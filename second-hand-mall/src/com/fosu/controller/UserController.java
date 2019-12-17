package com.fosu.controller;
import com.fosu.pojo.Admin;
import com.fosu.pojo.Good;
import com.fosu.pojo.TabUser;
import com.fosu.service.AdminService;
import com.fosu.service.GoodService;
import com.fosu.service.TabUserService;
import com.fosu.util.GoodGrid;
import com.fosu.util.TabUserGrid;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
	private TabUserService userService;
	
	//定义一个常量,表示一页记录的条数
	public static final int PAGE_SIZE = 8;
//	查看所有符合条件的用户，如果条件为空，则默认显示全部值
	@RequestMapping("/userList")
	public ModelAndView	queryUser(
			@RequestParam(value="pageNo",required=false,defaultValue="1")int pageNo,
			//把查询条件作为model给到前端使用,可以回显；另外做到按下一页也要递交表单
			@ModelAttribute("searchuser") TabUser user) {
		
		ModelAndView mv =new ModelAndView();
	
		PageHelper.startPage(pageNo,PAGE_SIZE);
		List<TabUser> list = userService.findUser(user);
	
		System.out.println(list);
        //PageInfo 用于控制上一页，下一页，最后一页等信息。
		PageInfo pageInfo = new PageInfo<>(list);
		
		mv.addObject("userList",list);
		mv.addObject("pageInfo",pageInfo);
		
		mv.setViewName("user_list");
		return mv;
	}
	
	/* 查看用户*/
	@RequestMapping(value = "/getUser")
	@ResponseBody
	public TabUser getUser(HttpServletRequest request) {
		String id = request.getParameter("id");
		TabUser user = userService.getUserById(Integer.parseInt(id));
		System.out.println(user);
		
		return user;
	} 
	
	/* 修改用户 */
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	@ResponseBody
	public String updateUser(HttpServletRequest request, TabUser user) {
//		TabUser users = userService.selectByPrimaryKey(user.getUid());
//		user.setPassword(users.getPassword());
		try {
			userService.updateUser(user);
		} catch (Exception e) {
			return "{\"success\":false,\"msg\":\"保存失败!\"}";
		}
		return "{\"success\":true,\"msg\":\"保存成功!\"}";
	}

	/* 删除用户 */
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	@ResponseBody
	public String deleteUser(HttpServletRequest request, @RequestParam(value = "ids[]") String[] ids) {
		try {
			for (int i = 0; i < ids.length; i++) {
				userService.deleteUserById(ids[i]);
				System.out.println("删除开始");
			}
		} catch (Exception e) {
			return "{\"success\":false,\"msg\":\"删除失败!\"}";
		}
		return "{\"success\":true,\"msg\":\"删除成功!\"}";
	}
	
//	显示用户的统计信息
	@RequestMapping(value = "/allUserInfo")
	public ModelAndView	allUserInfo() {
		
		ModelAndView mv =new ModelAndView();
		
		Integer manNum = userService.findManNum();
		Integer womanNum = userService.findWomanNum();
		Integer activeNum = userService.findActiveNum();
		Integer noActiveNum = userService.findNoActiveNum();
		Integer total = manNum+womanNum;
		mv.addObject("manNum", manNum);
		mv.addObject("womanNum", womanNum);
		mv.addObject("activeNum", activeNum);
		mv.addObject("noActiveNum", noActiveNum);
		mv.addObject("total", total);
		mv.setViewName("userStatistics");
		return mv;
	}
}

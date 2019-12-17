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
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private TabUserService userService;
	@Autowired
	private GoodService goodService;

//	退出，注销登录
	@RequestMapping(value = "/logOut", method = RequestMethod.GET)
	public String login(HttpSession session) {
		// 清除session
		session.invalidate();
		return "login";
	}

//	登录,进入首页
	@RequestMapping(value = "/index", method = RequestMethod.POST)
	public ModelAndView index(HttpServletRequest request, Admin admins) {
		Admin admin = adminService.findAdmin(admins.getPhone(), admins.getPassword());
		ModelAndView mv = new ModelAndView();
		if (admin != null) {
			request.getSession().setAttribute("admin", admin);			
			mv.setViewName("/index");
			return mv;
		}
		mv.addObject("msg", "密码错误,请重新输入");
		mv.setViewName("/login");
		return mv;
	}
	
//	由超链接进入首页
	@RequestMapping(value = "/indexs")
	public String indexs(HttpServletRequest request) {
//		获取会话中的用户信息，如果还存在则为会话“续期”；如果会话失效，则回到登录界面
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin != null) {
			Integer id = admin.getAdminId();
			Admin myadmin = adminService.findAdminById(id);
			request.getSession().setAttribute("admin", myadmin);
			return "/index";
		}
		return "/login";
	}
	
	/* 管理员个人信息 */
	@RequestMapping(value = "/info")
	@ResponseBody
	public ModelAndView getInfo(HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("admin", admin);
		modelAndView.setViewName("/info");
		return modelAndView;
	}
	
	/* 到修改管理员个人密码的界面 */
	@RequestMapping(value = "/modify")
	@ResponseBody
	public ModelAndView getModify(HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("admin", admin);
		modelAndView.setViewName("/modify");
		return modelAndView;
	}
	/* 真正的修改管理员密码 */
	@RequestMapping(value = "/changePassword")
	@ResponseBody
	public ModelAndView changePassword(HttpServletRequest request,Admin admin) {
//		因为新密码不能放到表单里面，所以要通过request.getParame得到新密码
		String pwd=request.getParameter("newPassword");
		System.out.println("新密码是："+pwd);
		ModelAndView modelAndView = new ModelAndView();
//		admins是会话中得到的用户；admin是前台表单得到的用户
		Admin admins = (Admin) request.getSession().getAttribute("admin");
//		如果登录失效，则返回到登录界面重新登录
		if (admins == null) {
			System.out.println("会话超时，请重新登录");
			modelAndView.setViewName("/login");
			return modelAndView;
		}
		if(admin.getPassword().equals(admins.getPassword())) {
			admins.setPassword(pwd);
			adminService.updateAdmin(admins);
		}else {
			modelAndView.addObject("msg", "原密码有误，请重新输入！");
			modelAndView.setViewName("/modify");
			return modelAndView;
		}
		modelAndView.setViewName("/login");
		return modelAndView;
	}

}
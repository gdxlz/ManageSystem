package com.fosu.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fosu.pojo.Good;
import com.fosu.pojo.Pictures;
import com.fosu.service.GoodService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mysql.fabric.xmlrpc.base.Array;
import com.sun.org.apache.xml.internal.security.Init;

@Controller
@RequestMapping("/good")
public class GoodController {
	@Autowired 
	private GoodService goodService;
	
	//定义一个常量,表示一页记录的条数
	public static final int PAGE_SIZE = 8;
	DecimalFormat df = new DecimalFormat("#.00");

//	查看所有符合条件的商品，如果条件为空，则默认显示全部值
	@RequestMapping("/goodsList")
	public ModelAndView	queryGoods(
			@RequestParam(value="pageNo",required=false,defaultValue="1")int pageNo,
			//把查询条件作为model给到前端使用,可以回显；另外做到按下一页也要递交表单
			@ModelAttribute("searchgoods") Good good) {
		
		ModelAndView mv =new ModelAndView();
		System.out.println(good);
		PageHelper.startPage(pageNo,PAGE_SIZE);
		List<Good> list = goodService.findGood(good);
		System.out.println("list");
		System.out.println(list);
        //PageInfo 用于控制上一页，下一页，最后一页等信息。
		PageInfo pageInfo = new PageInfo<>(list);
		
		mv.addObject("goodsList",list);
		mv.addObject("pageInfo",pageInfo);
		
		mv.setViewName("goods_list");
		return mv;
	}
	
	/* 查看商品*/
	@RequestMapping(value = "/getGoods")
	@ResponseBody
	public Good getGood(HttpServletRequest request) {
		String id = request.getParameter("id");
		Good good = goodService.getGoodById(Integer.parseInt(id));
		System.out.println(good);
		
		return good;
	} 
	
	/* 修改商品*/
	@RequestMapping(value = "/updateGoods", method = RequestMethod.POST)
	@ResponseBody
	public String updateGood(HttpServletRequest request, Good good) {
		try {
			goodService.updateGood(good);
		} catch (Exception e) {
			return "{\"success\":false,\"msg\":\"保存失败!\"}";
		}
		return "{\"success\":true,\"msg\":\"保存成功!\"}";
	}

	/* 删除多个商品 */
	@RequestMapping(value = "/deleteGoods", method = RequestMethod.POST)
	@ResponseBody
	public String deleteGoods(HttpServletRequest request, @RequestParam(value = "ids[]") String[] ids) {
		try {
			for (int i = 0; i < ids.length; i++) {
				goodService.deleteGoodById(ids[i]);
				System.out.println("删除开始");
			}
		} catch (Exception e) {
			return "{\"success\":false,\"msg\":\"删除失败!\"}";
		}
		return "{\"success\":true,\"msg\":\"删除成功!\"}";
	}
	

	/* 删除单个商品 */
	@RequestMapping(value = "/deleteGood", method = RequestMethod.GET)
	@ResponseBody
	public String deleteGood(HttpServletRequest request, @RequestParam(value = "id") int id) {
		try {
				
				goodService.deleteGoodById(id);
				System.out.println("删除开始");
			
		} catch (Exception e) {
			return "{\"success\":false,\"msg\":\"删除失败!\"}";
		}
		return "{\"success\":true,\"msg\":\"删除成功!\"}";
	}
	
//	显示商品的统计数据
	@RequestMapping(value = "/allGoodInfo")
	public ModelAndView	allUserInfo() {
		
		ModelAndView mv =new ModelAndView();
		
		Integer electronic = goodService.findElectronic();
		Integer life = goodService.findLife();
		Integer electric = goodService.findElectric();
		Integer food = goodService.findFood();
		Integer book = goodService.findBook();
		Integer colothe = goodService.findColothe();
		
		
		Integer noSoldOut = goodService.findnoSoldOut();
		Integer soldDown = goodService.findSoldDown();
		Integer soldOut = goodService.findSoldOut();
		Integer total = electronic+life+electric+food+book+colothe;
		mv.addObject("electronic", electronic);
		mv.addObject("life", life);
		mv.addObject("electric", electric);
		mv.addObject("food", food);
		mv.addObject("book", book);
		mv.addObject("colothe", colothe);

		mv.addObject("noSoldOut", noSoldOut);
		mv.addObject("soldOut", soldOut);
		mv.addObject("soldDown", soldDown);
		mv.addObject("total", total);
		mv.setViewName("goodStatistics");
		return mv;
	}
	
//	显示商品的相关时间统计数据
	@RequestMapping(value = "/allGoodAndTimeInfo")
	public ModelAndView	allGoodAndTimeInfo() {
		
		ModelAndView mv =new ModelAndView();
		Calendar date = Calendar.getInstance();        
		int year = Integer.valueOf(date.get(Calendar.YEAR));
		//上架数量
		int[] arrUp = new int[13];
		arrUp[0]=0;//总数		
		for (int i = 1; i < arrUp.length; i++) {
			arrUp[i] = goodService.findUpGoodByMonth(i,year);
			arrUp[0]+=arrUp[i];
		}
		//下架数量
		int[] arrDown = new int[13];
		arrDown[0]=0;//总数		
		for (int i = 1; i < arrDown.length; i++) {
			arrDown[i] = goodService.findDownGoodByMonth(i,year);
			arrDown[0]+=arrDown[i];
		}
		//售出数量
		int[] arrSailOut = new int[13];
		arrSailOut[0]=0;//总数		
		for (int i = 1; i < arrSailOut.length; i++) {
			arrSailOut[i] = goodService.findSailOutGoodByMonth(i,year);
			arrSailOut[0]+=arrSailOut[i];
		}
		//2020
		//上架数量
		int[] arrUp2 = new int[13];
		arrUp2[0]=0;//总数		
		for (int i = 1; i < arrUp2.length; i++) {
			arrUp2[i] = goodService.findUpGoodByMonth(i,year+1);
			arrUp2[0]+=arrUp2[i];
		}
		//下架数量
		int[] arrDown2 = new int[13];
		arrDown2[0]=0;//总数		
		for (int i = 1; i < arrDown2.length; i++) {
			arrDown2[i] = goodService.findDownGoodByMonth(i,year+1);
			arrDown2[0]+=arrDown2[i];
		}
		//售出数量
		int[] arrSailOut2 = new int[13];
		arrSailOut2[0]=0;//总数		
		for (int i = 1; i < arrSailOut2.length; i++) {
			arrSailOut2[i] = goodService.findSailOutGoodByMonth(i,year+1);
			arrSailOut2[0]+=arrSailOut2[i];
		}
		mv.addObject("arrUp", arrUp);
		mv.addObject("arrDown", arrDown);
		mv.addObject("arrSailOut", arrSailOut);
		mv.addObject("arrUp2", arrUp2);
		mv.addObject("arrDown2", arrDown2);
		mv.addObject("arrSailOut2", arrSailOut2);
		mv.setViewName("goodAndTimeStatistics");
		return mv;
	}
	
//	显示商品的相关金额统计数据
	@RequestMapping(value = "/moneyInfo")
	public ModelAndView	moneyInfo() {
		
		ModelAndView mv =new ModelAndView();
		Calendar date = Calendar.getInstance();        
		int year = Integer.valueOf(date.get(Calendar.YEAR));
		//上架金额
		double[] arrUp = new double[13];
		arrUp[0]=0;//总数		
		for (int i = 1; i < arrUp.length; i++) {
			arrUp[i] = goodService.findUpGoodTotalMoney(year, i, 0);
			
			arrUp[0]+=arrUp[i];
			System.out.println(arrUp[0]);
		}
//		将double保留两位小数
		arrUp[0]=new BigDecimal(arrUp[0]).setScale(2, RoundingMode.UP).doubleValue();
		//下架金额
		double[] arrDown = new double[13];
		arrDown[0]=0;//总数		
		for (int i = 1; i < arrDown.length; i++) {
			arrDown[i] = goodService.findDownGoodTotalMoney(year, i, 1);
			arrDown[0]+=arrDown[i];
		}
//		将double保留两位小数
		arrDown[0]=new BigDecimal(arrDown[0]).setScale(2, RoundingMode.UP).doubleValue();
		//售出金额
		double[] arrSailOut = new double[13];
		arrSailOut[0]=0;//总数		
		for (int i = 1; i < arrSailOut.length; i++) {
			arrSailOut[i] = goodService.findOutGoodTotalMoney(year, i, 2);
			arrSailOut[0]+=arrSailOut[i];
		}
//		将double保留两位小数
		arrSailOut[0]=new BigDecimal(arrSailOut[0]).setScale(2, RoundingMode.UP).doubleValue();
		//2020
		//上架金额
		double[] arrUp2 = new double[13];
		arrUp2[0]=0;//总数		
		for (int i = 1; i < arrUp2.length; i++) {
			arrUp2[i] = goodService.findUpGoodTotalMoney(i,year+1,0);
			arrUp2[0]+=arrUp2[i];
		}
//		将double保留两位小数
		arrUp2[0]=new BigDecimal(arrUp2[0]).setScale(2, RoundingMode.UP).doubleValue();
		//下架金额
		double[] arrDown2 = new double[13];
		arrDown2[0]=0;//总数		
		for (int i = 1; i < arrDown2.length; i++) {
			arrDown2[i] = goodService.findDownGoodTotalMoney(i,year+1,1);
			arrDown2[0]+=arrDown2[i];
		}
//		将double保留两位小数
		arrDown2[0]=new BigDecimal(arrDown2[0]).setScale(2, RoundingMode.UP).doubleValue();
		//售出金额
		double[] arrSailOut2 = new double[13];
		arrSailOut2[0]=0;//总数		
		for (int i = 1; i < arrSailOut2.length; i++) {
			arrSailOut2[i] = goodService.findOutGoodTotalMoney(i,year+1,2);
			arrSailOut2[0]+=arrSailOut2[i];
		}
//		将double保留两位小数
		arrSailOut2[0]=new BigDecimal(arrSailOut2[0]).setScale(2, RoundingMode.UP).doubleValue();
		
		mv.addObject("arrUp", arrUp);
		mv.addObject("arrDown", arrDown);
		mv.addObject("arrSailOut", arrSailOut);
		mv.addObject("arrUp2", arrUp2);
		mv.addObject("arrDown2", arrDown2);
		mv.addObject("arrSailOut2", arrSailOut2);
		mv.setViewName("moneyStatistics");
		System.out.println(arrUp[0]);
		return mv;
	}
	
//	按照年份显示商品的相关时间统计数据     还没有完成
	@RequestMapping(value = "/allGoodAndTimeInfoByYear")
	@ResponseBody
	public List allGoodAndTimeInfoByYear(HttpServletRequest
			request) {
		int year = Integer.valueOf(request.getParameter("year"));
		
		int[] arrUp = new int[13];
		arrUp[0]=0;
		for (int i = 1; i < arrUp.length; i++) {
			arrUp[i] = goodService.findUpGoodByMonth(i,year);
			arrUp[0]+=arrUp[i];
		}
		List li = new ArrayList();
        li.add(0,arrUp);
        li.add(1,arrUp);
        li.add(2,arrUp);
		return li;
	}
//	查看所有需要审核的商品
	@RequestMapping("/check")
	public ModelAndView	check(
			@RequestParam(value="pageNo",required=false,defaultValue="1")int pageNo,
			//把查询条件作为model给到前端使用,可以回显；另外做到按下一页也要递交表单
			@ModelAttribute("searchgoods") Good good) {		
		ModelAndView mv =new ModelAndView();
	
		PageHelper.startPage(pageNo,PAGE_SIZE);
//		如果要使用good来存放条件，就要像下面一样用new出来的对象来进行初始化；
//		切记不能用Good good = null;这样的话就不能够用setXXX()来为对象进行赋值
//		Good good = new Good();
		good.setStatus(9);
		List<Good> list = goodService.findGood(good);
		System.out.println("list");
		System.out.println(list);
        //PageInfo 用于控制上一页，下一页，最后一页等信息。
		PageInfo pageInfo = new PageInfo<>(list);
		
		mv.addObject("goodsList",list);
		mv.addObject("pageInfo",pageInfo);
		
		mv.setViewName("check_good");
		return mv;
	}
	
	/* 查看商品图片*/
	@RequestMapping(value = "/getPicture")
	@ResponseBody
	public Pictures getPicture(HttpServletRequest request) {
		String id = request.getParameter("id");
		Pictures pictures = goodService.getPictureById(Integer.parseInt(id));
		System.out.println(id);		
		return pictures;
	} 
	
	/* 审核通过 */
	@RequestMapping(value = "/doPass", method = RequestMethod.GET)
	@ResponseBody
	public String doPass(HttpServletRequest request, @RequestParam(value = "id") int id) {
				goodService.passGoodById(id);
				System.out.println("已经审核");
		return "{\"success\":true,\"msg\":\"审核通过!\"}";
	}
	
	
}

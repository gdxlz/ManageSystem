package com.fosu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fosu.dao.CollectMapper;
import com.fosu.dao.GoodAndRecordMapper;
import com.fosu.dao.GoodMapper;
import com.fosu.dao.PicturesMapper;
import com.fosu.dao.TimeRecordMapper;
import com.fosu.pojo.CollectExample;
import com.fosu.pojo.Good;
import com.fosu.pojo.GoodExample;
import com.fosu.pojo.GoodExample.Criteria;
import com.fosu.pojo.Pictures;
import com.fosu.pojo.PicturesExample;
import com.fosu.pojo.TabUser;
import com.fosu.pojo.TabUserExample;
import com.fosu.pojo.TimeRecordExample;
import com.fosu.service.GoodService;

@Service
public class GoodServiceImpl implements GoodService {

	@Autowired 
	GoodMapper goodMapper;
	@Autowired 
	PicturesMapper picturesMapper;
	@Autowired
	TimeRecordMapper timeRecordMapper;
	@Autowired
	GoodAndRecordMapper goodAndRecordMapper;
	@Autowired
    private CollectMapper collectMapper;
//	查找并显示商品	
	@Override
	public List<Good> findGood(Good good) {
		GoodExample example = new GoodExample();
		GoodExample.Criteria criteria = example.createCriteria();
		if (good != null) {
			if (good.getGoodId() != null&&!"".equals(good.getGoodId())) {
				criteria.andGoodIdEqualTo(good.getGoodId());
			}
			if (good.getGoodName() != null&&!"".equals(good.getGoodName())) {
				criteria.andGoodNameLike("%"+good.getGoodName()+"%");
			}
			if (good.getUserId() != null && !"".equals(good.getUserId())) {
				criteria.andUserIdEqualTo(good.getUserId());
			}
			if (good.getDescription() != null && !"".equals(good.getDescription())) {
				criteria.andDescriptionLike("%"+good.getDescription()+"%");
			}
			if (good.getStatus() != null && !"".equals(good.getStatus())) {
				criteria.andStatusEqualTo(good.getStatus());
			}
			if (good.getCatelog() != null && !"".equals(good.getCatelog())) {
				criteria.andCatelogLike(good.getCatelog());
			}
		}
		example.setOrderByClause("good_id desc");
		List<Good> list = goodMapper.selectByExample(example);
		return list;
	}
//	获得一个商品的信息
	@Override
	public Good getGoodById(int id) {
		GoodExample example = new GoodExample();
		GoodExample.Criteria criteria = example.createCriteria();
		criteria.andGoodIdEqualTo(id);
		List<Good> list = goodMapper.selectByExample(example);
		return list.get(0);
	}
// 修改商品信息
	@Override
	public void updateGood(Good good) {
		goodMapper.updateByPrimaryKeySelective(good);		

	}
// 删除商品，包括外表的图片和日期记录（用于批量删除，传进来的是字符串）
	@Override
	public void deleteGoodById(String i) {
//		先删除外表的图片
		PicturesExample example = new PicturesExample();
		PicturesExample.Criteria criteria = example.createCriteria();
		criteria.andGoodIdEqualTo(Integer.parseInt(i));
		picturesMapper.deleteByExample(example);
//		再删除外表的时间记录表
		TimeRecordExample example2 = new TimeRecordExample();
		TimeRecordExample.Criteria criteria2 = example2.createCriteria();
		criteria2.andGoodIdEqualTo(Integer.parseInt(i));
		timeRecordMapper.deleteByExample(example2);
//		再删除收藏表的记录
		CollectExample example3 = new CollectExample();
	    CollectExample.Criteria criteria3 = example3.createCriteria();
	    criteria3.andGoodIdEqualTo(Integer.parseInt(i));
	    collectMapper.deleteByExample(example3);
//		再删除主表的商品		
		goodMapper.deleteByPrimaryKey(Integer.parseInt(i));	
	}
	
//删除商品，包括外表的图片和日期记录	
	@Override
	public void deleteGoodById(int i) {
//		先删除外表的图片
		PicturesExample example = new PicturesExample();
		PicturesExample.Criteria criteria = example.createCriteria();
		criteria.andGoodIdEqualTo(i);
		picturesMapper.deleteByExample(example);
//		再删除外表的时间记录表
		TimeRecordExample example2 = new TimeRecordExample();
		TimeRecordExample.Criteria criteria2 = example2.createCriteria();
		criteria2.andGoodIdEqualTo(i);
		timeRecordMapper.deleteByExample(example2);
//		再删除收藏表的记录
		CollectExample example3 = new CollectExample();
	    CollectExample.Criteria criteria3 = example3.createCriteria();
	    criteria3.andGoodIdEqualTo(i);
	    collectMapper.deleteByExample(example3);
//		再删除主表的商品	
		goodMapper.deleteByPrimaryKey(i);		

	}
// 返回某一类商品的数量
	@Override
	public int findElectronic() {
		GoodExample example = new GoodExample();
		GoodExample.Criteria criteria = example.createCriteria();
		criteria.andCatelogEqualTo("电子产品");	
		return goodMapper.countByExample(example);
	}

	@Override
	public int findLife() {
		GoodExample example = new GoodExample();
		GoodExample.Criteria criteria = example.createCriteria();
		criteria.andCatelogEqualTo("生活用品");	
		return goodMapper.countByExample(example);
	}

	@Override
	public int findElectric() {
		GoodExample example = new GoodExample();
		GoodExample.Criteria criteria = example.createCriteria();
		criteria.andCatelogEqualTo("家电");	
		return goodMapper.countByExample(example);
	}

	@Override
	public int findFood() {
		GoodExample example = new GoodExample();
		GoodExample.Criteria criteria = example.createCriteria();
		criteria.andCatelogEqualTo("食品");	
		return goodMapper.countByExample(example);
	}

	@Override
	public int findBook() {
		GoodExample example = new GoodExample();
		GoodExample.Criteria criteria = example.createCriteria();
		criteria.andCatelogEqualTo("旧书");	
		return goodMapper.countByExample(example);
	}

	@Override
	public int findColothe() {
		GoodExample example = new GoodExample();
		GoodExample.Criteria criteria = example.createCriteria();
		criteria.andCatelogEqualTo("服装");	
		return goodMapper.countByExample(example);
	}

//  查找在售的商品的数量
	@Override
	public int findnoSoldOut() {
		GoodExample example = new GoodExample();
		GoodExample.Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(0);
		return goodMapper.countByExample(example);
	}
	
//  查找下架的商品
	@Override
	public int findSoldDown() {
		GoodExample example = new GoodExample();
		GoodExample.Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(1);
		return goodMapper.countByExample(example);
	}
	
//  查找已售的商品
	@Override
	public int findSoldOut() {
		GoodExample example = new GoodExample();
		GoodExample.Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(2);
		return goodMapper.countByExample(example);
	}
			
//  获取当前商品的图片
	@Override
	public Pictures getPictureById(int id) {
		PicturesExample example = new PicturesExample();
		PicturesExample.Criteria criteria = example.createCriteria();
		criteria.andGoodIdEqualTo(id);
		List<Pictures> list = picturesMapper.selectByExample(example);
		return list.get(0);
	}
	
//  审核通过该商品
	@Override
	public void passGoodById(int id) {
		GoodExample example = new GoodExample();
		GoodExample.Criteria criteria = example.createCriteria();
		Good good = new Good();
		good.setGoodId(id);
		good.setStatus(0);
		goodMapper.updateByPrimaryKeySelective(good);
	}

//	查找每月上架的商品的数量
	public int findUpGoodByMonth(int month,int year) {
		return goodAndRecordMapper.findUpGoodByMonth(month,year);
	}
//	查找每月下架的商品的数量
	@Override
	public int findDownGoodByMonth(int month, int year) {
		return goodAndRecordMapper.findDownGoodByMonth(month,year);
		
	}
//	查找每月售出的商品的数量
	@Override
	public int findSailOutGoodByMonth(int month, int year) {
		return goodAndRecordMapper.findSailOutGoodByMonth(month,year);
		
	}
//  查找每月上架商品的金额
	@Override
	public double findUpGoodTotalMoney(int year, int month, int status) {
		
		double total =goodAndRecordMapper.findUpGoodTotalMoney(year, month, status);
		return  total;
	}
//  下架金额
	@Override
	public double findDownGoodTotalMoney(int year, int month, int status) {
		double total =goodAndRecordMapper.findDownGoodTotalMoney(year, month, status);
		return  total;
	}
//  售出金额	
	@Override
	public double findOutGoodTotalMoney(int year, int month, int status) {
		double total =goodAndRecordMapper.findOutGoodTotalMoney(year, month, status);
		return  total;
	}
}

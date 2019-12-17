package com.fosu.service.impl;

import java.util.List;

import org.apache.catalina.User;
import org.apache.poi.ss.formula.functions.Count;
import org.mybatis.generator.codegen.ibatis2.sqlmap.elements.CountByExampleElementGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fosu.pojo.Admin;
import com.fosu.pojo.AdminExample;
import com.fosu.pojo.CollectExample;
import com.fosu.pojo.Good;
import com.fosu.pojo.GoodExample;
import com.fosu.pojo.PicturesExample;
import com.fosu.pojo.TabUser;
import com.fosu.pojo.TabUserExample;
import com.fosu.pojo.TimeRecordExample;
import com.fosu.service.TabUserService;
import com.github.pagehelper.PageHelper;
import com.fosu.dao.CollectMapper;
import com.fosu.dao.GoodAndRecordMapper;
import com.fosu.dao.GoodMapper;
import com.fosu.dao.PicturesMapper;
import com.fosu.dao.TabUserMapper;
import com.fosu.dao.TimeRecordMapper;
import com.fosu.pojo.TabUser;

@Service
public class TabUserServiceImpl implements TabUserService {

	@Autowired 
	private TabUserMapper userMapper;
	
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

	@Override
	public List<TabUser> findUser(TabUser user) {
		TabUserExample example = new TabUserExample();
		TabUserExample.Criteria criteria = example.createCriteria();
		if (user != null) {
			if (user.getUid() != null&&!"".equals(user.getUid())) {
				criteria.andUidEqualTo(user.getUid());
			}
			if (user.getTelephone() != null&&!"".equals(user.getTelephone())) {
				criteria.andTelephoneLike("%"+user.getTelephone()+"%");
			}
			if (user.getUsername() != null && !"".equals(user.getUsername())) {
				criteria.andUsernameLike("%"+user.getUsername()+"%");
			}
			if (user.getSex() != null && !"".equals(user.getSex())) {
				criteria.andSexEqualTo(user.getSex());
			}
			if (user.getStatus() != null && !"".equals(user.getStatus())) {
				criteria.andStatusEqualTo(user.getStatus());
			}
		}
		List<TabUser> list = userMapper.selectByExample(example);
		return list;
	}

	@Override
	public TabUser getUserById(int id) {
		TabUserExample example = new TabUserExample();
		TabUserExample.Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(id);
		List<TabUser> list = userMapper.selectByExample(example);
		return list.get(0);
	}

	@Override
	public void updateUser(TabUser user) {
		userMapper.updateByPrimaryKeySelective(user);		
	}

//  删除用户	
	@Override
	public void deleteUserById(String i) {
//		先删除收藏表的记录
		CollectExample example1 = new CollectExample();
	    CollectExample.Criteria criteria1 = example1.createCriteria();
	    criteria1.andUserIdEqualTo(Integer.parseInt(i));
	    collectMapper.deleteByExample(example1);
	    
//	           获取用户发布的所有商品 的goodid,放入数组中
	    GoodExample example2 = new GoodExample();
	    GoodExample.Criteria criteria2 = example2.createCriteria();
	    criteria2.andUserIdEqualTo(Integer.parseInt(i));
	    List<Good> goodList = goodMapper.selectByExample(example2);
	    
	    int[] arr = new int[goodList.size()];
	    for (int j = 0; j < goodList.size(); j++) {
			arr[j]=goodList.get(j).getGoodId();
		}
	    System.out.println(arr.toString());
	    
//	           循环删除各个goodid对应的图片，时间记录，商品主表
	    for (int k = 0; k < arr.length; k++) {
				    
//		再删除图片表
		PicturesExample example3 = new PicturesExample();
		PicturesExample.Criteria criteria3 = example3.createCriteria();
		criteria3.andGoodIdEqualTo(arr[k]);
		picturesMapper.deleteByExample(example3);
//		再删除时间记录表
		TimeRecordExample example4 = new TimeRecordExample();
		TimeRecordExample.Criteria criteria4 = example4.createCriteria();
		criteria4.andGoodIdEqualTo(arr[k]);
		timeRecordMapper.deleteByExample(example4);
//		还要删除收藏表的记录
		CollectExample example5 = new CollectExample();
	    CollectExample.Criteria criteria5 = example5.createCriteria();
	    criteria5.andGoodIdEqualTo(arr[k]);
	    collectMapper.deleteByExample(example5);
		
//		最后删除主表的商品		
		goodMapper.deleteByPrimaryKey(arr[k]);			
	    }
//	           删除TimeRecord买家为当前用户的表？这个不做了，到时候考虑再把数据库对应的栏位删除掉
//	           删除用户表
		userMapper.deleteByPrimaryKey(Integer.parseInt(i));		
	}

	@Override
	public Integer findManNum() {
		TabUserExample example = new TabUserExample();
		TabUserExample.Criteria criteria = example.createCriteria();
		criteria.andSexEqualTo("男");
		return userMapper.countByExample(example);
	}

	@Override
	public Integer findWomanNum() {
		TabUserExample example = new TabUserExample();
		TabUserExample.Criteria criteria = example.createCriteria();
		criteria.andSexEqualTo("女");
		return userMapper.countByExample(example);
	}
	@Override
	public Integer findActiveNum() {
		TabUserExample example = new TabUserExample();
		TabUserExample.Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo("Y");
		return userMapper.countByExample(example);
	}

	@Override
	public Integer findNoActiveNum() {
		TabUserExample example = new TabUserExample();
		TabUserExample.Criteria criteria = example.createCriteria();
		example.or().andStatusEqualTo("N");
		example.or().andStatusEqualTo("");
		example.or().andStatusEqualTo(" ");
		example.or().andStatusIsNull();
		return userMapper.countByExample(example);
	}
	
}

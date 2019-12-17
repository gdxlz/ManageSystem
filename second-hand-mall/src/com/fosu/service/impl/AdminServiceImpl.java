package com.fosu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.generator.codegen.ibatis2.model.ExampleGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fosu.dao.AdminMapper;
import com.fosu.pojo.Admin;
import com.fosu.pojo.AdminExample;
import com.fosu.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired 
	AdminMapper adminMapper;
	
	@Override
	public Admin findAdmin(String phone, String password) {
		AdminExample example = new AdminExample();
		AdminExample.Criteria criteria = example.createCriteria();
		criteria.andPhoneEqualTo(phone);
		criteria.andPasswordEqualTo(password);
		List<Admin> list =adminMapper.selectByExample(example);
		//逻辑代码编写，登录验证
		//list.size()>0是怕可能会出现多个返回值对
		if(list!=null&&list.size()>0) {
			//返回的是一个user，最后将其放到session中
			return list.get(0);
		}
		return null;
	}

	@Override
	public Admin findAdminById(Integer id) {
		AdminExample example = new AdminExample();
		AdminExample.Criteria criteria = example.createCriteria();
		criteria.andAdminIdEqualTo(id);
		List<Admin> list = adminMapper.selectByExample(example);
		return list.get(0);
	}

	@Override
	public void updateAdmin(Admin admins) {
		AdminExample example = new AdminExample();
		adminMapper.updateByPrimaryKey(admins);
		
	}
	
}

package com.fosu.service;

import org.springframework.stereotype.Service;

import com.fosu.pojo.Admin;
@Service
public interface AdminService {
	
	public Admin findAdmin(String phone, String password);

	public Admin findAdminById(Integer id);

	public void updateAdmin(Admin admins);
	
	

}

package com.fosu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fosu.pojo.TabUser;


@Service
public interface TabUserService {
	public List<TabUser> findUser(TabUser user);
	public TabUser getUserById( int id);
	public void updateUser(TabUser user);
	public void deleteUserById( String i);
	public Integer findManNum();
	public Integer findWomanNum();
	public Integer findActiveNum();
	public Integer findNoActiveNum();
}

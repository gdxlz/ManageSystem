package com.fosu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fosu.pojo.Good;
import com.fosu.pojo.Pictures;
import com.fosu.pojo.TabUser;

@Service
public interface GoodService {
	public List<Good> findGood(Good good);
	public Good getGoodById( int id);
	public void updateGood(Good good);
	public void deleteGoodById( String i);
	public void deleteGoodById( int i);
	public int findElectronic();
	public int findLife();
	public int findElectric();
	public int findFood();
	public int findBook();
	public int findColothe();
	
	public int findnoSoldOut();
	public int findSoldDown();
	public int findSoldOut();
	public Pictures getPictureById( int id);
	public  void passGoodById(int id);
	
	public int findUpGoodByMonth(int month,int year);
	public int findDownGoodByMonth(int month,int year);
	public int findSailOutGoodByMonth(int month,int year);
	
	public double findUpGoodTotalMoney(int year,int month,int status);
	public double findDownGoodTotalMoney(int year,int month,int status);
	public double findOutGoodTotalMoney(int year,int month,int status);
	
}

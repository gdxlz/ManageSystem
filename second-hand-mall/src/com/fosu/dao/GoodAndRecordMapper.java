package com.fosu.dao;

import org.apache.ibatis.annotations.Param;

public interface GoodAndRecordMapper {
//	查找每月的上架商品数
	public int findUpGoodByMonth(@Param("month")int month,@Param("year")int year);
//	查找每月的下架商品数
	public int findDownGoodByMonth(@Param("month")int month,@Param("year")int year);
//	查找每月的上架售出商品数
	public int findSailOutGoodByMonth(@Param("month")int month,@Param("year")int year);
//  查找每年、每月、上架的商品的总金额数
	public Double findUpGoodTotalMoney(@Param("year")int year,@Param("month")int month,@Param("status")int status);
//  查找每年、每月、上架的商品的总金额数
	public Double findDownGoodTotalMoney(@Param("year")int year,@Param("month")int month,@Param("status")int status);	
//  查找每年、每月、上架的商品的总金额数
	public Double findOutGoodTotalMoney(@Param("year")int year,@Param("month")int month,@Param("status")int status);	
}

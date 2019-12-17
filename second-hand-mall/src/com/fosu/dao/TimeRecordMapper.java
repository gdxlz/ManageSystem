package com.fosu.dao;

import com.fosu.pojo.TimeRecord;
import com.fosu.pojo.TimeRecordExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TimeRecordMapper {
    int countByExample(TimeRecordExample example);

    int deleteByExample(TimeRecordExample example);

    int deleteByPrimaryKey(Integer recordId);

    int insert(TimeRecord record);

    int insertSelective(TimeRecord record);

    List<TimeRecord> selectByExample(TimeRecordExample example);

    TimeRecord selectByPrimaryKey(Integer recordId);

    int updateByExampleSelective(@Param("record") TimeRecord record, @Param("example") TimeRecordExample example);

    int updateByExample(@Param("record") TimeRecord record, @Param("example") TimeRecordExample example);

    int updateByPrimaryKeySelective(TimeRecord record);

    int updateByPrimaryKey(TimeRecord record);
}
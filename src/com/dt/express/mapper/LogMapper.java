package com.dt.express.mapper;

import java.util.List;

import com.dt.express.entity.Log;

public interface LogMapper {
	List<Log> selectlog(String expressid);
	
    int deleteByPrimaryKey(Integer logid);

    int insert(Log record);

    int insertSelective(Log record);

    Log selectByPrimaryKey(Integer logid);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKey(Log record);
}
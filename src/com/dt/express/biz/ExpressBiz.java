package com.dt.express.biz;

import java.util.List;

import com.dt.express.entity.Express;

public interface ExpressBiz {
	List<Express> selectall(String location);
	
	List<Express> selectbyphone(String phone);
	
	int deleteByPrimaryKey(String id);

    int insert(Express record);

    int insertSelective(Express record);

    Express selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Express record);

    int updateByPrimaryKey(Express record);
}

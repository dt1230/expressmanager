package com.dt.express.mapper;

import java.util.List;

import com.dt.express.entity.Express;

public interface ExpressMapper {
	List<Express> selectall(String location);
	
	List<Express> selectbyphone(String phone);
	//通过id删除快递
    int deleteByPrimaryKey(String id);
    //增加快递Express
    int insert(Express record);

    int insertSelective(Express record);
   //通过id查询快递信息
    Express selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Express record);
    //通过id修改快递信息
    int updateByPrimaryKey(Express record);
}
package com.dt.express.mapper;

import java.util.List;

import com.dt.express.entity.User;

public interface UserMapper {
	List<User> selectbypt(String pt);
	//通过id删除user
    int deleteByPrimaryKey(String id);
    //插入user
    int insert(User record);

    int insertSelective(User record);
    //通过id查询user
    User selectByPrimaryKey(String id);
    
    int updateByPrimaryKeySelective(User record);
    //根据user更新user的信息
    int updateByPrimaryKey(User record);
}
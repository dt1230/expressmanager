package com.dt.express.biz;

import java.util.List;

import com.dt.express.entity.User;

public interface UserBiz {
	
	List<User> selectbypt(String pt);
	 int deleteByPrimaryKey(String id);

	    int insert(User record);

	    int insertSelective(User record);

	    User selectByPrimaryKey(String id);

	    int updateByPrimaryKeySelective(User record);

	    int updateByPrimaryKey(User record);

}

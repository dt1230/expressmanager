package com.dt.express.mapper;

import com.dt.express.entity.User;
import com.dt.express.entity.Vehicleinfo;
import com.dt.express.entity.VehicleinfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface VehicleinfoMapper {
	
	//查询所在仓库的车辆
	List<Vehicleinfo> selectall(String location);
	
    int countByExample(VehicleinfoExample example);

    int deleteByExample(VehicleinfoExample example);

    int deleteByPrimaryKey(String id);

    int insert(Vehicleinfo record);

    int insertSelective(Vehicleinfo record);

    List<Vehicleinfo> selectByExample(VehicleinfoExample example);

    Vehicleinfo selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Vehicleinfo record, @Param("example") VehicleinfoExample example);

    int updateByExample(@Param("record") Vehicleinfo record, @Param("example") VehicleinfoExample example);

    int updateByPrimaryKeySelective(Vehicleinfo record);

    int updateByPrimaryKey(Vehicleinfo record);
}
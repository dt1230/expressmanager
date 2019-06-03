package com.dt.express.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dt.express.biz.*;
import com.dt.express.entity.Express;
import com.dt.express.entity.Log;
import com.dt.express.entity.User;
import com.dt.express.entity.Vehicleinfo;
import com.dt.express.mapper.VehicleinfoMapper;
import com.dt.express.util.DateUtil;

@Controller
public class MainController {
	@Autowired
	ExpressBiz expressBiz;
	@Autowired
	LogBiz logBiz;
	@Autowired
	UserBiz userBiz;
	@Autowired
	VehicleinfoMapper vehicleinfoMapper;
	
	//运费时效查询selectFreightLimitationResult   能力不足 该功能实现不了
	
	
	
	//绑定驾驶员
	@RequestMapping(value="addDriver")
	@ResponseBody
	public void addDriver(String id,String staffid,HttpServletResponse res) throws IOException {
		res.setCharacterEncoding("utf-8");
		PrintWriter pw = res.getWriter();
		//通过员工编号查询该员工信息
		User user = userBiz.selectByPrimaryKey(staffid);
		if(user==null) {
			pw.write("0");
			return;
		}
		//通过车牌号查询该车信息
		Vehicleinfo vehicleinfo = vehicleinfoMapper.selectByPrimaryKey(id);
		//将员工信息更新到车辆信息表中
		vehicleinfo.setDriver(user.getName());
		vehicleinfoMapper.updateByPrimaryKeySelective(vehicleinfo);
		pw.write("已绑定驾驶员！");
	}
	
	
	//新增车辆  addVehicle
	@RequestMapping(value="addVehicle")
	public String addVehicle(HttpSession session, Vehicleinfo vehicleinfo) {

		 String driver = "";
		vehicleinfo.setDriver(driver);
		vehicleinfoMapper.insertSelective(vehicleinfo);
		session.setAttribute("addVehicle", "创建成功，车牌号为："+vehicleinfo.getId());
		return "newVehicle";
	}
	//删除车辆
		@RequestMapping(value="vehicleremove")
		@ResponseBody          //使用ajax 需要加这个，不然系统默认去找JSP界面
		public void vehicleremove(@Param("id") String id) {
			System.out.println(id);
			vehicleinfoMapper.deleteByPrimaryKey(id);
		}
	//车辆管理 vehicleManage
	
	@RequestMapping(value="vehicleManage")
	public String vehicleManage(HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		String location = user.getType().substring(0, user.getType().length()-1);
		location=location+ "%";
		List<Vehicleinfo> vehicleList = vehicleinfoMapper.selectall(location);
		session.setAttribute("vehicleList", vehicleList);
		return "vehicleManage";
	}

	
	//用户首页
	@RequestMapping(value="index")
	public String index(HttpSession session) {
		session.invalidate();
		return "index";  
	}
	

	//查询快递
	@RequestMapping(value="selectExpress")
	public String selectExpress(HttpSession session) {
		session.invalidate();
		return "showexp";  
	}
	//寄送快递
	@RequestMapping(value="addorder")
	public String addorder(Express express,HttpSession session) {
		express.setId(DateUtil.getId());
		express.setPosttime(new Date());
		express.setType("等待揽收");
		expressBiz.insertSelective(express);
		session.setAttribute("expid", express.getId());
		return "success";
	}
	
	@RequestMapping(value="showexp")
	public String showexp(String expid,HttpSession session) {
		Express express = expressBiz.selectByPrimaryKey(expid);
		if(express==null) {
			List<Express> expressList = expressBiz.selectbyphone(expid);
			if(expressList.size()==0) {
				session.setAttribute("msg", "没有此快递单号或手机号的记录，请核对后再次查询！");
				return "selectExpress";
			}
			session.setAttribute("expressList", expressList);
			return "success";
		}
		List<Log> logList = logBiz.selectlog(expid);
		session.setAttribute("express", express);
		session.setAttribute("logList", logList);
		return "orderinfo";
	}
	
	
	
	@RequestMapping(value="staff")
	public String staff() {
		return "login";
	}
	//员工登录
	@RequestMapping(value="login")
	public String employeeLogin(HttpSession session,String username,String password) {
		User user = userBiz.selectByPrimaryKey(username);
		if(!user.getPassword().equals(password)) {
			session.setAttribute("error", "工号或密码错误！");
			return "login";
		}
		session.setAttribute("loginUser", user);
		session.removeAttribute("msg");
		String lastname = user.getType().substring(user.getType().length()-1, user.getType().length());
		if(lastname.equals("仓")) {
			//登录是输入对应的仓库密码
			return "cangadmin";
		}
		if(user.getType().equals("admin")) {
			List<Express> orderList = expressBiz.selectall("");
			session.setAttribute("orderList", orderList);
			return "admin";
		}
		return "orderin";
	}
	//员工收入/签收操作
	@RequestMapping(value="orderin")
	public String orderin(String expid,HttpSession session) {
		session.removeAttribute("msg");
		Express express = expressBiz.selectByPrimaryKey(expid);
		if(express==null) {
			session.setAttribute("msg", "没有此快递单号的记录，请核对后再次操作！");
			return "orderin";
		}
		User user = (User) session.getAttribute("loginUser");
		Log log = new Log();
		log.setExpressid(expid);
		log.setTime(new Date());
		String type = express.getType().substring(0, 4);
		//System.out.println(type);
		if(type.equals("正在揽收")&&user.getType().equals("员工")) {
		log.setContext("揽收成功！");
		express.setType("已经揽收等待运输");
		session.setAttribute("msg", "操作成功！单号"+expid+"已经揽收");
		}else if(user.getType().equals("员工")){
			log.setContext("已签收");
			express.setType("已签收,请确认收货");
			session.setAttribute("msg", "操作成功！单号"+expid+"已经完成签收");
		}else {
			log.setContext(user.getType()+"已入库");
			express.setType("正在运输，当前位置："+user.getType());
			session.setAttribute("msg", "操作成功！单号"+expid+"已经入库");
		}
		expressBiz.updateByPrimaryKeySelective(express);
		logBiz.insert(log);
		
		return "orderin";
	}
	//员工出库/派件操作
	@RequestMapping(value="orderout")
	public String orderout(String expid,HttpSession session) {
		Express express = expressBiz.selectByPrimaryKey(expid);
		if(express==null) {
			session.setAttribute("msg", "没有此快递单号的记录，请核对后再次操作！");
			return "orderin";
		}
		User user = (User) session.getAttribute("loginUser");
		Log log = new Log();
		log.setExpressid(expid);
		log.setTime(new Date());
		if(express.getType().equals("等待揽收")&&user.getType().equals("快递员")) {
		
		session.setAttribute("msg", "操作有误请确认快递单号！");
		}else if(user.getType()!=null&&user.getType().equals("员工")){
			log.setContext("派件中，快递员："+user.getName()+",电话："+user.getPhone()+",请确保电话畅通！");
			express.setType("派件中，快递员："+user.getName()+"电话："+user.getPhone());
			session.setAttribute("msg", "操作成功！单号"+expid+"已经准备派件");
		}else {
			log.setContext(user.getType()+"已出库，发往下一目的地");
			express.setType("正在运输，之前位置："+user.getType());
			session.setAttribute("msg", "操作成功！单号"+expid+"已经出库");
		}
		expressBiz.updateByPrimaryKeySelective(express);
		logBiz.insert(log);
		
		return "orderin";
	}
	//揽件
	@RequestMapping(value="order")
	public void order(String expid,String staffid,HttpServletResponse res) throws IOException {
		res.setCharacterEncoding("utf-8");
		PrintWriter pw = res.getWriter();
		User user = userBiz.selectByPrimaryKey(staffid);
		if(user==null) {
			pw.write("0");
			return;
		}
		Log log = new Log();
		log.setContext("快递员："+user.getName()+"已出发,联系电话"+user.getPhone());
		log.setExpressid(expid);
		log.setTime(new Date());
		Express express = expressBiz.selectByPrimaryKey(expid);
		express.setType("正在揽收，快递员："+user.getName()+",电话："+user.getPhone());
		logBiz.insert(log);
		expressBiz.updateByPrimaryKeySelective(express);
		pw.write("已发出揽收通知！");
	}
	//删除
	@RequestMapping(value="orderremove")
	@ResponseBody
	public void orderremove(String expid) {
		expressBiz.deleteByPrimaryKey(expid);
	}
	
	@RequestMapping(value="confimorder")
	public String confimorder(String expid) {
		Express express = expressBiz.selectByPrimaryKey(expid);
		express.setType("已确认收货，感谢您的使用！");
		Log log = new Log();
		log.setContext("已确认收货，感谢您的使用！");
		log.setExpressid(expid);
		log.setTime(new Date());
		log.setType("0");
		logBiz.insertSelective(log);
		expressBiz.updateByPrimaryKeySelective(express);
		return "redirect:showexp.do?expid="+expid;
	}
	
	//仓库管理员工操作
	@RequestMapping(value="addstaff")
	public String addstaff(User user,HttpSession session) {
		user.setId(DateUtil.getStaffId());
		user.setType("员工");
		userBiz.insertSelective(user);
		session.setAttribute("addstaffmsg", "创建成功，员工号为："+user.getId());
		return "newstaff";
	}
	
	@RequestMapping(value="showstaff")
	public String showstaff(HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		List<User> staffList = userBiz.selectbypt(user.getType());
		session.setAttribute("staffList", staffList);
		return "staff";
	}
	
	@RequestMapping(value="allorder")
	public String allorder(HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		String location = user.getType().substring(0, user.getType().length()-1);
		List<Express> orderList = expressBiz.selectall(location);
		session.setAttribute("orderList", orderList);
		return "allorder";
	}

}

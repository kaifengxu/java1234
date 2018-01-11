package com.java1234.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java1234.entity.Group;
import com.java1234.entity.MemberShip;
import com.java1234.entity.PageBean;
import com.java1234.entity.User;
import com.java1234.service.GroupService;
import com.java1234.service.MemberShipService;
import com.java1234.service.UserService;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * �û�Controller
 * @author user
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Resource
	private UserService userService;
	
	@Resource
	private MemberShipService memberShipService;
	
	@Resource
	private GroupService groupService;
	
	/**
	 * �û���¼
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		String groupId=request.getParameter("groupId");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("userName", userName);
		map.put("password", password);
		map.put("groupId", groupId);
		MemberShip memberShip=memberShipService.login(map);
		JSONObject result=new JSONObject();
		if(memberShip==null){
			result.put("success", false);
			result.put("errorInfo", "�û��������������");
		}else{
			result.put("success", true);
			request.getSession().setAttribute("currentMemberShip", memberShip);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * ����������ҳ��ѯ�û�����
	 * @param page
	 * @param rows
	 * @param s_user
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,User s_user,HttpServletResponse response)throws Exception{
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id",StringUtil.formatLike(s_user.getId())); // ��ѯ�û�����ȡ
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<User> userList=userService.find(map);
		Long total=userService.getTotal(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(userList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * ����������ҳ��ѯ�û��Լ��û��Ľ�ɫ��Ϣ����
	 * @param page
	 * @param rows
	 * @param s_user
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/listWithGroups")
	public String listWithGroups(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,User s_user,HttpServletResponse response)throws Exception{
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id",StringUtil.formatLike(s_user.getId())); // ��ѯ�û�����ȡ
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<User> userList=userService.find(map);
		for(User user:userList){
			StringBuffer groups=new StringBuffer();
			List<Group> groupList=groupService.findByUserId(user.getId());
			for(Group g:groupList){
				groups.append(g.getName()+",");
			}
			if(groups.length()>0){
				user.setGroups(groups.deleteCharAt(groups.length()-1).toString());
			}else{
				user.setGroups(groups.toString());
			}
		}
		Long total=userService.getTotal(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(userList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * ɾ���û�
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids",required=false)String ids,HttpServletResponse response)throws Exception{
		String []idsStr=ids.split(",");
		for(int i=0;i<idsStr.length;i++){
			userService.delete(idsStr[i]);
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * ��ӻ����޸��û�
	 * @param user
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(User user,HttpServletResponse response,Integer flag)throws Exception{
		int resultTotal=0;
		if(flag==1){
			resultTotal=userService.add(user);
		}else{
			resultTotal=userService.update(user);
		}
		JSONObject result=new JSONObject();
		if(resultTotal>0){
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * �ж��Ƿ����ָ���û���
	 * @param userName
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/existUserName")
	public String existUserName(String userName,HttpServletResponse response)throws Exception{
		JSONObject result=new JSONObject();
		if(userService.findById(userName)==null){
			result.put("exist", false);
		}else{
			result.put("exist", true);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * �޸��û�����
	 * @param id
	 * @param newPassword
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/modifyPassword")
	public String modifyPassword(String id,String newPassword,HttpServletResponse response)throws Exception{
		User user=new User();
		user.setId(id);
		user.setPassword(newPassword);
		JSONObject result=new JSONObject();
		int resultTotal=userService.update(user);
		if(resultTotal>0){
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * �û�ע��
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:/login.jsp";
	}
}

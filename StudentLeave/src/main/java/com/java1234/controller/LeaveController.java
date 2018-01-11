package com.java1234.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.impl.json.JsonObjectConverter;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java1234.entity.Leave;
import com.java1234.entity.PageBean;
import com.java1234.service.LeaveService;
import com.java1234.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * ��ٵ�Controller
 * @author leave
 *
 */
@Controller
@RequestMapping("/leave")
public class LeaveController {

	@Resource
	private LeaveService leaveService;
	
	@Resource
	private RuntimeService runtimeService;
	
	@Resource
	private TaskService taskService;
	
	/**
	 * ����������ҳ��ѯ��ٵ�����
	 * @param page
	 * @param rows
	 * @param userId
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,String userId,HttpServletResponse response)throws Exception{
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("userId",userId); // �û���
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Leave> leaveList=leaveService.find(map);
		Long total=leaveService.getTotal(map);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd hh:mm:ss"));
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(leaveList,jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * �����ٵ�
	 * @param leave
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(Leave leave,HttpServletResponse response,Integer flag)throws Exception{
		int resultTotal=0;
		leave.setLeaveDate(new Date());
		resultTotal=leaveService.add(leave);
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
	 * ����������룬�޸���ٵ�
	 * @param leaveId
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/startApply")
	public String startApply(Integer leaveId,HttpServletResponse response)throws Exception{
		Map<String,Object> variables=new HashMap<String,Object>();
		variables.put("leaveId", leaveId);
		ProcessInstance pi= runtimeService.startProcessInstanceByKey("studentLeaveProcess",variables);  // ��������
		Task task=taskService.createTaskQuery().processInstanceId(pi.getProcessInstanceId()).singleResult(); // ��������ʵ��Id��ѯ����
		taskService.complete(task.getId());  // ��� ѧ����д��ٵ�����
		
		Leave leave=leaveService.findById(leaveId);
		leave.setState("�����");
		leave.setProcessInstanceId(pi.getProcessInstanceId());
		leaveService.update(leave); // �޸���ٵ�״̬
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * ͨ������id��ȡ��ٵ�
	 * @param taskId
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getLeaveByTaskId")
	public String getLeaveByTaskId(String taskId,HttpServletResponse response)throws Exception{
		Integer leaveId=(Integer) taskService.getVariable(taskId, "leaveId");
		Leave leave=leaveService.findById(leaveId);
		JSONObject result=new JSONObject();
		result.put("leave", JSONObject.fromObject(leave));
		ResponseUtil.write(response, result);
		return null;
	}
	
}

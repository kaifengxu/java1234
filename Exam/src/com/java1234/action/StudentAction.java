package com.java1234.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.java1234.dao.StudentDao;
import com.java1234.model.PageBean;
import com.java1234.model.Student;
import com.java1234.util.DateUtil;
import com.java1234.util.PageUtil;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

public class StudentAction extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private StudentDao studentDao=new StudentDao();
	
	private Student student;
	private String error;
	
	private String mainPage;
	
	private List<Student> studentList;
	
	private Student s_student;
	
	private String page;
	private int total;
	private String pageCode;
	
	private String title;
	
	private String id;
	
	public Student getStudent() {
		return student;
	}



	public void setStudent(Student student) {
		this.student = student;
	}



	public String getError() {
		return error;
	}



	public void setError(String error) {
		this.error = error;
	}
	
	


	public String getMainPage() {
		return mainPage;
	}



	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}
	
	



	public List<Student> getStudentList() {
		return studentList;
	}



	public void setStudentList(List<Student> studentList) {
		this.studentList = studentList;
	}

	


	public Student getS_student() {
		return s_student;
	}



	public void setS_student(Student s_student) {
		this.s_student = s_student;
	}
	
	



	public String getPage() {
		return page;
	}



	public void setPage(String page) {
		this.page = page;
	}



	public int getTotal() {
		return total;
	}



	public void setTotal(int total) {
		this.total = total;
	}



	public String getPageCode() {
		return pageCode;
	}



	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}
	
	



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}
	
	



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String login()throws Exception{
		HttpSession session=request.getSession();
		Student currentUser=studentDao.login(student);
		if(currentUser==null){
			error="准考证号或密码错误";
			return ERROR;
		}else{
			session.setAttribute("currentUser", currentUser);
			return SUCCESS;
		}
	}
	
	public String preUpdatePassword()throws Exception{
		mainPage="student/updatePassword.jsp";
		return SUCCESS;
	}
	
	public String updatePassword()throws Exception{
		Student s=studentDao.getStudentById(student.getId());
		s.setPassword(student.getPassword());
		studentDao.saveStudent(s);
		mainPage="student/updateSuccess.jsp";
		return SUCCESS;
	}
	
	public String logout()throws Exception{
		request.getSession().invalidate();
		return "logout";
	}

	public String list()throws Exception{
		HttpSession session=request.getSession();
		if(StringUtil.isEmpty(page)){
			page="1";
		}
		if(s_student==null){
			Object o=session.getAttribute("s_student");
			if(o!=null){
				s_student=(Student)o;
			}else{
				s_student=new Student();				
			}
		}else{
			session.setAttribute("s_student", s_student);
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),3);
		studentList=studentDao.getStudents(s_student,pageBean);
		total=studentDao.studentCount(s_student);
		pageCode=PageUtil.genPagination(request.getContextPath()+"/student!list", total, Integer.parseInt(page), 3);
		mainPage="student/studentList.jsp";
		return SUCCESS;
	}
	
	public String preSave()throws Exception{
		if(StringUtil.isNotEmpty(id)){
			student=studentDao.getStudentById(id);
			title="修改学生信息";
		}else{
			title="添加学生信息";			
		}
		mainPage="student/studentSave.jsp";
		return SUCCESS;
	}
	
	public String saveStudent()throws Exception{
		if(StringUtil.isEmpty(student.getId())){
			student.setId("JS"+DateUtil.getCurrentDateStr());
		}
		studentDao.saveStudent(student);
		return "save";
	}
	
	public String deleteStudent()throws Exception{
		student=studentDao.getStudentById(id);
		studentDao.studentDelete(student);
		JSONObject resultJson=new JSONObject();
		resultJson.put("success", true);
		ResponseUtil.write(resultJson, ServletActionContext.getResponse());
		return null;
	}


	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}

}

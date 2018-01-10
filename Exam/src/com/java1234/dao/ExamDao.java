package com.java1234.dao;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.java1234.model.Exam;
import com.java1234.model.PageBean;
import com.java1234.model.Student;
import com.java1234.util.HibernateUtil;
import com.java1234.util.StringUtil;

public class ExamDao {

	public void saveExam(Exam exam)throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.merge(exam);
		session.getTransaction().commit();
	}
	
	public List<Exam> getExams(Exam s_exam,PageBean pageBean)throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		StringBuffer hql=new StringBuffer("from Exam exam");
		if(s_exam.getStudent()!=null&&StringUtil.isNotEmpty(s_exam.getStudent().getId())){
			hql.append(" and exam.student.id='"+s_exam.getStudent().getId()+"'");
		}
		if(s_exam.getStudent()!=null&&StringUtil.isNotEmpty(s_exam.getStudent().getName())){
			hql.append(" and exam.student.name like '%"+s_exam.getStudent().getName()+"%'");
		}
		Query query=session.createQuery(hql.toString().replaceFirst("and", "where"));
		if(pageBean!=null){
			query.setFirstResult(pageBean.getStart());
			query.setMaxResults(pageBean.getPageSize());
		}
		@SuppressWarnings("unchecked")
		List<Exam> examList=query.list();
		session.getTransaction().commit();
		return examList;
	}
	
	public int examCount(Exam s_exam)throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		StringBuffer sql=new StringBuffer("select count(*) from t_exam t1,t_student t2 where t1.studentId=t2.id ");
		if(s_exam.getStudent()!=null&&StringUtil.isNotEmpty(s_exam.getStudent().getId())){
			sql.append(" and t2.id='"+s_exam.getStudent().getId()+"'");
		}
		if(s_exam.getStudent()!=null&&StringUtil.isNotEmpty(s_exam.getStudent().getName())){
			sql.append(" and t2.name like '%"+s_exam.getStudent().getName()+"%'");
		}
		Query query=session.createSQLQuery(sql.toString());
		int count=((BigInteger)query.uniqueResult()).intValue();
		session.getTransaction().commit();
		return count;
	}
}

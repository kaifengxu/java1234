package com.java1234.service.impl;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.BaseDAO;
import com.java1234.entity.Comment;
import com.java1234.entity.Notice;
import com.java1234.entity.PageBean;
import com.java1234.service.CommentService;

/**
 * 留言Service类
 * @author Administrator
 *
 */
@Service("commentService")
public class CommentServiceImpl implements CommentService {

	@Resource
	private BaseDAO<Comment> baseDAO;
	
	public List<Comment> findCommentList(Comment s_comment,PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Comment");
		hql.append(" order by createTime desc");
		if(pageBean!=null){
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else{
			return null;
		}
	}

	public Long getCommentCount(Comment s_Comment) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Comment");
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	public void saveComment(Comment comment) {
		// TODO Auto-generated method stub
		baseDAO.merge(comment);
	}

	public void delete(Comment comment) {
		// TODO Auto-generated method stub
		baseDAO.delete(comment);
	}

	public Comment getCommentById(int commentId) {
		return baseDAO.get(Comment.class, commentId);
	}

}

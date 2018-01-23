package com.java1234.service.impl;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.BaseDAO;
import com.java1234.entity.Notice;
import com.java1234.entity.PageBean;
import com.java1234.entity.Tag;
import com.java1234.service.TagService;
import com.java1234.util.StringUtil;

/**
 * 商品大类实体类
 * @author Administrator
 *
 */
@Service("tagService")
public class TagServiceImpl implements TagService {

	@Resource
	private BaseDAO<Tag> baseDAO;
	
	public List<Tag> findTagList(Tag s_tag,PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Tag");
		if(s_tag!=null){
			if(StringUtil.isNotEmpty(s_tag.getName())){
				hql.append(" and name like ?");
				param.add("%"+s_tag.getName()+"%");
			}
		}
		if(pageBean!=null){
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else{
			return baseDAO.find(hql.toString().replaceFirst("and", "where"),param);
		}
	}

	public Long getTagCount(Tag s_tag) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Tag");
		if(s_tag!=null){
			if(StringUtil.isNotEmpty(s_tag.getName())){
				hql.append(" and name like ?");
				param.add("%"+s_tag.getName()+"%");
			}
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	public void saveTag(Tag tag) {
		// TODO Auto-generated method stub
		baseDAO.merge(tag);
	}

	public void delete(Tag tag) {
		// TODO Auto-generated method stub
		baseDAO.delete(tag);
	}

	public Tag getTagById(int tagId) {
		// TODO Auto-generated method stub
		return baseDAO.get(Tag.class, tagId);
	}

}

package com.java1234.service.impl;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.BaseDAO;
import com.java1234.entity.News;
import com.java1234.entity.PageBean;
import com.java1234.service.NewsService;
import com.java1234.util.StringUtil;

/**
 * 新闻Service类
 * @author Administrator
 *
 */
@Service("newsService")
public class NewsServiceImpl implements NewsService {

	@Resource
	private BaseDAO<News> baseDAO;
	
	public List<News> findNewsList(News s_news, PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from News");
		if(s_news!=null){
			if(StringUtil.isNotEmpty(s_news.getTitle())){
				hql.append(" and title like ?");
				param.add("%"+s_news.getTitle()+"%");
			}
		}
		if(pageBean!=null){
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else{
			return null;
		}
	}

	public News getNewsById(int newsId) {
		return baseDAO.get(News.class, newsId);
	}

	public Long getNewsCount(News s_news) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from News");
		if(s_news!=null){
			if(StringUtil.isNotEmpty(s_news.getTitle())){
				hql.append(" and title like ?");
				param.add("%"+s_news.getTitle()+"%");
			}
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	public void saveNews(News news) {
		// TODO Auto-generated method stub
		baseDAO.merge(news);
	}

	public void delete(News news) {
		// TODO Auto-generated method stub
		baseDAO.delete(news);
	}

}

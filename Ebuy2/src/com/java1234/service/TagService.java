package com.java1234.service;

import java.util.List;

import com.java1234.entity.Notice;
import com.java1234.entity.PageBean;
import com.java1234.entity.Tag;

/**
 * 标签service接口
 * @author Administrator
 *
 */
public interface TagService {

	/**
	 * 查询标签集合
	 * @return
	 */
	public List<Tag> findTagList(Tag s_tag,PageBean pageBean);
	
	/**
	 * 查询标签数量
	 * @param s_tag
	 * @return
	 */
	public Long getTagCount(Tag s_tag);
	
	/**
	 * 保存标签
	 * @param tag
	 */
	public void saveTag(Tag tag);
	
	/**
	 * 删除标签
	 * @param tag
	 */
	public void delete(Tag tag);
	
	/**
	 * 通过标签id获取标签
	 * @param tagId
	 * @return
	 */
	public Tag getTagById(int tagId);
}

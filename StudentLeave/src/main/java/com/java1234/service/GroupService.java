package com.java1234.service;

import java.util.List;
import java.util.Map;

import com.java1234.entity.Group;

/**
 * ��ɫService
 * @author user
 *
 */
public interface GroupService {

	/**
	 * ����������ѯ��ɫ����
	 * @param id
	 * @return
	 */
	public List<Group> find(Map<String,Object> map);
	
	/**
	 * ͨ��id��ѯ��ɫʵ��
	 * @param id
	 * @return
	 */
	public Group findById(String id);
	
	/**
	 * ����������ȡ�ܼ�¼��
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * ɾ����ɫ
	 * @param id
	 * @return
	 */
	public int delete(String id);
	
	/**
	 * �޸Ľ�ɫ
	 * @param group
	 * @return
	 */
	public int update(Group group);
	
	/**
	 * ��ӽ�ɫ
	 * @param group
	 * @return
	 */
	public int add(Group group);
	
	/**
	 * �ù��û�Id��ѯ��ɫ����
	 * @param userId
	 * @return
	 */
	public List<Group> findByUserId(String userId);
}

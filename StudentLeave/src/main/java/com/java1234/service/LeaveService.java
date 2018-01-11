package com.java1234.service;

import java.util.List;
import java.util.Map;

import com.java1234.entity.Leave;

/**
 * ��ٵ�Service�ӿ�
 * @author user
 *
 */
public interface LeaveService {

	/**
	 * ����������ѯ��ٵ�����
	 * @param map
	 * @return
	 */
	public List<Leave> find(Map<String,Object> map);
	
	/**
	 * ����������ȡ�ܼ�¼��
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * �����ٵ�
	 * @param leave
	 * @return
	 */
	public int add(Leave leave);
	
	/**
	 * ͨ��id��ѯ��ٵ�ʵ��
	 * @param id
	 * @return
	 */
	public Leave findById(Integer id);
	
	/**
	 * �޸���ٵ�
	 * @param leave
	 * @return
	 */
	public int update(Leave leave);
}

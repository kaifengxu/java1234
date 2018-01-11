package com.java1234.dao;

import java.util.Map;

import com.java1234.entity.MemberShip;

/**
 * �û���ɫ����Dao
 * @author user
 *
 */
public interface MemberShipDao {

	/**
	 * �û���¼
	 * @param map
	 * @return
	 */
	public MemberShip login(Map<String,Object> map);
	
	/**
	 * ɾ��ָ���û����н�ɫ
	 * @param userId
	 * @return
	 */
	public int deleteAllGroupsByUserId(String userId);
	
	/**
	 * ����û�Ȩ��
	 * @param memberShip
	 * @return
	 */
	public int add(MemberShip memberShip);
}

package com.java1234.service;

import java.util.Map;

import com.java1234.entity.MemberShip;

/**
 * �û���ɫ��ϵService
 * @author user
 *
 */
public interface MemberShipService {

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

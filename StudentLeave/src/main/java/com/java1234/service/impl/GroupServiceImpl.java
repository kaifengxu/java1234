package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.GroupDao;
import com.java1234.entity.Group;
import com.java1234.service.GroupService;

/**
 * 角色Service实现类
 * @author user
 *
 */
@Service("groupService")
public class GroupServiceImpl implements GroupService{

	@Resource
	private GroupDao groupDao;
	
	public List<Group> find(Map<String, Object> map) {
		return groupDao.find(map);
	}

	public Group findById(String id) {
		return groupDao.findById(id);
	}

	public Long getTotal(Map<String, Object> map) {
		return groupDao.getTotal(map);
	}

	public int delete(String id) {
		return groupDao.delete(id);
	}

	public int update(Group group) {
		return groupDao.update(group);
	}

	public int add(Group group) {
		return groupDao.add(group);
	}

	public List<Group> findByUserId(String userId) {
		return groupDao.findByUserId(userId);
	}

}

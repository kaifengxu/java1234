package com.java1234.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.RepairDao;
import com.java1234.model.Repair;
import com.java1234.model.PageBean;
import com.java1234.service.RepairService;

@Service("repairService")
public class RepairServiceImpl implements RepairService{

	@Resource
	private RepairDao repairDao;
	
	
	@Override
	public List<Repair> find(PageBean pageBean, Repair s_repair) {
		return repairDao.find(pageBean, s_repair);
	}

	@Override
	public int count(Repair s_repair) {
		return repairDao.count(s_repair);
	}




}

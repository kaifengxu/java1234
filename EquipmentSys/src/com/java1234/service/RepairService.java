package com.java1234.service;

import java.util.List;

import com.java1234.model.Repair;
import com.java1234.model.PageBean;

public interface RepairService {

	public List<Repair> find(PageBean pageBean,Repair s_repair);
	
	public int count(Repair s_repair);
	
}

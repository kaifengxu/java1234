package com.java1234.dao;

import java.util.List;

import com.java1234.model.Repair;
import com.java1234.model.PageBean;

public interface RepairDao {

	public void add(Repair repair);
	
	public List<Repair> find(PageBean pageBean,Repair s_repair);
	
	public int count(Repair s_repair);
	
	public void update(Repair repair);
}

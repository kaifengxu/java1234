package com.java1234.dao;

import java.util.List;

import com.java1234.model.EquipmentType;
import com.java1234.model.PageBean;

public interface EquipmentTypeDao {

	public List<EquipmentType> find(PageBean pageBean,EquipmentType s_equipmentType);
	
	public int count(EquipmentType s_equipmentType);
	
	public void add(EquipmentType equipmentType);
	
	public void update(EquipmentType equipmentType);
	
	public void delete(int id);
	
	public EquipmentType loadById(int id);
}

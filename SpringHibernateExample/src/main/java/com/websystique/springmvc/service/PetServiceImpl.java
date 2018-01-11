package com.websystique.springmvc.service;

import com.websystique.springmvc.dao.PetDao;
import com.websystique.springmvc.model.Pet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("petService")
@Transactional
public class PetServiceImpl implements PetService {

	@Autowired
	private PetDao dao;
	
	public Pet findById(int id) {
		return dao.findById(id);
	}

	public void savePet(Pet pet) {
		dao.savePet(pet);
	}

	public void deletePetById(int id) {
		dao.deletePetById(id);
	}
	
	public List<Pet> findAllPets() {
		return dao.findAllPets();
	}
	
}

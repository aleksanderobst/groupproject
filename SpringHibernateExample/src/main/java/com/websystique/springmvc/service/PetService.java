package com.websystique.springmvc.service;

import com.websystique.springmvc.model.Pet;

import java.util.List;

public interface PetService {

	Pet findById(int id);
	
	void savePet(Pet employee);
	
	void deletePetById(int id);

	List<Pet> findAllPets();
}

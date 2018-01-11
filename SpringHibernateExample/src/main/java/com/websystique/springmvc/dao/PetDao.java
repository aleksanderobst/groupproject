package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.Pet;

import java.util.List;

public interface PetDao {
    Pet findById(int id);

    void savePet(Pet employee);

    void deletePetById(int id);

    public boolean isDone(Pet active);

    List<Pet> findAllPets();
}

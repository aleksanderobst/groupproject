package com.websystique.springmvc.dao;


import com.websystique.springmvc.model.Pet;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Repository("petDao")
public class PetDaoImpl extends AbstractDao<Integer, Pet> implements PetDao {
    public Pet findById(int id) {
        return null;
    }

    public void savePet(Pet pet) {
        Logger.getLogger(getClass().getName())
                .log(Level.INFO, "Saving pet:" + pet);
        persist(pet);
    }

    public void deletePetById(int id) {
        Logger.getLogger(getClass().getName())
                .log(Level.INFO, "Deleting pet: " + id);

    }

    @Override
    public boolean isDone(Pet active) {

        return false;
    }

    public List<Pet> findAllPets() {
        Criteria criteria = createEntityCriteria();
        return (List<Pet>) criteria.list();
    }
}

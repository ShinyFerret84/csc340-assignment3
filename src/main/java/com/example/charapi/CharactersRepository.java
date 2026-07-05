package com.example.charapi;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CharactersRepository extends JpaRepository<Characters, Long> {
    List<Characters> findByNameContainingIgnoreCase(String name);
    
    List<Characters> findBySpeciesContainingIgnoreCase(String species);

    List<Characters> findByOccupationContainingIgnoreCase(String occupation);
}

package com.example.charapi;

import java.util.List;

import javax.xml.stream.events.Characters;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CharactersRepository extends JpaRepository<Characters, Long> {
    List<Characters> findByNameContainingIgnoreCase(String name);
    
    List<Characters> findBySpeciesContainingIgnoreCase(String species);

    List<Characters> findByOccupationContainingIgnoreCase(String occupation);
}

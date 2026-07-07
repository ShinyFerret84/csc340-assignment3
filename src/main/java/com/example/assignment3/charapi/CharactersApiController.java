package com.example.assignment3.charapi;

import java.util.Collections;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/characters")
public class CharactersApiController {
    private final CharactersService charactersService;
    
    public CharactersApiController(CharactersService charactersService) {
        this.charactersService = charactersService;
    }

    @GetMapping("/hello")
    public String sayHello() {
        return "Hello from CharactersController!";
    }

    @GetMapping
    public ResponseEntity<List<Characters>> getAllCharacters() {
        List<Characters> characters = charactersService.getAllCharacters();
        if (characters.isEmpty()) {
            return ResponseEntity.ok(Collections.emptyList());
        }
        return ResponseEntity.ok(characters);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Characters> getCharacterById(@PathVariable Long id) {
        Characters character = charactersService.getCharacterById(id);
        if (character != null) {
            return ResponseEntity.ok(character);
        }
        return ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<Characters> addCharacter(@RequestBody Characters character) {
        Characters createdCharacter = charactersService.addCharacter(character);
        return ResponseEntity.ok(createdCharacter);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Characters> updateCharacter(@PathVariable Long id, @RequestBody Characters updatedCharacter) {
        Characters character = charactersService.updateCharacter(id, updatedCharacter);
        if (character != null) {
            return ResponseEntity.ok(character);
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCharacter(@PathVariable Long id) {
        boolean deleted = charactersService.deleteCharacter(id);
        if (deleted) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/search")
    public ResponseEntity<List<Characters>> searchCharacters(@RequestParam String name) {
        List<Characters> characters = charactersService.searchCharactersByName(name);
        if (characters.isEmpty()) {
            return ResponseEntity.ok(Collections.emptyList());
        }
        return ResponseEntity.ok(characters);
    }

    @GetMapping("/species")
    public ResponseEntity<List<Characters>> getCharactersBySpecies(@RequestParam String species) {
        List<Characters> characters = charactersService.getCharactersBySpecies(species);
        if (characters.isEmpty()) {
            return ResponseEntity.ok(Collections.emptyList());
        }
        return ResponseEntity.ok(characters);
    }   

    @GetMapping("/occupation")
    public ResponseEntity<List<Characters>> getCharactersByOccupation(@RequestParam String occupation) {
        List<Characters> characters = charactersService.getCharactersByOccupation(occupation);
        if (characters.isEmpty()) {
            return ResponseEntity.ok(Collections.emptyList());
        }
        return ResponseEntity.ok(characters);
    }

}
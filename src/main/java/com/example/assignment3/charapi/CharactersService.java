package com.example.assignment3.charapi;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class CharactersService {
    private final CharactersRepository charactersRepository;

    public CharactersService(CharactersRepository charactersRepository) {
        this.charactersRepository = charactersRepository;
    }

    public List<Characters> getAllCharacters() {
        return charactersRepository.findAll();
    }

    public Characters getCharacterById(Long id) {
        return charactersRepository.findById(id).orElse(null);
    }

    public Characters addCharacter(Characters character) {
        return charactersRepository.save(character);
    }

    public Characters updateCharacter(Long id, Characters updatedCharacter) {
    return charactersRepository.findById(id)
            .map(character -> {
                character.setName(updatedCharacter.getName());
                character.setDescription(updatedCharacter.getDescription());
                character.setSpecies(updatedCharacter.getSpecies());
                character.setOccupation(updatedCharacter.getOccupation());
                character.setFirstAppearance(updatedCharacter.getFirstAppearance());
                character.setImageUrl(updatedCharacter.getImageUrl());
                character.setThumbImg(updatedCharacter.getThumbImg());

                return charactersRepository.save(character);
            })
            .orElse(null);
    }

    public void deleteCharacter(Long id) {
        if (charactersRepository.existsById(id)) {
        charactersRepository.deleteById(id);
        }
    }

    public List<Characters> getCharactersBySpecies(String species) {
        return charactersRepository.findBySpeciesContainingIgnoreCase(species);
    }

    public List<Characters> searchCharactersByName(String name) {
        return charactersRepository.findByNameContainingIgnoreCase(name);
    }

    public List<Characters> getCharactersByOccupation(String occupation) {
        return charactersRepository.findByOccupationContainingIgnoreCase(occupation);
    }


}

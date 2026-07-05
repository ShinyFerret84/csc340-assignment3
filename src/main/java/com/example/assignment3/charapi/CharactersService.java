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
        Characters existingCharacter = charactersRepository.findById(id).orElse(null);
        if (existingCharacter != null) {
            existingCharacter.setName(updatedCharacter.getName());
            existingCharacter.setDescription(updatedCharacter.getDescription());
            existingCharacter.setSpecies(updatedCharacter.getSpecies());
            existingCharacter.setOccupation(updatedCharacter.getOccupation());
            existingCharacter.setFirstAppearance(updatedCharacter.getFirstAppearance());
            return charactersRepository.save(existingCharacter);
        }
        return null;
    }

    public boolean deleteCharacter(Long id) {
        if (charactersRepository.existsById(id)) {
            charactersRepository.deleteById(id);
            return true;
        }
        return false;
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

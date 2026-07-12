package com.example.assignment3.charapi;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CharactersUiController {

    private final CharactersService charactersService;

    public CharactersUiController(CharactersService charactersService) {
        this.charactersService = charactersService;
    }

    //About Page
    @GetMapping("/about")
    public String about(){
    return "about";
    }

    //Index Page
    @GetMapping("/characters")
    public String getAllCharacters(Model model) {
        model.addAttribute("characterList", 
                        charactersService.getAllCharacters());
        return "index";
    }

    //Add Character Form
    @GetMapping("/create")
    public String showCreateForm() {
        return "new-character-form";
    }

    @PostMapping("/create")
    public String createCharacter(@ModelAttribute Characters character) {
        charactersService.addCharacter(character);
        return "redirect:/characters";
    }

    //Details
    @GetMapping("/characters/{id}")
    public String getCharactersById(@PathVariable Long id, Model model) {
        Characters characters = charactersService.getCharacterById(id);
        model.addAttribute("character", characters);
        return "details";
    }
}

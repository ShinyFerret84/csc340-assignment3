package com.example.assignment3.charapi;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class CharactersUiController {

    private final CharactersService charactersService;

    public CharactersUiController(CharactersService charactersService) {
        this.charactersService = charactersService;
    }

    @GetMapping("/about")
    public String about(){
    return "about";
    }
    
    @GetMapping("/characters/{id}")
    public String getCharactersById(@PathVariable Long id, Model model) {
        Characters characters = charactersService.getCharacterById(id);
        model.addAttribute("character", characters);
        return "details";
    }
}

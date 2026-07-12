package com.example.assignment3.charapi;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "characters")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Characters {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String description;

    @Column(nullable = false)
    private String species;

    @Column(nullable = false)
    private String occupation;

    @Column
    private String firstAppearance;

    @Column(name = "imageUrl")
    private String imageUrl;

    @Column(name = "thumbImg")
    private String thumbImg;

    public Characters(String name, String description, String species, String occupation, String firstAppearance, String imageUrl, String thumbImg) {
        this.name = name;
        this.description = description;
        this.species = species;
        this.occupation = occupation;
        this.firstAppearance = firstAppearance;
        this.imageUrl = imageUrl;
        this.thumbImg = thumbImg;
    }

    
}   

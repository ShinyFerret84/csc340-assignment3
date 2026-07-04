package com.example.charapi;


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

    public Characters(String name, String description, String species, String occupation, String firstAppearance) {
        this.name = name;
        this.description = description;
        this.species = species;
        this.occupation = occupation;
        this.firstAppearance = firstAppearance;
    }
}   

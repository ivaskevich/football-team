package com.football.team.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
@NoArgsConstructor
@Entity
public class Player {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @NotBlank(message = "Поле імені не може бути порожнім !")
    private String name;
    @NotBlank(message = "Поле прізвища не може бути порожнім !")
    private String surname;
    private Position position;
    private AgeCategory ageCategory;
    private Short shirtNumber;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private File file;

    public Player(String name, String surname, AgeCategory ageCategory, Position position, Short shirtNumber) {
        this.ageCategory = ageCategory;
        this.name = name;
        this.surname = surname;
        this.position = position;
        this.shirtNumber = shirtNumber;
    }
}

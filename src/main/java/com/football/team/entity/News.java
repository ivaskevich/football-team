package com.football.team.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@Entity
public class News {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @NotBlank(message = "Заголовок не може бути порожнім !")
    private String title;
    @NotBlank(message = "Підзаголовок не може бути порожнім !")
    private String subTitle;
    @NotBlank(message = "Текс новини не може бути порожнім !")
    private String text;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private File file;

    private LocalDateTime dateTime;

    public News(String title, String subTitle, String text) {
        this.title = title;
        this.subTitle = subTitle;
        this.text = text;
        this.dateTime = LocalDateTime.now();
    }

    public void setCurrentDateTime() {
        this.setDateTime(LocalDateTime.now());
    }
}

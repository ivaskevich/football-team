package com.football.team.controller;

import com.football.team.entity.News;
import com.football.team.repository.NewsRepository;
import com.football.team.service.ResultsService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final NewsRepository newsRepository;
    private final ResultsService resultsService;

    @GetMapping("/")
    public String index(Model model) {
        ArrayList<News> news = newsRepository.findAll();

        model.addAttribute("news", news);
        model.addAttribute("tableResult", resultsService.getTableResult());
        return "main";
    }
}

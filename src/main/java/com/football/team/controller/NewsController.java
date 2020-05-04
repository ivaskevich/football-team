package com.football.team.controller;

import com.football.team.entity.File;
import com.football.team.entity.News;
import com.football.team.service.FileService;
import com.football.team.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import static com.football.team.controller.ControllerUtil.getErrors;

@Controller
@RequestMapping("/news")
public class NewsController {

    private final NewsService newsService;
    private final FileService fileService;

    @Autowired
    public NewsController(NewsService newsService, FileService fileService) {
        this.newsService = newsService;
        this.fileService = fileService;
    }

    @GetMapping()
    public String news(Model model) {
        List<News> news = newsService.findAll();
        model.addAttribute("news", news);
        return "news_list";
    }

    @GetMapping("{id}")
    public String getNews(@PathVariable int id, Model model) {
        News current_new = newsService.findById(id);
        model.addAttribute("currentNews", current_new);
        return "news";
    }

    @PostMapping("add")
    public String addNews(@Valid News news,
                          BindingResult bindingResult,
                          Model model,
                          @RequestParam MultipartFile multipartFile) throws IOException {

        File uploadedFile = fileService.addFile(multipartFile);

        if (bindingResult.hasErrors()) {
            Map<String, String> errors = getErrors(bindingResult);

            model.mergeAttributes(errors);
            model.addAttribute("new", news);
        } else {
            if (!Objects.requireNonNull(multipartFile.getOriginalFilename()).isEmpty()) {
                news.setFile(uploadedFile);
            }
            model.addAttribute("new", null);
            newsService.addNews(news);
        }

        List<News> newsList = newsService.findAll();
        model.addAttribute("news", newsList);

        return "redirect:/news";
    }


    @RequestMapping(value = "delete/{id}")
    public String delete(@PathVariable int id, Model model) {
        newsService.deleteNewsById(id);

        List<News> newsList = newsService.findAll();
        model.addAttribute("news", newsList);

        return "redirect:/news";
    }
}

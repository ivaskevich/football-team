package com.football.team.service;

import com.football.team.entity.News;
import com.football.team.repository.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsService {
    private final NewsRepository newsRepository;

    @Autowired
    public NewsService(NewsRepository newsRepository) {
        this.newsRepository = newsRepository;
    }

    public List<News> findAll() {
        return newsRepository.findAll();
    }

    public News findById(Integer id) {
        if (newsRepository.findById(id).isPresent()) {
            return newsRepository.findById(id).get();
        }
        throw new RuntimeException("Could not load news with id - " + id);
    }

    public News addNews(News news) {
        news.setCurrentDateTime();
        return newsRepository.save(news);
    }

    public void deleteNewsById(Integer id) {
        if (newsRepository.findById(id).isPresent()) {
            newsRepository.delete(newsRepository.findById(id).get());
        }
    }
}

package com.football.team.repository;

import com.football.team.entity.News;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface NewsRepository extends CrudRepository<News, Integer> {
    ArrayList<News> findAll();

    News findById(int id);
}

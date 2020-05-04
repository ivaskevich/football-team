package com.football.team.repository;

import com.football.team.entity.AgeCategory;
import com.football.team.entity.Player;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PlayerRepository extends JpaRepository<Player, Integer> {

    List<Player> findByName(String filter);

    List<Player> findByAgeCategory(AgeCategory ageCategory);

    List<Player> findByNameAndAgeCategory(String filter, AgeCategory ageCategory);
}

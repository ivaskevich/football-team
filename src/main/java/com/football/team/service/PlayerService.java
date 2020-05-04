package com.football.team.service;

import com.football.team.entity.AgeCategory;
import com.football.team.entity.Player;
import com.football.team.repository.PlayerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlayerService {
    private final PlayerRepository playerRepository;

    @Autowired
    public PlayerService(PlayerRepository playerRepository) {
        this.playerRepository = playerRepository;
    }

    public Player addPlayer(Player player) {
        return playerRepository.save(player);
    }

    public void deletePlayerById(Integer id) {
        if (playerRepository.findById(id).isPresent()) {
            playerRepository.delete(playerRepository.findById(id).get());
        }
    }

    public List<Player> getAllPlayersByFilterAndAgeCategory(String filter, AgeCategory ageCategory) {
        return filter == null || filter.equals("") ? playerRepository.findByAgeCategory(ageCategory) :
                playerRepository.findByNameAndAgeCategory(filter, ageCategory);
    }

    public List<Player> getAllPlayersAgeCategory(AgeCategory ageCategory) {
        return playerRepository.findByAgeCategory(ageCategory);
    }

    public List<Player> getAllPlayers() {
        return playerRepository.findAll();
    }


}

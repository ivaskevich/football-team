package com.football.team.repository;

import com.football.team.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);

    User findByActivationCode(String code);

    List<User> findAllByIdIsGreaterThan(Long idMin);
}

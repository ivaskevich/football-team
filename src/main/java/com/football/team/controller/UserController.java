package com.football.team.controller;

import com.football.team.entity.User;
import com.football.team.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/users")
public class UserController {

    private final UserService userService;

    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    @GetMapping
    public String userList(Model model) {
        model.addAttribute("users", userService.findAll());
        model.addAttribute("roles", userService.getRoleRepository().findAll());
        return "userList";
    }

    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    @GetMapping("{id}")
    public String userEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("user", userService.findUserById(id));
        model.addAttribute("roles", userService.getRoleRepository().findAll());
        return "userEdit";
    }

    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user) {

        userService.saveUser(user, username, form);

        return "redirect:/users";
    }

    @GetMapping("profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());

        return "profile";
    }

    @PostMapping("profile")
    public String updateProfile(@AuthenticationPrincipal User user,
                                @RequestParam String password,
                                @RequestParam String email) {

        userService.updateProfile(user, password, email);

        return "redirect:/user/profile";
    }


}

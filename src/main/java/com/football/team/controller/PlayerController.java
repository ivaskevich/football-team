package com.football.team.controller;

import com.football.team.entity.AgeCategory;
import com.football.team.entity.File;
import com.football.team.entity.Player;
import com.football.team.service.FileService;
import com.football.team.service.PlayerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import static com.football.team.controller.ControllerUtil.getErrors;

@Controller
@RequiredArgsConstructor
public class PlayerController {

    private final PlayerService playerService;
    private final FileService fileService;

/*    @Autowired
    public PlayerController(FileService fileService, PlayerService playerService) {
        this.fileService = fileService;
        this.playerService = playerService;
    }*/

    @GetMapping("/players/{ageCategory}")
    public String main(@PathVariable AgeCategory ageCategory,
                       @RequestParam(required = false) String filter,
                       Model model) {
        List<Player> players = playerService.getAllPlayersByFilterAndAgeCategory(filter, ageCategory);

        model.addAttribute("players", players);
        model.addAttribute("filter", filter);
        model.addAttribute("ageCategory", ageCategory.name());

        return "players";
    }

    @PostMapping("/players/{ageCategory}")
    public String add(@Valid Player player, @PathVariable AgeCategory ageCategory,
                      BindingResult bindingResult,
                      Model model,
                      @RequestParam MultipartFile multipartFile) {

        File uploadedFile = fileService.addFile(multipartFile);

        if (bindingResult.hasErrors()) {
            Map<String, String> errors = getErrors(bindingResult);

            model.mergeAttributes(errors);
            model.addAttribute("player", player);
        } else {
            if (!Objects.requireNonNull(multipartFile.getOriginalFilename()).isEmpty()) {
                player.setFile(uploadedFile);
            }
            model.addAttribute("player", null);
            model.addAttribute("ageCategory", ageCategory.name());
            playerService.addPlayer(player);
        }

        List<Player> players = playerService.getAllPlayersAgeCategory(ageCategory);
        model.addAttribute("players", players);

        return "players";
    }

    @RequestMapping(value = "/delete/{id}/{ageCategory}")
    public String delete(@PathVariable int id, @PathVariable AgeCategory ageCategory, Model model) {

        playerService.deletePlayerById(id);

        Iterable<Player> players = playerService.getAllPlayers();
        model.addAttribute("players", players);

        return "redirect:/players/" + ageCategory;
    }
}

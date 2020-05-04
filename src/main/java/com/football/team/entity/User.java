package com.football.team.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.Collection;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "t_user")
public class User implements UserDetails {
    private static final long serialVersionUID = -6844875147875714374L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Size(min = 4, message = "Ім'я користувача повинно містити не менше 4 знаків !")
    @NotEmpty(message = "Ім'я користувача не може бути порожнім !")
    private String username;

    @NotEmpty(message = "Пароль користувача не може бути порожнім !")
    private String password;
    @Transient
    private String passwordConfirm;

    private boolean active;

    @Email(message = "Електронна пошта введена не коректно !")
    @NotBlank(message = "Електронна пошта не може бути порожньою !")
    private String email;
    private String activationCode;

    @ManyToMany(fetch = FetchType.EAGER)
    private Set<Role> roles;

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return isActive();
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    public boolean isAdmin() {
        for (Role r : getRoles()) if (r.getName().equals("ROLE_ADMIN")) return true;
        return false;
    }
}

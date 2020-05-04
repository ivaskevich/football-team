package com.football.team.entity;

import lombok.Getter;

@Getter
public enum Position {
    gk("Воротар"), df("Захисник"), mf("Півзахисник"), cf("Нападник");

    private final String name;

    Position(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return getName();
    }
}

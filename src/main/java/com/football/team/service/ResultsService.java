package com.football.team.service;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class ResultsService {
    public List<List<String>> getTableResult() {
        List<List<String>> tableResult = new ArrayList<>();
        try {
            Document doc = Jsoup.connect("https://ffl.org.ua/cup/147").get();
            Element table = doc.select("table").get(0);
            Elements rows = table.select("tr");

            for (int i = 0; i < rows.size(); i++) {
                Element row = rows.get(i);
                Elements cols = row.select("td");
                tableResult.add(new ArrayList<>());
                for (int j = 0; j < cols.size(); j++) {
                    if (j == 1) {
                        if (i == 0) tableResult.get(i).add(cols.get(j).text());
                        else tableResult.get(i).add(cols.get(j).getElementsByTag("a").text());
                    } else tableResult.get(i).add(cols.get(j).text());
                }
            }
        } catch (
                IOException e) {
            e.printStackTrace();
        }
        return tableResult;
    }
}

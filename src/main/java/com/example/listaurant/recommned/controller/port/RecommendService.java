package com.example.listaurant.recommned.controller.port;

import com.example.listaurant.recommned.service.dto.RecommendDto;

public interface RecommendService {

    boolean isRecommendPresent(RecommendDto dto);

    void save(RecommendDto dto);

    void delete(RecommendDto dto);
}

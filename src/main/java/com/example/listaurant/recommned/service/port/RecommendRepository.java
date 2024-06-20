package com.example.listaurant.recommned.service.port;

import com.example.listaurant.recommned.reposiroty.RecommendEntity;
import com.example.listaurant.recommned.service.dto.RecommendDto;

import java.util.Optional;

public interface RecommendRepository {

    void save(RecommendDto recommendDto);

    Optional<RecommendEntity> findByTxtIdAndMemberId(RecommendDto recommendDto);

    void delete(RecommendDto recommendDto);
}

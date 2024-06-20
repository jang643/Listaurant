package com.example.listaurant.recommned.reposiroty;

import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface RecommendMapper {

    void save(RecommendEntity recommendEntity);

   Optional<RecommendEntity> findByTxtIdAndMemberId(RecommendEntity recommendEntity);

   void delete(RecommendEntity recommendEntity);
}

package com.example.listaurant.recommned.reposiroty;

import com.example.listaurant.recommned.service.dto.RecommendDto;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class RecommendEntity {
    Long member_id;
    Long txt_id;


    public static RecommendEntity from(RecommendDto recommendDto){
        return RecommendEntity.builder()
                .txt_id(recommendDto.getTxt_id())
                .member_id(recommendDto.getMember_id())
                .build();
    }
}

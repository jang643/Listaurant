package com.example.listaurant.recommned.service.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Getter
@Setter
public class RecommendDto {

    private Long txt_id;
    private Long member_id;
}

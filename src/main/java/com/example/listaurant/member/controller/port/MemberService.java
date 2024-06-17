package com.example.listaurant.member.controller.port;

import com.example.listaurant.member.controller.request.SignUpRequest;
import com.example.listaurant.member.domain.Member;

public interface MemberService {

    void save(SignUpRequest signUpRequest);

    boolean isDuplicationEmail(String email);
}
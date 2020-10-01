package com.example.configMapSecrets

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class PocController(val pocConfig: PocConfig) {


    @GetMapping("/poc")
    fun get() = pocConfig.value1 + " and " + pocConfig.value2

}

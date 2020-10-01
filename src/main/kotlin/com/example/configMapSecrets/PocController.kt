package com.example.configMapSecrets

import org.springframework.beans.factory.annotation.Value
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class PocController(@Value("\${hello.world:hi}") val hello: String) {

    @GetMapping("/poc")
    fun get() = hello
}

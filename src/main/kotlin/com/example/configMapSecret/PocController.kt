package com.example.configMapSecret

import org.springframework.beans.factory.annotation.Value
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class PocController(@Value("\${poc.configmap:hi}") private val configmap: String,
                    @Value("\${poc.secret:@#$}") private val secret: String) {

    @GetMapping("/configmap")
    fun getConfigMap() = configmap

    @GetMapping("/secret")
    fun getSecret() = secret
}

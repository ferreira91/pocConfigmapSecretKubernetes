package com.example.configMapSecret

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class PocConfigMapSecretApplication

fun main(args: Array<String>) {
    runApplication<PocConfigMapSecretApplication>(*args)
}

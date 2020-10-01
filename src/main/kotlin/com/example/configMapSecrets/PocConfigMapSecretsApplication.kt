package com.example.configMapSecrets

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class PocConfigMapSecretsApplication

fun main(args: Array<String>) {
    runApplication<PocConfigMapSecretsApplication>(*args)
}

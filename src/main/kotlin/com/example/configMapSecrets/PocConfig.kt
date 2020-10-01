package com.example.configMapSecrets

import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.context.annotation.Configuration

@Configuration
@ConfigurationProperties(prefix = "bean")
class PocConfig {
    val value1 : String = "test"
    val value2 : String = ""
}
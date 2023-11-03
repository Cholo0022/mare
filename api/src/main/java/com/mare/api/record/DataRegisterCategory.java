package com.mare.api.record;

import jakarta.validation.constraints.NotBlank;

public record DataRegisterCategory(
        Long id,
        @NotBlank
        String name) {
}

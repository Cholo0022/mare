package com.mare.api.record;

import jakarta.validation.constraints.*;

import java.math.BigDecimal;
import java.time.LocalDate;

public record DataRegisterProduct(Long id,
                                  @NotBlank
                                  String name,
                                  @NotBlank
                                  String description,
                                  @NotBlank
                                  String image,
                                  @NotNull
                                  @DecimalMin(value = "0.01", message = "El precio debe ser mayor o igual a 0.01")
                                  // Valida que el precio tenga hasta 2 decimales
                                  @Digits(integer = 10, fraction = 2, message = "El precio no puede tener más de 10 dígitos enteros y 2 decimales")
                                  BigDecimal price,
                                  // Valida que el campo no sea nulo
                                  @NotNull(message = "El stock no puede ser nulo")
                                  // Valida que el stock sea mayor o igual a 0
                                  @Min(value = 0, message = "El stock no puede ser negativo")
                                  Integer stock,
                                  @NotBlank
                                  String waist,
                                  @NotBlank
                                  String color,
                                  Boolean featured,

                                  DataRegisterCategory category) {
}

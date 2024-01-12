//
//  DataModel.swift
//  ActUni2.2
//
//  Created by Luciano Blanco on 1/11/24.

import Foundation

// Definición de la estructura Category
struct Category {
    var name: String
    var image: String
    var description: String
}

// Extensión de Category para contener datos de muestra
extension Category {
    static let sampleData = [
        Category(name: "Hamburguesas", image: "hamburguesa", description: "Platillos tradicionales con carne de res, pollo o alternativas vegetarianas, servidas con pan y complementos variados."),
        Category(name: "Pizzas", image: "pizza", description: "Delgadas masas horneadas con una variedad de ingredientes y salsas, originarias de Italia."),
        Category(name: "Mexicano", image: "nachos", description: "Cocina rica en sabores y colores, destacando ingredientes como el maíz, chile y frijoles."),
        Category(name: "Italiano", image: "italiano", description: "Gastronomía conocida por su pasta, pizzas y uso de hierbas frescas y tomate.")
    ]
}

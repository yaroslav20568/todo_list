# Todo List

Приложение для управления задачами, разработанное на Flutter.

## О проекте

Todo List - это простое и удобное приложение для управления задачами с поддержкой планирования по дате и времени. Приложение позволяет создавать задачи, отслеживать их статус и сохранять данные локально.

## Что было сделано

- Создана архитектура проекта с разделением на модели, сервисы, экраны, виджеты и утилиты
- Реализована модель задачи с тремя статусами: pending, inProgress, completed
- Создан экран со списком задач и полем ввода
- Реализован функционал добавления, удаления и изменения статуса задач
- Добавлена возможность планирования задач по дате и времени
- Интегрировано локальное кеширование задач через shared_preferences
- Настроена кастомная иконка приложения для Android
- Созданы переиспользуемые виджеты с декомпозицией UI

## Используемые пакеты

- `shared_preferences: ^2.2.2` - для локального хранения данных
- `flutter_launcher_icons: ^0.13.1` - для генерации иконок приложения
- `flutter_lints: ^6.0.0` - для анализа кода

---

# Todo List

A task management application built with Flutter.

## About

Todo List is a simple and convenient task management application with date and time scheduling support. The app allows you to create tasks, track their status, and save data locally.

## Features

- Project architecture with separation into models, services, screens, widgets, and utilities
- Task model with three statuses: pending, inProgress, completed
- Task list screen with input field
- Add, delete, and change task status functionality
- Date and time scheduling for tasks
- Local task caching via shared_preferences
- Custom app icon configuration for Android
- Reusable widgets with UI decomposition

## Dependencies

- `shared_preferences: ^2.2.2` - for local data storage
- `flutter_launcher_icons: ^0.13.1` - for app icon generation
- `flutter_lints: ^6.0.0` - for code analysis

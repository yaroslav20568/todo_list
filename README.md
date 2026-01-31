# Todo List

Приложение для управления задачами с поддержкой планирования по дате и времени.

## Описание проекта

Todo List - это мобильное приложение на Flutter для управления задачами. Приложение позволяет пользователям создавать задачи, отслеживать их статус (ожидание, в процессе, выполнено), планировать задачи по дате и времени, а также сохранять все данные локально на устройстве.

# Демонстрация

![Демонстрация работы](video/demo.gif)

## Что было сделано

- Создана структура проекта с разделением на экраны, виджеты, модели, сервисы, константы и утилиты
- Реализована модель задачи с тремя статусами: pending, inProgress, completed
- Создан основной экран со списком задач и полем ввода новой задачи
- Реализован функционал добавления, удаления и изменения статуса задач
- Добавлена возможность планирования задач по дате и времени через встроенные пикеры
- Интегрировано локальное хранилище задач через shared_preferences
- Созданы переиспользуемые виджеты для карточек задач, поля ввода и пустого состояния
- Настроены цвета приложения в отдельном файле констант
- Добавлена иконка приложения для Android
- Настроено название приложения "Todo List" для Android

## Используемые пакеты

- `flutter` - основной фреймворк
- `cupertino_icons` - иконки для iOS стиля
- `shared_preferences: ^2.2.2` - для локального хранения данных
- `flutter_lints` - линтеры для проверки кода
- `flutter_launcher_icons` - генерация иконок приложения (dev dependency)

## Архитектура

Проект следует принципам SOLID и KISS. Код организован в следующие директории:

- `lib/screens/` - экраны приложения
- `lib/widgets/` - переиспользуемые виджеты
- `lib/models/` - модели данных
- `lib/services/` - бизнес-логика и работа с хранилищем
- `lib/constants/` - константы (цвета)
- `lib/utils/` - утилиты (работа с датами)

---

# Todo List

A task management application with date and time scheduling support.

## Project Description

Todo List is a Flutter mobile application for task management. The application allows users to create tasks, track their status (pending, in progress, completed), schedule tasks by date and time, and save all data locally on the device.

# Demo

![Demo](video/demo.gif)

## What Was Done

- Created project structure with separation into screens, widgets, models, services, constants, and utilities
- Implemented task model with three statuses: pending, inProgress, completed
- Created main screen with task list and input field for new tasks
- Implemented functionality for adding, deleting, and changing task status
- Added ability to schedule tasks by date and time through built-in pickers
- Integrated local task storage via shared_preferences
- Created reusable widgets for task cards, input field, and empty state
- Configured application colors in a separate constants file
- Added application icon for Android
- Configured application name "Todo List" for Android

## Used Packages

- `flutter` - main framework
- `cupertino_icons` - icons for iOS style
- `shared_preferences: ^2.2.2` - for local data storage
- `flutter_lints` - linters for code checking
- `flutter_launcher_icons` - application icon generation (dev dependency)

## Architecture

The project follows SOLID and KISS principles. Code is organized into the following directories:

- `lib/screens/` - application screens
- `lib/widgets/` - reusable widgets
- `lib/models/` - data models
- `lib/services/` - business logic and storage operations
- `lib/constants/` - constants (colors)
- `lib/utils/` - utilities (date operations)

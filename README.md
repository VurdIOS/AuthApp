# AuthApp
## Приложение авторизации
## 🦦🦦🦦

---

### Немного по технологиям.
- MVVM
- Regex
- NSRegularExpression
- DigitalOcean
- DeepLink
- JWT token
- URLSession
- iOS SDK, XCODE и тд.

### Описание
Данное приложение было создано для изучения некоторых тонкостей авторизации пользователя в приложении

Для работы с сетевыми запросами был создан сервер в DigitalOcean, с базовоми функциями, а именно регистрация новых пользователей с последующим подтверждением email, и авторизация пользователей с отправкой токена.

Приложение на данный момент полностью функционирует, но только на моей машине, так как на сервере прописан только мой ssh ключ.

## Стартовый экран
Сделал лаунчер для красоты)
<div align="center">
  <img src="https://github.com/VurdIOS/AuthApp/blob/main/ScreenshotsREADME/LaunchView.png?raw=true" width="250" height="541" alt="Стартовый экран" />
</div>

## Основной экран
Он выглядит как самое базовое окно авторизации, с возможностью регистрации новых пользователей, с функцией скрытия пароля. При неверном пароле сверху выпадает кастомный алерт о неправильно введенном пароле.
При корректном пароле и 200 от сервера, мы перейдем на экран для авторизованных пользователей а также получим JWT token в теле ответа сервера. Так как я в последующем его нигде не использую, не реализовано сохранение токена.
<div align="center">
  <img src="https://github.com/VurdIOS/AuthApp/blob/main/ScreenshotsREADME/LoginView.png?raw=true" width="250" height="541" alt="Основной функционал" />
</div>

## Экран регистрации
Здесь основной момент был в валидации пароля, а именно он должен соответствовать 4 требованиям, на которые я проверяю текст в филде используя regex и NSRegularExpression. Проверка происходит в реальном времени используя делегаты.
Также кнопка не активна при несовпадении паролей.
<div align="center">
  <img src="https://github.com/VurdIOS/AuthApp/blob/main/ScreenshotsREADME/RegView1.png?raw=true" width="250" height="541" alt="Регистрация1" />
</div>
<div align="center">
  <img src="https://github.com/VurdIOS/AuthApp/blob/main/ScreenshotsREADME/RegView2.png?raw=true" width="250" height="541" alt="Регистрация2" />
</div>
<div align="center">
  <img src="https://github.com/VurdIOS/AuthApp/blob/main/ScreenshotsREADME/RegView3.png?raw=true" width="250" height="541" alt="Регистрация3" />
</div>


---


## Это был хороший опыт, приступаем к следующему проложению)

---


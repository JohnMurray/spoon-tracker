# Spoon Tracker

__This project is still under active, and early, development. The app is not yet available on
any app-store. The app will be ready once the 'Version 1' milestone is reached.__

---

Spoon tracker is an app for assisting those suffering from complicated or undiagnosed chronic
illness. Users of the app track their symptoms (pain, fatigue, dizzyness, etc) along with input
data. Input data comes with some pre-set automated inputs such as:

  - Weather data (temperature, humidity, barometric pressure, air quality, etc)
  - Heart-Rate data (pulled from smart-watches and connected devices)

But it can also be any user-defined data such as:

  - A specific medication taken (quantity and dosage)
  - A workout performed (type and reps)
  - A food eaten (type and quantity)

All of this data, which is tracked in a time-series format, is then used to generate _insights_,
which are essentially correlations found between 1 or more inputs and a single symptom. The goal
is to empower users to better understand how their environment and lifestyle affect their
health. 

## Contributing

If you are interested in contributing, take a look at the tickets under the __Version 1__ milestone.
If a ticket is not assigned, you can comment that you'd like to take it and I'll assign it to you.
If progress is not made and you are unreachable, if asked questions, the ticket will be reassigned
if someone is willing/wanting to work on it.

The app itself is written in [Flutter][flutter] and all efforts should be made to keep development
within Flutter and _not_ make use of native code. Changes that _require_ native code __must__ be made
on both platforms (Android and iOS) unless the feature only make sense on one (e.g. integration with
Apple Watch).

## Privacy

The goal of __Version 1__ is to build an application that is entirely local. The data is not stored
outside of the application or phone. Future versions may look into anonymous reporting (if the user
would like to opt-in) in order to help improve the insights algorithms, but at no point will the app
be used to collect any identifiable or personal information. 

Any data retrieved by the application will not carry any identifying information (such as pulling
weather data). 


## License

The project is licensed under the Apache 2.0 license. See `LICENSE.txt` for more info.



  [flutter]: https://flutter.io/

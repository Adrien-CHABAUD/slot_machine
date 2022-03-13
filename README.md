<!--
  Title: Slot MAchine
  Description: iOS App of slot machine type, made using SWIFTUI
  Author: Adrien CHABAUD
  -->
  
# Slot Machine iOS App

This project is about a simple slot machine using SwiftUI!

## Table of contents
* [General Info](#general-info)
* [Technologies](#technologies)
* [Sources](#sources)
* [Last Updates](#last-updates)

## General Info
Slot machine type of application, containing just one line and three symbols to match (Apple/Cherries/Star).

<!-- Add picture of the symbols -->
<!-- ![Lorem Ipsum](path) -->

<p align="center">
  <img src="/Slot_Machine/Assets.xcassets/fruit1.imageset/apple.png"><img src="/Slot_Machine/Assets.xcassets/fruit2.imageset/cherry.png"><img src="Slot_Machine/Assets.xcassets/fruit3.imageset/star.png">
</p>

When the button **SPIN** is pressed, the symbols are randomly changed and displayed, the coins amount is updated (amount bet is taken off and in case of a win, the won amount is added).

<p align="center">
  <img src="/images/slot_machine_activity.png" width=300><img src="/images/slot_machine_win.png" width=300>
</p>

**In case of a win**, the stars in the title scale up and rotate, the amount of coins scale up and change of background color and the slots turn to green and the images inside spin. When the user spins another time, the green colors fade back down and the the different component that changed go back as normal.

<ins>Here with the animations and transitions:</ins><br>

<p align="center">
  <img src="/images/slot_machine.gif" width=300>
</p>

## Technologies

This project uses:
* *Xcode: 13.2.1*
* *Swift: 5.5.2*

## Sources
<!-- Add any references or tutorials used -->
Base of the App made following **CodeWithChris** video *"SwiftUI Tutorial: Build a Slots App"*.<br>
The video can be found at: https://www.youtube.com/watch?v=51Z9Kun7tFo&t=1169s&ab_channel=CodeWithChris

## Last Updates:

- Change of UI colors
- Add animations & transitions

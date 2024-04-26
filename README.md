# Boggle-Game---Elixir
Boggle Game

Overview

This program implements a modified version of the classic game Boggle. Given an N*N grid of letters and a list of legal words, the program searches for unique legal words in the grid according to the rules of Boggle. The rules are slightly modified from the traditional game, as described below.

Game Description

Input: The program takes as input an N*N grid of letters and a list of legal words. Output: It returns a list of words found in the grid, along with the indexes of each letter in the word. Rules: Each letter after the first must be a horizontal, vertical, or diagonal neighbor of the one before it. No individual letter cube may be used more than once in a word. Scoring: The score for each word is calculated based on its length according to the provided table. Variations from Traditional Boggle Minimum word length: 1 (instead of 3) Word scoring differs (see table in the Game Description) Input grid size can vary from 2x2 to NxN (always square) No "Qu" combination tile Program must complete unit tests for each language in 30 seconds or less Usage

Run the program and provide the N*N grid of letters and the list of legal words as input. The program will output the list of words found in the grid, along with the indexes of each letter in the word and their corresponding scores.

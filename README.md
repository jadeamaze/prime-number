## How to run it
Both from prime-number/
From command line: ruby app/main.rb n    where n is replaced with whatever number of primes you want to generate
To run tests: bundle exec rspec -fd


## What you’re pleased with
* Separation of concerns. I'm happy that I removed any knowledge of primes from the multiplication table logic
* Simplicity of the prime generator.

## What you would do with it if you had more time
* Loading the generated primes into a file. I can't see much use for this application beyond encryption, and for that you would be using large numbers that would be computationally heavy to generate, so storing the generated numbers would be better.
* Pagination of the generator for large values of N


## Task - Coding exercise - Prime tables
Introduction

Write an application that takes a numeric input (N) from a user and outputs a multiplication table of (N) prime numbers. Our hope is that it should only take a couple of hours to build a simple solution. The aim is NOT to see how much you can code in a given time, so feel free to spend as much time as you want to highlight your level of programming.

You must put your code onto GitHub, otherwise we won’t consider it. We will review it from there.


# Requirements
- you can use whatever programming language you like for this exercise - we mainly use Ruby and JavaScript
- Do not use a brute force / trial division algorithm
- Small commits to git so that we can see how you’ve developed your solution
- Write your application with high unit test coverage
- For the input and output you can use the console, a web page, or something else
- Please write an algorithm to solve the prime number generation - do not use a library method to generate your primes
- The user should input a whole number N, where is N is at least 1
- The application should output an N+1 x N+1 grid of numbers


Example primes multiplication table when N is 3
|      |    2 |    3 |    5 |
|    2 |    4 |    6 |   10 |
|    3 |    6 |    9 |   15 |
|    5 |   10 |   15 |   25 |

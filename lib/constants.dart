import 'package:flutter/material.dart';

String apiKey = "4d563e4765d041f8a41bae0dfddfc049";

const Color orangeWeb = Color(0xFFf59400);
const Color white = Color(0xFFf5f5f5);
const Color lightGrey = Color(0xFFd2d7df);
const Color black = Color.fromARGB(255, 28, 28, 28);

var listOfCountry = [
  {"name": "INDIA", "code": "in"},
  {"name": "USA", "code": "us"},
  {"name": "UK", "code": "gb"},
  {"name": "MEXICO", "code": "mx"},
  {"name": "United Arab Emirates", "code": "ae"},
  {"name": "New Zealand", "code": "nz"},
  {"name": "Australia", "code": "au"},
  {"name": "Canada", "code": "ca"},
];

var listOfCategory = [
  {"name": "Science", "code": "science"},
  {"name": "Business", "code": "business"},
  {"name": "Technology", "code": "technology"},
  {"name": "Sports", "code": "sports"},
  {"name": "Health", "code": "health"},
  {"name": "General", "code": "general"},
  {"name": "Entertainment", "code": "entertainment"},
  {"name": "ALL", "code": null},
];
var listOfNewsChannel = [
  {"name": "BBC News", "code": "bbc-news"},
  {"name": "ABC News", "code": "abc-news"},
  {"name": "The Times of India", "code": "the-times-of-india"},
  {"name": "ESPN Cricket", "code": "espn-cric-info"},
  {"code": "politico", "name": "Politico"},
  {"code": "the-washington-post", "name": "The Washington Post"},
  {"code": "reuters", "name": "Reuters"},
  {"code": "cnn", "name": "cnn"},
  {"code": "nbc-news", "name": "NBC news"},
  {"code": "the-hill", "name": "The Hill"},
  {"code": "fox-news", "name": "Fox News"},
];
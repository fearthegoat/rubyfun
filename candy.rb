a = "mara", "kevin", "amy", "maple"
minimum = 4 assuming ratings are equal
one kid has a higher rating, #line + kids_with_higher_ratings 4 + 1
2 kids have higher, but equal ratings, #line + kids_with_higher_ratings 4 + 2
2 kids have higher, but not equal ratings #line
ratings.uniq.size == 1 ?  a.count : 
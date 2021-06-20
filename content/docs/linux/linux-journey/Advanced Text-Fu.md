## Advanced Text-Fu

# regex (regular expressions)
- powerful tool for pattern recognition
```
Test string:

sally sells seashells 
by the seashore
```
- beginning of a line:`^by` will match `by the seashore`
- end of a line: `seashore$` will match `by the seashore`
- match a single character: `b.` will match `by`
- bracket notation: match characters in the brackets
	- `d[iou]g` will match `dig`, `dog`, `dug`
	- `^` in bracket means anything besides this: `d[^i]g` will match `dog` and `dug` but not `dig`
	- specify a range of characters with a `-`: `d[a-c]g`
	- brackets are case sensitive
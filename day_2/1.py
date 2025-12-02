sum = 0

with open("2.dat", "r") as f:
    for ranges in f.readlines()[0].split(","):
        start, end = ranges.split("-")
        for number in range(int(start), int(end) + 1):
            length = len(str(number))
            if str(number)[:length//2] == str(number)[length//2:]:
                sum += number
    print(sum)
            

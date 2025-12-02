import queue

sum = 0

def is_invalid_id(s: str) -> bool:
    return s in (s[:i] * (len(s) // i) for i in range(1, len(s)//2 + 1) if len(s) % i == 0)

with open("2.dat", "r") as f:
    for ranges in f.readlines()[0].split(","):
        start, end = ranges.split("-")
        for number in range(int(start), int(end) + 1):
            if is_invalid_id(str(number)):
                sum += number

    print(sum)



            

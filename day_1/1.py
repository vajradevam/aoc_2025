with open("1.dat", "r") as f:
    data = [_.strip() for _ in f.readlines()]

    pointer = 50
    count = 0

    for action in data:

        direction = action[0]
        steps = int(action[1:])
        
        if direction == 'L':
            pointer = (pointer - steps) % 100
        else:
            pointer = (pointer + steps) % 100

        if pointer == 0:
            count += 1

        print(pointer, direction, steps)

    print(count)


with open("1.dat", "r") as f:
    data = [_.strip() for _ in f.readlines()]

    pointer = 50
    count = 0

    for action in data:
        direction = action[0]
        steps = int(action[1:])

        full_turns = steps // 100
        count += full_turns

        rotation = steps % 100

        if direction == 'R':
            if pointer + rotation >= 100:
                count += 1
            pointer = (pointer + rotation) % 100

        else:
            if pointer > 0 and pointer - rotation <= 0:
                count += 1
            pointer = (pointer - rotation) % 100

        print(pointer, direction, steps)

    print(count)

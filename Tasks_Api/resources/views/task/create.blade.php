<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar Nova Tarefa</title>
</head>
<body>
    <h1>Criar Nova Tarefa</h1>

    <form action="{{ route('tasks.store') }}" method="POST">
        @csrf
        <label for="title">Título:</label>
        <input type="text" name="title" required>

        <br>

        <label for="description">Descrição:</label>
        <textarea name="description"></textarea>

        <br>

        <button type="submit">Criar Tarefa</button>
    </form>
</body>
</html>

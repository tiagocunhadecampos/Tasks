<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Tarefa</title>
</head>
<body>
    <h1>Editar Tarefa</h1>

    <form action="{{ route('tasks.update', $task->id) }}" method="POST">
        @csrf
        @method('PUT')
        
        <label for="title">Título:</label>
        <input type="text" name="title" value="{{ $task->title }}" required>

        <br>

        <label for="description">Descrição:</label>
        <textarea name="description">{{ $task->description }}</textarea>

        <br>

        <button type="submit">Salvar Tarefa</button>
    </form>
</body>
</html>

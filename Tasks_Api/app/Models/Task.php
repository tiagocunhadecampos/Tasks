<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class Task extends Model
{
    use HasFactory;

    protected $table="task";

    /**
     * @param array $attributes
     * @return Task
     */
    public function createTask(array $attributes){
        $task = new self();
        $task->title = $attributes["title"];
        $task->content = $attributes["content"];
        $task->save();
        return $task;
    }

    /**
     * @param int $id
     * @return mixed
     */
    public function getTask(int $id){
        $task = $this->where("id",$id)->first();
        return $task;
    }

    /**
     * @return Task[]|\Illuminate\Database\Eloquent\Collection
     */
    public function getsTask(){
        $tasks = $this::all();
        return $tasks;
    }

    /**
     * @param int $id
     * @param array $attributes
     * @return mixed
     */
    public function updateTask(int $id, array $attributes){
        $task = $this->getTask($id);
        if($task == null){
            throw new ModelNotFoundException("Cant find task");
        }
        $task->title = $attributes["title"];
        $task->content = $attributes["content"];
        $task->save();
        return $task;
    }

    /**
     * @param int $id
     * @return mixed
     */
    public function deleteTask(int $id){
        $task = $this->getTask($id);
        if($task == null){
            throw new ModelNotFoundException("task item not found");
        }
        return $task->delete();
    }
}
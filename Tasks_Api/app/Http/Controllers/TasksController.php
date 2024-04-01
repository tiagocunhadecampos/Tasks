<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;

class TasksController extends Controller
{
    protected $task;

    public function __construct(Task $task){
        $this->task = $task;
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function create(Request $request){
        $task = $this->task->createTask($request->all());
        return response()->json($task);
    }

    /**
     * @param $id
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function update($id, Request $request){
        try {
            $task = $this->task->updateTask($id,$request->all());
            return response()->json($task);
        }catch (ModelNotFoundException $exception){
            return response()->json(["msg"=>$exception->getMessage()],404);
        }
    }

    /**
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function get($id){
        $task = $this->task->getTask($id);
        if($task){
            return response()->json($task);
        }
        return response()->json(["msg"=>"Task item not found"],404);
    }

    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function gets(){
        $tasks = $this->task->getsTask();
        return response()->json($tasks);
    }

    /**
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function delete($id){
        try {
            $task = $this->task->deleteTask($id);
            return response()->json(["msg"=>"delete task success"]);
        }catch (ModelNotFoundException $exception){
            return response()->json(["msg"=>$exception->getMessage()],404);
        }
    }
}
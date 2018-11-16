<?php

namespace App\Http\Controllers;

use App\Student;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public $studentcount= App\Student::all();
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        return view('index');
    }
}

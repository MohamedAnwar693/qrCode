<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Controller;
use App\Models\User;
use Throwable;


class AuthController extends Controller
{
    public function register(Request $request){
        try {
            $valid = $request->validate([
                'name' => 'required|string|min:2|max:100',
                'email'=> 'required|string|email|unique:users',
                'phone' => 'required|string|min:10|max:15',
                'type' => 'required|string|in:company,client',
                'logo' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
                'company_name' => 'string|min:2|max:100',
                'password'=> 'required|string|min:10|max:100',
                'confirm_password'=> 'required|same:password'
            ]);

            $data = $request->all();
            if ($request->hasFile('logo')) {
                $logo = $request->file('logo');
                $path = $logo->store('logos', 'public');
                $data['logo'] = $path;
            }
            $user = User::create([
                'name' => $valid['name'],
                'email'=> $valid['email'],
                'phone'=> $valid['phone'],
                'type' => $valid['type'],
                'logo' => $data['logo'] ?? null,
                'company_name' => $valid['company_name'] ?? null,
                'password' => bcrypt($valid['password']),
            ]);
            $token = $user->createToken('API Token')->plainTextToken;
            return response()->json([
                'status' => 'Success',
                'message'=> 'Successful register',
                'user'   => $user,
                'token' => $token,
            ], 200);
        } catch (Throwable $th) {
            return response()->json(['error' => $th->getMessage()], 500);
        }
    }

    public function login(Request $request){
        try {
            $valid = $request->validate([
                'email'=> 'required|string|email|',
                'password'=> 'required|string|min:6',
            ]);
            $user=User::where('email', $request->email)->first();
            if($user){
                if(Hash::check($request->password, $user->password)){
                    $token = $user->createToken('API Token')->plainTextToken;
                    return response()->json([
                        'status' => 'Success',
                        'message' => 'Successful Login',
                        'token' => $token,
                        'user'=> $user
                    ], 200);
                }else{
                    return response()->json([
                        'message'=> 'Incorrect email or password',
                    ],400);
                }
            }
        } catch (Throwable $th) {
            return response()->json(['error' => $th->getMessage()], 500);
        }
    }

    public function logout(Request $request){
        $request->user()->currentAccessToken()->delete();
        return response()->json([
            'status' => 'Success',
            'message'=> 'User successfully logged out',
        ],200);

    }

}

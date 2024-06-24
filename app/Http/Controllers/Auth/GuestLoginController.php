<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\User;

class GuestLoginController extends Controller
{
    public function login()
    {
        // Find the guest user by email
        $guestUser = User::where('email', 'guest@example.com')->first();

        if ($guestUser) {
            // Log in the guest user
            Auth::login($guestUser);

            // Redirect to the intended page or a default page
            return redirect()->intended('/dashboard');
        }

        return redirect()->route('login')->withErrors(['guest' => 'Guest login failed.']);
    }
}

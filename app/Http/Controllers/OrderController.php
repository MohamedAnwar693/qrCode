<?php

namespace App\Http\Controllers;


use App\Models\Order;
use App\Models\QrCodeLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class OrderController extends Controller
{
    public function create()
    {
        return view('form.create');
    }

    public function createOrder(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255',
            'phone' => 'required|string|max:15',
            'text' => 'required|string',
            'qrcode_id' => 'exists:qrcode_id,id',
        ]);

        $user = Auth::user();
        Order::create([
            'name' => $request->name,
            'phone' => $request->phone,
            'email' => $request->email,
            'text' => $request->text,
            'user_id' => $user->id,
            'qrcode_id' => $request->qrcode_id,
        ]);

        return redirect()->back()->with('success', 'Form data saved successfully!');
    }

}

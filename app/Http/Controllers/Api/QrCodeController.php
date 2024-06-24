<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use App\Models\QrCodeLog;

class QrCodeController extends Controller
{
    public function generate(Request $request)
    {
        // Get the authenticated user
        $user_id = $request->input('user_id');

        // Get the text to be encoded
        // $text = $request->input('text');
        $text = 'https://qawl-talabak.com';

        // Generate a random reference string
        $reference = Str::random(11);

        // Ensure the reference is unique (optional)
        while (QrCodeLog::where('reference', $reference)->exists()) {
            $reference = Str::random(11);
        }

        // Generate the QR code with the reference included
        $qrCode = QrCode::format('png')->size(200)->generate($text . '/' . $reference);

        // Save the log to the database
        QrCodeLog::create([
            'text' => $text,
            'user_id' => $user_id,
            'reference' => $reference,
        ]);

        // Return the QR code as a response
        return response($qrCode)->header('Content-Type', 'image/png');
    }
}

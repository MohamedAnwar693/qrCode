<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Order') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    @if(auth()->user()->type === "Guest")
                        <x-guest-layout>
                                <!-- Session Status -->
                                <x-auth-session-status class="mb-4" :status="session('status')" />

                                <!-- Validation Errors -->
                                <x-auth-validation-errors class="mb-4" :errors="$errors" />

                                @if(session('success'))
                                    <div class="alert alert-success">
                                        {{ session('success') }}
                                    </div>
                                @endif
                                <form action="{{ route('form.createOrder') }}" method="POST">
                                    @csrf
                                    <div>
                                        <x-label for="name">Name:</x-label>
                                        <x-input type="text" class="block mt-1 w-full" id="name" name="name" value="{{ old('name') }}" required autofocus />
                                        @error('name')
                                            <div>{{ $message }}</div>
                                        @enderror
                                    </div>


                                    <div style="margin-top: 10px;">
                                        <x-label for="phone">Phone:</x-label>
                                        <x-input type="text" class="block mt-1 w-full"  id="phone" name="phone" value="{{ old('phone') }}" required autofocus />
                                        @error('phone')
                                            <div>{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <div style="margin-top: 10px;">
                                        <x-label for="email">Email:</x-label>
                                        <x-input type="email" class="block mt-1 w-full" id="email" name="email" value="{{ old('email') }}" required autofocus />
                                        @error('email')
                                            <div>{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <div style="margin-top: 10px;">
                                        <x-label for="text">Order:</x-label>
                                        <textarea id="text" style="height: 110px;" class="block mt-1 w-full" name="text" required autofocus>{{ old('text') }}</textarea>
                                        @error('text')
                                            <div>{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <x-button class="ml-3 mt-4" type="submit">Submit</x-button>
                                </form>
                        </x-guest-layout>
                    @else
                        <x-guest-layout>
                            <!-- Session Status -->
                            <x-auth-session-status class="mb-4" :status="session('status')" />

                            <!-- Validation Errors -->
                            <x-auth-validation-errors class="mb-4" :errors="$errors" />

                            @if(session('success'))
                                <div class="alert alert-success">
                                    {{ session('success') }}
                                </div>
                            @endif
                            <form action="{{ route('form.createOrder') }}" method="POST">
                                @csrf
                                <div style="display: none;">
                                    <x-label for="name">Name:</x-label>
                                    <x-input type="text" class="block mt-1 w-full" id="name" name="name" value="{{ auth()->user()->name }}" required autofocus />
                                    @error('name')
                                        <div>{{ $message }}</div>
                                    @enderror
                                </div>

                                <div style="display: none;">
                                    <x-label for="phone">Phone:</x-label>
                                    <x-input type="text" class="block mt-1 w-full"  id="phone" name="phone" value="{{ auth()->user()->phone }}" required autofocus />
                                    @error('phone')
                                        <div>{{ $message }}</div>
                                    @enderror
                                </div>

                                <div style="display: none;">
                                    <x-label for="email">Email:</x-label>
                                    <x-input type="email" class="block mt-1 w-full" id="email" name="email" value="{{ auth()->user()->email }}" required autofocus />
                                    @error('email')
                                        <div>{{ $message }}</div>
                                    @enderror
                                </div>

                                <div>
                                    <x-label for="text">Order:</x-label>
                                    <textarea id="text" style="height: 110px;" class="block mt-1 w-full" name="text" required autofocus>{{ old('text') }}</textarea>
                                    @error('text')
                                        <div>{{ $message }}</div>
                                    @enderror
                                </div>

                                <x-button class="ml-3 mt-4" type="submit">Submit</x-button>
                            </form>
                        </x-guest-layout>
                    @endif
                </div>
            </div>
        </div>
    </div>
</x-app-layout>

#include <windows.h>
#include <stdio.h>

// Function pointer type for the CreateSimpleWindow function
typedef void (*CreateSimpleWindowFunc)();

int main() {
    HMODULE hDll = LoadLibrary("simple_window.dll");
    if (hDll == NULL) {
        MessageBox(NULL, "Failed to load DLL", "Error", MB_OK | MB_ICONERROR);
        return 1;
    }

    CreateSimpleWindowFunc createWindow = (CreateSimpleWindowFunc) GetProcAddress(hDll, "CreateSimpleWindow");
    if (createWindow == NULL) {
        MessageBox(NULL, "Failed to get CreateSimpleWindow function", "Error", MB_OK | MB_ICONERROR);
        FreeLibrary(hDll);
        return 1;
    }

    createWindow();

    FreeLibrary(hDll);
    return 0;
}


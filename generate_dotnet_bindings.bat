set namespace=ImGui
set prefixStrip=ImGui_

set includes=--include-directory ../imgui --include_directory generated
set defines=--define-macro IMGUI_BACKEND_HAS_WINDOWS_H --define-macro IMGUI_ENABLE_FREETYPE --define-macro IMGUI_USE_WCHAR32

set libraryPath=ImGui/Binaries/ImGuiLib

ClangSharpPInvokeGenerator --file generated/dcimgui.h --namespace %namespace% %includes% -o generated/ImGuiBindings.cs --prefixStrip %prefixStrip% %defines% --libraryPath %libraryPath%

:: We need to pass backend here - we need dcimgui_freetype.h to refer to dcimgui.h, not imgui.h!
:: See: mod_change_includes.apply(dom_root, {"\"imgui.h\"": "\"dcimgui.h\""})
:: In dear_bindings.py
ClangSharpPInvokeGenerator --file generated/misc/freetype/dcimgui_freetype.h --namespace %namespace% %includes% -o generated/ImGuiBindingsFreetype.cs --prefixStrip %prefixStrip% %defines% --libraryPath %libraryPath%

ClangSharpPInvokeGenerator --file generated/backends/dcimgui_impl_dx9.h --namespace %namespace% %includes% -o generated/ImGuiBindingsDx9.cs --prefixStrip %prefixStrip% %defines% --libraryPath %libraryPath%

ClangSharpPInvokeGenerator --file generated/backends/dcimgui_impl_dx11.h --namespace %namespace% %includes% -o generated/ImGuiBindingsDx11.cs --prefixStrip %prefixStrip% %defines% --libraryPath %libraryPath%

ClangSharpPInvokeGenerator --file generated/backends/dcimgui_impl_dx12.h --namespace %namespace% %includes% -o generated/ImGuiBindingsDx12.cs --prefixStrip %prefixStrip% %defines% --libraryPath %libraryPath%

ClangSharpPInvokeGenerator --file generated/backends/dcimgui_impl_win32.h --namespace %namespace% %includes% -o generated/ImGuiBindingsWin32.cs --prefixStrip %prefixStrip% %defines% --libraryPath %libraryPath%

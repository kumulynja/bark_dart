mod ark_info;
mod config;
mod wallet;

use std::{ffi::CString, os::raw::c_char};

pub use config::{create_default_config, destroy_config, get_asp_address};

/// Free the memory for the C string returned by `get_asp_address`
///
/// # Safety
///
/// This function takes ownership of the string pointer, so it must only be called once per pointer.
#[no_mangle]
pub unsafe extern "C" fn free_c_string(s: *mut c_char) {
    if !s.is_null() {
        // Convert the pointer back into a CString to properly deallocate
        unsafe {
            let _ = CString::from_raw(s);
        };
    }
}

#[no_mangle]
pub extern "C" fn sum(a: usize, b: usize) -> usize {
    println!("Hello from rust {a} + {b}");
    a + b
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = sum(2, 2);
        assert_eq!(result, 4);
    }
}

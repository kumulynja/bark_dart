use std::{ffi::CString, os::raw::c_char};

use bark::Config;

// Create a new Config instance with default values
#[no_mangle]
pub extern "C" fn create_default_config() -> *mut Config {
    Box::into_raw(Box::default())
}

/// Destroy the Config instance
///
/// # Safety
///
/// This function is unsafe because it dereferences a raw pointer.
/// The caller must ensure that the pointer is valid and not null.
#[no_mangle]
pub unsafe extern "C" fn destroy_config(config_ptr: *mut Config) {
    if !config_ptr.is_null() {
        drop(Box::from_raw(config_ptr)); // Drop the Box to free memory
    }
}

/// Get the `asp_address` field from `Config`
///
/// # Safety
///
/// This function dereferences a raw pointer, so the caller must ensure the pointer is valid.
#[no_mangle]
pub unsafe extern "C" fn get_asp_address(config_ptr: *const Config) -> *const c_char {
    let config = unsafe {
        assert!(!config_ptr.is_null());
        &*config_ptr
    };

    // Convert the `asp_address` string to a CString
    let asp_address_cstr = CString::new(config.asp_address.clone()).unwrap();

    // Return a pointer to the CString's internal buffer
    asp_address_cstr.into_raw()
}

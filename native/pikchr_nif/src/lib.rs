use pikchr::{Pikchr, PikchrFlags};
use rustler::{Encoder, Env, NifResult, Term};

rustler::init!("Elixir.Pikchr.Native");

mod atoms {
    rustler::atoms! { ok, error }
}

#[rustler::nif(schedule = "DirtyCpu")]
fn render<'a>(env: Env<'a>, source: &str, class: &str, dark_mode: bool) -> NifResult<Term<'a>> {
    let mut flags = PikchrFlags::default();
    if dark_mode {
        flags.use_dark_mode();
    }

    // Pass None for class to work around a bug in the pikchr C library
    // that corrupts the class attribute bytes. We inject it ourselves.
    match Pikchr::render(source, None, flags) {
        Ok(svg) => {
            let mut svg_string = svg.rendered().to_owned();
            if !class.is_empty() {
                svg_string = svg_string.replacen("<svg", &format!("<svg class=\"{}\"", class), 1);
            }
            Ok((atoms::ok(), svg_string).encode(env))
        }
        Err(e) => Ok((atoms::error(), e).encode(env)),
    }
}

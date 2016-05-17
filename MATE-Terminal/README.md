# MATE Terminal Zenburn

## Installation notes
- Create a new target profile in `mate-terminal`:
  - `File -> New Profile...`
  - Choose a memorable name.
- Use `dconf-editor` and browse `/org/mate/terminal/profiles` to identify the `profile<n>`
  of the new profile. (Hint: the `visible-name` key will be what was chosen in `mate-terminal`) 
- Run `apply_colours_to_profile.sh profile<n>`
  - Where `profile<n>` is the identified profile from `dconf-editor`
- Exit all `mate-terminal` windows (or logout of the session) to see the new `Zenburn` profile.

## Gnome Terminal
This Zenburn theme is probably suitable for `gnome-terminal` as well, but the script is only designed for Mint MATE. It should be possible to cut and paste the values from the `zenburn_colours` file into the correct key values in `dconf-editor` to achieve the same effect.

## Screenshot
![Alt text](screenshot.png?raw=true "MATE Terminal Zenburn")

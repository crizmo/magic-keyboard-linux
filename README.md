
# Magic Keyboard (Japanese) Setup for Linux

This guide provides detailed steps to configure your **Apple Magic Keyboard (Japanese layout)** to work properly on Linux, including remapping keys like **Kana (Henkan)** and **Alphanumeric (Muhenkan)** to switch between Kana and Alphanumeric input modes using **Mozc** input method. It also includes instructions on how to switch between Magic Keyboard and basic layouts using shell scripts.

---

## Prerequisites

- **Linux** (tested on Ubuntu).
- **Apple Magic Keyboard (Japanese Layout)** connected via **Bluetooth**.
- **Mozc** or another Japanese input method installed via **IBus**.

---

## Step 1: Install Required Packages

To ensure that the Japanese input method works properly, you need to install **IBus** and **Mozc**.

1. **Install IBus and Mozc:**
   ```bash
   sudo apt update
   sudo apt install ibus ibus-anthy ibus-mozc
   ```

2. **Restart the IBus daemon:**
   ```bash
   ibus-daemon -drx
   ```

---

## Step 2: Set up IBus Input Method

1. **Configure IBus Input Method:**
   - Run the following command to open IBus settings:
     ```bash
     ibus-setup
     ```
   - Under the **Input Method** tab, make sure **Mozc** (Japanese) is added and set as the default input method.

2. **Switch to Japanese Input:**
   - Use the **IBus** system tray icon to switch to the Japanese input method (Mozc).
   - Alternatively, you can use the default keyboard shortcut (`Ctrl + Space`) to toggle between input methods.

---

## Step 3: Configure Key Mappings with `.Xmodmap`

You need to map the **Kana** (Henkan) and **Alphanumeric** (Muhenkan) keys using **xmodmap** to properly switch between input modes.

1. **Create or Edit the `.Xmodmap` File:**
   - Open or create the `.Xmodmap` file in your home directory:
     ```bash
     nano ~/.Xmodmap
     ```
   - Add the following lines to map keycodes 130 and 131 (Kana and Alphanumeric keys):
     ```bash
     keycode 130 = Henkan_Mode NoSymbol Henkan_Mode
     keycode 131 = Muhenkan NoSymbol Muhenkan
     ```
   - Save and exit the editor (`Ctrl + X`, then `Y`, then `Enter`).

2. **Apply the Key Mappings:**
   - To apply the mappings immediately, run:
     ```bash
     xmodmap ~/.Xmodmap
     ```

3. **Verify the Key Mappings:**
   - Run the following command to ensure the key mappings are applied correctly:
     ```bash
     xev
     ```
   - Press the **Kana** and **Alphanumeric** keys and check if the correct keysyms (Henkan_Mode and Muhenkan) are triggered in the output.

---

## Step 4: Set the Keyboard Layout to Japanese

To ensure the Kana and Alphanumeric keys are interpreted correctly, set your keyboard layout to **Japanese**.

1. **Set Layout to Japanese:**
   ```bash
   setxkbmap -layout jp
   ```

---

## Step 5: Test the Kana and Alphanumeric Keys

1. **Test Switching Between Input Modes:**
   - With **Mozc** as the active input method, press the **Kana (かな)** key to switch to Kana mode.
   - Press the **Alphanumeric (英数)** key to switch back to Alphanumeric mode.

2. **Test the Behavior in `xev`:**
   - Run `xev` and verify that pressing the **Kana** and **Alphanumeric** keys triggers the correct keysyms (Henkan_Mode and Muhenkan).

---

## Step 6: Make the `.Xmodmap` Changes Permanent

To automatically apply the `.Xmodmap` settings each time you log in:

1. Open your `.bashrc` or `.profile` file:
   ```bash
   nano ~/.bashrc
   ```

2. Add the following line to apply the `.Xmodmap` file on startup:
   ```bash
   xmodmap ~/.Xmodmap
   ```

3. Save and exit (`Ctrl + X`, then `Y`, then `Enter`).

4. Reload `.bashrc`:
   ```bash
   source ~/.bashrc
   ```

---

## Step 7: Switch Between Basic and Magic Keyboard Layouts

To easily switch between the **Magic Keyboard layout** and a **basic keyboard layout**, you can use the provided shell scripts: `switch_to_basic.sh` and `switch_to_magic.sh`.

1. **Create the Shell Scripts:**
   - Create two shell scripts: `switch_to_basic.sh` and `switch_to_magic.sh` in your home directory.
   
   - **switch_to_basic.sh**:
     ```bash
     #!/bin/bash
     # Switch to basic keyboard layout (e.g., US layout)
     setxkbmap -layout us
     ```

   - **switch_to_magic.sh**:
     ```bash
     #!/bin/bash
     # Switch to Magic Keyboard layout (Japanese layout)
     setxkbmap -layout jp
     ```

2. **Make the Scripts Executable:**
   ```bash
   chmod +x ~/switch_to_basic.sh
   chmod +x ~/switch_to_magic.sh
   ```

3. **Run the Scripts:**
   - To switch to the basic layout, run:
     ```bash
     ~/switch_to_basic.sh
     ```
   - To switch to the Magic Keyboard layout, run:
     ```bash
     ~/switch_to_magic.sh
     ```

---

## Troubleshooting

- If the keys still don't work as expected, try restarting the **IBus** daemon:
  ```bash
  ibus-daemon -drx
  ```
- If key mappings are not applying, recheck your `.Xmodmap` file or manually run `xmodmap ~/.Xmodmap`.
- Verify the keycodes using `xev` to make sure they match the expected **Kana** and **Alphanumeric** keys.

---

## Additional Resources

- **IBus Documentation**: [IBus Official Site](https://ibus.github.io/)
- **Mozc Documentation**: [Mozc GitHub](https://github.com/google/mozc)


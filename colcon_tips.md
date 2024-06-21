# Colcon Tips

1. Useful colcon commands
2. Meta config file

For a lot of (unfortunately not all) info, go to the official site (https://colcon.readthedocs.io/)

## Useful colcon commands

**ATTENTION:** you must be in the root of the workspace to use colcon correctly correctly. If you build from other directories, `install`, `build` and `log` directories are created there.

### Build
- **Common build**
  ```bash
  colcon build --continue-on-error --symlink-install
  ```
  - `--continue-on-error`: in case a package has an error, continue building the others (where possible)
  - `--symlink-install`: files in the `install` directory will be link to `build` and `src` directory, instead of a copy $\to$ edits to files (e.g. a config file) in `src` are propagated to `install`

- **Common build of some package**
  ```bash
  colcon build --continue-on-error --symlink-install --packages-select PKG1 PKG2 ....
  ```

### Clean

- **Clean Workspace**
  ```bash
  colcon clean workspace
  ```
  You must be in the root of the workspace

- **Clean some package**
  ```bash
  colcon clean package --packages-select PKG1 PKG2 .....
  ```

### List

```bash
colcon list
```

will list all the packages in the workspace, with their respective build type: [`ament` | `catkin` | `cmake`].

## Meta config file

Useful to define `cmake` arguments for packages in the workspace (and other things, look at the official documentation).

Should be placed in the root of the workspace.

If the name is `colcon.meta`, in the root of the workspace, it is automatically found. Otherwise, the name must be specified.

**Example**
```json
{
    "names": 
    {
        "cnr_logger" :
        {
            "cmake-args": [
                "-DUSE_ROS1=False",
                "-DCOMPILE_EXAMPLE=True",
                "-DENABLE_TESTING=True",
            ]
        },
}
```
The `names` field allow to specify the packages.
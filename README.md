# Pumpdata: Manage distribution data to run your favorite five panel dance game
Version: 1.00</br>
[Release history](CHANGELOG.md)

## Purpose
Scripts to manage distribution data, i.e. game assets, executables etc, for Pump It Up games.

* Distribution data integration checks to verify your data packages for deployment are fine.
* Game asset integration checks to verify if the actual game assets are fine.

## How to use distribution data
Place all distribution data in the corresponding version sub-folders in `data`.

To check if everything's placed correctly and verifying distribution data integrity:
```shell script
./pumpdata.sh check-dist-data
```

Check the output for any errors indicating a file is missing or for incorrect checksums.

Furthermore, you can check the integrity of the game assets inside the distribution packages. Note that this might
take a very long time and needs a lot of drive space. The script unpacks every `game.zip` temporarily, generates MD5
sums and compares them to tables within this repository. If you have the game data already unpacked, you can put the
`game` folder and it's contents next to the `game.zip` file. The script will pick-up the folder instead, now.

```shell script
./pumpdata.sh check-game-assets
```

## Contributing
Refer to [CONTRIBUTING](CONTRIBUTING.md).

## License
Source code license is the Unlicense; you are permitted to do with this as thou
wilt. For details, please refer to the [LICENSE file](LICENSE) included with the
source code.
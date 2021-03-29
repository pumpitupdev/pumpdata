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
make check-dist-data
```

Check the output for any errors indicating a file is missing or for incorrect checksums.

Furthermore, you can check the integrity of the game assets inside the distribution packages. Note that this might
take a very long time and needs a lot of drive space. The script unpacks every `game.zip` temporarily, generates MD5
sums and compares them to tables within this repository. If you have the game data already unpacked, you can put the
`game` folder and it's contents next to the `game.zip` file. The script will pick-up the folder instead, now.

```shell script
make check-game-assets
```

## Creating new checksums

This part is only relevant for contributors.

To create a new list of checks for the distribution data, i.e. packaged/zip'd data:

```shell script
# NX2 as an example here
make create-checksum-dist-data-20_nx2 > checksum/dist/20_nx2.md5
```

For the game asset checksums which unpacks the `game.zip` file and generates checksums of the contents:

```shell script
# NX2 as an example here
make create-checksum-game-assets-20_nx2 > ./checksum/game/20_nx2.md5
```

## Data

### Latest versions

Latest game assets and executables that are dumped and recommended to be used for regular play.

* 01_1st: `0.53.1999.9.31`
* 02_2nd: `Dec 27 1999`
* 03_obg: `v3.03`
* 04_3se: `R4/v3.25`
* 05_tc: `R5/v3.43`
* 06_pc: `R5/v3.52`
* 07_extra: `R4/v5.10`
* 08_prem1: `R6/v4.01`
* 08_prem1braz: ---
* 09_prex1: `REV2/101`
* 10_reb: `2002`
* 11_prem2: `2002`
* 12_prex2: `2003`
* 12_prex2beta: ---
* 13_prem3: `2003.P3`
* 14_prex3: `X3.1.MK3`
* 15_exc: `20040408`
* 16_exc2: `102`
* 17_zero: `103`
* 18_nx: `108`
* 20_nx2: `1.54`

### Known and dumped versions

A list of revisions of each game version that are known to us and/or dumped.

#### 01_1st: Pump it Up: The 1st Dance Floor

* `0.53.1999.9.31`

#### 02_2nd: Pump it Up: The 2nd Dance Floor

* `Dec 27 1999`

#### 03_obg: Pump it Up The O.B.G: The 3rd Dance Floor

`v3.03`

#### 04_3se: Pump it Up The O.B.G: The Season Evolution Dance Floor

* `R4/v3.25`

#### 05_tc: Pump it Up: The Collection

* `R5/v3.43`

#### 06_pc: Pump it Up: The Perfect Collection

* `R5/v3.52`

#### 07_extra: Pump it Up Extra

* `R4/v5.10`
* `tester`
 
#### 08_prem1: Pump it Up The Premiere: The International Dance Floor

* `R6/v4.01`

#### 08_prem1braz


#### 09_prex1: Pump it Up The PREX: The International Dance Floor

* `REV2/101`

#### 10_reb: Pump it Up The Rebirth: The 8th Dance Floor

`2002`

#### 11_prem2: Pump it Up The Premiere 2: The International 2nd Dance Floor

* `2002`

#### 12_prex2: Pump it Up The PREX 2

* `2003`

#### 12_prex2beta


#### 13_prem3: Pump it Up The Premiere 3: The International 3rd Dance Floor

* `2003.P3`

#### 14_prex3: Pump it Up The PREX 3: The International 4th Dance Floor

* `X3.1.MK3`

#### 15_exc: Pump it Up Exceed: The International 5th Dance Floor

* `20040408`
* `20040325`
* `20040316`
* `loctest`

#### 16_exc2: Pump it Up Exceed 2: The International 6th Dance Floor

* `102`
* `102 Mini`
* `102 MEX`
* `101`

#### 17_zero: Pump it Up Zero: International 7th Dance Floor

* `103`
* `102`
* `101`

#### 18_nx: Pump it Up NX: New Xenesis

* `108`
* `105`
* `104`

#### 20_nx2: Pump it Up NX2: Next Xenesis

* `1.56CN`
* `1.56KR`
* `1.54`
* `1.50`

## Contributing

Refer to [CONTRIBUTING](CONTRIBUTING.md).

## License

Source code license is the Unlicense; you are permitted to do with this as thou
wilt. For details, please refer to the [LICENSE file](LICENSE) included with the
source code.
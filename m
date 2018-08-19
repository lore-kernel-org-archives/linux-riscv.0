From: linux@roeck-us.net (Guenter Roeck)
Date: Sun, 19 Aug 2018 08:10:37 -0700
Subject: [GIT PULL] RISC-V Updates for the 4.19 Merge Window
In-Reply-To: <20180819072614.etl7izdicabsffn3@excalibur.cnev.de>
References: <mhng-4afb9897-29ed-4eb4-88d7-6cfb09a0a65c@palmer-si-x1c4>
 <20180818133759.GA20049@roeck-us.net>
 <20180819072614.etl7izdicabsffn3@excalibur.cnev.de>
Message-ID: <2f5d45c1-9f18-9002-d655-90aad655b416@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 08/19/2018 12:26 AM, Karsten Merker wrote:
[ ... ]
>> However, the she system boots fine with the same qemu command line if I use qemu
>> built from https://github.com/riscv/riscv-qemu.git, branch qemu-for-upstream.
> 
> Hello,
> 
> AFAICS the qemu patch that adds support for handling separate bbl
> and kernel images, i.e.
> 
>    https://github.com/riscv/riscv-qemu/commit/6338416ecf4717197c635b5abf9c17465d2d0da0
> 
> hasn't yet made it into upstream qemu, so using the "-bios"
> option for bbl generally doesn't work with (upstream) qemu 3.0.
> 

You are correct. With qemu 3.0+commit b79cd8dec5 ("RISC-V: Support separate firmware
and kernel payload") and this pull request plus "riscv: Drop setup_initrd" on top
of mainline, my test passes:

Build reference: riscv-for-linus-4.19-mw0-8897-gd028021652dd

Building virt:defconfig:initrd ... running .... passed
Building virt:defconfig:virtio-blk:rootfs ... running .... passed

... giving this an official

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter

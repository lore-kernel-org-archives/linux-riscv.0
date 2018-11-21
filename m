From: bmeng.cn@gmail.com (Bin Meng)
Date: Wed, 21 Nov 2018 13:06:18 +0800
Subject: [PATCH] RISC-V: Build flat and compressed kernel images
In-Reply-To: <20181112055515.20341-1-anup@brainfault.org>
References: <20181112055515.20341-1-anup@brainfault.org>
Message-ID: <CAEUhbmWskEtQR-kAuAYx=SHOJ4-MrCRUchSQ68WwZ62hxsTQyQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Nov 12, 2018 at 1:55 PM Anup Patel <anup@brainfault.org> wrote:
>
> This patch extends Linux RISC-V build system to build and install:
> Image - Flat uncompressed kernel image
> Image.gz - Flat and GZip compressed kernel image
>
> Quiet a few bootloaders (such as Uboot, UEFI, etc) are capable of

nits: U-Boot

> booting flat and compressed kernel images. In case of Uboot, booting

nits: U-Boot

> Image or Image.gz is achieved using bootm command.
>
> The flat and uncompressed kernel image (i.e. Image) is very useful
> in pre-silicon developent and testing because we can create back-door
> HEX files for RAM on FPGAs from Image.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/Makefile             | 15 ++++++++-
>  arch/riscv/boot/.gitignore      |  2 ++
>  arch/riscv/boot/Makefile        | 33 ++++++++++++++++++
>  arch/riscv/boot/install.sh      | 60 +++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/head.S        | 10 ++++++
>  arch/riscv/kernel/vmlinux.lds.S |  2 +-
>  6 files changed, 120 insertions(+), 2 deletions(-)
>  create mode 100644 arch/riscv/boot/.gitignore
>  create mode 100644 arch/riscv/boot/Makefile
>  create mode 100644 arch/riscv/boot/install.sh
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Tested with U-Boot s-mode on QEMU virt, using bootm to boot the kernel
Tested-by: Bin Meng <bmeng.cn@gmail.com>

Regards,
Bin

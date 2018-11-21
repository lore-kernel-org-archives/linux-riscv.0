From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 21 Nov 2018 08:28:09 -0800 (PST)
Subject: [PATCH] RISC-V: Build flat and compressed kernel images
In-Reply-To: <CAEUhbmWskEtQR-kAuAYx=SHOJ4-MrCRUchSQ68WwZ62hxsTQyQ@mail.gmail.com>
Message-ID: <mhng-7be4f47d-bc3a-4073-a6db-dc5588304d2d@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 20 Nov 2018 21:06:18 PST (-0800), bmeng.cn at gmail.com wrote:
> On Mon, Nov 12, 2018 at 1:55 PM Anup Patel <anup@brainfault.org> wrote:
>>
>> This patch extends Linux RISC-V build system to build and install:
>> Image - Flat uncompressed kernel image
>> Image.gz - Flat and GZip compressed kernel image
>>
>> Quiet a few bootloaders (such as Uboot, UEFI, etc) are capable of
>
> nits: U-Boot
>
>> booting flat and compressed kernel images. In case of Uboot, booting
>
> nits: U-Boot

Thanks for the review.  The PR has already been tagged, but it's not scheduled 
to be sent out until later today.  I generally try to avoid rewriting the tags 
unless there's something major that's wrong, so unless you feel very strongly 
about this then I think I'll let it stand.

Let me know if this is a big deal for you, I can rewrite things.

>> Image or Image.gz is achieved using bootm command.
>>
>> The flat and uncompressed kernel image (i.e. Image) is very useful
>> in pre-silicon developent and testing because we can create back-door
>> HEX files for RAM on FPGAs from Image.
>>
>> Signed-off-by: Anup Patel <anup@brainfault.org>
>> ---
>>  arch/riscv/Makefile             | 15 ++++++++-
>>  arch/riscv/boot/.gitignore      |  2 ++
>>  arch/riscv/boot/Makefile        | 33 ++++++++++++++++++
>>  arch/riscv/boot/install.sh      | 60 +++++++++++++++++++++++++++++++++
>>  arch/riscv/kernel/head.S        | 10 ++++++
>>  arch/riscv/kernel/vmlinux.lds.S |  2 +-
>>  6 files changed, 120 insertions(+), 2 deletions(-)
>>  create mode 100644 arch/riscv/boot/.gitignore
>>  create mode 100644 arch/riscv/boot/Makefile
>>  create mode 100644 arch/riscv/boot/install.sh
>>
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>
> Tested with U-Boot s-mode on QEMU virt, using bootm to boot the kernel
> Tested-by: Bin Meng <bmeng.cn@gmail.com>

I also won't include the tags unless I rewrite the tags.

Thanks for the review!

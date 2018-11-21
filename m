From: bmeng.cn@gmail.com (Bin Meng)
Date: Wed, 21 Nov 2018 13:09:47 +0800
Subject: [PULL RFC] RISC-V Patches for 4.20-rc4
In-Reply-To: <mhng-c4f4aebd-afe6-42f8-a2e0-a0c6ff3dc001@palmer-si-x1c4>
References: <mhng-c4f4aebd-afe6-42f8-a2e0-a0c6ff3dc001@palmer-si-x1c4>
Message-ID: <CAEUhbmWiSKJhAotBC13PN+useOCktnfvDr6nCuqVoDOP9cnuZQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Palmer,

On Wed, Nov 21, 2018 at 2:13 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The following changes since commit 9ff01193a20d391e8dbce4403dd5ef87c7eaaca6:
>
>   Linux 4.20-rc3 (2018-11-18 13:33:44 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.20-rc4
>
> for you to fetch changes up to 5d8f81ba1da55210123b9595e87b913c79579d02:
>
>   RISC-V: recognize S/U mode bits in print_isa (2018-11-20 05:19:28 -0800)
>
> ----------------------------------------------------------------
> RISC-V Patches for 4.20-rc4
>
> This week is a bit bigger than I expected.  That's my fault, as I missed
> a few patches while I was at Plumbers last week.  We have:
>
> * A fix to a quite embarassing issue where raw_copy_to_user() was
>   implemented with asm_copy_from_user() (and vice versa).
> * Improvements to our makefile to allow flat binaries to be generated.
> * A build fix that predeclares "struct module" at the top of
>   <asm/module.h>, which triggers warnings later in that header.
> * The addition of our own <uapi/asm/unistd> header, which is necessary
>   to align our stat ABI on 32-bit systems.
> * A fix to avoid printing a warning when the S or U bits are set in
>   print_isa().
>
> I already have one patch in the queue for next week.
>
> ----------------------------------------------------------------
> Anup Patel (1):
>       RISC-V: Build flat and compressed kernel images
>

This one need a minor tweak in the commit message.
See http://lists.infradead.org/pipermail/linux-riscv/2018-November/002327.html

Feel free to include my RB/TB tags when you touch it.

> David Abdurachmanov (2):
>       riscv: fix warning in arch/riscv/include/asm/module.h
>       riscv: add asm/unistd.h UAPI header
>
> Olof Johansson (1):
>       RISC-V: Fix raw_copy_{to,from}_user()
>
> Patrick St?hlin (1):
>       RISC-V: recognize S/U mode bits in print_isa
>

Regards,
Bin

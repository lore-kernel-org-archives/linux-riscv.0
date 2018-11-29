From: bmeng.cn@gmail.com (Bin Meng)
Date: Thu, 29 Nov 2018 15:36:41 +0800
Subject: [PATCH] RISC-V: Make BSS section as the last section in
 vmlinux.lds.S
In-Reply-To: <20181126060802.19314-1-anup@brainfault.org>
References: <20181126060802.19314-1-anup@brainfault.org>
Message-ID: <CAEUhbmXMZj68FyANeqP4jo2Pvk4ihEqPG2+g1gQAFMSqppNq-Q@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Nov 26, 2018 at 2:12 PM Anup Patel <anup@brainfault.org> wrote:
>
> The objcopy only emits loadable sections when creating flat kernel
> Image. To have minimal possible size of flat kernel Image, we should
> have all non-loadable sections after loadable sections.
>
> Currently, execption table section (loadable section) is after BSS
> section (non-loadable section) in the RISC-V vmlinux.lds.S. This
> is not optimal for having minimal flat kernel Image size hence this
> patch makes BSS section as the last section in RISC-V vmlinux.lds.S.
>
> In addition, we make BSS section aligned to 16byte instead of PAGE
> aligned which further reduces flat kernel Image size by few KBs.
>
> The flat kernel Image size of Linux-4.20-rc4 using GCC 8.2.0 is
> 8819980 bytes with current RISC-V vmlinux.lds.S and it reduces to
> 7991740 bytes with this patch applied using GCC 8.2.0. In summary,
> this patch reduces Linux-4.20-rc4 flat kernel Image size by 809 KB.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/kernel/vmlinux.lds.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

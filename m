From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 20 Aug 2018 15:22:55 -0700 (PDT)
Subject: [PATCH v4 3/5] Cleanup ISA string setting
In-Reply-To: <1533698685-18022-4-git-send-email-alankao@andestech.com>
Message-ID: <mhng-e7585e65-b47f-48c2-97dd-5cc19396c0a7@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 07 Aug 2018 20:24:43 PDT (-0700), alankao at andestech.com wrote:
> Just a side note: (Assume that atomic and compressed is on)
>
> Before this patch, assembler was always given the riscv64imafdc
> MARCH string because there are fld/fsd's in entry.S; compiler was
> always given riscv64imac because kernel doesn't need floating point
> code generation.  After this, the MARCH string in AFLAGS and CFLAGS
> become the same.
>
> Signed-off-by: Alan Kao <alankao@andestech.com>
> Cc: Greentime Hu <greentime@andestech.com>
> Cc: Vincent Chen <vincentc@andestech.com>
> Cc: Zong Li <zong@andestech.com>
> Cc: Nick Hu <nickhu@andestech.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/Makefile | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 6d4a5f6c3f4f..e0fe6790624f 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -26,7 +26,6 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
>
>  	KBUILD_CFLAGS += -mabi=lp64
>  	KBUILD_AFLAGS += -mabi=lp64
> -	KBUILD_MARCH = rv64im
>  	LDFLAGS += -melf64lriscv
>  else
>  	BITS := 32
> @@ -34,22 +33,20 @@ else
>
>  	KBUILD_CFLAGS += -mabi=ilp32
>  	KBUILD_AFLAGS += -mabi=ilp32
> -	KBUILD_MARCH = rv32im
>  	LDFLAGS += -melf32lriscv
>  endif
>
>  KBUILD_CFLAGS += -Wall
>
> -ifeq ($(CONFIG_RISCV_ISA_A),y)
> -	KBUILD_ARCH_A = a
> -endif
> -ifeq ($(CONFIG_RISCV_ISA_C),y)
> -	KBUILD_ARCH_C = c
> -endif
> -
> -KBUILD_AFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)fd$(KBUILD_ARCH_C)
> +# ISA string setting
> +riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32im
> +riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64im
> +riscv-march-$(CONFIG_RISCV_ISA_A)	:= $(riscv-march-y)a
> +riscv-march-y				:= $(riscv-march-y)fd
> +riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
> +KBUILD_CFLAGS += -march=$(riscv-march-y)
> +KBUILD_AFLAGS += -march=$(riscv-march-y)
>
> -KBUILD_CFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)$(KBUILD_ARCH_C)

We used to have "fd" disabled in KBUILD_CFLAGS because we wanted to ensure that 
any use of floating-point types within the kernel would trigger the inclusion 
of soft-float libraries rather than emitting hardware floating-point 
instructions.  The worry here is that we'd end up corrupting the user's 
floating-point state with the kernel accesses because of the lazy save/restore 
stuff going on.

I remember at some point it was illegal to use floating-point within the 
kernel, but for some reason I thought that had changed.  I do see a handful of 
references to "float" and "double" in the kernel source, and most of references 
to kernel_fpu_begin() appear to be in SSE-specific stuff.  My one worry are the 
usages in drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c, as I can't quickly 
demonstrate they won't happen.

If we do this I think we should at least ensure kernel_fpu_{begin,end}() do the 
right thing for RISC-V.  I'd still feel safer telling the C compiler to 
disallow floating-point, though, as I'm a bit paranoid that GCC might go and 
emit a floating-point instruction even when it's not explicitly asked for.  I 
just asked Jim, who actually understands GCC, and he said that it'll spill to 
floating-point registers if the cost function determines it's cheaper than the 
stack.  While he thinks that's unlikely, I don't really want to rely a GCC cost 
function for the correctness of our kernel port.

I'd like to avoid having "-march=*fd*" in CFLAGS, unless someone can convince 
me it's safe and that I'm just being too paranoid :).

>  KBUILD_CFLAGS += -mno-save-restore
>  KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)

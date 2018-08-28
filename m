From: alankao@andestech.com (Alan Kao)
Date: Tue, 28 Aug 2018 15:10:32 +0800
Subject: [PATCH] RISC-V: Mask out the F extension on systems without D
In-Reply-To: <20180827220352.24301-1-palmer@sifive.com>
References: <20180827220352.24301-1-palmer@sifive.com>
Message-ID: <20180828071032.GA16806@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Palmer,

On Mon, Aug 27, 2018 at 03:03:52PM -0700, Palmer Dabbelt wrote:
> The RISC-V Linux port doesn't support systems that have the F extension
> but don't have the D extension -- we actually don't support systems
> without D either, but Alan's patch set is rectifying that soon.  For now
> I think we can leave this in a semi-broken state and just wait for
> Alan's patch set to get merged for proper non-FPU support -- the patch
> set is starting to look good, so doing something in-between doesn't seem
> like it's worth the work.
> 
> I don't think it's worth fretting about support for systems with F but
> not D for now: our glibc ABIs are IMAC and IMAFDC so they probably won't
> end up being popular.  We can always extend this in the future.
> 
> CC: Alan Kao <alankao@andestech.com>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 17011a870044..652d102ffa06 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -57,5 +57,12 @@ void riscv_fill_hwcap(void)
>  	for (i = 0; i < strlen(isa); ++i)
>  		elf_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
>  
> +	/* We don't support systems with F but without D, so mask those out
> +	 * here. */
> +	if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
> +		pr_info("This kernel does not support systems with F but not D");
> +		elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
> +	}
> +

The commit message does address the problem and this patch does provide checks
and helpful information to users, but I wonder if we really need this patch, for
two reasons:

* Just as you mentioned, current glibc ABI does not support such a thing as
  IMAFC, so probably no one has had trouble with this.  To be honest, I suppose
  that anybody (RISC-V enthusiasts or vendors) who really need F-only support
  in kernel should get themself involved in the development by sending patches
  to improve.

* There are corner cases to let a F-only machine to pass the check in this
  patch.  For instance, a vendor decides to name her extension ISA as doom,
  and supports single-precision FP only, so her ISA string would be

    IMAFCXdoom.

  The variable elf_hwcap is calculated at the loop in line 57,58, the 'd'
  from Xdoom would bypass the check, while the underlying machine does not
  support double-precision FP.

>  	pr_info("elf_hwcap is 0x%lx", elf_hwcap);
>  }
> -- 
> 2.16.4
>

I don't know if the reasons make sense to you, but anyway that's all I
would like to say about this patch.

Alan

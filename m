From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 24 Oct 2018 15:05:43 -0700 (PDT)
Subject: [PATCH] RISC-V: properly determine hardware caps
In-Reply-To: <mvmftwxruas.fsf@suse.de>
Message-ID: <mhng-fe1ddf75-4f79-4ffa-8017-d9ddae5ef503@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 23 Oct 2018 00:33:47 PDT (-0700), schwab at suse.de wrote:
> On the Hifive-U platform, cpu 0 is a masked cpu with less capabilities
> than the other cpus.  Ignore it for the purpose of determining the
> hardware capabilities of the system.
>
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  arch/riscv/kernel/cpufeature.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 5493f32287..0339087aa6 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -28,7 +28,7 @@ bool has_fpu __read_mostly;
>
>  void riscv_fill_hwcap(void)
>  {
> -	struct device_node *node;
> +	struct device_node *node = NULL;
>  	const char *isa;
>  	size_t i;
>  	static unsigned long isa2hwcap[256] = {0};
> @@ -44,9 +44,11 @@ void riscv_fill_hwcap(void)
>
>  	/*
>  	 * We don't support running Linux on hertergenous ISA systems.  For
> -	 * now, we just check the ISA of the first processor.
> +	 * now, we just check the ISA of the first "okay" processor.
>  	 */
> -	node = of_find_node_by_type(NULL, "cpu");
> +	while ((node = of_find_node_by_type(node, "cpu")))
> +		if (riscv_of_processor_hartid(node) >= 0)
> +			break;
>  	if (!node) {
>  		pr_warning("Unable to find \"cpu\" devicetree entry");
>  		return;

Thanks!  I'll add this to for-next, and if there's no other comments I'll 
include it as part of next week's PR.

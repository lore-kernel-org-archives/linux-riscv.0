From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 09 Nov 2018 13:07:03 -0800 (PST)
Subject: [PATCH] RISC-V: recognize S/U mode bits in print_isa
In-Reply-To: <20181109193349.28179-1-me@packi.ch>
Message-ID: <mhng-cff31d5f-053e-4e62-997c-232c8bdd5fd3@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, 09 Nov 2018 11:33:47 PST (-0800), me at packi.ch wrote:
> Removes the warning about an unsupported ISA when reading /proc/cpuinfo
> on QEMU.
>
> Signed-off-by: Patrick St?hlin <me@packi.ch>
> ---
>  arch/riscv/kernel/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 3a5a2ee31547..4029c7e6872b 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -64,7 +64,7 @@ int riscv_of_processor_hartid(struct device_node *node)
>
>  static void print_isa(struct seq_file *f, const char *orig_isa)
>  {
> -	static const char *ext = "mafdc";
> +	static const char *ext = "mafdcsu";
>  	const char *isa = orig_isa;
>  	const char *e;

This is a bit pedantic, but the "S" extension should really be hidden from 
userspace.

From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 20 Nov 2018 09:29:50 -0800 (PST)
Subject: [PATCH] RISC-V: add of_node_put()
In-Reply-To: <20181120141102.20534-1-tiny.windzz@gmail.com>
Message-ID: <mhng-f6900077-f39d-46e8-8fce-e5f7af872ced@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 20 Nov 2018 06:11:02 PST (-0800), tiny.windzz at gmail.com wrote:
> use of_node_put() to release the refcount.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  arch/riscv/kernel/time.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> index 1911c8f6b8a6..40470e669a35 100644
> --- a/arch/riscv/kernel/time.c
> +++ b/arch/riscv/kernel/time.c
> @@ -26,6 +26,7 @@ void __init time_init(void)
>  	cpu = of_find_node_by_path("/cpus");
>  	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
>  		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
> +	of_node_put(cpu);
>  	riscv_timebase = prop;
>
>  	lpj_fine = riscv_timebase / HZ;

Thanks.  I'm going to target this for next week's PR.

From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 08 Nov 2018 11:32:55 -0800 (PST)
Subject: [PATCH] riscv: fix warning in arch/riscv/include/asm/module.h
In-Reply-To: <20181108190700.30825-1-david.abdurachmanov@gmail.com>
Message-ID: <mhng-1888c072-5274-457c-aa26-b9fa9cb246dd@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 08 Nov 2018 11:07:00 PST (-0800), david.abdurachmanov at gmail.com wrote:
> Fixes warning: 'struct module' declared inside parameter list will not be
> visible outside of this definition or declaration
>
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> ---
>  arch/riscv/include/asm/module.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/module.h
> index 349df33808c4..cd2af4b013e3 100644
> --- a/arch/riscv/include/asm/module.h
> +++ b/arch/riscv/include/asm/module.h
> @@ -8,6 +8,7 @@
>
>  #define MODULE_ARCH_VERMAGIC    "riscv"
>
> +struct module;
>  u64 module_emit_got_entry(struct module *mod, u64 val);
>  u64 module_emit_plt_entry(struct module *mod, u64 val);

Works for me.  Looks like arm64 might have exactly the same issue.  I'll roll 
it up into the next RC.

Thanks!

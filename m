From: hch@lst.de (Christoph Hellwig)
Date: Tue, 9 Oct 2018 18:15:33 +0200
Subject: [PATCH] RISC-V: remove the unused return_to_handler export
In-Reply-To: <20180921064321.21817-1-hch@lst.de>
References: <20180921064321.21817-1-hch@lst.de>
Message-ID: <20181009161533.GA21260@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

ping?

On Fri, Sep 21, 2018 at 08:43:21AM +0200, Christoph Hellwig wrote:
> This export is not only not needed, but also breaks symbol versioning
> due to being an undeclared assembly export.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/kernel/mcount.S | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
> index 5721624886a1..8a5593ff9ff3 100644
> --- a/arch/riscv/kernel/mcount.S
> +++ b/arch/riscv/kernel/mcount.S
> @@ -75,7 +75,6 @@ ENTRY(return_to_handler)
>  	RESTORE_RET_ABI_STATE
>  	jalr	a1
>  ENDPROC(return_to_handler)
> -EXPORT_SYMBOL(return_to_handler)
>  #endif
>  
>  #ifndef CONFIG_DYNAMIC_FTRACE
> -- 
> 2.18.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
---end quoted text---

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF09C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=45oKeAbadsXNHFJQgeOjdW1EBmP60m8fGr4Q3GvcqS8=; b=PAwPp3NcQvZ54h
	ni4NxBd7yGZ5eT4sBUuiLBIfilvocKxYaHgD4s2LcYDnFXiIWj6oHFFqhS/r/w8agPZLnHACB/eWN
	XES3x5hJE5//M4Xq/TTVV+QKGzJzNgWjuxqkyDivzbo7veaUaGnbqewcmEc2rgmdKxS1hXlTtRBfR
	Q+16zhTM4ME0NtNF84XjzclwkiVu54KL5A4FyuX2tEgaZta6vx+IlzCSZIHcdXTs63aLSXLPJY1RV
	jIovyuIyEYFPqhQwsU6B06icrgcSCprwXOwvusUa7CiwKr6IhTmJF6WfXu1dFvrpNJxgD39iFVWfO
	3P5lCfccx+F7/UGpyIQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt48h-00Es9o-Db; Fri, 03 Dec 2021 08:41:55 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt48e-00Es86-DL
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 08:41:53 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id CAFF66000E;
 Fri,  3 Dec 2021 08:41:49 +0000 (UTC)
Message-ID: <d7238da5-6a47-dcf6-9615-050856fc2dc9@ghiti.fr>
Date: Fri, 3 Dec 2021 09:41:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 5/5] riscv: mm: init: try best to remove #ifdef
 CONFIG_XIP_KERNEL usage
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211203050317.2102-1-jszhang@kernel.org>
 <20211203050317.2102-6-jszhang@kernel.org>
From: Alexandre ghiti <alex@ghiti.fr>
In-Reply-To: <20211203050317.2102-6-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_004152_639378_2538DF2C 
X-CRM114-Status: GOOD (  19.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/3/21 06:03, Jisheng Zhang wrote:
> Currently, the #ifdef CONFIG_XIP_KERNEL usage can be divided into the
> following three types:
>
> The first one is for functions/declarations only used in XIP case.
>
> The second one is for XIP_FIXUP case. Something as below:
> |foo_type foo;
> |#ifdef CONFIG_XIP_KERNEL
> |#define foo    (*(foo_type *)XIP_FIXUP(&foo))
> |#endif
>
> Usually, it's better to let the foo macro sit with the foo var
> together. But if various foos are defined adjacently, we can
> save some #ifdef CONFIG_XIP_KERNEL usage by grouping them together.
>
> The third one is for different implementations for XIP, usually, this
> is a #ifdef...#else...#endif case.
>
> This patch moves the pt_ops macro to adjacent #ifdef CONFIG_XIP_KERNEL
> and group first usage case into one.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/riscv/mm/init.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 4a9e3f429042..aeae7d6b2fee 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -40,10 +40,6 @@ EXPORT_SYMBOL(kernel_map);
>   phys_addr_t phys_ram_base __ro_after_init;
>   EXPORT_SYMBOL(phys_ram_base);
>   
> -#ifdef CONFIG_XIP_KERNEL
> -extern char _xiprom[], _exiprom[], __data_loc;
> -#endif
> -
>   unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
>   							__page_aligned_bss;
>   EXPORT_SYMBOL(empty_zero_page);
> @@ -227,10 +223,6 @@ static void __init setup_bootmem(void)
>   #ifdef CONFIG_MMU
>   static struct pt_alloc_ops pt_ops __initdata;
>   
> -#ifdef CONFIG_XIP_KERNEL
> -#define pt_ops (*(struct pt_alloc_ops *)XIP_FIXUP(&pt_ops))
> -#endif
> -
>   unsigned long riscv_pfn_base __ro_after_init;
>   EXPORT_SYMBOL(riscv_pfn_base);
>   
> @@ -242,6 +234,7 @@ pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>   static pmd_t __maybe_unused early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
>   
>   #ifdef CONFIG_XIP_KERNEL
> +#define pt_ops			(*(struct pt_alloc_ops *)XIP_FIXUP(&pt_ops))
>   #define trampoline_pg_dir      ((pgd_t *)XIP_FIXUP(trampoline_pg_dir))
>   #define fixmap_pte             ((pte_t *)XIP_FIXUP(fixmap_pte))
>   #define early_pg_dir           ((pgd_t *)XIP_FIXUP(early_pg_dir))
> @@ -445,6 +438,8 @@ static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
>   }
>   
>   #ifdef CONFIG_XIP_KERNEL
> +extern char _xiprom[], _exiprom[], __data_loc;
> +
>   /* called from head.S with MMU off */
>   asmlinkage void __init __copy_data(void)
>   {


Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

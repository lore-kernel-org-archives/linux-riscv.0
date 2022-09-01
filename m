Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F56AECAAD1
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpqI66ebbsnxL92ejO+cPjNETItmnCZRmTq7erRV3uQ=; b=Jx3gCIFzZnxvNz
	XMGMtsEzkMiR5YXQ9DP8AMue3X7CWbJHvkWbWqqdXoI/duliTwY0oP5NcpKpAzMLtH88qW0qY3YBm
	ODTw6LSmidH67T1ZIUpCmQCDnpshNbq70XADf9yJh7q2cUkvD5d02VX+PClObSdr3NP+7pnWDiddy
	Kf/M+NgdTyP4yvjtiLSxfrmC2AV6cswWzjm75db6MPMTi1bmWstyKILN0q4pkki9ICZ3j3ji9zLi5
	PkKqOPbB3s2F8RVNsgG5EOX2oCR0X7OzJ5NzCg7mMV/rn/qdEZt5fKZjdzKGGMuUM1+/hZQvQVAEs
	x5+SYkcLw4pKMZq7SxGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTfrZ-00Ae2D-54; Thu, 01 Sep 2022 08:47:49 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTfrV-00Ae16-UL
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 08:47:47 +0000
Received: by mail-wr1-x433.google.com with SMTP id u17so2100381wrp.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Sep 2022 01:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=/Auump3XxTowu3KsMpzt3UPvEs6aYKfLdnXKnH4oZ54=;
        b=Ycl15nMb/4hb3kHz/lQ3e6M+fpLdoHJWSCpWa/MbisPbZ7pCgQ11BLgW7NS3aX/qHi
         kjXZtQKJCke0dSlTE8pS78iuYzMr1YE/gvJLxuiYBHcPH9cIkR76HiQ6jvoeZ3Sqz0gN
         N3ojghubI2M9j+bN3fPDI2JJfumisjTd2WiJnE+Ga7SZ+MozHj9bswIVE3wDUdedNi7u
         Y9dGHbQXkX8CBtXZDy0LSXc+m4C6n+8WEYMZIT/Rx2IsivujQe2u6XUQDAxpsEEizbz9
         CDcObZT7NSWOYM0q8jeBpJOagUmXXO2vvqqk8glCUFNn8x7mgUKIY1Ddvy6p3TSf1imo
         8gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=/Auump3XxTowu3KsMpzt3UPvEs6aYKfLdnXKnH4oZ54=;
        b=xpHUAd8D+1xOI4ew3F0Uqz4bt7YyOIYuV20hxh4e7ou9tTVGcdrQ6x6v2JWt4aCGYX
         LPtA9QDkpN2Vgaf/wQQNhYVMB4SXqiBvq74DI5AqPxmiQ53FcRWK2YuBk9vpSnJPakfT
         +nqI4AOUD2TtSi6nf8LSQQ0lesAhghO0bWoD35cLjIrbK8tTcxEigEuebG37lFMgu4sj
         6kCZmsSbMwjhnWlWCiryQ02Rjifl94BWd5H3LTReOR32PTLMyt3NCz6SBjlIsvoZ+6mZ
         Nl53ctj+MaywtFefKQMxHokmpFFbVpGo54i9ZQuEMtHMlKXNjuBg/OWS81buBjVNlzUC
         EQXw==
X-Gm-Message-State: ACgBeo0TVUgZUurEMAAvVa2ilUwfRIkiAylF0T49kDCwLqNlwiK3YL+s
	PtPdNuoBBcTEQIZMdvCTUIphTg==
X-Google-Smtp-Source: AA6agR7YxteHL9Mris6cZrPrBO0zwwHVERYvvIslObQc105k447VDKLfl6OgWT/HLm3s5gCVTlynGw==
X-Received: by 2002:a05:6000:616:b0:226:d80b:76ab with SMTP id bn22-20020a056000061600b00226d80b76abmr11224186wrb.547.1662022062154;
        Thu, 01 Sep 2022 01:47:42 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id bq25-20020a5d5a19000000b0021e519eba9bsm9411140wrb.42.2022.09.01.01.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 01:47:41 -0700 (PDT)
Date: Thu, 1 Sep 2022 10:47:40 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Vladimir Isaev <vladimir.isaev@syntacore.com>
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
	Conor.Dooley@microchip.com, atishp@atishpatra.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	anup@brainfault.org
Subject: Re: [PATCH v2] riscv: Fix permissions for all mm's during mm init
Message-ID: <20220901084740.v34npx77vlfclyje@kamzik>
References: <20220830091612.513137-1-vladimir.isaev@syntacore.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220830091612.513137-1-vladimir.isaev@syntacore.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_014746_013105_45FBBAF3 
X-CRM114-Status: GOOD (  30.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 30, 2022 at 12:16:12PM +0300, Vladimir Isaev wrote:
> It is possible to have more than one mm (init_mm) during memory
> permission fixes. In my case it was caused by request_module
> from drivers/net/phy/phy_device.c and leads to following Oops
> during free_initmem() on RV32 platform:
>      Unable to handle kernel paging request at virtual address c0800000
>      Oops [#1]
>      Modules linked in:
>      CPU: 0 PID: 1 Comm: swapper Not tainted 5.15.45
>      Hardware name: Syntacore SCR5 SDK board (DT)
>      epc : __memset+0x58/0xf4
>       ra : free_reserved_area+0xfa/0x15a
>      epc : c02b26ac ra : c00eb588 sp : c1c1fed0
>       gp : c1898690 tp : c1c98000 t0 : c0800000
>       t1 : ffffffff t2 : 00000000 s0 : c1c1ff20
>       s1 : c189a000 a0 : c0800000 a1 : cccccccc
>       a2 : 00001000 a3 : c0801000 a4 : 00000000
>       a5 : 00800000 a6 : fef09000 a7 : 00000000
>       s2 : c0e57000 s3 : c10edcf8 s4 : 000000cc
>       s5 : ffffefff s6 : c188a9f4 s7 : 00000001
>       s8 : c0800000 s9 : fef1b000 s10: c10ee000
>       s11: c189a000 t3 : 00000000 t4 : 00000000
>       t5 : 00000000 t6 : 00000001
>      status: 00000120 badaddr: c0800000 cause: 0000000f
>      [<c0488658>] free_initmem+0x204/0x222
>      [<c048d05a>] kernel_init+0x32/0xfc
>      [<c0002f76>] ret_from_exception+0x0/0xc
>      ---[ end trace 7a5e2b002350b528 ]---
> 
> This is because request_module attempted to modprobe module, so it created
> new mm with the copy of kernel's page table. And this copy won't be updated
> in case of 4M pages and RV32 (pgd is the leaf).
> 
> To fix this we can update protection bits for all of existing mm-s, the
> same as ARM does, see commit 08925c2f124f
> ("ARM: 8464/1: Update all mm structures with section adjustments").
> 
> Fixes: 19a00869028f ("RISC-V: Protect all kernel sections including init early")
> Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
> ---
> Changes for v2:
>   - Fixed commit message format.
>   - Added 'Fixes' tag.
> ---
>  arch/riscv/include/asm/set_memory.h | 20 +++--------
>  arch/riscv/kernel/setup.c           | 11 ------
>  arch/riscv/mm/init.c                | 29 ++++++++++++---
>  arch/riscv/mm/pageattr.c            | 55 ++++++++++++++++++++++++-----
>  4 files changed, 75 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> index a2c14d4b3993..bb0f6b4ed86b 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -16,28 +16,16 @@ int set_memory_rw(unsigned long addr, int numpages);
>  int set_memory_x(unsigned long addr, int numpages);
>  int set_memory_nx(unsigned long addr, int numpages);
>  int set_memory_rw_nx(unsigned long addr, int numpages);
> -static __always_inline int set_kernel_memory(char *startp, char *endp,
> -					     int (*set_memory)(unsigned long start,
> -							       int num_pages))
> -{
> -	unsigned long start = (unsigned long)startp;
> -	unsigned long end = (unsigned long)endp;
> -	int num_pages = PAGE_ALIGN(end - start) >> PAGE_SHIFT;
> -
> -	return set_memory(start, num_pages);
> -}
> +void fix_kernel_mem_early(char *startp, char *endp, pgprot_t set_mask,
> +			  pgprot_t clear_mask);
>  #else
>  static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
> -static inline int set_kernel_memory(char *startp, char *endp,
> -				    int (*set_memory)(unsigned long start,
> -						      int num_pages))
> -{
> -	return 0;
> -}
> +static inline void fix_kernel_mem_early(char *startp, char *endp,
> +					pgprot_t set_mask, pgprot_t clear_mask) { }
>  #endif
>  
>  int set_direct_map_invalid_noflush(struct page *page);
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 95ef6e2bf45c..17eae1406092 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -27,7 +27,6 @@
>  #include <asm/early_ioremap.h>
>  #include <asm/pgtable.h>
>  #include <asm/setup.h>
> -#include <asm/set_memory.h>
>  #include <asm/sections.h>
>  #include <asm/sbi.h>
>  #include <asm/tlbflush.h>
> @@ -318,13 +317,3 @@ static int __init topology_init(void)
>  	return 0;
>  }
>  subsys_initcall(topology_init);
> -
> -void free_initmem(void)
> -{
> -	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> -		set_kernel_memory(lm_alias(__init_begin), lm_alias(__init_end),
> -				  IS_ENABLED(CONFIG_64BIT) ?
> -					set_memory_rw : set_memory_rw_nx);
> -
> -	free_initmem_default(POISON_FREE_INITMEM);
> -}
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index b56a0a75533f..978202712535 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -16,7 +16,6 @@
>  #include <linux/of_fdt.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/libfdt.h>
> -#include <linux/set_memory.h>
>  #include <linux/dma-map-ops.h>
>  #include <linux/crash_dump.h>
>  #include <linux/hugetlb.h>
> @@ -28,6 +27,7 @@
>  #include <asm/io.h>
>  #include <asm/ptdump.h>
>  #include <asm/numa.h>
> +#include <asm/set_memory.h>
>  
>  #include "../kernel/head.h"
>  
> @@ -714,10 +714,14 @@ static __init pgprot_t pgprot_from_va(uintptr_t va)
>  
>  void mark_rodata_ro(void)
>  {
> -	set_kernel_memory(__start_rodata, _data, set_memory_ro);
> -	if (IS_ENABLED(CONFIG_64BIT))
> -		set_kernel_memory(lm_alias(__start_rodata), lm_alias(_data),
> -				  set_memory_ro);
> +	pgprot_t set_mask = __pgprot(_PAGE_READ);
> +	pgprot_t clear_mask = __pgprot(_PAGE_WRITE);
> +
> +	fix_kernel_mem_early(__start_rodata, _data, set_mask, clear_mask);
> +	if (IS_ENABLED(CONFIG_64BIT)) {
> +		fix_kernel_mem_early(lm_alias(__start_rodata), lm_alias(_data),
> +				     set_mask, clear_mask);
> +	}
>  
>  	debug_checkwx();
>  }
> @@ -1243,3 +1247,18 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>  	return vmemmap_populate_basepages(start, end, node, NULL);
>  }
>  #endif
> +
> +void free_initmem(void)
> +{
> +	pgprot_t set_mask = __pgprot(_PAGE_READ | _PAGE_WRITE);
> +	pgprot_t clear_mask = IS_ENABLED(CONFIG_64BIT) ?
> +			      __pgprot(0) : __pgprot(_PAGE_EXEC);
> +
> +	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
> +		fix_kernel_mem_early(lm_alias(__init_begin),
> +				     lm_alias(__init_end),
> +				     set_mask, clear_mask);
> +	}
> +
> +	free_initmem_default(POISON_FREE_INITMEM);
> +}
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index 5e49e4b4a4cc..10a4ee313083 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/pagewalk.h>
>  #include <linux/pgtable.h>
> +#include <linux/sched.h>
>  #include <asm/tlbflush.h>
>  #include <asm/bitops.h>
>  #include <asm/set_memory.h>
> @@ -104,24 +105,62 @@ static const struct mm_walk_ops pageattr_ops = {
>  	.pte_hole = pageattr_pte_hole,
>  };
>  
> -static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
> -			pgprot_t clear_mask)
> +static int __set_memory_mm(struct mm_struct  *mm, unsigned long start,
                                              ^ extra space

> +			   unsigned long end, pgprot_t set_mask,
> +			   pgprot_t clear_mask)
>  {
>  	int ret;
> -	unsigned long start = addr;
> -	unsigned long end = start + PAGE_SIZE * numpages;
>  	struct pageattr_masks masks = {
>  		.set_mask = set_mask,
>  		.clear_mask = clear_mask
>  	};
>  
> +	mmap_read_lock(mm);
> +	ret = walk_page_range_novma(mm, start, end, &pageattr_ops, NULL,
> +				    &masks);
> +	mmap_read_unlock(mm);
> +
> +	return ret;
> +}
> +
> +void fix_kernel_mem_early(char *startp, char *endp, pgprot_t set_mask,
> +			  pgprot_t clear_mask)
> +{
> +	struct task_struct *t, *s;
> +
> +	unsigned long start = (unsigned long)startp;
> +	unsigned long end = PAGE_ALIGN((unsigned long)endp);
> +
> +	__set_memory_mm(current->active_mm, start, end, set_mask, clear_mask);
> +	__set_memory_mm(&init_mm, start, end, set_mask, clear_mask);
> +

Presumably this is only run at a point where it's safe not to take
tasklist_lock. A comment explaining that would be helpful to readers
and help avoid this code getting copy+pasted into points it's not
safe.

> +	rcu_read_lock();
> +	for_each_process(t) {
> +		if (t->flags & PF_KTHREAD)
> +			continue;
> +		for_each_thread(t, s) {
> +			if (s->mm) {
> +				__set_memory_mm(s->mm, start, end, set_mask,
> +						clear_mask);
> +			}
> +		}
> +	}
> +	rcu_read_unlock();
> +
> +	flush_tlb_kernel_range(start, end);
> +}
> +
> +static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
> +			pgprot_t clear_mask)
> +{
> +	int ret;
> +	unsigned long start = addr;
> +	unsigned long end = start + PAGE_SIZE * numpages;
> +
>  	if (!numpages)
>  		return 0;
>  
> -	mmap_read_lock(&init_mm);
> -	ret =  walk_page_range_novma(&init_mm, start, end, &pageattr_ops, NULL,
> -				     &masks);
> -	mmap_read_unlock(&init_mm);
> +	ret = __set_memory_mm(&init_mm, start, end, set_mask, clear_mask);
>  
>  	flush_tlb_kernel_range(start, end);
>  
> -- 
> 2.37.2
> 

Besides the extra space and comment request

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 859BCC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 02:39:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 237A364FA0
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 02:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 237A364FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=LnWa9NONXOe4o+SquW1yr9HP2dLZ8bU5Ijd8R8uXZMY=; b=DNB3cZfMPjImtSqHgws/1X4Cy
	xLe/DK8wZESQR6wf7g2gmOz/YIV9OU8H5V3WAsNBkKIHCAvdWyFsEfLLw0pRyYmBtKA0oZMLWeTao
	GeosWSM4n0yOWVkgx5gA03ZwYEWRRlVy9fL5slmoEP3ALIqduGCoOwOU2BSNKdaq0OvkOTLusu1kV
	uyHFHrz3uQvifmgs0go+tBGR+MadMhhUlptxq3nm52DNvs556cZp6ZscHilU6K7aIgAsc4U48YV8O
	P7G8tiBY2noEM3iHDjN3UaJsGG7XjQFFafqm46rZywx2jv8mQk7UlK4AZBj2Lo0sazxGC4sztwQAo
	lnyUJKzuQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJoke-005osW-Gp; Wed, 10 Mar 2021 02:39:11 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJojJ-005opF-Dy
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 02:38:12 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 q2-20020a17090a2e02b02900bee668844dso6385063pjd.3
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 18:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=UzABH8OfIDY+zUaaqIGMBSk5x3QjktoUn2udOPEAyJA=;
 b=S7p9K2Sy1JxHl14DlBQp08dPZfGedwIVcjfnsSdw6cX2LLEgqbJehT2sj8P2+Vu6h4
 OH4t3QtZMqqc8s2ld63L/KZhdp75/hnq9nuZW95Lq2npqwKVZFoUN9mt3vqKmrLAcbbD
 vRvrWvXtEvTzUAy7/l8z/Ftek6NZIivu7APlEaJ/JaVPAeqyYYsVsF9ZkYW2w8b0bQ/9
 xntuxhijdbCm4s+I/92WE2ob+0w7v9unuJZyPE5kNVt/FrsqI8tcVngntTMsG8TnnePE
 glkHCO1Chq0OvX3IpZnQ2u2W6wfAJXhWhBzeVw8vJYSbXtVBtuRFIqNXOsU2HollS4D1
 REzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=UzABH8OfIDY+zUaaqIGMBSk5x3QjktoUn2udOPEAyJA=;
 b=cGCnaBzDxYpVBgWSbIN1VlFpE/HDIxlP2um1eKDzXos4nQsk3efNTKuv4WW3JZeFKY
 wAGJqVimoTwC36cSRsAMQk8NQR+dGjhEZ+Fm9jxMm5t0KHCwI18DX/msWgJ9gV0wejK3
 UKc+k1rRfN3zGiVOHd2cUwjcTZkDahIcqlLwK/d4EaBjeG/GeiyzJjR62r6fn9BI2oVl
 xmWvYB0Ct7sYUGdwDyWWqPpFbE1jN+QShtfkCC0rAeLCLrIPKAY9oCeiZqCzfktt6ub0
 B78XRELei1cYIfkVBbilMGdbz6g5FXkA5CwFO4WngrljYtQSrgdHW3W9BPVCstP9RX98
 qwiA==
X-Gm-Message-State: AOAM532PqvSD0GslbTU6u0P0LfpdTMU53ngGFIvG6f1+41Q1r64VmMsy
 KEW8P90STqoDv1tAi+SwfeSdQt5J5369vQ==
X-Google-Smtp-Source: ABdhPJxuo7XbxYy02Dmd4tSy6hXdRwotPNq7rhbVP4gZ7CcP78+gYq8feEuqDD8nOpRdsuTnU06P0A==
X-Received: by 2002:a17:902:9001:b029:e6:2e56:8b0d with SMTP id
 a1-20020a1709029001b02900e62e568b0dmr1038347plp.31.1615343863808; 
 Tue, 09 Mar 2021 18:37:43 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s194sm14383714pfs.57.2021.03.09.18.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 18:37:43 -0800 (PST)
Date: Tue, 09 Mar 2021 18:37:43 -0800 (PST)
X-Google-Original-Date: Tue, 09 Mar 2021 18:37:24 PST (-0800)
Subject: Re: [PATCH v2] riscv: Improve KASAN_VMALLOC support
In-Reply-To: <20210226180154.31533-1-alex@ghiti.fr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 nylon7@andestech.com, nickhu@andestech.com, aryabinin@virtuozzo.com,
 glider@google.com, dvyukov@google.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, alex@ghiti.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-a1ab9e7a-d992-4432-badc-02cc788b1ace@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_023758_510668_6AEF481B 
X-CRM114-Status: GOOD (  31.66  )
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

On Fri, 26 Feb 2021 10:01:54 PST (-0800), alex@ghiti.fr wrote:
> When KASAN vmalloc region is populated, there is no userspace process and
> the page table in use is swapper_pg_dir, so there is no need to read
> SATP. Then we can use the same scheme used by kasan_populate_p*d
> functions to go through the page table, which harmonizes the code.
>
> In addition, make use of set_pgd that goes through all unused page table
> levels, contrary to p*d_populate functions, which makes this function work
> whatever the number of page table levels.
>
> And finally, make sure the writes to swapper_pg_dir are visible using
> an sfence.vma.

So I think this is actually a bug: without the fence we could get a 
kasan-related fault at any point (as the mappings might not be visible yet), 
and if we get one when inside do_page_fault() (or while holding a lock it 
wants) we'll end up deadlocking against ourselves.  That'll probably never 
happen in practice, but it'd still be good to get the fence onto fixes.  The 
rest are cleanups, they're for for-next (and should probably be part of your 
sv48 series, if you need to re-spin it -- I'll look at that next).

LMK if you want to split this up, or if you want me to do it.  Either way,

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>
> Changes in v2:
> - Quiet kernel test robot warnings about missing prototypes by declaring
>   the introduced functions as static.
>
>  arch/riscv/mm/kasan_init.c | 61 +++++++++++++-------------------------
>  1 file changed, 20 insertions(+), 41 deletions(-)
>
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index e3d91f334b57..aaa3bdc0ffc0 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -11,18 +11,6 @@
>  #include <asm/fixmap.h>
>  #include <asm/pgalloc.h>
>
> -static __init void *early_alloc(size_t size, int node)
> -{
> -	void *ptr = memblock_alloc_try_nid(size, size,
> -		__pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE, node);
> -
> -	if (!ptr)
> -		panic("%pS: Failed to allocate %zu bytes align=%zx nid=%d from=%llx\n",
> -			__func__, size, size, node, (u64)__pa(MAX_DMA_ADDRESS));
> -
> -	return ptr;
> -}
> -
>  extern pgd_t early_pg_dir[PTRS_PER_PGD];
>  asmlinkage void __init kasan_early_init(void)
>  {
> @@ -155,38 +143,29 @@ static void __init kasan_populate(void *start, void *end)
>  	memset(start, KASAN_SHADOW_INIT, end - start);
>  }
>
> -void __init kasan_shallow_populate(void *start, void *end)
> +static void __init kasan_shallow_populate_pgd(unsigned long vaddr, unsigned long end)
>  {
> -	unsigned long vaddr = (unsigned long)start & PAGE_MASK;
> -	unsigned long vend = PAGE_ALIGN((unsigned long)end);
> -	unsigned long pfn;
> -	int index;
> +	unsigned long next;
>  	void *p;
> -	pud_t *pud_dir, *pud_k;
> -	pgd_t *pgd_dir, *pgd_k;
> -	p4d_t *p4d_dir, *p4d_k;
> -
> -	while (vaddr < vend) {
> -		index = pgd_index(vaddr);
> -		pfn = csr_read(CSR_SATP) & SATP_PPN;
> -		pgd_dir = (pgd_t *)pfn_to_virt(pfn) + index;
> -		pgd_k = init_mm.pgd + index;
> -		pgd_dir = pgd_offset_k(vaddr);
> -		set_pgd(pgd_dir, *pgd_k);
> -
> -		p4d_dir = p4d_offset(pgd_dir, vaddr);
> -		p4d_k  = p4d_offset(pgd_k, vaddr);
> -
> -		vaddr = (vaddr + PUD_SIZE) & PUD_MASK;
> -		pud_dir = pud_offset(p4d_dir, vaddr);
> -		pud_k = pud_offset(p4d_k, vaddr);
> -
> -		if (pud_present(*pud_dir)) {
> -			p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
> -			pud_populate(&init_mm, pud_dir, p);
> +	pgd_t *pgd_k = pgd_offset_k(vaddr);
> +
> +	do {
> +		next = pgd_addr_end(vaddr, end);
> +		if (pgd_page_vaddr(*pgd_k) == (unsigned long)lm_alias(kasan_early_shadow_pmd)) {
> +			p = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
> +			set_pgd(pgd_k, pfn_pgd(PFN_DOWN(__pa(p)), PAGE_TABLE));
>  		}
> -		vaddr += PAGE_SIZE;
> -	}
> +	} while (pgd_k++, vaddr = next, vaddr != end);
> +}
> +
> +static void __init kasan_shallow_populate(void *start, void *end)
> +{
> +	unsigned long vaddr = (unsigned long)start & PAGE_MASK;
> +	unsigned long vend = PAGE_ALIGN((unsigned long)end);
> +
> +	kasan_shallow_populate_pgd(vaddr, vend);
> +
> +	local_flush_tlb_all();
>  }
>
>  void __init kasan_init(void)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

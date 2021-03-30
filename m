Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6FAC433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 05:06:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E443561580
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 05:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E443561580
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=E33mS41fSbsjYBEXR0ZUPZjfUfl1YZhZD7YFG3+Mgu4=; b=eL44PRmLC4M0AZqGFs+BpP7JN
	l1CYBOc6PTCRil6TEHqkmYSAgkdGpPI9R0UU3enQ+MuwPWgXKgOOC1+1pU6zaof+FTOiljb+RF7T5
	WVraNVePCB5RARpGcqEtoJF4BzaxwOwtnHfJMYGhplHMW6KBHvA/d6fmaYLUxwB67UjfkShn2bLTG
	x4X9E+0yJfBOTPIoN/2l4lWkFwlWKxxbCrnSAQqX1lJ/pMr1QBEGofPE8wakLH6fO5FhMMZZWrRk6
	8S6+jon7RUxfi3d94P1oUgbjSObYUv0imQ+qvrVmFa/tFuCSfheGwTAxfQm3+rgaLxtCnsFxXO3uF
	EvKrhf1EQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR6aL-002iZj-F1; Tue, 30 Mar 2021 05:06:37 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR6aG-002iZ2-T5
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 05:06:35 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so8839482pjh.1
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 22:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=vUHPJZsD1HsjvzEusIUyaB/CqNpQTfUUNzEFAb1GBPs=;
 b=vm+D9PSKU8aQKBqxe6YQ141KlvTTIjr63Fd9alM3Q9w1/2LKhteHaw24l18heIURO2
 EN6yJsgNvqtpfv7EygPqr09vmWhyQbyouVynYEg5UvO+SAA2du4Oh2ya/SP1gXJYcIzL
 qdYzhA/iBdbFsqAI/n0FUDaq4Rdx2EpP/12rkR13CC85fEaA+B/cZ7jHsxeoWNnUm656
 e4vVpeKLGRPpOSqZMa1e/4wpNNzmD+AAlOHhxOA22s+suq+WQaEGsu138/rXFwbsQr1T
 sxJQLgLhVK2OlU+YAxNxG/A65TqcuqMwDCfVnSluJEgGJ8TEftG6W+/Ve2Ev0ojcFbrF
 oFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=vUHPJZsD1HsjvzEusIUyaB/CqNpQTfUUNzEFAb1GBPs=;
 b=fyT7e+giaKGFb22xgoFTdrfXciG5+At/SE1SNI0PuDpJ7xI1KA//IAnn3tJTchx74F
 QPr3KcM18rsy01RRGN/Vhtb+ZuuS1XmnyhCX7y3wi5LBlloUobMEGCzWs3CwVdNJQy5r
 i/bdbkMC93J8rk4X39wfbjmltqstNEKH3joLAweiKGh28X8EkA7IipD+SFGKHewtIr+d
 1/UfsW5c6eeQ3E47QU/6sBnvYgh8p+Gv9/isppGYVluXFSb2cOuJeflmmM9pOjE1//cd
 YCVlPNQ+z4fDNZedduVIk5KmAobGcz/NmX2Y1geJu4DPKzlnnCiTOE2vqgWzdZ7x0NmJ
 lYYw==
X-Gm-Message-State: AOAM533DVaROeBRZEEoePJEeLp+VpnSAY/Rf6dEqNkPJRqyvCk80thRQ
 EEUSW9ugBQbLOKoeKSwE5k+Q2Q==
X-Google-Smtp-Source: ABdhPJzYxXi/P5lX8ODVPPjDHxBhKCBze39ZjqDO/zk+5AE3E8Znqti+eW8cxjlge5xZhIYdsu/5Ig==
X-Received: by 2002:a17:90b:16cd:: with SMTP id
 iy13mr2671264pjb.46.1617080790431; 
 Mon, 29 Mar 2021 22:06:30 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id i14sm1341926pjh.17.2021.03.29.22.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 22:06:30 -0700 (PDT)
Date: Mon, 29 Mar 2021 22:06:30 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Mar 2021 21:47:37 PDT (-0700)
Subject: Re: [PATCH v3 2/2] riscv: Cleanup KASAN_VMALLOC support
In-Reply-To: <20210313084505.16132-3-alex@ghiti.fr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 nylon7@andestech.com, nickhu@andestech.com, aryabinin@virtuozzo.com,
 glider@google.com, dvyukov@google.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, alex@ghiti.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-1a492a0c-049e-495e-8258-7513a4fa967a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_060633_339678_69FD2976 
X-CRM114-Status: GOOD (  25.02  )
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

On Sat, 13 Mar 2021 00:45:05 PST (-0800), alex@ghiti.fr wrote:
> When KASAN vmalloc region is populated, there is no userspace process and
> the page table in use is swapper_pg_dir, so there is no need to read
> SATP. Then we can use the same scheme used by kasan_populate_p*d
> functions to go through the page table, which harmonizes the code.
>
> In addition, make use of set_pgd that goes through all unused page table
> levels, contrary to p*d_populate functions, which makes this function work
> whatever the number of page table levels.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  arch/riscv/mm/kasan_init.c | 59 ++++++++++++--------------------------
>  1 file changed, 18 insertions(+), 41 deletions(-)
>
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index 57bf4ae09361..c16178918239 100644
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
> @@ -155,38 +143,27 @@ static void __init kasan_populate(void *start, void *end)
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
>
>  	local_flush_tlb_all();
>  }

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

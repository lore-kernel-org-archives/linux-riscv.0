Return-Path: <SRS0=mxd0=G2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CBEC433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 03:57:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE4E323B26
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 03:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE4E323B26
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=9J13GulQoz9wfNZcnh5a8M3wqA+mdIPbW5Spa1mgdGo=; b=r+s6lbg0GvVk1DTC/g7nk3hKd
	D2D2sbZF0eG0v1bC6eJCySV55gjZU9YLxdzpN9oZEj1p/Zsq4DoKs2wqNmArH7EnBhWPKGteKvQfW
	jwvfCZFoASYVob1c8lITVkwvZsbPKVm1iG85EL3g/5059cC7beyDCzB1iv1/r3UPlWC/xcoEUusRM
	wetDBr/JAG2Qw0ejq5CTXhRBD492qpXjqthu8iAZiVkXA4t+3BzL/diJX56kHefye+YJup7NTWj6s
	KXF5/ozwsfhzJT40RIs3XscjeMh1bQbKAVYCbnqraU7Z0lhhVOX4vf3GsQLzYdiLgG4i70uVyaf8c
	WghKhYMEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3A2a-0003Y2-Cy; Sat, 23 Jan 2021 03:56:48 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3A2X-0003Xi-6Z
 for linux-riscv@lists.infradead.org; Sat, 23 Jan 2021 03:56:46 +0000
Received: by mail-pj1-x102a.google.com with SMTP id b5so5121693pjl.0
 for <linux-riscv@lists.infradead.org>; Fri, 22 Jan 2021 19:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ZFKvUjQEqDP7dqlPLI+l3jxa5NuIGx5+bmxfTHNs2ZM=;
 b=xk8eS4U00k+Z8ur0NGybpW7vUIoEx6pspc4cIHNb9Ty0wJuHbgD3GVQb/xwh/uiSV8
 8xYi4Wc+933ZmNr2rrDjgiRbLdU0a9APUhC7tDxWH2CRTJvdapyXsip8djw7SJWrnwAa
 fhIZJw7YHNjsHHYB03CY0YPDo3uL0orTFDBNeC/kE8fCqzw3KbIHzm2vede8lzeLV8Xb
 Uia3xl3LIshFXOY83UN4FY+czx6wsL8OtWKF7Dba14uTVMQqck4+giiEfXx+IH1wOCt4
 FqdvrUadniai8La6s/2G3FhSnCbvAh+wUUwTILf6AyRTK9Ld+Q0meX+k/mEEdZ77lDnI
 vN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ZFKvUjQEqDP7dqlPLI+l3jxa5NuIGx5+bmxfTHNs2ZM=;
 b=BoRu8h6t7nhX6VSNKHWW5mu9GS/RYc5ZveCq9/Uq3icOAM06VVeTpfe8AouOYixE3m
 DAng6zWikyKYuTvQl9dA2JPh8rXaNbKUfVI5xM/z1Q0DT5Rn7tRZzRHUynGV/FCxuejp
 Zee5NvBCmI3q2Rr2ANwp4SV0CXNVc5u3ighnvhcwy2QvLdxle6nqzo8T4z2sWx0Fq5Su
 o+QElDg5WeZqiSuoZYLo51BceqNJuAiIdAYOtRpXFKwC0RUmZYVgjxW/8/pO5VyP5VsX
 4xoExZ5umUA+YgrsT3GahfOToJrKtRLipS/9u48Qugs+roWIwUV9IA/4bnpfJpa2Rl0V
 zlsQ==
X-Gm-Message-State: AOAM530+ku18S+Qh2vdYg0num0XeVrZ+C8mn8gWL99hrRkyrEAT8AOv9
 LHRDXXIgAz+BG3TdF6mi8bC6Ew==
X-Google-Smtp-Source: ABdhPJxM9hCcASZqov6JudlqdumnnZI8ha8I3iIJt9EaNAd8HOaEcV8/DV7TrtTgkRmYnRTLu0CAuw==
X-Received: by 2002:a17:902:7596:b029:da:b7a3:cdd0 with SMTP id
 j22-20020a1709027596b02900dab7a3cdd0mr7837480pll.14.1611374202834; 
 Fri, 22 Jan 2021 19:56:42 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c5sm10690982pjo.4.2021.01.22.19.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 19:56:41 -0800 (PST)
Date: Fri, 22 Jan 2021 19:56:41 -0800 (PST)
X-Google-Original-Date: Fri, 22 Jan 2021 19:52:19 PST (-0800)
Subject: Re: [PATCH v2 1/1] riscv/kasan: add KASAN_VMALLOC support
In-Reply-To: <20210116055836.22366-2-nylon7@andestech.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nylon7@andestech.com
Message-ID: <mhng-443fd141-b9a3-4be6-a056-416877f99ea4@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_225645_521073_2397A272 
X-CRM114-Status: GOOD (  23.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, nickhu@andestech.com, alankao@andestech.com,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, nylon7@andestech.com,
 nylon7717@gmail.com, glider@google.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aryabinin@virtuozzo.com,
 linux-riscv@lists.infradead.org, dvyukov@google.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 15 Jan 2021 21:58:35 PST (-0800), nylon7@andestech.com wrote:
> It references to x86/s390 architecture.
>
> So, it doesn't map the early shadow page to cover VMALLOC space.
>
> Prepopulate top level page table for the range that would otherwise be
> empty.
>
> lower levels are filled dynamically upon memory allocation while
> booting.
>
> Signed-off-by: Nylon Chen <nylon7@andestech.com>
> Signed-off-by: Nick Hu <nickhu@andestech.com>
> ---
>  arch/riscv/Kconfig         |  1 +
>  arch/riscv/mm/kasan_init.c | 57 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 57 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 81b76d44725d..15a2c8088bbe 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -57,6 +57,7 @@ config RISCV
>  	select HAVE_ARCH_JUMP_LABEL
>  	select HAVE_ARCH_JUMP_LABEL_RELATIVE
>  	select HAVE_ARCH_KASAN if MMU && 64BIT
> +	select HAVE_ARCH_KASAN_VMALLOC if MMU && 64BIT
>  	select HAVE_ARCH_KGDB
>  	select HAVE_ARCH_KGDB_QXFER_PKT
>  	select HAVE_ARCH_MMAP_RND_BITS if MMU
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index 12ddd1f6bf70..4b9149f963d3 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -9,6 +9,19 @@
>  #include <linux/pgtable.h>
>  #include <asm/tlbflush.h>
>  #include <asm/fixmap.h>
> +#include <asm/pgalloc.h>
> +
> +static __init void *early_alloc(size_t size, int node)
> +{
> +	void *ptr = memblock_alloc_try_nid(size, size,
> +		__pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE, node);
> +
> +	if (!ptr)
> +		panic("%pS: Failed to allocate %zu bytes align=%zx nid=%d from=%llx\n",
> +			__func__, size, size, node, (u64)__pa(MAX_DMA_ADDRESS));
> +
> +	return ptr;
> +}
>
>  extern pgd_t early_pg_dir[PTRS_PER_PGD];
>  asmlinkage void __init kasan_early_init(void)
> @@ -83,6 +96,40 @@ static void __init populate(void *start, void *end)
>  	memset(start, 0, end - start);
>  }
>
> +void __init kasan_shallow_populate(void *start, void *end)
> +{
> +	unsigned long vaddr = (unsigned long)start & PAGE_MASK;
> +	unsigned long vend = PAGE_ALIGN((unsigned long)end);
> +	unsigned long pfn;
> +	int index;
> +	void *p;
> +	pud_t *pud_dir, *pud_k;
> +	pgd_t *pgd_dir, *pgd_k;
> +	p4d_t *p4d_dir, *p4d_k;
> +
> +	while (vaddr < vend) {
> +		index = pgd_index(vaddr);
> +		pfn = csr_read(CSR_SATP) & SATP_PPN;
> +		pgd_dir = (pgd_t *)pfn_to_virt(pfn) + index;
> +		pgd_k = init_mm.pgd + index;
> +		pgd_dir = pgd_offset_k(vaddr);
> +		set_pgd(pgd_dir, *pgd_k);
> +
> +		p4d_dir = p4d_offset(pgd_dir, vaddr);
> +		p4d_k  = p4d_offset(pgd_k, vaddr);
> +
> +		vaddr = (vaddr + PUD_SIZE) & PUD_MASK;
> +		pud_dir = pud_offset(p4d_dir, vaddr);
> +		pud_k = pud_offset(p4d_k, vaddr);
> +
> +		if (pud_present(*pud_dir)) {
> +			p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
> +			pud_populate(&init_mm, pud_dir, p);
> +		}
> +		vaddr += PAGE_SIZE;
> +	}
> +}
> +
>  void __init kasan_init(void)
>  {
>  	phys_addr_t _start, _end;
> @@ -90,7 +137,15 @@ void __init kasan_init(void)
>
>  	kasan_populate_early_shadow((void *)KASAN_SHADOW_START,
>  				    (void *)kasan_mem_to_shadow((void *)
> -								VMALLOC_END));
> +								VMEMMAP_END));
> +	if (IS_ENABLED(CONFIG_KASAN_VMALLOC))
> +		kasan_shallow_populate(
> +			(void *)kasan_mem_to_shadow((void *)VMALLOC_START),
> +			(void *)kasan_mem_to_shadow((void *)VMALLOC_END));
> +	else
> +		kasan_populate_early_shadow(
> +			(void *)kasan_mem_to_shadow((void *)VMALLOC_START),
> +			(void *)kasan_mem_to_shadow((void *)VMALLOC_END));
>
>  	for_each_mem_range(i, &_start, &_end) {
>  		void *start = (void *)_start;

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

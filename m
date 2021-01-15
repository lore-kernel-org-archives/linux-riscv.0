Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC66CC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 02:24:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 408FF22BEA
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 02:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 408FF22BEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=U3DMtpzXAxP4jli15gT3fiCuhH3ycIA6ZTJZNvocqLA=; b=SoZij5hzaGQJo6rqsjXdkwO54
	z2Kzi7xi64LmtpbZTCBCM/rpCfO7lyUnzICCh25KKO0STFac3sAkZ9ofNrl59ylAKIJwAcF8s0FBQ
	0P3zhyL2ool+rjNbLvkChXUsKIf6KkBfMs0UJwibU1M8ey6/kXarJfaVXAkHfsnNRqVhETDMzN/L1
	ITfmY+IHbMRym/b30nLGemLwVzut3cDHiii0Y3zj8MUQzhJ7c+Nk99jXMkPotWvoMOzyAoWizjOw7
	51fXA4sqtv0YIw8jVK6MZLlWBQVOH8hDwHKDM7A+1TPgCvHOReSKHYmR5RJSDLehwxSBEGNB/SB8d
	zw7EqJkug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Emp-00089h-BQ; Fri, 15 Jan 2021 02:24:27 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Emm-000894-S3
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 02:24:25 +0000
Received: by mail-pl1-x630.google.com with SMTP id y8so3923230plp.8
 for <linux-riscv@lists.infradead.org>; Thu, 14 Jan 2021 18:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Cu1r4kHEpk1ipx1WHIOmDfUVLP4Os78haqvXs5XVFiU=;
 b=Zud2h77QBS795wG6yXJKYrE+EwcIZRELGrnX5yhmhtv4zDM0D/nOUTiAvTXeVP2sIO
 L/GSnmxhC8D6JQ6YgphQ4pJjFpxOQa4SyVKkuilYcZlfavsyfqtFjm8plUrNEuW4slPm
 /x528V9+0E7RU2i4JTSfp5f7gF2I1kCLUoqRjVWM0+kgzVnNnAt83iWDiO+sSUZVSbT4
 Qg8dFew5Ph4PFw+zlDZKoZYpypd2Gf8TCDH/GUMIocKwriLl+Aodh9Fu7wl+/wjEjVmG
 RNq7gTt489xXkC1FjodlAIF7iZ5Y5FjQq3VYhMFsFsiClZau/uySQ4uVQMw6vaoLRQXq
 7v4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Cu1r4kHEpk1ipx1WHIOmDfUVLP4Os78haqvXs5XVFiU=;
 b=DbAQKVH8++71Ag3M/FBLqH9o37jy7bdKD/y5py0tIdBAoHTdsaBgcMLz4Az6/vwN+7
 Nl9yWWMIBqtRcVr02VEfYzfZUDGu28fdwQNeo185gtT71qXRtBX0ur1Crhb35uXdnHb3
 79tehsIKM10ow15jWiZDi5DhNRhScC3mSQFErkRMefKxWVwonFfXFlqd63cU9UHrWDAq
 xn6g8M0UWy1K7Sql0LTIG/KB1I1ODGXlS6SuWxpz6m1rQzsftf+YrPZjiztWY5Yqa4wm
 l9rVxZsjqqoFFXc6y5oAzwKyFvVF0Qq4EhQB/bYIgPx216D8wB9RBQXrNgQaOs6sBfar
 T8Kw==
X-Gm-Message-State: AOAM530JM2ulFJ/nG+gIhdWgshzXar/EgHFdF6P+hoXFIG4keE2HdgY7
 23Kq/l1vVokgHz5OGd3eooX236Dmk/oWqPZu
X-Google-Smtp-Source: ABdhPJwZH1E+fKAbcid8dzJLVB3v/Csakmz5hxoyrQbsXKM3WODJcZDSzmxxQFad2rYO5A2oXoftYA==
X-Received: by 2002:a17:90b:a47:: with SMTP id gw7mr8102445pjb.1.1610677462419; 
 Thu, 14 Jan 2021 18:24:22 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x12sm6401588pfj.25.2021.01.14.18.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 18:24:21 -0800 (PST)
Date: Thu, 14 Jan 2021 18:24:21 -0800 (PST)
X-Google-Original-Date: Thu, 14 Jan 2021 18:24:20 PST (-0800)
Subject: Re: [PATCH 1/1] riscv/kasan: add KASAN_VMALLOC support
In-Reply-To: <20210113022822.9230-2-nylon7@andestech.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nylon7@andestech.com
Message-ID: <mhng-681abd1f-506e-4e1a-88e7-f48af7e6cc0e@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_212424_922793_38E75ED6 
X-CRM114-Status: GOOD (  24.34  )
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

On Tue, 12 Jan 2021 18:28:22 PST (-0800), nylon7@andestech.com wrote:
> It's reference x86/s390 architecture.
>
> So, it's don't map the early shadow page to cover VMALLOC space.
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
>  arch/riscv/mm/kasan_init.c | 66 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 66 insertions(+), 1 deletion(-)
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
> index 12ddd1f6bf70..ee332513d728 100644
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
> +        void *ptr = memblock_alloc_try_nid(size, size,
> +                        __pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE, node);
> +
> +        if (!ptr)
> +                panic("%pS: Failed to allocate %zu bytes align=%zx nid=%d from=%llx\n",
> +                      __func__, size, size, node, (u64)__pa(MAX_DMA_ADDRESS));
> +
> +        return ptr;
> +}
>
>  extern pgd_t early_pg_dir[PTRS_PER_PGD];
>  asmlinkage void __init kasan_early_init(void)
> @@ -83,6 +96,49 @@ static void __init populate(void *start, void *end)
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
> +	pmd_t *pmd_dir, *pmd_k;
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
> +		p4d_k  = p4d_offset(pgd_k,vaddr);
> +
> +		vaddr = (vaddr + PUD_SIZE) & PUD_MASK;
> +		pud_dir = pud_offset(p4d_dir, vaddr);
> +		pud_k = pud_offset(p4d_k,vaddr);
> +
> +		if (pud_present(*pud_dir)) {
> +			p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
> +			pud_populate(&init_mm, pud_dir, p);
> +		}
> +
> +		pmd_dir = pmd_offset(pud_dir, vaddr);
> +		pmd_k = pmd_offset(pud_k,vaddr);
> +		set_pmd(pmd_dir, *pmd_k);
> +		if (pmd_present(*pmd_dir)) {
> +			p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
> +			pmd_populate(&init_mm, pmd_dir, p);
> +		}
> +		vaddr += PAGE_SIZE;
> +	}
> +}
> +
>  void __init kasan_init(void)
>  {
>  	phys_addr_t _start, _end;
> @@ -90,7 +146,15 @@ void __init kasan_init(void)
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

There are a bunch of checkpatch issues here.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

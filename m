Return-Path: <SRS0=zqIG=BO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B863DC433DF
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2020 13:53:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB932086A
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2020 13:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bytTu5yW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="jumdjySC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DB932086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3HMJzfx0hiRaDbrGzs+VF1QZ512RWLzKWgPx16Zjomo=; b=bytTu5yWdswWNorLKgp7Lzej6
	pSMhNHFK4zKKZIxG8QwhMZFR3Epq+gg6ax+nSa9k3hBRJbZ48/FKJ/2d82diIdz8Om+gdXKxLV94m
	QIVYHVgJyUaaeKXqLbdo6l3rENCmE4YCmDuolI1oXoADQS0r9W8Ho5HV9L+nVNS4LH+EJPwT1gK9E
	MvGPI8dqobJBgNlXEp4zwoMOs5nKQBPLH5lqI7ttcAB10rJufmHufy56rGp+IDsPrgm2NSiA3EaeF
	fEdZXV8mWjOM1VYMEx3+4PLOAv9AtTpN7MLYLVjsGz4aZgK2qkpR21w48eTNzCmcb69YW8UKR0A2E
	/QPUCgDnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2xNg-0000CL-Vp; Tue, 04 Aug 2020 13:53:29 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2xNc-0000AJ-8m
 for linux-riscv@lists.infradead.org; Tue, 04 Aug 2020 13:53:25 +0000
Received: by mail-pg1-x543.google.com with SMTP id g33so4744232pgb.4
 for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2020 06:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=nig2/fJdYyt3b0Q5A/SU+0msFseeyybXCaAI4dDRdTg=;
 b=jumdjySCSXZVJzizm9OUzoU9OXCS+Cfq57D4M9+nOmcjFx/ImlUYxx8bn1JnW+143W
 B6tMiLN9WKIVbxAyKxyw81HdIULr1/GZN+VKaYR0TvHVg/4jcAFDj42GWXCA2Swm1Yfw
 5v27iYJTlRgBYWmLp+/HqtnWpSjejedeiZ1fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=nig2/fJdYyt3b0Q5A/SU+0msFseeyybXCaAI4dDRdTg=;
 b=LdRll5v669Om5qzNvae8G79gSJAqG1hmMBHSy306vWr+v4X2U5QV0Kpm51w05E2/Th
 5lDXp8iyf+/ptqKlpmb+G1rOCy3orZtcvE9gDQXPOCQvzbWKR7I+QNnRL7065a/wRSWd
 zewTvu82tbsEisLFYSOS6j4duR/pBNzZYk0/miJOh8YWT4N/CUEF4ePJ0PYpci0CFadR
 4epj3H3uXxE3pNVWbN5UqY1GegLV/38kmg2Z4wdawZX9BJDiqJODmeVZo86pNu0S9fgZ
 9UZWkws9UfPXxD2AAXagwIXiGdtCCo9HSkmZBYoeXTFpMC5s52jO0FilCScw5J4PGLYk
 u+Ag==
X-Gm-Message-State: AOAM5321n4+m+Dhs2qZvTdKWnZAMC/n4Snwwmfpxbf28v6a8Q3PwiP53
 3rQOdlSvqKblj8IRgFx9zdBvUQ==
X-Google-Smtp-Source: ABdhPJzULAmNSkaX32weXl1O34te5NSuX9EJVhPlxbPjsXptEZqiJedi5i9MSO/avpj2cLsHaUiFtw==
X-Received: by 2002:a63:3587:: with SMTP id
 c129mr20025647pga.322.1596549199803; 
 Tue, 04 Aug 2020 06:53:19 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-0414-2e33-60ed-75ec.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:414:2e33:60ed:75ec])
 by smtp.gmail.com with ESMTPSA id g8sm9981404pfo.132.2020.08.04.06.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 06:53:19 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 01/17] KVM: PPC: Book3S HV: simplify kvm_cma_reserve()
In-Reply-To: <20200802163601.8189-2-rppt@kernel.org>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-2-rppt@kernel.org>
Date: Tue, 04 Aug 2020 23:53:15 +1000
Message-ID: <87tuxio6us.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_095324_373641_D104181A 
X-CRM114-Status: GOOD (  24.19  )
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Mike,

>
> The memory size calculation in kvm_cma_reserve() traverses memblock.memory
> rather than simply call memblock_phys_mem_size(). The comment in that
> function suggests that at some point there should have been call to
> memblock_analyze() before memblock_phys_mem_size() could be used.
> As of now, there is no memblock_analyze() at all and
> memblock_phys_mem_size() can be used as soon as cold-plug memory is
> registerd with memblock.
>
> Replace loop over memblock.memory with a call to memblock_phys_mem_size().
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_builtin.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
> index 7cd3cf3d366b..56ab0d28de2a 100644
> --- a/arch/powerpc/kvm/book3s_hv_builtin.c
> +++ b/arch/powerpc/kvm/book3s_hv_builtin.c
> @@ -95,22 +95,15 @@ EXPORT_SYMBOL_GPL(kvm_free_hpt_cma);
>  void __init kvm_cma_reserve(void)
>  {
>  	unsigned long align_size;
> -	struct memblock_region *reg;
> -	phys_addr_t selected_size = 0;
> +	phys_addr_t selected_size;
>  
>  	/*
>  	 * We need CMA reservation only when we are in HV mode
>  	 */
>  	if (!cpu_has_feature(CPU_FTR_HVMODE))
>  		return;
> -	/*
> -	 * We cannot use memblock_phys_mem_size() here, because
> -	 * memblock_analyze() has not been called yet.
> -	 */
> -	for_each_memblock(memory, reg)
> -		selected_size += memblock_region_memory_end_pfn(reg) -
> -				 memblock_region_memory_base_pfn(reg);
>  
> +	selected_size = PHYS_PFN(memblock_phys_mem_size());
>  	selected_size = (selected_size * kvm_cma_resv_ratio / 100) << PAGE_SHIFT;

I think this is correct, but PHYS_PFN does x >> PAGE_SHIFT and then the
next line does x << PAGE_SHIFT, so I think we could combine those two
lines as:

selected_size = PAGE_ALIGN(memblock_phys_mem_size() * kvm_cma_resv_ratio / 100);

(I think that might technically change it from aligning down to aligning
up but I don't think 1 page matters here.)

Kind regards,
Daniel


>  	if (selected_size) {
>  		pr_debug("%s: reserving %ld MiB for global area\n", __func__,
> -- 
> 2.26.2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

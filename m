Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A502C2D0A3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 08:01:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85460206D4
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 08:01:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yR+/KSKr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="u0xJczYU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85460206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=PVvlUE8RkICJD9Mq3hoaJ5OND1Hm3r08bhIx2Ovs+bU=; b=yR+/KSKrJ4wY0q4IjmuqY57fH
	mH42j5AaHBYl4F7VcZHkyhL1rAy4DXVFdFekOGJWVloZr59p79J7S5GSdbpFKPulZ6LCrix2Szr/E
	r98jhR2YrBXxQIJcJrE9i0W2qQxx+fYVAmzvLsGrgD0Q3cEjIoJKmi4NCHmPYGhKr8M3jqnMTRtrE
	L4Mu5MqID1lrRgFpDar8bmP51q74KeFeHUvVMDtxwZBzFjONOCc2iFPkWHt/4Bd98FPMoZlz9AEG/
	ShoRfMyw1dEAz6hxvJfB6qfdV6bJxucvjBKBmw3mCBvi19jgi+87pip8jjFeUqQg4clx7RAw1uVa5
	R/mwzx+zA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kawg7-0006yW-1W; Fri, 06 Nov 2020 08:00:59 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kawg3-0006xm-UT
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 08:00:56 +0000
Received: by mail-pf1-x443.google.com with SMTP id g7so596632pfc.2
 for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2020 00:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=mXeLUnql0ZAHlwxfedR6V6JITpiJkpyK91YsFFWk1zo=;
 b=u0xJczYU1FnZOue8y5WE6Fjzr1YBmmSh08FLHnknlmv6Hh9VdFUkRJFtHJdeFvWGht
 iOqHOdhuxM/9pC2wVoIykUFsasxA89vUF/WomsFeS6qCNaZxdYg6CFEaw9/KlXheuCeV
 IIUNVH9ThhU+FUN3mIzVp452Kq1DAOFjrThC2ilEj6ihU4s9uQXniz5sTkub1G+AegOi
 XgnqD3QQ0Co9R1z0iw2cthC/7HXvYKr6TMvPrPCsNoDLph1PW4Gh8NuieatPHqGrOkF4
 Ck336IUEHVPFibsKqmge/qkuDjGDKxjy74WSItMld7+HbuwjjJK+Sz56EDLRN0Ye30WA
 ic7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=mXeLUnql0ZAHlwxfedR6V6JITpiJkpyK91YsFFWk1zo=;
 b=Y59dfFJBQ5YXEQCUYkeuEGuclYRQXBIUWmrcmuMJbDS2IgOuHDRBAEYg7e+s8+Xc6s
 vJj70GmfyQaFl+l2rsycJUmeFyjMHkZJHgcae/pClYiAUL2qHP3T5GfuPjLId27dZTvs
 FI0tW1i+0yREoA94b40mPE/HSBGAN8bIojp22nb5vNPUZLCxsvCQmvSL7zkxUgo1Aaex
 kGYH500Yhi1mCXyqLw986S3fsmfdWs0wKQufZz0q3lLt26VVmsPCD+UPYYNQ5w0Ny/KY
 +vjyzyRx5NtCYtdT8QCekRVczV0xphRppSKjHTfCGA64sVZ1g6kdeES1RZrOsbxx6Xfz
 /mKg==
X-Gm-Message-State: AOAM531uD/JptvSbQH8oTu824Ji2/pSYFL8yY8Is4cM7kGQvbs9dKsp8
 gE93iJLfZoBQ2VV8D2mgCTvCqg==
X-Google-Smtp-Source: ABdhPJw2jK5zQpZpSMduu0uslivHEYxwN4qwvLP8XRn/fbP7T1NuycqzFnrGc5htmCqhn0HKR7cdMg==
X-Received: by 2002:a63:e208:: with SMTP id q8mr749210pgh.181.1604649653735;
 Fri, 06 Nov 2020 00:00:53 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y8sm782655pge.22.2020.11.06.00.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 00:00:52 -0800 (PST)
Date: Fri, 06 Nov 2020 00:00:52 -0800 (PST)
X-Google-Original-Date: Fri, 06 Nov 2020 00:00:50 PST (-0800)
Subject: Re: [PATCH] RISC-V: Use non-PGD mappings for early DTB access
In-Reply-To: <20201104063713.3039035-1-anup.patel@wdc.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-78d4f2c3-0a0a-4264-9578-72ed0babbf1b@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_030056_008478_97FF09B6 
X-CRM114-Status: GOOD (  23.01  )
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
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 03 Nov 2020 22:37:13 PST (-0800), Anup Patel wrote:
> Currently, we use PGD mappings for early DTB mapping in early_pgd
> but this breaks Linux kernel on SiFive Unleashed because on SiFive
> Unleashed PMP checks don't work correctly for PGD mappings.
>
> To fix early DTB mappings on SiFive Unleashed, we use non-PGD
> mappings (i.e. PMD) for early DTB access.
>
> Fixes: 8f3a2b4a96dc ("RISC-V: Move DT mapping outof fixmap")
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/mm/init.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index ea933b789a88..0d13d0c36a7d 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -297,6 +297,7 @@ pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
>  #define NUM_EARLY_PMDS		(1UL + MAX_EARLY_MAPPING_SIZE / PGDIR_SIZE)
>  #endif
>  pmd_t early_pmd[PTRS_PER_PMD * NUM_EARLY_PMDS] __initdata __aligned(PAGE_SIZE);
> +pmd_t early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
>
>  static pmd_t *__init get_pmd_virt_early(phys_addr_t pa)
>  {
> @@ -494,6 +495,18 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  				   load_pa + (va - PAGE_OFFSET),
>  				   map_size, PAGE_KERNEL_EXEC);
>
> +#ifndef __PAGETABLE_PMD_FOLDED
> +	/* Setup early PMD for DTB */
> +	create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
> +			   (uintptr_t)early_dtb_pmd, PGDIR_SIZE, PAGE_TABLE);
> +	/* Create two consecutive PMD mappings for FDT early scan */
> +	pa = dtb_pa & ~(PMD_SIZE - 1);
> +	create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA,
> +			   pa, PMD_SIZE, PAGE_KERNEL);
> +	create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA + PMD_SIZE,
> +			   pa + PMD_SIZE, PMD_SIZE, PAGE_KERNEL);
> +	dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PMD_SIZE - 1));
> +#else
>  	/* Create two consecutive PGD mappings for FDT early scan */
>  	pa = dtb_pa & ~(PGDIR_SIZE - 1);
>  	create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
> @@ -501,6 +514,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  	create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA + PGDIR_SIZE,
>  			   pa + PGDIR_SIZE, PGDIR_SIZE, PAGE_KERNEL);
>  	dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PGDIR_SIZE - 1));
> +#endif
>  	dtb_early_pa = dtb_pa;
>
>  	/*

We're starting to build up a handful of workarounds for these sorts of things.
The PMP trap vs WARL one was the last I could remember, but that's a bit
different as both of those behaviors were allowed by specifications at some
point.  IIRC there were also some TLB shootdown issues floating

The best I can come up with is to add both some sort of "minimum support
specification version" Kconfig entry and an "quirks" set of Kconfig entries.
That would allow us to gradually jettison old ISAs as well as more cleanly add
support for broken hardware like this.

Do you have a pointer to some datasheet type document that describes the issue?
That'd probably be the line I'd like to draw for adding workarounds like this,
as otherwise we can't really be sure something is a hardware issue.

That said, it's better to have the fix so this is on fixes.  I'll try to
remember it for the list of workarounds.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

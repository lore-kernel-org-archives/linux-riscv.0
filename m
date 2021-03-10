Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F543C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 02:20:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A913664F38
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 02:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A913664F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=RyDC0yFd4GSHulLXQqBINBhnGpWcGwHkqoAXwGH5bSM=; b=UW8oOWCr2YT8e8WfmGQ9rm/d0
	986FERcd4AyZKRYs/EsBBOj+tMC1aH7ReMj1xu5nwUGJgJSRK59iEgqGUH3HhqY9YjcWfq3oqI+2d
	tHcHuGVRnpwHncFb24E4yRsSZfkT0uCrgKysguig6it1CZJrqkdi/je0kvPsLw9/zejLpaufo54OQ
	Vl+TbGPlUfsE3E10NkI3PGhzZU5cF5aahX05Wfk64kZAD6Sx+qeDscm8DyPWLPuuxxDxSCSLUb49l
	I1gOYt245uoitqYVoSTI8bJUeefOpsf0E80HiDr7HR+3HaUHYHZuRCllFt+dq+Hf8gK/K9rrhO6Ta
	MwjzVT2YQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJoSD-005nY6-Vn; Wed, 10 Mar 2021 02:20:06 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJoS1-005nVf-ER
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 02:19:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id 30so3148320ple.4
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 18:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+givEOuiLHPzWZrlbh97HG5Li5XouFn18Xz/5dlWNAI=;
 b=vkx9cI/3oWavvPhiESIjYoy4mIIZxsj9PVeXI8oJjDnh31BghSpiALZfpMJeptM1Lm
 Y4PfFHYGeINm3wzWKWwLAukW0yKrZT4lfB49XL0cSHvhJGJ8FT1ivHaAzjWB9+75o7l1
 zpS7zaoZfkLuDkNG34e025x7CKbQ5Zl7C1cnwuPAgnP1wXYUZRAhitOYOP3XjvrRQmSd
 /UVG0sVpKxkMHerU2hTAXZUnC1AN14h2Q2X35PmpYiHi5FjguZHMrhWqnsKo9/e5Tucd
 NN5kvXW4/yWCUWu22Bw9T9THQdfGiRUW+ROvFRoChaVaKLRNQx0chC0cMgisXLjRIrMV
 loWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+givEOuiLHPzWZrlbh97HG5Li5XouFn18Xz/5dlWNAI=;
 b=iWNK+6xUrDRxxYJ2UULtXJwgY6ZZdtLWoa6MB6mT04btsmlpoOCqtPSQ1KwsaK4XPU
 RBaY8nRfLmbItvnGlvg+Vchh2kddngK0srsjXLjLEbxNsEYy5GCIEU+QTJUex7mrDUfi
 6PESOCdp00yoxKVYoHoCnx8an7mKTHlsWmtIGbBzgrI6d3c/Fq57Tz1PUprKzQF0zmzT
 bRKoOEFBsH9uzcD0tARx5hSGb672qaPwQLj/v3fYw/N/Zdmx8V4BA4XtX8IrDVmvtSAp
 woMq+XShLz9yVaFp74RHJsJhOEKhOm7jqj82onC3oju2VVEVpPiKq/+53pVLlBSN9c5u
 r0bg==
X-Gm-Message-State: AOAM532N993IEFNfAFHqygBIk2VVinPO0fYGij34VmKIaSRJWDnwpUfI
 NcxMkOABM1rgM7GXtOWr3VeCHglYi2lwHg==
X-Google-Smtp-Source: ABdhPJwXg6Z/qgI5mz4c3oj0IF7foNdJx45Ihy+IOCZKlSnXIphq5+P2dctxlRZA6Ub1OeprCq2hmA==
X-Received: by 2002:a17:90b:92:: with SMTP id
 bb18mr1015391pjb.40.1615342787918; 
 Tue, 09 Mar 2021 18:19:47 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id p17sm4065464pjv.49.2021.03.09.18.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 18:19:47 -0800 (PST)
Date: Tue, 09 Mar 2021 18:19:47 -0800 (PST)
X-Google-Original-Date: Tue, 09 Mar 2021 18:11:17 PST (-0800)
Subject: Re: [PATCH next] riscv: Add support for memtest
In-Reply-To: <20210225065417.76373-1-wangkefeng.wang@huawei.com>
CC: linux-riscv@lists.infradead.org, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, wangkefeng.wang@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-5f8bd266-a90b-4884-9605-ffe7cd1fbb04@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_021955_589518_891836B6 
X-CRM114-Status: GOOD (  21.63  )
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

On Wed, 24 Feb 2021 22:54:17 PST (-0800), wangkefeng.wang@huawei.com wrote:
> The riscv [rv32_]defconfig enabled CONFIG_MEMTEST,
> but memtest feature is not supported in RISCV.
>
> Add early_memtest() to support for memtest.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  arch/riscv/mm/init.c                            | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 04545725f187..20447b531630 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2794,7 +2794,7 @@
>  			seconds.  Use this parameter to check at some
>  			other rate.  0 disables periodic checking.
>
> -	memtest=	[KNL,X86,ARM,PPC] Enable memtest
> +	memtest=	[KNL,X86,ARM,PPC,RISCV] Enable memtest
>  			Format: <integer>
>  			default : 0 <disable>
>  			Specifies the number of memtest passes to be
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 067583ab1bd7..7f5036fbee8c 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -128,8 +128,9 @@ void __init setup_bootmem(void)
>  	if (max_mapped_addr == (dram_end - 1))
>  		memblock_set_current_limit(max_mapped_addr - 4096);
>
> -	max_pfn = PFN_DOWN(dram_end);
> -	max_low_pfn = max_pfn;
> +	min_low_pfn = PFN_UP(memblock_start_of_DRAM());
> +	max_low_pfn = max_pfn = PFN_DOWN(dram_end);
> +
>  	dma32_phys_limit = min(4UL * SZ_1G, (unsigned long)PFN_PHYS(max_low_pfn));
>  	set_max_mapnr(max_low_pfn - ARCH_PFN_OFFSET);
>
> @@ -593,6 +594,7 @@ void __init paging_init(void)
>
>  void __init misc_mem_init(void)
>  {
> +	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
>  	arch_numa_init();
>  	sparse_init();
>  	zone_sizes_init();

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

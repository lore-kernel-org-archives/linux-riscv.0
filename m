Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE3CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 19:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=W3N3yVDJG4TtKeeRobU/tuNaS3XjUTs6XhrburpIlO0=; b=d1sgu6gS2KiCqq89rUH2ZLe9FL
	8Zzk4Qe9/VtIkzIiLBv6LjSwBCtGrg21RWeuAtZVRvoxRrta50BX+W9jo3phAqOjsGBl4RFXL3O9R
	WCgbQFVp9untfgjSNKOeb/YkPJbvOCQ5jhZ/6304fspqU+6J36SQG9C+BHJ2iRjGpGARxIKa8x7ME
	Xad9gqgyeIR0I/+MUmU3DkG1cbRwwnhZYQTIqeKpoR7pIpicVFtNQcH2eAGUzsm0E0NI31L355Cmh
	1IbacqP1z1wy86ovx6aPJBdojYz6NHe3jvxf7nzf9R5TEsv3KXzeS/Hecsz8Q06clVfQJbNHlNAGB
	zWU+ZEoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3MB0-008zqF-J2; Thu, 08 Dec 2022 19:03:22 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3MAw-008zbd-P5
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:03:21 +0000
Received: by mail-pl1-x62a.google.com with SMTP id jl24so2421848plb.8
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJirtvpfmZs6MdvQ6r4d0enX5SIcriclNMIRiWoyO5M=;
        b=A7gYTfEh9InrMuqY0KmRKCn9zsZyp5mYG0N/oCXTAFB+tcru1Hm4Ze36mTnuI+G+Iv
         DrHwB0LXVh+4u/CS3nsGGb7YWSONGwBy31SemY1tOWajeD8TcInDMhDzYNyBFJj1uH5n
         onXkw5L1kQBh5oE21aAaDkIZsJ8KLqBHxG+Ha0dcMfEgw9w+a5Lc+kc7v84LM0DxLSQG
         gAwB0hk0tWcoGiXVcyS4kXWqVcGd5i8OWYoISM49RTBJZo5fco21IzURvuFNxOCzMa2T
         QScwttmwOC5+e/dO6MK/tK+3I/Vu66lMaNtHfB7vDPrSjCAVjWlrm5OA9hpweS9AU8Cr
         pryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJirtvpfmZs6MdvQ6r4d0enX5SIcriclNMIRiWoyO5M=;
        b=o0IKAo4RT6bgEE5i1CAKOJuJfjWqszG2t8EVRG2t44P7pUdlaR3iobuRyB3Kuuicwq
         jLRaAZMRvY1xFp0QiR0rRnRDUrxoE5OvgQjLagEtII6lQGcTu5nIWOLEO5WsO9+C3Pcx
         +pMpyLNmCAYset2jtJtnaPROfZmGWTdTYg0W93lcQ92MXUjlBgjAl7aKeNLXlI2xqd4R
         Gxdu1LxD8fIlIBLYDh79welEtBJHeNnlD+D2GEgi7pdeg6htGLNKvG3THywhkT7ev4+z
         +Uvo9KDJAATa247jT0PJMP4uR1dpgtc27o2rLS5n2WupkVjncxGyM1x9QxjAYc7VYWz+
         ZWWA==
X-Gm-Message-State: ANoB5pnjGpTbkuNzgXM6hCmKU9s1sOUy8x/wX68ggVn0fFTJbWZWktxU
	nwbeuKdkFPwNuglDIndIX/LbGQ==
X-Google-Smtp-Source: AA0mqf5QMq87FnL4g2q+WDSYPbfjMneCKJNrX3zLUbFXZiNdWqDw4Dbx4PVhSddTA4mmPt+Ufi7y2A==
X-Received: by 2002:a17:90b:710:b0:20a:2547:907 with SMTP id s16-20020a17090b071000b0020a25470907mr110487259pjz.37.1670526195845;
        Thu, 08 Dec 2022 11:03:15 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id x10-20020aa7940a000000b005775c52dbc4sm4188910pfo.167.2022.12.08.11.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 11:03:15 -0800 (PST)
Date: Thu, 08 Dec 2022 11:03:15 -0800 (PST)
X-Google-Original-Date: Thu, 08 Dec 2022 11:03:02 PST (-0800)
Subject: Re: [RFC PATCH v2 2/2] riscv: mm: use svinval instructions instead of sfence.vma
In-Reply-To: <20220424090216.21887-3-mchitale@ventanamicro.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  mchitale@ventanamicro.com, atishp@atishpatra.org, anup@brainfault.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mchitale@ventanamicro.com
Message-ID: <mhng-e412fcd3-7d5f-4c13-97d5-311b00e59b3f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_110319_104759_5CD660EC 
X-CRM114-Status: GOOD (  36.09  )
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

On Sun, 24 Apr 2022 02:02:16 PDT (-0700), mchitale@ventanamicro.com wrote:
> When svinval is supported the local_flush_tlb_page*
> functions would prefer to use the following sequence
> to optimize the tlb flushes instead of a simple sfence.vma:
>
> sfence.w.inval
> svinval.vma
>   .
>   .
> svinval.vma
> sfence.inval.ir
>
> The maximum number of consecutive svinval.vma instructions
> that can be executed in local_flush_tlb_page* functions is
> limited to PTRS_PER_PTE. This is required to avoid soft
> lockups and the approach is similar to that used in arm64.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  arch/riscv/include/asm/tlbflush.h |  12 ++++
>  arch/riscv/kernel/setup.c         |   1 +
>  arch/riscv/mm/tlbflush.c          | 116 ++++++++++++++++++++++++++++--
>  3 files changed, 123 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 801019381dea..b535467c99f0 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -22,6 +22,18 @@ static inline void local_flush_tlb_page(unsigned long addr)
>  {
>  	ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
>  }
> +
> +void riscv_tlbflush_init(void);
> +void __riscv_sfence_w_inval(void);
> +void __riscv_sfence_inval_ir(void);
> +void __riscv_sinval_vma(unsigned long addr);
> +void __riscv_sinval_vma_asid(unsigned long addr, unsigned long asid);
> +
> +/* Check if we can use sinval for tlb flush */
> +DECLARE_STATIC_KEY_FALSE(riscv_flush_tlb_svinval);
> +#define riscv_use_flush_tlb_svinval() \
> +	static_branch_unlikely(&riscv_flush_tlb_svinval)
> +
>  #else /* CONFIG_MMU */
>  #define local_flush_tlb_all()			do { } while (0)
>  #define local_flush_tlb_page(addr)		do { } while (0)
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 834eb652a7b9..13de04259de9 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -295,6 +295,7 @@ void __init setup_arch(char **cmdline_p)
>  #endif
>
>  	riscv_fill_hwcap();
> +	riscv_tlbflush_init();
>  }
>
>  static int __init topology_init(void)
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 27a7db8eb2c4..800953f9121e 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -1,11 +1,14 @@
>  // SPDX-License-Identifier: GPL-2.0
>
> +#define pr_fmt(fmt) "riscv: " fmt
>  #include <linux/mm.h>
>  #include <linux/smp.h>
>  #include <linux/sched.h>
>  #include <asm/sbi.h>
>  #include <asm/mmu_context.h>
>
> +static unsigned long tlb_flush_all_threshold __read_mostly = PTRS_PER_PTE;
> +
>  static inline void local_flush_tlb_all_asid(unsigned long asid)
>  {
>  	__asm__ __volatile__ ("sfence.vma x0, %0"
> @@ -23,22 +26,110 @@ static inline void local_flush_tlb_page_asid(unsigned long addr,
>  			: "memory");
>  }
>
> +static inline void riscv_sfence_inval_ir(void)
> +{
> +	/*
> +	 * SFENCE.INVAL.IR
> +	 * 0001100 00001 00000 000 00000 1110011
> +	 */
> +	asm volatile (".word 0x18100073" ::: "memory");
> +}
> +
> +static inline void riscv_sfence_w_inval(void)
> +{
> +	/*
> +	 * SFENCE.W.INVAL
> +	 * 0001100 00000 00000 000 00000 1110011
> +	 */
> +	asm volatile (".word 0x18000073" ::: "memory");
> +}
> +
> +static inline void riscv_sinval_vma_asid(unsigned long vma, unsigned long asid)
> +{
> +	/*
> +	 * rs1 = a0 (VMA)
> +	 * rs2 = a1 (asid)
> +	 * SINVAL.VMA a0, a1
> +	 * 0001011 01011 01010 000 00000 1110011
> +	 */
> +	asm volatile ("srli a0, %0, 2\n"
> +			"add a1, %1, zero\n"
> +			".word 0x16B50073\n"
> +			:: "r" (vma), "r" (asid)
> +			: "a0", "a1", "memory");
> +}
> +
> +static inline void riscv_sinval_vma(unsigned long vma)
> +{
> +	/*
> +	 * rs1 = a0 (VMA)
> +	 * rs2 = 0
> +	 * SINVAL.VMA a0
> +	 * 0001011 00000 01010 000 00000 1110011
> +	 */
> +	asm volatile ("srli a0, %0, 2\n"
> +			".word 0x16050073\n"
> +			:: "r" (vma) : "a0", "memory");
> +}
> +
>  static inline void local_flush_tlb_range(unsigned long start,
>  		unsigned long size, unsigned long stride)
>  {
> -	if (size <= stride)
> -		local_flush_tlb_page(start);
> -	else
> +	if ((size / stride) <= tlb_flush_all_threshold) {
> +		if (riscv_use_flush_tlb_svinval()) {
> +			riscv_sfence_w_inval();
> +			while (size) {
> +				riscv_sinval_vma(start);
> +				start += stride;
> +				if (size > stride)
> +					size -= stride;
> +				else
> +					size = 0;
> +			}
> +			riscv_sfence_inval_ir();
> +		} else {
> +			while (size) {
> +				local_flush_tlb_page(start);
> +				start += stride;
> +				if (size > stride)
> +					size -= stride;
> +				else
> +					size = 0;
> +			}
> +		}
> +	} else {
>  		local_flush_tlb_all();
> +	}
>  }
>
>  static inline void local_flush_tlb_range_asid(unsigned long start,
>  		unsigned long size, unsigned long stride, unsigned long asid)
>  {
> -	if (size <= stride)
> -		local_flush_tlb_page_asid(start, asid);
> -	else
> +	if ((size / stride) <= tlb_flush_all_threshold) {
> +		if (riscv_use_flush_tlb_svinval()) {
> +			riscv_sfence_w_inval();
> +			while (size) {
> +				riscv_sinval_vma_asid(start, asid);
> +				start += stride;
> +				if (size > stride)
> +					size -= stride;
> +				else
> +					size = 0;
> +			}
> +			riscv_sfence_inval_ir();
> +		} else {
> +			while (size) {
> +				local_flush_tlb_page_asid(start, asid);
> +				start += stride;
> +				if (size > stride)
> +					size -= stride;
> +				else
> +					size = 0;
> +			}
> +		}
> +	} else {
>  		local_flush_tlb_all_asid(asid);
> +	}

Sorry to dig up an old post, but svinval came up and I started looking 
at this again.

There's some other issues with the code, but at a higher level it's not 
really clear this is a useful thing to do: splitting up sfence.vma makes 
sense, but if there's no operations between the sfence.w.inval and 
sinval.vma (or sinval.vma and sfence.inval.ir) then we're not giving the 
HW anything else to do concurrently with the flushes and thus I don't 
see how this would improve performance -- if anything we're just 
emitting more instructions to do the samething, which would be bad for 
performance.

So I think if we're going to use these we really need to also split up 
the TLB flush operations, so we can give something for the HW to do 
currently with the flushing.  That's be a pretty big change to our TLB 
model, though: essentially we're going from two phases (write the page 
tables, then flush) to at least three phases (write the page tables, 
start the flush, finish the flush) or even four (if we want to insert 
work between both sfence.w.inval->sinval.vma and 
sinval.vma->sfence.inval.ir).

Not sure if I'm just misunderstanding the performance characteristics, 
though.   Maybe I'm over-thinking things and sfence.vma is heavy-weight 
enough that implementations are flushing the pipeline for even the 
page-based flavors and thus sfence.vma-based loops are very slow?

Do you have any benchmarks for the Svinval bits here (which are mixed in 
with some non-global flushing, that's a different optimization that 
needs to be split out)?


>  }
>
>  static void __ipi_flush_tlb_all(void *info)
> @@ -149,3 +240,16 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  	__flush_tlb_range(vma->vm_mm, start, end - start, PMD_SIZE);
>  }
>  #endif
> +
> +DEFINE_STATIC_KEY_FALSE(riscv_flush_tlb_svinval);
> +EXPORT_SYMBOL_GPL(riscv_flush_tlb_svinval);
> +
> +void riscv_tlbflush_init(void)
> +{
> +	if (riscv_isa_extension_available(NULL, SVINVAL)) {
> +		pr_info("Svinval extension supported\n");
> +		static_branch_enable(&riscv_flush_tlb_svinval);
> +	} else {
> +		static_branch_disable(&riscv_flush_tlb_svinval);
> +	}
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

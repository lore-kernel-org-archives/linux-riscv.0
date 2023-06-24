Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0855EEB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 11:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EVPV0YK77A+nhSST+nDnUkwpaSU0Dgl82aWr1uLZFNk=; b=JpTVdnw5J3LA9Z
	kApWKVBbeowNoAEknYqKwh5a2vwQfWNyhyRam3baq9Z15D5wC98jRdsbRtEbmq5x96IMSwha3PT3U
	zsWQiLo5/rHrChZMirh629aSEzLtsmLdI3e1uua4HXKYHImkqLNqCBt4sBqyvTEc/HGEO4sCI4T5o
	uEHUveJE2Rla5tO9efHFg3gvuUpS1ljdUlHVxQHq2u/a3SpiKr2eHZV1RmN+janOSrQMRX1AE2kLP
	lmch+/vUm6zy9fkOqQSGwlYk63eBxvhnK8PjkPXEVqw/TiIcMxppyTw8BoFuM8mN/VGrOJhvC/YWM
	s1Fap/em/G2QpN1vDoZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qD14M-005s8O-23;
	Sat, 24 Jun 2023 11:04:42 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qD14J-005s7l-27
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 11:04:41 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9891c73e0fbso283438666b.1
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jun 2023 04:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687604675; x=1690196675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FeKfL6JWWjULtPMW8TUIbYFftOwoImsqTHZRAeZqWgo=;
        b=mKgwvEmRDhdv0zptzwNjlriMIBmo+NFiIjbIn/2bhvuo4tVsx5uVd2T5e6C2dlAX1E
         W+SX5jjDNAWTdWPUH7YeIqcfvSolZyiku5ppYLpUehxex1Luvi5F5z4jSNiIkPyEix1r
         qi3sCLS1SE8bNMPCL+WFtrW7MPI480TvgYtoW6Bmu7sqtLTe1pComtkbJ/JHTH4YcsdC
         c3uV5yTch5OvpElktG8tyyu4ApDAUq4RTwPlUsEMgPvZvrCDafEASdC7DKKYJSIAv628
         +DqWMDI7F40Yq0vizFfuX3v2nK/IhjsYvYwBlerGxgF+MOrzEtB01LNB2IyARVL3RVc4
         zp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687604675; x=1690196675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeKfL6JWWjULtPMW8TUIbYFftOwoImsqTHZRAeZqWgo=;
        b=BsGmg8RDSMnaoUKyMcOscyxR2HBfcJD2FqkeV+xvFUegkzroxqHfyFiTxaL79ERFTK
         givbIEl7kdKVGtYe2D41ji7gMWszuhQfAe0VzU/aORzFdYgTQ5m9RnVsij7+ee2Qd5K+
         U3VCcsrFVaztiOActptTP+ZV+ivxWBgKivIwrUUM1SUohg+JUQ1e21l5ehqBr73w1U/v
         vi9hniojZP/Xu4LFT1W2p9Hgi70onOkYx/hKQ+vyv8IJuKcG2jCFtevdJZp5CvTTfHB1
         jblN9jay9obgXtryzGhvG3y/pR5RcXdBoiy5t+k2prcpOg46hJK8XlnsyzDDWedk38xa
         dYRw==
X-Gm-Message-State: AC+VfDxhMnDr8e1wEuuG9awZNRzz6W+ivFgItS1Xhs1pH32gcpjhYLY1
	+Kb+F92D0lPEKdTHt37xARqjCg==
X-Google-Smtp-Source: ACHHUZ5QE+VOUhKV3E4QutVJE4qfwyuiJTgowoKrIDAAAffiYSZZuFj+lj1+FWMaLvn0KYvrKmDD5Q==
X-Received: by 2002:a17:907:a428:b0:98d:470d:9341 with SMTP id sg40-20020a170907a42800b0098d470d9341mr5644687ejc.27.1687604674873;
        Sat, 24 Jun 2023 04:04:34 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id lc6-20020a170906f90600b0096fbc516a93sm743629ejb.211.2023.06.24.04.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 04:04:34 -0700 (PDT)
Date: Sat, 24 Jun 2023 13:04:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/1] riscv: mm: use svinval instructions instead of
 sfence.vma
Message-ID: <20230624-354de4b11db5cf4313ff9afb@orel>
References: <20230623123849.1425805-1-mchitale@ventanamicro.com>
 <20230623123849.1425805-2-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230623123849.1425805-2-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_040439_696650_CC23528C 
X-CRM114-Status: GOOD (  22.47  )
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

On Fri, Jun 23, 2023 at 06:08:49PM +0530, Mayuresh Chitale wrote:
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
> limited to 64. This is required to avoid soft lockups and the
> approach is similar to that used in arm64.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  arch/riscv/include/asm/tlbflush.h |  1 +
>  arch/riscv/mm/tlbflush.c          | 66 +++++++++++++++++++++++++++----
>  2 files changed, 59 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index a09196f8de68..56490c04b0bd 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -30,6 +30,7 @@ static inline void local_flush_tlb_page(unsigned long addr)
>  #endif /* CONFIG_MMU */
>  
>  #if defined(CONFIG_SMP) && defined(CONFIG_MMU)
> +extern unsigned long tlb_flush_all_threshold;
>  void flush_tlb_all(void);
>  void flush_tlb_mm(struct mm_struct *mm);
>  void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 77be59aadc73..f63cdf8644f3 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -5,6 +5,17 @@
>  #include <linux/sched.h>
>  #include <asm/sbi.h>
>  #include <asm/mmu_context.h>
> +#include <asm/hwcap.h>
> +#include <asm/insn-def.h>
> +
> +#define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
> +
> +/*
> + * Flush entire TLB if number of entries to be flushed is greater
> + * than the threshold below. Platforms may override the threshold
> + * value based on marchid, mvendorid, and mimpid.
> + */
> +unsigned long tlb_flush_all_threshold __read_mostly = 64;
>  
>  static inline void local_flush_tlb_all_asid(unsigned long asid)
>  {
> @@ -24,21 +35,60 @@ static inline void local_flush_tlb_page_asid(unsigned long addr,
>  }
>  
>  static inline void local_flush_tlb_range(unsigned long start,
> -		unsigned long size, unsigned long stride)
> +					 unsigned long size,
> +					 unsigned long stride)
>  {
> -	if (size <= stride)
> -		local_flush_tlb_page(start);
> -	else
> +	unsigned long end = start + size;
> +	unsigned long num_entries = DIV_ROUND_UP(size, stride);
> +
> +	if (!num_entries || num_entries > tlb_flush_all_threshold) {
>  		local_flush_tlb_all();
> +		return;
> +	}
> +
> +	if (has_svinval())
> +		asm volatile(SFENCE_W_INVAL() ::: "memory");
> +
> +	while (start < end) {
> +		if (has_svinval())
> +			asm volatile(SINVAL_VMA(%0, zero)
> +				     : : "r" (start) : "memory");
> +		else
> +			local_flush_tlb_page(start);
> +		start += stride;
> +	}
> +
> +	if (has_svinval())
> +		asm volatile(SFENCE_INVAL_IR() ::: "memory");
>  }
>  
>  static inline void local_flush_tlb_range_asid(unsigned long start,
> -		unsigned long size, unsigned long stride, unsigned long asid)
> +					      unsigned long size,
> +					      unsigned long stride,
> +					      unsigned long asid)
>  {
> -	if (size <= stride)
> -		local_flush_tlb_page_asid(start, asid);
> -	else
> +	unsigned long end = start + size;
> +	unsigned long num_entries = DIV_ROUND_UP(size, stride);
> +
> +	if (!num_entries || num_entries > tlb_flush_all_threshold) {
>  		local_flush_tlb_all_asid(asid);
> +		return;
> +	}
> +
> +	if (has_svinval())
> +		asm volatile(SFENCE_W_INVAL() ::: "memory");
> +
> +	while (start < end) {
> +		if (has_svinval())
> +			asm volatile(SINVAL_VMA(%0, %1) : : "r" (start),
> +				     "r" (asid) : "memory");
> +		else
> +			local_flush_tlb_page_asid(start, asid);
> +		start += stride;
> +	}
> +
> +	if (has_svinval())
> +		asm volatile(SFENCE_INVAL_IR() ::: "memory");
>  }
>  
>  static void __ipi_flush_tlb_all(void *info)
> -- 
> 2.34.1
> 

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

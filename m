Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDE6EE14AA
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Sep 2023 19:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=61RZOq7NpIA0T7J4r45oPoTAay+6rW4JzrT9FhgrH7M=; b=AITGiIY7woiWeU
	SWvm0UNr50M3hTduQRUhng953YLAl4q/KO6utc1+c/vNgOpF195j68ppuanXeHTLLqlu0xPcuxAsW
	VjmF32jROtylX+a7N3acpty1km3DkBLwyk9k25hndKXasBOrlcHZsPTyqj7uhh5jgb2XMfOEAcH+g
	URZfp1loc6dlvt8ftqnjY3qJSe5PNAHU0vAlRO9xh4hZZe9l0ESMenl/wdwMOSwSFHXpmI+siuJoL
	PPnuXTsy172SqGME+8nPhexwewmfSYmzTqQQ9d/WEOTKMBjA+SH6EBpSkMbJ0JF3L8sQPdccM6idQ
	mXbuRdXmIXlRzZ85ZPdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qf3Bs-00FiIK-38;
	Sat, 09 Sep 2023 19:00:20 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qf3Bp-00FiFO-1z
	for linux-riscv@lists.infradead.org;
	Sat, 09 Sep 2023 19:00:19 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id D971132004AE;
	Sat,  9 Sep 2023 15:00:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 09 Sep 2023 15:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1694286010; x=1694372410; bh=A5MrvyLA8xK/vXHCbe2soE3nnJPbSYtusqU
	f8e4mJXA=; b=IOHHx7fgIj067XKK/TgqYl/W5/K0yivCWNbZ4MrzV3gSCd0x3v2
	1eRtCaE/J8DSgXTBFAFoe3QfoFR5H3E50QwjeyTshhyLtHxMk5VfzyPWPheS3E4b
	4jGj3o5xWRaYD5Bimod3eWKb6iHEIM9oinudM3pPR+5tV5xnKNGZtj86B3VsFxNA
	SeQxcyJhDkIIXFwpJHVNUZEJ2PCTOALrPOWM1ZlY6SafpnaabRKxZHV9gaifnYct
	lvzCjOWqVQKGvGwP9ydBWSXpcVMZu6NZpCefx/UA2mCcedoAEdw4OOHJ02DnJyrd
	GlYIGy3ajQl9dtgVXnHbx2b2L9FIaY5dAvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1694286010; x=1694372410; bh=A5MrvyLA8xK/vXHCbe2soE3nnJPbSYtusqU
	f8e4mJXA=; b=wpDxu6Hs901TF7HNAStGBys/AaZxlr2uz60wWhFqd5dsP9RoFeu
	+3q8IwwfBOM9X1zFwW8XgbyNsYh2ZRJReuQ42JCTLDfGCeDZpxsKPXNz0ViXoVVw
	Z6SYTHVve+24SpaLHSEbBKwn2UZs+qhY2f93meIQ0pUUPKv8xquBqsujnoudnJV/
	nq58Yn16ZBlqXHTo+VqW/YNeJp3JGm+uOOBQaiPjIS7nldTUDYY9pkvBf5W9CxPq
	ZyElYWm444VCbMrS8bgeHukwy76bJOpO56BGuvK6RfjVCUNc/DcJ9x3NlSgVxnD6
	Knk5QcZtfCtGRQ2pJwg/eecrzqmAsgkhpOQ==
X-ME-Sender: <xms:ucD8ZA52tTYm-AOghvaKiA7tQNGU1bNCwWtzcWxGTynbILs6FOSAWQ>
    <xme:ucD8ZB70MZThFNNbomHDu-tlIoTx8q9NVf2KTOlVjSSqYouA6wCwrGISwWDfKmiZs
    ovkhmuP-O-UzSaFyA>
X-ME-Received: <xmr:ucD8ZPc8oAEfDDRjPZ073GwzrZ6oWINsLVEmFalnSoJLZASgife_08M8TQko5uEgT8UG2EV5HCJCq5tKWUOYjsiy0-KRsCLexGa3wT-Le0NhJ0m-2SIgQKVq-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudehledgudefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgr
    mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
    cuggftrfgrthhtvghrnhepkeejleelfeeitdfhtdfgkeeghedufeduueegffdvhfdukeel
    leeftdetjeehuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:ucD8ZFJLl1J7Qk6SKkwCXOfLMqr7DyOlToqhg4ZwWIiuXUO_XvgsJw>
    <xmx:ucD8ZEKC8t-nGCVa-CbY5qUkYn279ZbTVs1Ek1Ztf62yjINmld6eeQ>
    <xmx:ucD8ZGxeBw21ixCbCVjY66r0aGz3ymOfSAYzK9a_XcL4FiqhGMADaA>
    <xmx:usD8ZGhNeFiN9dJjzQBQsM9uOjiWjkg1W06YDsBYNiH5oVDcxRTYWA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Sep 2023 15:00:08 -0400 (EDT)
Message-ID: <0e101df0-397a-0d1a-0080-2e60c68c79b6@sholland.org>
Date: Sat, 9 Sep 2023 14:00:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 4/4] riscv: Improve flush_tlb_kernel_range()
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230801085402.1168351-1-alexghiti@rivosinc.com>
 <20230801085402.1168351-5-alexghiti@rivosinc.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20230801085402.1168351-5-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230909_120017_994135_726C39E9 
X-CRM114-Status: GOOD (  27.61  )
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

Hi Alex,

On 8/1/23 03:54, Alexandre Ghiti wrote:
> This function used to simply flush the whole tlb of all harts, be more
> subtile and try to only flush the range.
> 
> The problem is that we can only use PAGE_SIZE as stride since we don't know
> the size of the underlying mapping and then this function will be improved
> only if the size of the region to flush is < threshold * PAGE_SIZE.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/tlbflush.h | 11 +++++-----
>  arch/riscv/mm/tlbflush.c          | 34 +++++++++++++++++++++++--------
>  2 files changed, 31 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index f5c4fb0ae642..7426fdcd8ec5 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -37,6 +37,7 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
>  void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
>  void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  		     unsigned long end);
> +void flush_tlb_kernel_range(unsigned long start, unsigned long end);
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>  void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
> @@ -53,15 +54,15 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
>  	local_flush_tlb_all();
>  }
>  
> -#define flush_tlb_mm(mm) flush_tlb_all()
> -#define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
> -#endif /* !CONFIG_SMP || !CONFIG_MMU */
> -
>  /* Flush a range of kernel pages */
>  static inline void flush_tlb_kernel_range(unsigned long start,
>  	unsigned long end)
>  {
> -	flush_tlb_all();
> +	local_flush_tlb_all();
>  }
>  
> +#define flush_tlb_mm(mm) flush_tlb_all()
> +#define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
> +#endif /* !CONFIG_SMP || !CONFIG_MMU */
> +
>  #endif /* _ASM_RISCV_TLBFLUSH_H */
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 0c955c474f3a..687808013758 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -120,18 +120,27 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
>  			      unsigned long size, unsigned long stride)
>  {
>  	struct flush_tlb_range_data ftd;
> -	struct cpumask *cmask = mm_cpumask(mm);
> -	unsigned int cpuid;
> +	struct cpumask *cmask, full_cmask;
>  	bool broadcast;
>  
> -	if (cpumask_empty(cmask))
> -		return;
> +	if (mm) {
> +		unsigned int cpuid;
> +
> +		cmask = mm_cpumask(mm);
> +		if (cpumask_empty(cmask))
> +			return;
> +
> +		cpuid = get_cpu();
> +		/* check if the tlbflush needs to be sent to other CPUs */
> +		broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
> +	} else {
> +		cpumask_setall(&full_cmask);
> +		cmask = &full_cmask;
> +		broadcast = true;
> +	}
>  
> -	cpuid = get_cpu();
> -	/* check if the tlbflush needs to be sent to other CPUs */
> -	broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
>  	if (static_branch_unlikely(&use_asid_allocator)) {
> -		unsigned long asid = atomic_long_read(&mm->context.id) & asid_mask;
> +		unsigned long asid = mm ? atomic_long_read(&mm->context.id) & asid_mask : 0;

I think the bug is here. Passing a value of 0 for the ASID is not the
same as passing the ASID in register x0. Only in the latter case does
the TLB flush apply to global mappings, which is what you need for
flush_tlb_kernel_range().

Regards,
Samuel

>  
>  		if (broadcast) {
>  			if (riscv_use_ipi_for_rfence()) {
> @@ -165,7 +174,8 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
>  		}
>  	}
>  
> -	put_cpu();
> +	if (mm)
> +		put_cpu();
>  }
>  
>  void flush_tlb_mm(struct mm_struct *mm)
> @@ -196,6 +206,12 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  
>  	__flush_tlb_range(vma->vm_mm, start, end - start, stride_size);
>  }
> +
> +void flush_tlb_kernel_range(unsigned long start, unsigned long end)
> +{
> +	__flush_tlb_range(NULL, start, end, PAGE_SIZE);
> +}
> +
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  			unsigned long end)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

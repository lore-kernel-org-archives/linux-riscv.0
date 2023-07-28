Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DE3C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 13:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5DSL5whjNXbltEFZUibrMA6rA2Y6okDg5Ixjmy5DEeo=; b=eM7mgJSiDcB1bx
	qhsoILMt4Kz6+jpYsnEW26qpRvqwBxql+Kply2cKuEnzl/bd5D1zXYP/JJUqW4Y+YVhcbIB50BKjg
	7YKHqiUzStN9y21UKYy2cyW1D0ZGsSvnXYAKmI9aluz8qgQeg7sOthrK/H4tIe4YaF75J6go6z30a
	zGhNOeNCZ4HH3td9eKjeGEmLyBmbV1V8XAbEayrVZmAz11lOqMfCMYJHKOa8bNFegOjfpLv/fNfuP
	Q0FwlOiF8I2lvrrJshcz7MCStn9ASaaZ76z/BvoS/ZGaexpMQYqv5LfUBPczW2QkDXegTisUdWiPK
	1um6fN7wBUyxITJP+j9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPNpr-003ZQw-23;
	Fri, 28 Jul 2023 13:48:51 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPNpn-003ZOR-0C
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 13:48:49 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-991da766865so302813466b.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 06:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690552122; x=1691156922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xglqSrB2iPFW2I/fuXfPFH2AjeG9G8DHiCGCdZ7AftA=;
        b=AB6+MgpeqsfDfT0Gtsokz5BQci7npK3FQ2KziJGiv0UyZ8bcgvhqc+jcNFZrgvptI9
         AIrPkUC39/8FTuu/2fdqNt4nPY7RpvzNBpE7u/1AXmaIiKrDozV1gP+5xgOZOIjJVg14
         v4JrgVF+IQYC8AW77Co4dn69YatbvqQJ1SQm5mYkHE6NZyD60qjFEj4H0s0FvdQ5X9/s
         ujEuMICe9jOyJ0EPcuouBIXvftZ9Tthnvhpr+wf+Bx5uPEZrkR50ZxRGeActqvJAADh7
         bvgMp3mmy12GUl0qjKexge/lNeaeMf3tZsrb+qxNw4/y3M9VQ2w6+z84jeC0dMO0xJRS
         5fFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690552122; x=1691156922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xglqSrB2iPFW2I/fuXfPFH2AjeG9G8DHiCGCdZ7AftA=;
        b=WNM9RrgZFJqztwAUZWYm0TXG30ju1zTwErzrrB7/axQZ2i69h5YQLEyixjW734uDAn
         9W6VwI8P4G2nZC1oK5kcmH9T+qfvIMrP5eykuovt1LedOkuIZH8mTLZOna4tGDLGpiUn
         18Ind+iT5xqUNTemSzXcHggrd7IPipINUKklY8P8MvKizjze3qiykcM/rCgf2VMGxO93
         YKpqjQlpsog1VHJ3PrVOVpf8cKKlSQI1pFdI2XdkT+3U5Yn+4fzFGEKcGU/rDjzTIjan
         qTaVd0LkW0WHaVYyMHDSRrlpMQx5EcMhW/sw6aHGGWm/E4komoUTAWRABFkUcJe/A9/8
         GWmg==
X-Gm-Message-State: ABy/qLZ3LzybqFExFJqO2cTtGag9WAnoioXwZ6F+eeKHz+E3sRE8zPwT
	eJU8xE4hcsiE4tjec5RbXV6Qfw==
X-Google-Smtp-Source: APBJJlGnEXAlsMCADN+Nq6BK+wfKYf1MY6AOSQRz7CvibJgwy8Y7+jhKeE+hbVuLfVBpD8mGaYmFsQ==
X-Received: by 2002:a17:907:7710:b0:988:6491:98e1 with SMTP id kw16-20020a170907771000b00988649198e1mr2173678ejc.42.1690552122403;
        Fri, 28 Jul 2023 06:48:42 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id t10-20020a17090616ca00b00982a352f078sm2066763ejd.124.2023.07.28.06.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 06:48:41 -0700 (PDT)
Date: Fri, 28 Jul 2023 15:48:41 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Vincent Chen <vincent.chen@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] riscv: Improve flush_tlb_kernel_range()
Message-ID: <20230728-f5c389ac7f2a9aadf93939f5@orel>
References: <20230727185553.980262-1-alexghiti@rivosinc.com>
 <20230727185553.980262-5-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230727185553.980262-5-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_064847_101159_0726C64C 
X-CRM114-Status: GOOD (  27.85  )
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

On Thu, Jul 27, 2023 at 08:55:53PM +0200, Alexandre Ghiti wrote:
> This function used to simply flush the whole tlb of all harts, be more
> subtile and try to only flush the range.
> 
> The problem is that we can only use PAGE_SIZE as stride since we don't know
> the size of the underlying mapping and then this function will be improved
> only if the size of the region to flush is < threshold * PAGE_SIZE.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/tlbflush.h | 11 +++++-----
>  arch/riscv/mm/tlbflush.c          | 35 +++++++++++++++++++++++--------
>  2 files changed, 32 insertions(+), 14 deletions(-)
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
> index 8017d2130e27..96aeacb269d5 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -117,18 +117,27 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
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
>  
>  		if (broadcast) {
>  			if (riscv_use_ipi_for_rfence()) {
> @@ -162,7 +171,8 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
>  		}
>  	}
>  
> -	put_cpu();
> +	if (mm)
> +		put_cpu();
>  }
>  
>  void flush_tlb_mm(struct mm_struct *mm)
> @@ -194,6 +204,13 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  	__flush_tlb_range(vma->vm_mm,
>  			  start, end - start, 1 << stride_shift);
>  }
> +
> +void flush_tlb_kernel_range(unsigned long start,
> +			    unsigned long end)

No need to wrap this line.

> +{
> +	__flush_tlb_range(NULL, start, end, PAGE_SIZE);
> +}
> +
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  			unsigned long end)
> -- 
> 2.39.2
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

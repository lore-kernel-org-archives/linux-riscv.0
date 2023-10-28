Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B701DC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 19:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZGsC5u4Wjgp03dNakazXTBtfFhsyTfEAWBK9mDUT98=; b=yBCZGPRsC3vNXD
	gA8sH1YwZvaKF7sV2fXo8SOXSwDNJZ/sdt4Onb7HHoP6GTWVJZm8Z27X9JRzbyG0REWd5S30k3vW8
	gyV9w9tqQxJHoLQ+TuKCM4vj9GO7ky3Z09XevLzQrIX5Kz3P/NXmik2JukyE994kDtu/6kuXdXq0J
	lg5V0EIKoOFe3EzhRy/rcqUdZtz7KFs141bBfwzWNmnX49afKy405PdXLn9NGMMkE7+9BlnZH2R1c
	qpANrQyZySsTjUXdvXyxuPAvVq3WFLGd7mF9SxpQW3ViwZbxlCbJcA22tWat1eyfCA1S9zlR5zvSN
	jVK4DUT+GbYB/FianigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwpCU-000n1k-2d;
	Sat, 28 Oct 2023 19:42:27 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwpCQ-000n0x-31
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 19:42:24 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6705379b835so7464226d6.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Oct 2023 12:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698522141; x=1699126941; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qq6x4Nq7vuXjfz7tKTCkE6tm57DtbpxomcSKCh+LPx0=;
        b=nGq3ygQVGEpl0+oAdY8O0qsVhyD5Q2iPghgxpXv/7rYl+HT6mOxFzz57fFP3jHSJG5
         TJ/tRmviz5ZsEVl1x3rYApmQyZDpB1Wbv3Z/q/rn7bLKT0dwG1/2Fgo46lUF96cvlKng
         kZO6olTuY7qaiEALEAkcCtYvsyUE2MbgCWS3n9J4sXtos/FiAl2yOBvrHWBA2oIkUtmJ
         PK8rJyp4c9gSEb3UoXgKyJ0ydGskEQy37RdQeDaGI2vyjGCu2G9ZhHvfRj6UJF22MZcW
         dUxZizB6Ed8HjUmdmM+n7lH9u8lYe5UtexsGNSaqQ+UmAmEV/NQ533l7Y8qdVBQ9kDBK
         w/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698522141; x=1699126941;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qq6x4Nq7vuXjfz7tKTCkE6tm57DtbpxomcSKCh+LPx0=;
        b=wbLr8ZnbvIrMBJHWGXCm+jFtr49ZTdBiahwQQQ4FjW6sJBqG0COS4SD/oRupm4bD7P
         h/ptoAYHFIe0YzAsFg7sqoQluOedTjTsHvyrXPzj/ztv+2nTdvAIwfA6PHl6HpMNju+B
         QV/MHSjv6XFdX0DwsHCm8UK9feUBNZktWJok7xKe0tFOehJthPTgALTDg+zg2cYU08rf
         yhLot9mnrwWgqEDeJg8AZWC43WoXgxrsoXVkIaDglk3NF23219gugPAMBpNrNxH9kEuU
         g5pngqw9t6WG7sIKpc1am4UmrFa6L7ZUucZkBquPLxMWaXOFC9aIwcR6TTaVBBeOYgPK
         S0eA==
X-Gm-Message-State: AOJu0YzfGtPpzbfCf5hqWC5tXutk5UG1PKwCnJ/eupIXJ8BegAWkeHAQ
	ecbMg3rJTTcQTeLkMuXBFYUqKg==
X-Google-Smtp-Source: AGHT+IG8lUSEc0ZqGXmBwx7uoR3D0JZCF8vHTRrCrxH1Pssc53OXRuD5E/+biagdI12WjtsL+f8OvQ==
X-Received: by 2002:ad4:4ee3:0:b0:66d:49aa:6844 with SMTP id dv3-20020ad44ee3000000b0066d49aa6844mr9472629qvb.19.1698522141362;
        Sat, 28 Oct 2023 12:42:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:c988:e7b9:36ab:57c6? ([2600:1700:2000:b002:c988:e7b9:36ab:57c6])
        by smtp.gmail.com with ESMTPSA id l4-20020a056214104400b0065afe284b3csm1853091qvr.125.2023.10.28.12.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Oct 2023 12:42:20 -0700 (PDT)
Message-ID: <65d7ea77-35fa-4aa2-9431-8f7f218cae57@sifive.com>
Date: Sat, 28 Oct 2023 14:42:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] riscv: Improve flush_tlb_kernel_range()
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>,
 Lad Prabhakar <prabhakar.csengg@gmail.com>
References: <20231019140151.21629-1-alexghiti@rivosinc.com>
 <20231019140151.21629-5-alexghiti@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231019140151.21629-5-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_124222_992421_8151DF08 
X-CRM114-Status: GOOD (  24.87  )
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

On 2023-10-19 9:01 AM, Alexandre Ghiti wrote:
> This function used to simply flush the whole tlb of all harts, be more
> subtile and try to only flush the range.
> 
> The problem is that we can only use PAGE_SIZE as stride since we don't know
> the size of the underlying mapping and then this function will be improved
> only if the size of the region to flush is < threshold * PAGE_SIZE.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # On RZ/Five SMARC
> ---
>  arch/riscv/include/asm/tlbflush.h | 11 ++++++-----
>  arch/riscv/mm/tlbflush.c          | 33 ++++++++++++++++++++++---------
>  2 files changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 170a49c531c6..8f3418c5f172 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -40,6 +40,7 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
>  void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
>  void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  		     unsigned long end);
> +void flush_tlb_kernel_range(unsigned long start, unsigned long end);
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>  void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
> @@ -56,15 +57,15 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
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
> index c27ba720e35f..7e182f2bc0ab 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -97,19 +97,27 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
>  			      unsigned long size, unsigned long stride)
>  {
>  	struct flush_tlb_range_data ftd;
> -	struct cpumask *cmask = mm_cpumask(mm);
> +	struct cpumask *cmask, full_cmask;
>  	unsigned long asid = FLUSH_TLB_NO_ASID;
> -	unsigned int cpuid;
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
>  
> -	cpuid = get_cpu();
> -	/* check if the tlbflush needs to be sent to other CPUs */
> -	broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
> +		cpuid = get_cpu();
> +		/* check if the tlbflush needs to be sent to other CPUs */
> +		broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
> +	} else {
> +		cpumask_setall(&full_cmask);
> +		cmask = &full_cmask;
> +		broadcast = true;

on_each_cpu_mask() only considers CPUs in cpu_online_mask anyway, so you can
more efficiently use:

  cmask = cpu_online_mask;

here (after making cmask const).

> +	}
>  
> -	if (static_branch_unlikely(&use_asid_allocator))
> +	if (static_branch_unlikely(&use_asid_allocator) && mm)
>  		asid = atomic_long_read(&mm->context.id) & asid_mask;

Instead of adding another check, please move this inside "if (mm)" above. Those
are both non-functional changes, so:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>

>  
>  	if (broadcast) {
> @@ -128,7 +136,8 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
>  		local_flush_tlb_range_asid(start, size, stride, asid);
>  	}
>  
> -	put_cpu();
> +	if (mm)
> +		put_cpu();
>  }
>  
>  void flush_tlb_mm(struct mm_struct *mm)
> @@ -181,6 +190,12 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  
>  	__flush_tlb_range(vma->vm_mm, start, end - start, stride_size);
>  }
> +
> +void flush_tlb_kernel_range(unsigned long start, unsigned long end)
> +{
> +	__flush_tlb_range(NULL, start, end - start, PAGE_SIZE);
> +}
> +
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  			unsigned long end)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

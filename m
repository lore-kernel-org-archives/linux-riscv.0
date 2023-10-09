Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFDACD6114
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 17:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ZbNHF3AFbNdlGd5dPx9BTrSdOnawgBIOkQdV9Z2ZR4=; b=oHW09VmzAePhfZ
	57d7ua8SWL1VkJoBN2SxYXzAzi7WyOq+aQlcxBYTtg1mcaYKbeL7PjwV4Yk0zBfqSSkcwaMl7Muoz
	znTqQHbHv2TYda+Ud9fnvehs30XC4/M3rbN4sqEXcHdHSEuzGFYP4HWUpTm6ppMgeOaqTYwuo3vKk
	K8uHbCXiDt9Ar549Deh9T2Iln2sx58/F1PF7udZS5a8+6y81dxlZrkItrv+r6fp1LEjFhAzph8tDt
	VL9z2AlLxWXMIvwEFs2trUogl/sTsCGCODwGHe7BEe/f7US4K6BMQB1T9dLw8QS8+0Aj7Bz3gZ9kA
	n8afpsbWt3Z8iSX0Q/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpuRj-00BLqg-0I;
	Mon, 09 Oct 2023 17:53:35 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpuRg-00BLq0-02
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 17:53:33 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7742be66bd3so329744485a.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 10:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1696874010; x=1697478810; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IoyXQp0nB/IWm6dvckPcOr8vbJO99u9ZUrMCMrf5qWM=;
        b=W6hbfG51KSE8SmoRlOvzHarduyHw+uacQfTIjRhy+IuzkLojulTu2wFbGmX8RG8v8I
         ivBDl20M5J1n3s+j6KJrUdJUm+WY3PIaFpTkDwN9VQ6xm/hP5E2dIbdXxvWw5sdOn9Hq
         FVOJ7dfzXgLH8wXElTZkqsNLjJHDvwEmj97H90an/AcACKXcKDNHy2ZPCCtnKpG9Bj3m
         nVHq908ylvS3fygaj0vkE19Epvz4XBWO7FezcmowiOMzuZbI2DDhZVX1gKwG9Nl2CUtQ
         XIF1YjwbrAbJjCo/X4YLblzpylINcS0YK5a2CAGB5wgn5vTTqg2VVT1k33vodvlLw7k2
         ywEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696874010; x=1697478810;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IoyXQp0nB/IWm6dvckPcOr8vbJO99u9ZUrMCMrf5qWM=;
        b=VWWDxbc/39fj/gZzfgitS8KDF7GYQPGIBtFSXrAhI2hn6Y7QeOaOkKD4NzqCqBv2L4
         My0qWMhy2A9plbMJEqaz96U9yIpN0RYXNjWzGLP0iScllDMNS5j5JPPH1xjI3Y8A0RhH
         xOJr1x4P6h4k+FA2g9ptaAc9vQA+dxQTAwWFCj7RvT6tZHc68EKyhdOkjzs0hrqFOrpk
         FDWnKh2UPjj+gzSwyR9rSaar3wuzTSyo91M/N1bvXINfZs2LMgRwpGP2wqfnzwk3avFt
         oZ+l8Abf1Jxr4tT8UzRZSe00uFTFtB0uUTL4XouK7lccoXC3ufrf+DHWfoZfKJoY4ulI
         HcFg==
X-Gm-Message-State: AOJu0YwoMXQxFh94Wzqr0qeIr73DyT+3qDhrmNL0BjQKrMXxZlnxMMD2
	DJ7q87WgisEjkpH8JR7zV5o++w==
X-Google-Smtp-Source: AGHT+IE1Qk4KpxGExPbP+Bwm/XXhpMnfLUgfDaerG1rDq19vZJtPM/OZ16TFeKYeE6po2KeQFV7LTw==
X-Received: by 2002:a05:620a:16c9:b0:76f:f11:7d1 with SMTP id a9-20020a05620a16c900b0076f0f1107d1mr14894821qkn.77.1696874010272;
        Mon, 09 Oct 2023 10:53:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:41c4:1832:a984:34e2? ([2600:1700:2000:b002:41c4:1832:a984:34e2])
        by smtp.gmail.com with ESMTPSA id f10-20020a05620a15aa00b007659935ce64sm3681308qkk.71.2023.10.09.10.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 10:53:29 -0700 (PDT)
Message-ID: <2047b2c2-bf37-4c02-9297-d89f95863ed5@sifive.com>
Date: Mon, 9 Oct 2023 12:53:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] riscv: Improve flush_tlb()
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
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>,
 Lad Prabhakar <prabhakar.csengg@gmail.com>
References: <20230911131224.61924-1-alexghiti@rivosinc.com>
 <20230911131224.61924-2-alexghiti@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20230911131224.61924-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_105332_084430_CF6C49D6 
X-CRM114-Status: GOOD (  18.09  )
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

On 2023-09-11 8:12 AM, Alexandre Ghiti wrote:
> For now, flush_tlb() simply calls flush_tlb_mm() which results in a

s/flush_tlb/tlb_flush/ here and in the subject.

Otherwise:
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

> flush of the whole TLB. So let's use mmu_gather fields to provide a more
> fine-grained flush of the TLB.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/tlb.h      | 8 +++++++-
>  arch/riscv/include/asm/tlbflush.h | 3 +++
>  arch/riscv/mm/tlbflush.c          | 7 +++++++
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
> index 120bcf2ed8a8..1eb5682b2af6 100644
> --- a/arch/riscv/include/asm/tlb.h
> +++ b/arch/riscv/include/asm/tlb.h
> @@ -15,7 +15,13 @@ static void tlb_flush(struct mmu_gather *tlb);
>  
>  static inline void tlb_flush(struct mmu_gather *tlb)
>  {
> -	flush_tlb_mm(tlb->mm);
> +#ifdef CONFIG_MMU
> +	if (tlb->fullmm || tlb->need_flush_all)
> +		flush_tlb_mm(tlb->mm);
> +	else
> +		flush_tlb_mm_range(tlb->mm, tlb->start, tlb->end,
> +				   tlb_get_unmap_size(tlb));
> +#endif
>  }
>  
>  #endif /* _ASM_RISCV_TLB_H */
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index a09196f8de68..f5c4fb0ae642 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -32,6 +32,8 @@ static inline void local_flush_tlb_page(unsigned long addr)
>  #if defined(CONFIG_SMP) && defined(CONFIG_MMU)
>  void flush_tlb_all(void);
>  void flush_tlb_mm(struct mm_struct *mm);
> +void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
> +			unsigned long end, unsigned int page_size);
>  void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
>  void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  		     unsigned long end);
> @@ -52,6 +54,7 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
>  }
>  
>  #define flush_tlb_mm(mm) flush_tlb_all()
> +#define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
>  #endif /* !CONFIG_SMP || !CONFIG_MMU */
>  
>  /* Flush a range of kernel pages */
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 77be59aadc73..fa03289853d8 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -132,6 +132,13 @@ void flush_tlb_mm(struct mm_struct *mm)
>  	__flush_tlb_range(mm, 0, -1, PAGE_SIZE);
>  }
>  
> +void flush_tlb_mm_range(struct mm_struct *mm,
> +			unsigned long start, unsigned long end,
> +			unsigned int page_size)
> +{
> +	__flush_tlb_range(mm, start, end - start, page_size);
> +}
> +
>  void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
>  {
>  	__flush_tlb_range(vma->vm_mm, addr, PAGE_SIZE, PAGE_SIZE);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

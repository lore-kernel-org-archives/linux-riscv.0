Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CBFCD6114
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 17:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYbWLNVVEej2k15U4gKx7+Qh2oLvkNVZELdULQB387c=; b=0+B9STkpAt9Mv6
	o7G2Ol/323xm00Bxj3eYU41ymbA/bgyAJtDAw9S2Air18xmHyzIVrbw/C0kT/sv8V+2iSwGWHOHF0
	PhVF2P6O6Bz/nNgJTVaf4ZfVgZFW+3k9ew4blFLEKTcrt6+E6HuTBz0wj0zXPairGY4LGOudY7OXQ
	MxE4OsRRqbR1OVH5Y+bJF9H8wo8tYPzgmWaoInMlbv8P5J+SQdo7bNyB2lNd8H6e2VEV4yI39hwBk
	Cuw3nV/yFvspoQUmDbLXMwPx2cLQh4QA0bLL/RwZo/HHOAsqF6UAEOKOWxDEMecI5M5hlc0p8JYME
	If4gpqRkFGffFn7syTig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpuRz-00BLtU-0B;
	Mon, 09 Oct 2023 17:53:51 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpuRv-00BLsC-2W
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 17:53:49 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7740729ae12so318093885a.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 10:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1696874026; x=1697478826; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/5YUwrppm/AoYHUPSKvRLI3OIQ5ZsMP8vebRQ0LmXCY=;
        b=PX3xeJADFrrcMqoqxJv1KTokk7TjD0f6OP7rsMH18XkN51j0xmQpMlSkfUpcvkleN1
         xWS/DHbk27ChgcNXrNi+l9Hs2kn1YRKKtWtmop7VzdqYdVoaB7ClrDHWmsMISyvjkRW4
         7c91R4FjSVfK69Q0tVsTNZg2NVMRATSsAqinK4k4A9hapLC/5QNDgR6G3LucRnuaxINo
         04bW5AosjV7SjFLX3bB3ecsDfSqLW1S0Y7LkupDpaiSuuSjSF32CVNc1AnLhU7cNUlB5
         Vc2qI6oXrMOWJXM9TM4hs23exCyrJf0RuHFmN2VBtKKl4jFi6JV7+tgZA9kH8bX3QJlI
         ZCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696874026; x=1697478826;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5YUwrppm/AoYHUPSKvRLI3OIQ5ZsMP8vebRQ0LmXCY=;
        b=kEufhUp4xbAxYVYVf7VXPnW9WAzzfr07VLbuyfOozZtscf6MoGqehQC3URfmGtQKB0
         MQYgYxWYIkwln60RPQqwKBhcrPxpTxl1Tb0bD8qW+1V5FktD9flhGWOzBN2woP93qt3Z
         hj/j1GfOIhKFjV4HqHWZ6vrBDMDVmzmxN1hcDDApFEFz5hjJsBvqxmWqrk6TW27vOCXj
         Arkp9BAuCtHhCEpdFF20edt1kjgYxTLd6KFwwh3lFWRCwusFGQxvFrTdbFSAnXb2kzAo
         xaL9l7Cdr/huB/dIocmCPj5l2iqdlBO6vqx5S4R3KCz4C6HoV8pC2QDZzuemc6RKJ6L4
         kuDg==
X-Gm-Message-State: AOJu0Yymg4fI7qzzqNrQo6YFttapP+hYu/4GkbxKzqHDTd6iyqp6NtZQ
	LhXXBBtRaGVbat277HMFH4oa8A==
X-Google-Smtp-Source: AGHT+IHn3G7dp7w4ELGf7mKo4hz5o3p9FIlRvSczI8R7BrW5KIzLNolaRTbPbsB8nhk7K2CpQZp1tA==
X-Received: by 2002:a05:620a:1a89:b0:773:a83f:413c with SMTP id bl9-20020a05620a1a8900b00773a83f413cmr21902058qkb.30.1696874025984;
        Mon, 09 Oct 2023 10:53:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:41c4:1832:a984:34e2? ([2600:1700:2000:b002:41c4:1832:a984:34e2])
        by smtp.gmail.com with ESMTPSA id f10-20020a05620a15aa00b007659935ce64sm3681308qkk.71.2023.10.09.10.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 10:53:45 -0700 (PDT)
Message-ID: <79d8ca23-478d-4f88-afb3-343a85ed0fe6@sifive.com>
Date: Mon, 9 Oct 2023 12:53:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] riscv: Improve flush_tlb_range() for hugetlb pages
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
 <20230911131224.61924-3-alexghiti@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20230911131224.61924-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_105347_818062_5750D942 
X-CRM114-Status: GOOD (  22.50  )
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

On 2023-09-11 8:12 AM, Alexandre Ghiti wrote:
> flush_tlb_range() uses a fixed stride of PAGE_SIZE and in its current form,
> when a hugetlb mapping needs to be flushed, flush_tlb_range() flushes the
> whole tlb: so set a stride of the size of the hugetlb mapping in order to
> only flush the hugetlb mapping. However, if the hugepage is a NAPOT region,
> all PTEs that constitute this mapping must be invalidated, so the stride
> size must actually be the size of the PTE.
> 
> Note that THPs are directly handled by flush_pmd_tlb_range().
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/mm/tlbflush.c | 39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index fa03289853d8..5bda6d4fed90 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -3,6 +3,7 @@
>  #include <linux/mm.h>
>  #include <linux/smp.h>
>  #include <linux/sched.h>
> +#include <linux/hugetlb.h>
>  #include <asm/sbi.h>
>  #include <asm/mmu_context.h>
>  
> @@ -147,7 +148,43 @@ void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
>  void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  		     unsigned long end)
>  {
> -	__flush_tlb_range(vma->vm_mm, start, end - start, PAGE_SIZE);
> +	unsigned long stride_size;
> +
> +	stride_size = is_vm_hugetlb_page(vma) ?
> +				huge_page_size(hstate_vma(vma)) :
> +				PAGE_SIZE;
> +
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> +	/*
> +	 * As stated in the privileged specification, every PTE in a NAPOT
> +	 * region must be invalidated, so reset the stride in that case.
> +	 */
> +	if (has_svnapot()) {

This whole block should probably go inside the is_vm_hugetlb_page(vma) check,
since we have to perform that check anyway.

> +		unsigned long order, napot_size;
> +
> +		for_each_napot_order(order) {
> +			napot_size = napot_cont_size(order);
> +
> +			if (stride_size != napot_size)
> +				continue;
> +
> +			if (napot_size >= PGDIR_SIZE)

Can you check stride_size here directly, and drop the loop? We should be able to
assume that the huge page size is valid. Non-NAPOT hugepages will hit one of the
equal-to cases below, which is fine.

Regards,
Samuel

> +				stride_size = PGDIR_SIZE;
> +			else if (napot_size >= P4D_SIZE)
> +				stride_size = P4D_SIZE;
> +			else if (napot_size >= PUD_SIZE)
> +				stride_size = PUD_SIZE;
> +			else if (napot_size >= PMD_SIZE)
> +				stride_size = PMD_SIZE;
> +			else
> +				stride_size = PAGE_SIZE;
> +
> +			break;
> +		}
> +	}
> +#endif
> +
> +	__flush_tlb_range(vma->vm_mm, start, end - start, stride_size);
>  }
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10856C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 18:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KL6HB0XNpzUnUi6bVGeaJoyQVIvSPzTF41nf80u5ZCY=; b=QklA6OTFOeku3C
	hWxCmrM4HQPGqrC2LHxnogcDoyPGtDwnEpc/n4kKlN+ccV0KjM4JPLA/3LwgMUTz7TrBhZ4M3hCcV
	5bzX4H463zEckUHGzKLFJ+Xg7jjFpOcz4/cZOrxYWwR8fbgsXMB8WetguTTeGc2jhifgOi7qZ+iwO
	rqp3A+i534qDWtNXeyOF6vEsNCOQv8agdy5G9FAN/Gwv1xalMg7f7dhtJ99Q+ef/DznvCtrPy+5Xv
	9mILos22d1IsWHBEM04lrmeL44/unDSAfigKtRaoYc95s9Zq8ReXl1z/jhftCLGR+SQCsVL1mhCMN
	qeBMwiiS4NW3IracTK+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwoQR-000kvh-2u;
	Sat, 28 Oct 2023 18:52:47 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwoQP-000kuu-0V
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 18:52:46 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-66d0760cd20so26078276d6.0
        for <linux-riscv@lists.infradead.org>; Sat, 28 Oct 2023 11:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698519163; x=1699123963; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rTzbMaF9e6LFHLkvVnlr1iqkQocBR5uDxVZIr/Uj4WE=;
        b=e1G0zx35H8PuaD9b2akxFw6NJwzUP2CRibdeMarq0NcQb2FqS1Nsquqxo/j7YaJHQ9
         6sCxnu5BXlac88mYYMkNE0FkDHbHvT3lTiuqpfeDvplMpaxx9aUdz0pna94Xr++lz7+p
         uO30DIAY6AZnQ9DRcX9ENjM2m//ogYJcoELufGmTUkl+I+DQYzy0TwZshvRqGE3jdvzn
         r1A0ovMm+bGav2vgKWWqL7dGjgzrct5QtlXKF406dk66hElr+glSttpupJpsamBTPAMK
         ytl9x/csD/yIZ/OX1SaC9Yeq6pzArv1XxS1Tuw3niWJ7wK4VnML6YwYbUKjzfSKlQoG/
         98Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698519163; x=1699123963;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rTzbMaF9e6LFHLkvVnlr1iqkQocBR5uDxVZIr/Uj4WE=;
        b=t4KCPczF8aIXRqNj+FMCY31E2OSokHSKVuDhQ7Sy13/GRlAVhpbVQgGqkWxBKq0mNp
         thLL6ckTnqDhmXk7O31BSK+rJ47Aq2jz5lEqqYy8c2oJ309ECIKFMZkNlNDoEgs2imkU
         PLZDiABCrm/8+pkkMsoHlJPR/12COe6Y3cSYuugffKEscQ7yD62MLqGcbeMB7P92VFfy
         NwV2qo4kn3wa5WUg0bb10G/9v0g3G+NsC3DFYDPpPiondQ3OQzpSo3V4kYBzt4vZ2ouX
         ORhoIDJOEo4rCTwK+LSApZkToJS0KB9fv/hxjAc41QYfvLOv2kDLGCRzb9V1yg40lG07
         9t4Q==
X-Gm-Message-State: AOJu0Yz8XckrOPG2PANJLy+XUiKGZddKP4LlocCa/oe8w6qYxEj/2yn7
	/pMg3GSk+OS3jLo3UxYzEIHCDQ==
X-Google-Smtp-Source: AGHT+IHRhO2f1MH3WnnbQd9fLdzhnTNzypJ89qAUGrhcvHOOFaTQVJ4ekwM34frzhsDctzrIh0CLVQ==
X-Received: by 2002:ad4:5aaf:0:b0:66d:8752:b6cf with SMTP id u15-20020ad45aaf000000b0066d8752b6cfmr5006791qvg.26.1698519163004;
        Sat, 28 Oct 2023 11:52:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:c988:e7b9:36ab:57c6? ([2600:1700:2000:b002:c988:e7b9:36ab:57c6])
        by smtp.gmail.com with ESMTPSA id mg22-20020a056214561600b0065b0d9b4ee7sm1820353qvb.20.2023.10.28.11.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Oct 2023 11:52:42 -0700 (PDT)
Message-ID: <e661b2ef-2a9a-44d7-bb32-6c0c8f8b6e85@sifive.com>
Date: Sat, 28 Oct 2023 13:52:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] riscv: Improve flush_tlb_range() for hugetlb pages
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20231019140151.21629-1-alexghiti@rivosinc.com>
 <20231019140151.21629-3-alexghiti@rivosinc.com>
Cc: Will Deacon <will@kernel.org>,
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
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231019140151.21629-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_115245_284536_B56A7D69 
X-CRM114-Status: GOOD (  22.25  )
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
> ---
>  arch/riscv/mm/tlbflush.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index fa03289853d8..5933744df91a 100644
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
> @@ -147,7 +148,35 @@ void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
>  void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  		     unsigned long end)
>  {
> -	__flush_tlb_range(vma->vm_mm, start, end - start, PAGE_SIZE);
> +	unsigned long stride_size;
> +
> +	if (!is_vm_hugetlb_page(vma)) {
> +		stride_size = PAGE_SIZE;
> +	} else {
> +		stride_size = huge_page_size(hstate_vma(vma));
> +
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT

There is a fallback implementation of has_svnapot(), so you do not need this
preprocessor check. With that removed:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

> +		/*
> +		 * As stated in the privileged specification, every PTE in a
> +		 * NAPOT region must be invalidated, so reset the stride in that
> +		 * case.
> +		 */
> +		if (has_svnapot()) {
> +			if (stride_size >= PGDIR_SIZE)
> +				stride_size = PGDIR_SIZE;
> +			else if (stride_size >= P4D_SIZE)
> +				stride_size = P4D_SIZE;

As a side note, and this is probably premature optimization... PGDIR_SIZE and
P4D_SIZE check pgtable_l{4,5}_enabled. That's not really necessary here, since
we are just trying to round down, and there won't be any higher-order hugepages
if those paging levels are disabled.

> +			else if (stride_size >= PUD_SIZE)
> +				stride_size = PUD_SIZE;
> +			else if (stride_size >= PMD_SIZE)
> +				stride_size = PMD_SIZE;
> +			else
> +				stride_size = PAGE_SIZE;
> +		}
> +#endif
> +	}
> +
> +	__flush_tlb_range(vma->vm_mm, start, end - start, stride_size);
>  }
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

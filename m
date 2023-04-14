Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023F7C77B6F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 09:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2GYbE+nXE9sL0JhbIKlmOdNUrWO20253HTI+77Z5jw=; b=PXQUsH2cVnn9k1
	VCNm3p0mJTt04+Jjf54vouEUJ9rZZrd5jboczBtsGGUcH6JdrnJZg/R+3exF5VPpJKdTLT79nHzs+
	UHMNIbzCR75314H6jgZDfzrqxUWzchrLTkjpU1gWLvIuJBVDr/rtkYSJ2A3n192DbR2DXp3e8GHFS
	XMeCpOkT1XELMMS0ZWy9RDBngoAzrVxm/rRn0FaOmx/J9OucE3MquF/sKceN+N0hF0akcZ23paTjX
	MkoXq7lbtDZpmjXggTlS/WL4d4Gh7P+Glk9RV+k5dQ/LRMB/jas3lLwoC7HnBB+Yb6Yuh4YRVJ3c7
	cgKjgzlsldw+N+Y8B9pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnFWH-008piS-1U;
	Fri, 14 Apr 2023 09:15:01 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnFWE-008phJ-2z
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 09:15:00 +0000
Received: by mail-ej1-x631.google.com with SMTP id c9so5138446ejz.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 02:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681463696; x=1684055696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KpMQhDzzgrlExHJBn7HrlDTYoVOY3vvei/11EajpUF8=;
        b=ZPCUL0+bK332HE9gtGAnLR3ZQAv2LTjnnH2Cv/URQiNJBJMNFpkDwjQ5qw1Ghfe2iw
         V96UEiUvuv4vul/5g2k3VubDkTEjfbfEl5Ui66w7gX8OrDO+NCQSuhXIzVPXpjgtYO1P
         9dU8KMC4+6Yj/Duzo8VudXyKF8hWqA0Omo0HcvgYmNfuY38ekBU67cGwj0UwQWWK0bLT
         3JWFGPVHcSbuxogsHRvr8R/ZLDgstq3uCkmbnkbBsbdAlgnd42KkEInOGM2ew7WXb+GZ
         XOkKLPIkD/phbA+Ubj4CvXNpaUx0RbGJc3onhW5+QsDMIPoUL9uBmeqGo3DmiFXTATbH
         1PJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681463696; x=1684055696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpMQhDzzgrlExHJBn7HrlDTYoVOY3vvei/11EajpUF8=;
        b=cyfztqBHrPc64AGC3levkJTE6kO5836Emze9EYcBK/n9z9OZOOBZR1PkP+dlQ4Fn1Y
         aRIENj75PjIo18JPDOh0Dqjb3fKryTWpInI7x+d2IUfGESn9mDRTPw+A7yy8jV/44VyY
         8HMR6YgzS80gMd1kDJSUhD8Y1H7AcXdmB70H/zKFoijLQxMhmJODCYK30vPiANMs67zK
         zXu6kdRkwK4w81OLmqFx6PatgY94kwzaZcn011gTrOXAyNeLnAw3UCvcVaVxr9p38WGC
         pbfDQ4jJUZLa16yFFIDCzxBmRhufuM2whP4HhN5zlxRyGKfxMvbAyPgHBD8EuqMJoPjl
         x2yw==
X-Gm-Message-State: AAQBX9diQbfXFk76BTVc5s1StTSE/KzoV3n0QwrgYm6+RFl0Jcx6Bk+6
	5xM6aza2b/ebyLMtX9Kvibj1pA==
X-Google-Smtp-Source: AKy350Z2g5HU4veXBC7Toq8RA9rtH8Q1iR5eYOw+R7glcJ7QcsbUpI4ltAdprqNvOZ0Fubk0bmrqFw==
X-Received: by 2002:a17:907:d68e:b0:94c:dcac:4b24 with SMTP id wf14-20020a170907d68e00b0094cdcac4b24mr5527109ejc.49.1681463696130;
        Fri, 14 Apr 2023 02:14:56 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id hq22-20020a1709073f1600b009486efb9192sm2221592ejc.11.2023.04.14.02.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 02:14:55 -0700 (PDT)
Date: Fri, 14 Apr 2023 11:14:54 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Vincent Chen <vincent.chen@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH] riscv: mm: execute local TLB flush after populating
 vmemmap
Message-ID: <p6zxwbthpyepr4tlheifd5s5rwqe2kpc7mmgjtz5ffzftc7bmt@ku57j4x7kcyr>
References: <20230414081605.471375-1-vincent.chen@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230414081605.471375-1-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_021458_970652_25790C7B 
X-CRM114-Status: GOOD (  21.62  )
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

On Fri, Apr 14, 2023 at 04:16:05PM +0800, Vincent Chen wrote:
> The spare_init() calls memmap_populate() many times to create VA to PA
> mapping for the VMEMMAP area, where all "strcut page" are located once

struct

> CONFIG_SPARSEMEM_VMEMMAP is defined. These "struct page" are later
> initialized in the zone_sizes_init() function. However, during this
> process, no sfence.vma instruction is executed for this VMEMMAP area.
> This omission may cause the hart to fail to perform page table work

s/work/walk/ ?

> because some data related to the address translation is invisible to the
> hart. To solve this issue, the local_flush_tlb_kernel_range() is called
> right after the spare_init() to execute a sfence.vma instruction for the
> VMEMMAP area, ensuring that all data related to the address translation
> is visible to the hart.
> 
> Fixes: d95f1a542c3d ("RISC-V: Implement sparsemem")
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/tlbflush.h | 7 +++++++
>  arch/riscv/mm/init.c              | 5 +++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index a09196f8de68..f9d3712bd93b 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -61,4 +61,11 @@ static inline void flush_tlb_kernel_range(unsigned long start,
>  	flush_tlb_all();
>  }
>  
> +/* Flush a range of kernel pages without broadcasting */
> +static inline void local_flush_tlb_kernel_range(unsigned long start,
> +						unsigned long end)
> +{
> +	local_flush_tlb_all();
> +}
> +
>  #endif /* _ASM_RISCV_TLBFLUSH_H */
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 478d6763a01a..5bd96f6c8f19 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1231,6 +1231,10 @@ void __init misc_mem_init(void)
>  	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
>  	arch_numa_init();
>  	sparse_init();
> +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> +	/* The entire VMEMMAP region has been propulated. Flush TLB for this region */

populated

> +	local_flush_tlb_kernel_range(VMEMMAP_START, VMEMMAP_END);
> +#endif
>  	zone_sizes_init();
>  	reserve_crashkernel();
>  	memblock_dump_all();
> @@ -1240,6 +1244,7 @@ void __init misc_mem_init(void)
>  int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>  			       struct vmem_altmap *altmap)
>  {
> +	/* Defer the required TLB flush until the entire VMEMMAP region has been populated */
>  	return vmemmap_populate_basepages(start, end, node, NULL);
>  }
>  #endif
> -- 
> 2.25.1
> 

Besides the typos,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

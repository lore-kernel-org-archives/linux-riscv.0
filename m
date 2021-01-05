Return-Path: <SRS0=oZIk=GI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66E6C433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jan 2021 12:07:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DDC222A84
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jan 2021 12:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DDC222A84
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hXMYfze9IL+LiyuQFcjX11kSygudoF6lppp4PPqK184=; b=lD3dkajhCUAt5sGdQJGhAIiLb
	HL6kVikTUkpx+Fw+XjJoFFAGqviH0pP7Qti1mnietHVaBLdRDsj4skf3HTy42OEupBRmz2/Im82so
	RSdEKGgDDXZA6txQ+NXJxeCuFSsjgAkjKWL/g5RpO2HwPOVJ5bvjaYFGaDN2XCTRKpK1FKLQhiohg
	wVMe6rFcLYe0deCj6AgMtrGibEwIlKtmBrOmulcZ4Sbt5zO7iH/AaoXQ8Qsa+CVEizD+FwpOgOxy2
	Vr4nENfGWSRUm52rFPPtDQ6Pf7j0L/BXECnYzy0RQB/X35hucSx+sQso8xi4EqlVjBAZU0onpUEy4
	vV/d7mMWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwl6x-0001sN-Es; Tue, 05 Jan 2021 12:06:51 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwl6u-0001s0-8i
 for linux-riscv@lists.infradead.org; Tue, 05 Jan 2021 12:06:49 +0000
Received: by mail-wr1-x430.google.com with SMTP id i9so35938788wrc.4
 for <linux-riscv@lists.infradead.org>; Tue, 05 Jan 2021 04:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AGKjJEiSSy2izG4ujkGcD0moiRRni/L2Q0MG/wluNhc=;
 b=mtV8E91wND1aKNfDji9QLYJPBQMWC8mHS1I4adE/gfWGyS6lubB7mDXao3j2RV8Gmu
 uvYlNcWrA9nXdzJsCVF3yIA5OIQ7xTm3zkjLJEsotudU5JnoWOVITaPrlrGq82UcKjTk
 SfuYEppZJ5ULuLdMAJN9HJZydDXSWYqNIVljiT911GOBsYlN6+r3kLua9KF6YQQ5TNd5
 EiqCuJ7lj7GlkpGGr+YxlDZgMgYBCDn3+kQmmPMEA1COtJGyh3o4GoSX50Cpk3fWNeIN
 vUK5NHkPWGI6ZLGwtDcGIvRktep2OxxEdLXK+aAgJeaBrAtZdI9msB7it8mYfk2uz9vE
 bsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AGKjJEiSSy2izG4ujkGcD0moiRRni/L2Q0MG/wluNhc=;
 b=BG0HcscPmRqIfLFn6abhPmnbO9C83IbCU3t4EyfcnbEqUQSqIOUaAfuJfiFaC30MDy
 0HuFl6890hzIxicXA+A/aGi2SFfnUHAgiDmo0Lu8RL0VrCOb1OXMy3EeowwdCZc98mT9
 8eZS/W83vg6ZxxTQHJSLmw7YoXKfIk9j5hcsQlBQD3N3sNcgqHxlN2bhLyoeEInE+UV0
 S+ffB4D8xxLFvF3oEbgQI4US4pD+A+aitSNlQijzWKDT3HxIre+X3F99QX5EacL4F98H
 nYamW/V/Xu9BSjkMYrHhE+lR0yjsd0+PL8InryFw9M8K1mzfeSPkxMacOLHQ8IEb3+Qs
 BaIw==
X-Gm-Message-State: AOAM530iRhGfYkDrqW5hXXN46tgVuu77j1wJzgOJ6j3HqXYqEscNG0KL
 vtt+IDw079orQdRk4rgJSRYOnQUkCi9sxd2LpNrS6A==
X-Google-Smtp-Source: ABdhPJzFWenLt+B+f1yF1feYSMrXNb+Mp6Ub9dRfYe/spk0aF2jGgTIUeiE6CfQ/l7BuWWVxGTeJ+rIJPBN3zlzSg3g=
X-Received: by 2002:adf:c18d:: with SMTP id x13mr83182459wre.128.1609848406611; 
 Tue, 05 Jan 2021 04:06:46 -0800 (PST)
MIME-Version: 1.0
References: <20210104195840.1593-1-alex@ghiti.fr>
 <20210104195840.1593-5-alex@ghiti.fr>
In-Reply-To: <20210104195840.1593-5-alex@ghiti.fr>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Jan 2021 17:36:35 +0530
Message-ID: <CAAhSdy0Diu3nD+QswUUr7Ox+FdZGRedivJ6gNU2dYUCaOx8KjA@mail.gmail.com>
Subject: Re: [RFC PATCH 04/12] riscv: Allow to dynamically define VA_BITS
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_070648_344017_3871E4E0 
X-CRM114-Status: GOOD (  20.38  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-efi <linux-efi@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 5, 2021 at 1:33 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> With 4-level page table folding at runtime, we don't know at compile time
> the size of the virtual address space so we must set VA_BITS dynamically
> so that sparsemem reserves the right amount of memory for struct pages.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/Kconfig                 | 10 ----------
>  arch/riscv/include/asm/pgtable.h   | 11 +++++++++--
>  arch/riscv/include/asm/sparsemem.h |  6 +++++-
>  3 files changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 44377fd7860e..2979a44103be 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -122,16 +122,6 @@ config ZONE_DMA32
>         bool
>         default y if 64BIT
>
> -config VA_BITS
> -       int
> -       default 32 if 32BIT
> -       default 39 if 64BIT
> -
> -config PA_BITS
> -       int
> -       default 34 if 32BIT
> -       default 56 if 64BIT
> -
>  config PAGE_OFFSET
>         hex
>         default 0xC0000000 if 32BIT && MAXPHYSMEM_2GB
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 102b728ca146..c7973bfd65bc 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -43,8 +43,14 @@
>   * struct pages to map half the virtual address space. Then
>   * position vmemmap directly below the VMALLOC region.
>   */
> +#ifdef CONFIG_64BIT
> +#define VA_BITS                39
> +#else
> +#define VA_BITS                32
> +#endif
> +
>  #define VMEMMAP_SHIFT \
> -       (CONFIG_VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
> +       (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
>  #define VMEMMAP_SIZE   BIT(VMEMMAP_SHIFT)
>  #define VMEMMAP_END    (VMALLOC_START - 1)
>  #define VMEMMAP_START  (VMALLOC_START - VMEMMAP_SIZE)
> @@ -83,6 +89,7 @@
>  #endif /* CONFIG_64BIT */
>
>  #ifdef CONFIG_MMU
> +
>  /* Number of entries in the page global directory */
>  #define PTRS_PER_PGD    (PAGE_SIZE / sizeof(pgd_t))
>  /* Number of entries in the page table */
> @@ -453,7 +460,7 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>   * and give the kernel the other (upper) half.
>   */
>  #ifdef CONFIG_64BIT
> -#define KERN_VIRT_START        (-(BIT(CONFIG_VA_BITS)) + TASK_SIZE)
> +#define KERN_VIRT_START        (-(BIT(VA_BITS)) + TASK_SIZE)
>  #else
>  #define KERN_VIRT_START        FIXADDR_START
>  #endif
> diff --git a/arch/riscv/include/asm/sparsemem.h b/arch/riscv/include/asm/sparsemem.h
> index 45a7018a8118..63acaecc3374 100644
> --- a/arch/riscv/include/asm/sparsemem.h
> +++ b/arch/riscv/include/asm/sparsemem.h
> @@ -4,7 +4,11 @@
>  #define _ASM_RISCV_SPARSEMEM_H
>
>  #ifdef CONFIG_SPARSEMEM
> -#define MAX_PHYSMEM_BITS       CONFIG_PA_BITS
> +#ifdef CONFIG_64BIT
> +#define MAX_PHYSMEM_BITS       56
> +#else
> +#define MAX_PHYSMEM_BITS       34
> +#endif /* CONFIG_64BIT */
>  #define SECTION_SIZE_BITS      27
>  #endif /* CONFIG_SPARSEMEM */
>
> --
> 2.20.1
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

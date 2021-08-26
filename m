Return-Path: <SRS0=v94U=NR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28830C432BE
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 04:48:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA06060EFE
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 04:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA06060EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4dknoe41WwrY1iT8Vhn+0cNSueZBW6XWCNkUOI223fU=; b=yaFcATFFvKPlsVwSYvEvIj+5VJ
	HyKinsNjpeN1d0S+q1JL6PuhUp5oBfSfqOk27yisvPFJdgZEgYlTyFc9lowbCPgn2l3NhoyY9qjcw
	E6WWC6LtzEtMYio8gFrRZnMRkZuNtuabhVe36aEd2JdM69l6nmg512uhMtWaLA69OEu5+eV7ee25K
	fbXmmXP5BXwjXiELeKNiIxh5YX6eUuWdlRbWbCH+Mxs7VLmLvHMvz9Roiehjpv6kbl3It6TsMN6mo
	Qk7U7gUk6/Si8SlB26fsvX2pQwKEfBDZbNakKYQV/bdmM9elJ3rIRwL05A/4EpZH9sCfBt5+hK1/b
	Low17TgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ7JT-00996N-9X; Thu, 26 Aug 2021 04:48:27 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ7JC-00995h-3v
 for linux-riscv@lists.infradead.org; Thu, 26 Aug 2021 04:48:11 +0000
Received: by mail-pj1-x102f.google.com with SMTP id oa17so1383623pjb.1
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 21:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=CVByhjP1i2oA1KBEUJykBzcIy3uSqCrwHbgIyy+OMWM=;
 b=zhQLVwXtUQ1F9xPIqwJobzGM3h5hp6Kb+jAqR0TufspBhPHjmVsD+AGl+hG/tYR4S0
 LeADLT1tE+KRKccHrTnRTbTAvwjXEkHM8RT2b3peDV1kyJ243rn8yDekCV/Qsd8dAGQq
 ndSBRt8LHCjXK131bSl7A4HgruAK5pNgjiNYHCVovnYjEPvQzTknX/2XuQ9uMo4XC/xd
 xIN7YAx5mAIPCXP8wwVvnD5GI7aVu9w5hnqyJn1sfPsrWjK3plgphoKn3wQ7qxhzgHSe
 sny85sDvMCZ9gZh9akVe7bXNh5clX+Amj8nHwO4mGXDK2poM77d+SKYpjToRrs5iUGJX
 4BBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=CVByhjP1i2oA1KBEUJykBzcIy3uSqCrwHbgIyy+OMWM=;
 b=Tr8LPOS7SQJWDWfFziDRnDmujG/p4RIyZSxGxelnKytSN40Bk/G41kFJs2VM4IBgrq
 o6Z8k9xi6CVHbYu8U9tXPo6/5chc+aIogCIOkIdKyN8x9ECB+Tj+0x1K22yTqPGpPoya
 ohRxkIYl2oJJOC4YxQ5g0EO4uf/K/uTYJb01+yLKRKX/qh3ix1VdQgpdDZlU3lyNavLY
 q+ZgPFVQPgoRzfUZz2OVWvGn5pG2PbUHNbLVfuz0gRxRNLkN8Gmu5rkkHGs/sErzWNyA
 Hf1yoswXK1NYG8tpe2QVeEDA3uXe6Pr1DAjmhkMFLx5ypTXFW9/VWfwj6GUN/9EraONr
 nJVg==
X-Gm-Message-State: AOAM531erAMwY+Q7/TMpPQpO4X59fNE7DfJoOgG/Nl/It+z6tGB76eWu
 E29ePCSy+wekiomAOCLK85xZ1A==
X-Google-Smtp-Source: ABdhPJwW/hCGfEDMPcpzaroks8UhmWJ1z7TQk2gskjWvpBtS/EGSHzKUSsDiTTWuk0fFJ3MUQWGHMA==
X-Received: by 2002:a17:902:f552:b029:12d:3d11:4ff1 with SMTP id
 h18-20020a170902f552b029012d3d114ff1mr1709114plf.1.1629953288396; 
 Wed, 25 Aug 2021 21:48:08 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q3sm1655685pgf.18.2021.08.25.21.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 21:48:07 -0700 (PDT)
Date: Wed, 25 Aug 2021 21:48:07 -0700 (PDT)
X-Google-Original-Date: Wed, 25 Aug 2021 21:48:03 PDT (-0700)
Subject: Re: [PATCH -next] riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT
In-Reply-To: <20210805113837.805805-1-liushixin2@huawei.com>
CC: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, liushixin2@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: liushixin2@huawei.com
Message-ID: <mhng-57cbc077-dfa6-48a7-a29d-b27862e1e800@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_214810_264875_3B2FE68A 
X-CRM114-Status: GOOD (  24.37  )
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

On Thu, 05 Aug 2021 04:38:37 PDT (-0700), liushixin2@huawei.com wrote:
> This sets the HAVE_ARCH_HUGE_VMAP option. Enable pmd vmap support and
> define the required page table functions(Currently, riscv has only
> three-level page tables support for 64BIT).
>
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
>  .../features/vm/huge-vmap/arch-support.txt    |  2 +-
>  arch/riscv/Kconfig                            |  1 +
>  arch/riscv/include/asm/vmalloc.h              | 12 +++++
>  arch/riscv/mm/Makefile                        |  1 +
>  arch/riscv/mm/pgtable.c                       | 53 +++++++++++++++++++
>  5 files changed, 68 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/mm/pgtable.c
>
> diff --git a/Documentation/features/vm/huge-vmap/arch-support.txt b/Documentation/features/vm/huge-vmap/arch-support.txt
> index 439fd9069b8b..0ff394acc9cf 100644
> --- a/Documentation/features/vm/huge-vmap/arch-support.txt
> +++ b/Documentation/features/vm/huge-vmap/arch-support.txt
> @@ -22,7 +22,7 @@
>      |    openrisc: | TODO |
>      |      parisc: | TODO |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: | TODO |
>      |          sh: | TODO |
>      |       sparc: | TODO |
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 8fcceb8eda07..94cc2a254773 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -61,6 +61,7 @@ config RISCV
>  	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
>  	select HANDLE_DOMAIN_IRQ
>  	select HAVE_ARCH_AUDITSYSCALL
> +	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
>  	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
>  	select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
>  	select HAVE_ARCH_KASAN if MMU && 64BIT
> diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vmalloc.h
> index ff9abc00d139..8f17f421f80c 100644
> --- a/arch/riscv/include/asm/vmalloc.h
> +++ b/arch/riscv/include/asm/vmalloc.h
> @@ -1,4 +1,16 @@
>  #ifndef _ASM_RISCV_VMALLOC_H
>  #define _ASM_RISCV_VMALLOC_H
>
> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
> +
> +#define IOREMAP_MAX_ORDER (PMD_SHIFT)
> +
> +#define arch_vmap_pmd_supported	arch_vmap_pmd_supported
> +static inline bool __init arch_vmap_pmd_supported(pgprot_t prot)
> +{
> +	return true;
> +}
> +
> +#endif
> +
>  #endif /* _ASM_RISCV_VMALLOC_H */
> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> index 7ebaef10ea1b..f932b4d69946 100644
> --- a/arch/riscv/mm/Makefile
> +++ b/arch/riscv/mm/Makefile
> @@ -13,6 +13,7 @@ obj-y += extable.o
>  obj-$(CONFIG_MMU) += fault.o pageattr.o
>  obj-y += cacheflush.o
>  obj-y += context.o
> +obj-y += pgtable.o
>
>  ifeq ($(CONFIG_MMU),y)
>  obj-$(CONFIG_SMP) += tlbflush.o
> diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
> new file mode 100644
> index 000000000000..f68dd2b71dce
> --- /dev/null
> +++ b/arch/riscv/mm/pgtable.c
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <asm/pgalloc.h>
> +#include <linux/gfp.h>
> +#include <linux/kernel.h>
> +#include <linux/pgtable.h>
> +
> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
> +
> +int pud_set_huge(pud_t *pud, phys_addr_t phys, pgprot_t prot)
> +{
> +	return 0;
> +}
> +
> +int pud_clear_huge(pud_t *pud)
> +{
> +	return 0;
> +}
> +
> +int pud_free_pmd_page(pud_t *pud, unsigned long addr)
> +{
> +	return 0;
> +}

Do we actually need the PUD helpers?  I'd prefer to avoid adding these 
unimplemented stubs, IIUC the other architectures are relying on the 
generic implementations (which are themselves stubs) for configurations 
that don't have PUDs.

> +int pmd_set_huge(pmd_t *pmd, phys_addr_t phys, pgprot_t prot)
> +{
> +	pmd_t new_pmd = pfn_pmd(__phys_to_pfn(phys), prot);
> +
> +	set_pmd(pmd, new_pmd);
> +	return 1;
> +}
> +
> +int pmd_clear_huge(pmd_t *pmd)
> +{
> +	if (!pmd_leaf(READ_ONCE(*pmd)))
> +		return 0;
> +	pmd_clear(pmd);
> +	return 1;
> +}
> +
> +int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
> +{
> +	pte_t *pte;
> +
> +	pte = (pte_t *)pmd_page_vaddr(*pmd);
> +	pmd_clear(pmd);
> +
> +	flush_tlb_kernel_range(addr, addr + PMD_SIZE);
> +	pte_free_kernel(NULL, pte);
> +	return 1;
> +}
> +
> +#endif /* CONFIG_HAVE_ARCH_HUGE_VMAP */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

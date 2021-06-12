Return-Path: <SRS0=I7Ft=LG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DB4C48BCF
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 16:58:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE2DE611CB
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 16:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE2DE611CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=539rp7aN8F44WhcheV9KQItN+hj/cuHm4y1yiEXret8=; b=CR44WBcY+TnwFHbDkfIvyrhTZG
	ZJfhUk7ubB69agvIbpIk/jXyPUXZvx9RnfYXRn9EN9GLJfAdY16FWiPuiP2oBYbBd9pMQE8t+aTY/
	WzT0pUxrfTo2Aff1x2VmnpzadrSlb0icQBnd50KQbytQnGzudQyEb7f41Bt1vgPwXWLPlWs1Z/Zw+
	2tjrVIZ609pNygZskqfC/7/f1LhAHprJMz823vHUN8iSaWiG1+R9CIxj7hbLSAWZTT/wstPyb9mnD
	DgSpHiqgnF3D+pHQddnQ92Tm2AtehhYwn4iX0kD1L9LfK3RtRupoAw6gPR+ro2izkFkpU1f6Ugv8k
	yyqkgcDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ls6xb-008rZ6-Uf; Sat, 12 Jun 2021 16:58:15 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ls6xW-008rYT-Hd
 for linux-riscv@lists.infradead.org; Sat, 12 Jun 2021 16:58:12 +0000
Received: by mail-pl1-x635.google.com with SMTP id x10so4400691plg.3
 for <linux-riscv@lists.infradead.org>; Sat, 12 Jun 2021 09:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=BkJ9VfaVDWckj1qLY318bk4f+lp9IhMIKatyOGiiDZQ=;
 b=gHWhfC/FFvWaZ0SZAUGyB42W55ECJuwoOO3WjN+Qv9Uk6bua9/Z7werOn2eP+RgQ5p
 VihbNPczLeWWaHWl5zEed2Q7saGu50ju0beRqZZ72s/1/xJEugRzA+GntXI+r4U4V4dE
 xlWnWGLH0L74JSQbrkNoThogBTml3nCJkyNEyrmP22YFJph4jFgjauJGfXSNZ2FUffs4
 JSylKfqNfua3tzTzvGYBWYmunmg6vWQoLGGRgjUyofmv0J5HbNMi0pRC1wYk+9YYiy/n
 5Tmkser+R/MGTkr4El5dJIs4WFKmY+c6TT4jVttGrYy6J8BD2t1i8YakGUOAmD3d7s/W
 4J9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=BkJ9VfaVDWckj1qLY318bk4f+lp9IhMIKatyOGiiDZQ=;
 b=jWWSEv/k7hcnOoBLnzj2nJGu3VKwDEv0jhWgw4klzBEx/qG7C0khmIdH/Sh+n68T9F
 JG+ss6DXL97c8RHyFGyGeqjeExRWtfDbUbEAzqmdHDKrVD5vaHrBYAHHUU+9sXOAQeVH
 fIpIaISNZqAt7/fXn8quMYat/i4eztRL5NWZnYxV+un1/61YePA+cmef2kSdcxj0qpgZ
 Aqsn/ICA/GDQO93uduCvKXB67cEtTsnFU2GymhLjTPybsItd4j39g5FjejyFn4Uf6eaF
 HkZM93PQtHGuKZEu2hk2UEUNN/kNw5RPRSvJSGqFnTI/a7dmAnuzic3RA/BJt5P9IGXd
 OIsg==
X-Gm-Message-State: AOAM533sgwcyPq4gqXnj8D2hWhuXKdR/Jx9Y4oMEM6xjMxES6hVruelt
 qyiNL0q0fxhITofCiFooVYLmJQ==
X-Google-Smtp-Source: ABdhPJz+5Xx/cipqmT511r0mFGMwVv3NgngF3Lbu8RkxfM3aIFngBHOQ0hTAY7Ex2NfvSKK3jbI8kw==
X-Received: by 2002:a17:902:6b04:b029:10d:8c9e:5f56 with SMTP id
 o4-20020a1709026b04b029010d8c9e5f56mr9207024plk.8.1623517089386; 
 Sat, 12 Jun 2021 09:58:09 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id bg16sm2236899pjb.16.2021.06.12.09.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jun 2021 09:58:08 -0700 (PDT)
Date: Sat, 12 Jun 2021 09:58:08 -0700 (PDT)
X-Google-Original-Date: Sat, 12 Jun 2021 09:58:06 PDT (-0700)
Subject: Re: [PATCH -next] riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT
In-Reply-To: <20210605054838.2017817-1-liushixin2@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liushixin2@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: liushixin2@huawei.com
Message-ID: <mhng-20fb7613-b83d-45a7-a2b0-5a6734ead69e@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_095810_614350_EB5D2E38 
X-CRM114-Status: GOOD (  21.09  )
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

On Fri, 04 Jun 2021 22:48:37 PDT (-0700), liushixin2@huawei.com wrote:
> This sets the HAVE_ARCH_HUGE_VMAP option. Enable pmd vmap support and
> define the required page table functions(Currently, riscv has only
> three-level page tables support for 64BIT).
>
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
>  arch/riscv/Kconfig               |  1 +
>  arch/riscv/include/asm/vmalloc.h | 12 ++++++++++
>  arch/riscv/mm/Makefile           |  1 +
>  arch/riscv/mm/pgtable.c          | 40 ++++++++++++++++++++++++++++++++
>  4 files changed, 54 insertions(+)
>  create mode 100644 arch/riscv/mm/pgtable.c
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 4c0bfb2569e9..fb3c48fa96c1 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -61,6 +61,7 @@ config RISCV
>  	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
>  	select HANDLE_DOMAIN_IRQ
>  	select HAVE_ARCH_AUDITSYSCALL
> +	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
>  	select HAVE_ARCH_JUMP_LABEL
>  	select HAVE_ARCH_JUMP_LABEL_RELATIVE
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
> index 000000000000..738dc6f3530f
> --- /dev/null
> +++ b/arch/riscv/mm/pgtable.c
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <asm/pgalloc.h>
> +#include <linux/gfp.h>
> +#include <linux/kernel.h>
> +#include <linux/pgtable.h>
> +
> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
> +
> +#ifndef __PAGETABLE_PMD_FOLDED
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
> +#endif
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

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

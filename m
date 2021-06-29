Return-Path: <SRS0=OKTc=LX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E686C11F66
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jun 2021 13:37:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7935861D8E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jun 2021 13:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7935861D8E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/qCmMKhSp13nVxCQ1Y/Ban9b38V18bq1pMQyI8UmXY=; b=buiaBciucaK1ZV6HzKsWUrL63J
	nz2Z/CZ3NKWWNk6GegsCUz6Ykl8Ln3dpT8HJn/iNzhyEjKuhh0QJssFL9ik22aKwDGhBrATatvANZ
	UeI6NyX6HtmHHgVosQIkHtqfIfOSRl8gthhxw0zhRqb1m9kcVTt/aWAt9Rj0GtbinwBciRZeK4x1a
	0gcOIy4KDEes3iTkTE9StqPOGJ440rGVTzxDXnJ9Y7lxmbtYHQyWoh5gW17wjXyC3/zIY1lUBUY/X
	UyxbQygmkHFeqpd+dBma8BxEmZuMisFv7ylHheE3R0k+hwVSG6iclc+DEV1eSv1eF7hpnnZMpS79c
	g9f3scFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyDuT-00B521-He; Tue, 29 Jun 2021 13:36:17 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyDMY-00AvYJ-QR
 for linux-riscv@lists.infradead.org; Tue, 29 Jun 2021 13:01:17 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id A9C21240013;
 Tue, 29 Jun 2021 13:01:05 +0000 (UTC)
Subject: Re: [PATCH -next] riscv: mm: remove redundant trampoline PGD for 64bit
To: Nanyong Sun <sunnanyong@huawei.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, anup.patel@wdc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 palmerdabbelt@google.com, atish.patra@wdc.com, wangkefeng.wang@huawei.com
References: <20210527144819.12101-1-sunnanyong@huawei.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <33f93026-cbd2-acd4-e737-c744207f82f2@ghiti.fr>
Date: Tue, 29 Jun 2021 15:01:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210527144819.12101-1-sunnanyong@huawei.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_060115_206576_7B0F673E 
X-CRM114-Status: GOOD (  31.81  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Nanyong,

Le 27/05/2021 =E0 16:48, Nanyong Sun a =E9crit=A0:
> Remove redundant trampoline PGD for 64bit and add more comment
> for why 32bit systems need trampoline PGD.
> =

> There was a patch and discussion similar to this,refer to
> the link [1][2].
> =

> The trampoline PGD is redundant for 64bit systems because:
> 1. The early PGD covers the entire kernel mapping. Directly
> loading early PGD can achieve the result in boot stage.
> A more trampoline PGD makes code hard to understand.
> 2. Directly loading early PGD is safe in 64bit systems since
> the kernel virtual address starts as 0xFFFFxxxxxxxxxxxx,
> which has a very big gap with RAM address.It won't fall into
> the corner case that 32bit system worrys.
> 3. Remove redundant trampoline PGD can benefit to code maintaince,
> because 64bit systems have more page table levels.For example:
> If we want to support SV48 which has 4 page table levels, we have
> to add a trampoline_pud and insert it before trampoline_pmd.

I do agree with your last point about code maintenance and this would be =

a welcome improvement before I respin my sv48 series.

Some comments below though.

> =

> Reference link:
> [1]https://lore.kernel.org/linux-riscv/20190325092234.5451-4-anup.patel@w=
dc.com/
> [2]https://lkml.org/lkml/2019/3/28/147
> =

> Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>
> ---
>   arch/riscv/kernel/head.S | 13 +++++++++++--
>   arch/riscv/mm/init.c     | 21 +++++++--------------
>   2 files changed, 18 insertions(+), 16 deletions(-)
> =

> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 89cc58ab52b4..1897b17c5fcc 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -93,12 +93,18 @@ relocate:
>   	add a2, a2, a1
>   	csrw CSR_TVEC, a2

This is not needed in 64-bit then.

>   =

> -	/* Compute satp for kernel page tables, but don't load it yet */
> +	/* Compute satp for kernel page tables */
>   	srl a2, a0, PAGE_SHIFT
>   	li a1, SATP_MODE
>   	or a2, a2, a1
> -
> +#ifdef CONFIG_64BIT
> +	/* Load kernel page directory */
> +	sfence.vma
> +	csrw CSR_SATP, a2
> +#else
>   	/*
> +	 * 32bit system need a trampoline to handle a corner case where

s/system/systems or s/need/needs.

> +	 * load address range overlaps kernel virtual address range.
>   	 * Load trampoline page directory, which will cause us to trap to
>   	 * stvec if VA !=3D PA, or simply fall through if VA =3D=3D PA.  We ne=
ed a
>   	 * full fence here because setup_vm() just wrote these PTEs and we need
> @@ -110,6 +116,7 @@ relocate:
>   	or a0, a0, a1
>   	sfence.vma
>   	csrw CSR_SATP, a0
> +#endif /* CONFIG_64BIT */
>   .align 2
>   1:
>   	/* Set trap vector to spin forever to help debug */
> @@ -122,6 +129,7 @@ relocate:
>   	la gp, __global_pointer$
>   .option pop
>   =

> +#ifdef CONFIG_32BIT
>   	/*
>   	 * Switch to kernel page tables.  A full fence is necessary in order to
>   	 * avoid using the trampoline translations, which are only correct for
> @@ -130,6 +138,7 @@ relocate:
>   	 */
>   	csrw CSR_SATP, a2
>   	sfence.vma
> +#endif /* CONFIG_32BIT */
> =


I would have done something like that instead, in order to avoid to copy =

the code that loads the kernel page table:


diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 89cc58ab52b4..1251f4d201a8 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -98,18 +98,23 @@ relocate:
         li a1, SATP_MODE
         or a2, a2, a1

+       /*
+        * We need a full fence here because setup_vm() just wrote these =

PTEs
+        * and we need to ensure the new translations are in use.
+        */
+       sfence.vma
+
+#ifndef CONFIG_64BIT
         /*
          * Load trampoline page directory, which will cause us to trap to
-        * stvec if VA !=3D PA, or simply fall through if VA =3D=3D PA.  We=
 need a
-        * full fence here because setup_vm() just wrote these PTEs and =

we need
-        * to ensure the new translations are in use.
+        * stvec if VA !=3D PA, or simply fall through if VA =3D=3D PA.
          */
         la a0, trampoline_pg_dir
         XIP_FIXUP_OFFSET a0
         srl a0, a0, PAGE_SHIFT
         or a0, a0, a1
-       sfence.vma
         csrw CSR_SATP, a0
+#endif


>   	ret
>   #endif /* CONFIG_MMU */
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 11b61bea0c4d..b7226ac2d04f 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -210,13 +210,17 @@ unsigned long pfn_base __ro_after_init;
>   EXPORT_SYMBOL(pfn_base);
>   =

>   pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> +#ifdef CONFIG_32BIT
>   pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> +#endif /* CONFIG_32BIT */
>   pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
>   =

>   pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>   =

>   #ifdef CONFIG_XIP_KERNEL
> +#ifdef CONFIG_32BIT
>   #define trampoline_pg_dir      ((pgd_t *)XIP_FIXUP(trampoline_pg_dir))
> +#endif /* CONFIG_32BIT */
>   #define fixmap_pte             ((pte_t *)XIP_FIXUP(fixmap_pte))
>   #define early_pg_dir           ((pgd_t *)XIP_FIXUP(early_pg_dir))
>   #endif /* CONFIG_XIP_KERNEL */
> @@ -291,13 +295,11 @@ static void __init create_pte_mapping(pte_t *ptep,
>   =

>   #ifndef __PAGETABLE_PMD_FOLDED
>   =

> -pmd_t trampoline_pmd[PTRS_PER_PMD] __page_aligned_bss;
>   pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
>   pmd_t early_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
>   pmd_t early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
>   =

>   #ifdef CONFIG_XIP_KERNEL
> -#define trampoline_pmd ((pmd_t *)XIP_FIXUP(trampoline_pmd))
>   #define fixmap_pmd     ((pmd_t *)XIP_FIXUP(fixmap_pmd))
>   #define early_pmd      ((pmd_t *)XIP_FIXUP(early_pmd))
>   #endif /* CONFIG_XIP_KERNEL */
> @@ -543,21 +545,12 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>   	/* Setup fixmap PMD */
>   	create_pmd_mapping(fixmap_pmd, FIXADDR_START,
>   			   (uintptr_t)fixmap_pte, PMD_SIZE, PAGE_TABLE);
> -	/* Setup trampoline PGD and PMD */
> -	create_pgd_mapping(trampoline_pg_dir, kernel_virt_addr,
> -			   (uintptr_t)trampoline_pmd, PGDIR_SIZE, PAGE_TABLE);
> -#ifdef CONFIG_XIP_KERNEL
> -	create_pmd_mapping(trampoline_pmd, kernel_virt_addr,
> -			   xiprom, PMD_SIZE, PAGE_KERNEL_EXEC);
> -#else
> -	create_pmd_mapping(trampoline_pmd, kernel_virt_addr,
> -			   load_pa, PMD_SIZE, PAGE_KERNEL_EXEC);
> -#endif
> -#else
> +#endif /* __PAGETABLE_PMD_FOLDED */
> +#ifdef CONFIG_32BIT

Why did you change the #else for an #ifdef CONFIG_32BIT? =

__PAGETABLE_PMD_FOLDED <=3D> CONFIG_32BIT anyway.

>   	/* Setup trampoline PGD */
>   	create_pgd_mapping(trampoline_pg_dir, kernel_virt_addr,
>   			   load_pa, PGDIR_SIZE, PAGE_KERNEL_EXEC);
> -#endif
> +#endif /* CONFIG_32BIT */

If you use IS_ENABLED(CONFIG_32BIT) instead of #ifdef (and maybe rather =

CONFIG_64BIT as this is the config that is widely used to distinguish =

between both), that would avoid the #ifdef around trampoline_pg_dir =

which would be even more readable.

>   =

>   	/*
>   	 * Setup early PGD covering entire kernel which will allow
> =


Thanks,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

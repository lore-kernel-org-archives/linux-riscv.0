Return-Path: <SRS0=+8gn=2G=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF48C2D0BF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2019 22:04:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D26CE21739
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2019 22:04:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JxN6FEfM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ukTiNvyg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D26CE21739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OcaMGxlrC1ZMOva0UGfFnxr9HfZ6ixW+3vJ8ufw+WhQ=; b=JxN6FEfM31+X2n5PQ/Qr3yXm8
	8LIdmzotmai+GVMFvvBqh8EMuRza1fPWZa09TOJnrsNBHVB44Xd8fUb6pM7mimES0UikfnHyr+jBu
	fsOr2BMQPUKew02iu/MU4vLs1jkskrVk6vm0A69J/KlX7/7bNV4OvjxGvpI8ykxnIJ1VA0w4bSxvg
	ZxQiHqE8lhtaS2buJ8HsXOVXDyCYcrNGxH1b+lUZ0xoraGVWShE9ZcLs8M7NCNOEFX9GjnO645Zz5
	Co9IQnegavNxFJc4gaU9wk5Nu+73XaPPIPmILdemgWXgM/WLfsvv6IZ+FZ2d4YtQtCHIenE1uycgQ
	NiE79/slg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igyTN-0000UV-RW; Mon, 16 Dec 2019 22:04:13 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igyTK-0000U7-Qx
 for linux-riscv@lists.infradead.org; Mon, 16 Dec 2019 22:04:12 +0000
Received: by mail-wr1-x444.google.com with SMTP id w15so9156857wru.4
 for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2019 14:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OcaMGxlrC1ZMOva0UGfFnxr9HfZ6ixW+3vJ8ufw+WhQ=;
 b=ukTiNvygZ5u+EeL1hpgcFtxuL7Z34tbI4uhe68+7FNUaKFF3IFrbQxcRyyThNqt7fz
 U99e4cHxy1Dn8Pf/j/qTzncx1DRduWFOts08kiEVbVlymNSLIg0EFpYOlgxAzV/FAd4Q
 d1ksLa+054LseS4RAS3psrSLTylNNUjI++wHFrclrjKpkULTi11STweuj0MTWNZ7m/QN
 rPldetgj1J5EHLi4Lcg2gieZV0nfS0mmBu5aQSip4WjkMsR4FC2KX+Fkz16rxcvkDwUK
 sBvnmAU9fYOJA58Lfc0zwnkTvLOsm7n9gSPESUAmE0nTD+tXyNhvd5hkM1GTvB6X23IX
 V0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OcaMGxlrC1ZMOva0UGfFnxr9HfZ6ixW+3vJ8ufw+WhQ=;
 b=B8/7X1D/o3jaBbn2kFCedl2Itw9vT98uGkbuWy4jRuPRn9l1G/9KW9ZM0JO74cZt7K
 QqdgZ0lLB23NdN3599sqnDRuGODwCJs153b2oMhJfqfzIyDFWAyEWuyBLV97QcQR0wJi
 f9PTvB/g+FbTkAEY72azOHq84rTLdH049oHBKi3QNY1uol48Q3EFb9VLKcde8qsFZf3I
 5GdmK8/H3p0DuZBkcBJbIJmmLhxub5114OeP767oNp/ypv5i5eZEyunza6VfVMHTQZ9O
 QE8L0RcNxzan5yJ0bWH3/eBQG9Z0bB0jV8sCJ6kfg0AIpSrZA/ym7rOrXo/PgK+Wtp/Y
 ojXg==
X-Gm-Message-State: APjAAAVmQs2h+OUo9DSOw7tUhUbBEuui3Tb37BSpOqs3Y/bJbhcPzsfE
 NZv9HcTCuclWKwWdaIb+jHeHptqX4x7oZGXb1Jk=
X-Google-Smtp-Source: APXvYqwjlrGcgF1Z8NSbOvTnVQvRG0qQGr4zsIUXDAknAikfuQSR8RG2GDUDznaZo04TJF5d0zC6e4bFnV0AF0xrH6E=
X-Received: by 2002:adf:e74a:: with SMTP id c10mr32016069wrn.386.1576533848518; 
 Mon, 16 Dec 2019 14:04:08 -0800 (PST)
MIME-Version: 1.0
References: <20191028121043.22934-1-hch@lst.de>
 <20191028121043.22934-11-hch@lst.de>
 <alpine.DEB.2.21.9999.1911171511170.5296@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1911171511170.5296@viisi.sifive.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Tue, 17 Dec 2019 00:03:32 +0200
Message-ID: <CAEn-LToO9MjMr6ipXO1pCGG7H-bunHHAVyYkknOZ2dixOOG4+w@mail.gmail.com>
Subject: Re: [PATCH 10/12] riscv: add nommu support
To: Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_140410_901546_498F0851 
X-CRM114-Status: GOOD (  22.05  )
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 18, 2019 at 1:13 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> On Mon, 28 Oct 2019, Christoph Hellwig wrote:
>
> > The kernel runs in M-mode without using page tables, and thus can't run
> > bare metal without help from additional firmware.
> >
> > Most of the patch is just stubbing out code not needed without page
> > tables, but there is an interesting detail in the signals implementation:
> >
> >  - The normal RISC-V syscall ABI only implements rt_sigreturn as VDSO
> >    entry point, but the ELF VDSO is not supported for nommu Linux.
> >    We instead copy the code to call the syscall onto the stack.
> >
> > In addition to enabling the nommu code a new defconfig for a small
> > kernel image that can run in nommu mode on qemu is also provided, to run
> > a kernel in qemu you can use the following command line:
> >
> > qemu-system-riscv64 -smp 2 -m 64 -machine virt -nographic \
> >       -kernel arch/riscv/boot/loader \
> >       -drive file=rootfs.ext2,format=raw,id=hd0 \
> >       -device virtio-blk-device,drive=hd0
> >
> > Contains contributions from Damien Le Moal <Damien.LeMoal@wdc.com>.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Thanks, queued the following for v5.5-rc1.
>
>
[..]

> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index d3221017194d..beb5f0865e39 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -25,6 +25,7 @@
>  #include <asm/pgtable-32.h>
>  #endif /* CONFIG_64BIT */
>
> +#ifdef CONFIG_MMU
>  /* Number of entries in the page global directory */
>  #define PTRS_PER_PGD    (PAGE_SIZE / sizeof(pgd_t))
>  /* Number of entries in the page table */
> @@ -32,7 +33,6 @@
>
>  /* Number of PGD entries that a user-mode program can use */
>  #define USER_PTRS_PER_PGD   (TASK_SIZE / PGDIR_SIZE)
> -#define FIRST_USER_ADDRESS  0
>
>  /* Page protection bits */
>  #define _PAGE_BASE     (_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_USER)
> @@ -84,42 +84,6 @@ extern pgd_t swapper_pg_dir[];
>  #define __S110 PAGE_SHARED_EXEC
>  #define __S111 PAGE_SHARED_EXEC
>
> -#define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
> -#define VMALLOC_END      (PAGE_OFFSET - 1)
> -#define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
> -#define PCI_IO_SIZE      SZ_16M
> -
> -/*
> - * Roughly size the vmemmap space to be large enough to fit enough
> - * struct pages to map half the virtual address space. Then
> - * position vmemmap directly below the VMALLOC region.
> - */
> -#define VMEMMAP_SHIFT \
> -       (CONFIG_VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
> -#define VMEMMAP_SIZE   BIT(VMEMMAP_SHIFT)
> -#define VMEMMAP_END    (VMALLOC_START - 1)
> -#define VMEMMAP_START  (VMALLOC_START - VMEMMAP_SIZE)
> -
> -#define vmemmap                ((struct page *)VMEMMAP_START)
> -
> -#define PCI_IO_END       VMEMMAP_START
> -#define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
> -#define FIXADDR_TOP      PCI_IO_START
> -
> -#ifdef CONFIG_64BIT
> -#define FIXADDR_SIZE     PMD_SIZE
> -#else
> -#define FIXADDR_SIZE     PGDIR_SIZE
> -#endif
> -#define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
> -
> -/*
> - * ZERO_PAGE is a global shared page that is always zero,
> - * used for zero-mapped memory areas, etc.
> - */
> -extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
> -#define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
> -
>  static inline int pmd_present(pmd_t pmd)
>  {
>         return (pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROT_NONE));
> @@ -430,11 +394,34 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>  #define __pte_to_swp_entry(pte)        ((swp_entry_t) { pte_val(pte) })
>  #define __swp_entry_to_pte(x)  ((pte_t) { (x).val })
>
> -#define kern_addr_valid(addr)   (1) /* FIXME */
> +#define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
> +#define VMALLOC_END      (PAGE_OFFSET - 1)
> +#define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
>
> -extern void *dtb_early_va;
> -extern void setup_bootmem(void);
> -extern void paging_init(void);
> +/*
> + * Roughly size the vmemmap space to be large enough to fit enough
> + * struct pages to map half the virtual address space. Then
> + * position vmemmap directly below the VMALLOC region.
> + */
> +#define VMEMMAP_SHIFT \
> +       (CONFIG_VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
> +#define VMEMMAP_SIZE   BIT(VMEMMAP_SHIFT)
> +#define VMEMMAP_END    (VMALLOC_START - 1)
> +#define VMEMMAP_START  (VMALLOC_START - VMEMMAP_SIZE)
> +
> +#define vmemmap                ((struct page *)VMEMMAP_START)

Why did you move these defines below the functions?

This seems to break kernel (5.5-rc2) compilation in Fedora/RISCV. The
function above needed vmemmap macro.

BUILDSTDERR: In file included from ./arch/riscv/include/asm/page.h:131,
BUILDSTDERR:                  from ./arch/riscv/include/asm/thread_info.h:11,
BUILDSTDERR:                  from ./include/linux/thread_info.h:38,
BUILDSTDERR:                  from ./include/asm-generic/preempt.h:5,
BUILDSTDERR:                  from
./arch/riscv/include/generated/asm/preempt.h:1,
BUILDSTDERR:                  from ./include/linux/preempt.h:78,
BUILDSTDERR:                  from ./include/linux/spinlock.h:51,
BUILDSTDERR:                  from ./include/linux/seqlock.h:36,
BUILDSTDERR:                  from ./include/linux/time.h:6,
BUILDSTDERR:                  from ./include/linux/stat.h:19,
BUILDSTDERR:                  from ./include/linux/module.h:13,
BUILDSTDERR:                  from init/main.c:17:
BUILDSTDERR: ./arch/riscv/include/asm/pgtable.h: In function 'pmd_page':
BUILDSTDERR: ./include/asm-generic/memory_model.h:54:29: error:
'vmemmap' undeclared (first use in this function); did you mean
'mem_map'?
BUILDSTDERR:    54 | #define __pfn_to_page(pfn) (vmemmap + (pfn))
BUILDSTDERR:       |                             ^~~~~~~
BUILDSTDERR: ./include/asm-generic/memory_model.h:82:21: note: in
expansion of macro '__pfn_to_page'
BUILDSTDERR:    82 | #define pfn_to_page __pfn_to_page
BUILDSTDERR:       |                     ^~~~~~~~~~~~~
BUILDSTDERR: ./arch/riscv/include/asm/pgtable.h:140:9: note: in
expansion of macro 'pfn_to_page'
BUILDSTDERR:   140 |  return pfn_to_page(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
BUILDSTDERR:       |         ^~~~~~~~~~~
BUILDSTDERR: ./include/asm-generic/memory_model.h:54:29: note: each
undeclared identifier is reported only once for each function it
appears in
BUILDSTDERR:    54 | #define __pfn_to_page(pfn) (vmemmap + (pfn))
BUILDSTDERR:       |                             ^~~~~~~
BUILDSTDERR: ./include/asm-generic/memory_model.h:82:21: note: in
expansion of macro '__pfn_to_page'
BUILDSTDERR:    82 | #define pfn_to_page __pfn_to_page
BUILDSTDERR:       |                     ^~~~~~~~~~~~~
BUILDSTDERR: ./arch/riscv/include/asm/pgtable.h:140:9: note: in
expansion of macro 'pfn_to_page'
BUILDSTDERR:   140 |  return pfn_to_page(pmd_val(pmd) >> _PAGE_PFN_SHIFT);


> +
> +#define PCI_IO_SIZE      SZ_16M
> +#define PCI_IO_END       VMEMMAP_START
> +#define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
> +
> +#define FIXADDR_TOP      PCI_IO_START
> +#ifdef CONFIG_64BIT
> +#define FIXADDR_SIZE     PMD_SIZE
> +#else
> +#define FIXADDR_SIZE     PGDIR_SIZE
> +#endif
> +#define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
>
>  /*
>   * Task size is 0x4000000000 for RV64 or 0x9fc00000 for RV32.
> @@ -446,6 +433,31 @@ extern void paging_init(void);
>  #define TASK_SIZE FIXADDR_START
>  #endif
>
> +#else /* CONFIG_MMU */
> +
> +#define PAGE_KERNEL            __pgprot(0)
> +#define swapper_pg_dir         NULL
> +#define VMALLOC_START          0
> +
> +#define TASK_SIZE 0xffffffffUL
> +
> +#endif /* !CONFIG_MMU */
> +
> +#define kern_addr_valid(addr)   (1) /* FIXME */
> +
> +extern void *dtb_early_va;
> +void setup_bootmem(void);
> +void paging_init(void);
> +
> +#define FIRST_USER_ADDRESS  0
> +
> +/*
> + * ZERO_PAGE is a global shared page that is always zero,
> + * used for zero-mapped memory areas, etc.
> + */
> +extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
> +#define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
> +
>  #include <asm-generic/pgtable.h>
>
>  #endif /* !__ASSEMBLY__ */


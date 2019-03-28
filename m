Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82856C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 10:04:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50E9B2173C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 10:04:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a5fpglhg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="iDDm4imj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50E9B2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ev10PcbYK/tWrxPeKvSB9Rc2HZjks0XZ3az9hZWm7s0=; b=a5fpglhgI44hPm
	45fpk4Bv3l53/FZyWWusxA4GV+AvG6BSI2ldi6Mn4ufZZFkRttm7BFClRZCXSFfVM5pRwX0akZGbt
	ZSVVn3sN7Kl81o6IqBd9Au8pRWZ4kuI00ihkxRWBqX+zXxLCWn1a3MiyYTzhQs2ELhyhZ9A131LM/
	FE8C+Wao7DqHgcLr16fzrXvTbav482Kp0lAm+3EC3rkEjFlaxfsarqi+uiFVQmWZ6go+pXGsWO6Rt
	pPjqlecUN0GE9uIhzJ6lqIGOfmJ5K0FA8BaNZQqvL4E/jrKXusP7SwjiAznvfB2Tbeom5QrxZ8azq
	w0l6KKKa0ncRhf0dwAvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9RtI-0007aq-GV; Thu, 28 Mar 2019 10:04:08 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9RtF-0007T2-KR
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 10:04:07 +0000
Received: by mail-wm1-x341.google.com with SMTP id v14so3254380wmf.2
 for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2019 03:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HmLIFXfNkZvraaMu+SUWaKZg9Szlg4DGUc3DWtzRI/c=;
 b=iDDm4imj3H5g6r+2ywDcxyDVyLwQacKDck/R0DG/ClAifvTD8sVa5lqX0oOgr9DKSn
 wgKaCfk3MkiHAO0j5XotFlU+plkW9aaHmXPkn8r+sALt1rHQthbiu1kP13aUZ19fMmv8
 rXX9sp6oeig0M9wsWpUF6w7Y1N7rdQM1qUaeD4vLPBaMY+GRCPGcVSve4T9wsPX2ocAL
 8coswoFgypSrMJaOILpEmMn9omO4qf2jq90kEFj9AdLSaKjR5Qtr0ZotD4yGqGh2tZA+
 ENU+xIlvcdXBGwcWse3hLYBjROiGg2MaaYZVxyXpJwMiAC3TVHxFDmE9pJJUfevoy0aq
 nwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HmLIFXfNkZvraaMu+SUWaKZg9Szlg4DGUc3DWtzRI/c=;
 b=GOEHQW+7FOjLNZpnGA5oDSBn//3oB5EJdBJ6EhzvjSL/QxAcnwIbybEZZVHgmJzudh
 hH5qc+Swcpuc+KBBbHo+fG4L44axijWXqIPbf5d2R0UZ7G6AYtOVw26OeAkUTyXZ1zPr
 cplAh7td5YcBM28Gli9ApsbQXA/STMRA9fh2+WGXj0McvTxs3aWcHjuiEZkBj+2mzvH0
 +pFxMkOYb46iHe0OHp4Z3AqJtxwG4TOxaQQytJDP/c8eK+/eayoB0IyGltMU4PdQRKfd
 lrq5mdBiiSOBL5cLpS4wPpOzQbkXqVnvSLFFVidZSb6xwKVrhJ1/it4L81/ZFsOpORUX
 MstQ==
X-Gm-Message-State: APjAAAW5VnAvimD6Xu2jSXX7U5L+1LLetk95p6GZHaTzV8vnP1XBmxDS
 6zd0Sr90tj+BB3nQBuW5p8PIAgmg8Hd+M4hy+pzhYA==
X-Google-Smtp-Source: APXvYqwL8sv6SSmbjr8nblpcDxHSKAKqE1uaw7r0/DezE8ufGA7VZDZPof2VI7HlpcuSNMY0vWWJbP8yGDElX5Y2oFY=
X-Received: by 2002:a1c:e185:: with SMTP id y127mr16247791wmg.76.1553767443262; 
 Thu, 28 Mar 2019 03:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190327213643.23789-1-logang@deltatee.com>
 <20190327213643.23789-5-logang@deltatee.com>
In-Reply-To: <20190327213643.23789-5-logang@deltatee.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Mar 2019 15:33:52 +0530
Message-ID: <CAAhSdy0rZCNG4582gCd2wJ9zWwRZJ8uohPLs91=Ww=+=JnG4=w@mail.gmail.com>
Subject: Re: [PATCH 4/7] RISC-V: Update page tables to cover the whole linear
 mapping
To: Logan Gunthorpe <logang@deltatee.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_030405_672674_1294C941 
X-CRM114-Status: GOOD (  19.22  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Stephen Bates <sbates@raithlin.com>, Atish Patra <atish.patra@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Zong Li <zongbox@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 28, 2019 at 3:06 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
> With the new virtual address changes in an earlier patch, we want the
> page tables to cover more of the linear mapping region. Instead of
> only mapping from PAGE_OFFSET and up, we instead map starting
> from an aligned version of va_pa_offset such that all of the physical
> address space will be mapped.
>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Zong Li <zongbox@gmail.com>
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/riscv/kernel/setup.c |  1 -
>  arch/riscv/mm/init.c      | 27 +++++++++++++++------------
>  2 files changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index ecb654f6a79e..8286df8be31a 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -59,7 +59,6 @@ EXPORT_SYMBOL(empty_zero_page);
>  /* The lucky hart to first increment this variable will boot the other cores */
>  atomic_t hart_lottery;
>  unsigned long boot_cpu_hartid;
> -
>  void __init parse_dtb(unsigned int hartid, void *dtb)
>  {
>         if (early_init_dt_scan(__va(dtb)))
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index b9d50031e78f..315194557c3d 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -150,8 +150,8 @@ pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>  pgd_t trampoline_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>
>  #ifndef __PAGETABLE_PMD_FOLDED
> -#define NUM_SWAPPER_PMDS ((uintptr_t)-PAGE_OFFSET >> PGDIR_SHIFT)
> -pmd_t swapper_pmd[PTRS_PER_PMD*((-PAGE_OFFSET)/PGDIR_SIZE)] __page_aligned_bss;
> +#define NUM_SWAPPER_PMDS ((uintptr_t)-VMALLOC_END >> PGDIR_SHIFT)
> +pmd_t swapper_pmd[PTRS_PER_PMD*((-VMALLOC_END)/PGDIR_SIZE)] __page_aligned_bss;
>  pmd_t trampoline_pmd[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>  pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
>  #endif
> @@ -180,13 +180,18 @@ asmlinkage void __init setup_vm(void)
>         extern char _start;
>         uintptr_t i;
>         uintptr_t pa = (uintptr_t) &_start;
> +       uintptr_t linear_start;
> +       uintptr_t off;
>         pgprot_t prot = __pgprot(pgprot_val(PAGE_KERNEL) | _PAGE_EXEC);
>
>         va_pa_offset = PAGE_OFFSET - pa;
>         pfn_base = PFN_DOWN(pa);
>
> +       linear_start = ALIGN_DOWN(va_pa_offset, PGDIR_SIZE);
> +       off = linear_start - va_pa_offset;
> +
>         /* Sanity check alignment and size */
> -       BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
> +       BUG_ON(linear_start <= VMALLOC_END);
>         BUG_ON((pa % (PAGE_SIZE * PTRS_PER_PTE)) != 0);
>
>  #ifndef __PAGETABLE_PMD_FOLDED
> @@ -195,15 +200,14 @@ asmlinkage void __init setup_vm(void)
>                         __pgprot(_PAGE_TABLE));
>         trampoline_pmd[0] = pfn_pmd(PFN_DOWN(pa), prot);
>
> -       for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
> -               size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
> -
> +       for (i = 0; i < (-linear_start)/PGDIR_SIZE; ++i) {
> +               size_t o = (linear_start >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
>                 swapper_pg_dir[o] =
>                         pfn_pgd(PFN_DOWN((uintptr_t)swapper_pmd) + i,
>                                 __pgprot(_PAGE_TABLE));
>         }
>         for (i = 0; i < ARRAY_SIZE(swapper_pmd); i++)
> -               swapper_pmd[i] = pfn_pmd(PFN_DOWN(pa + i * PMD_SIZE), prot);
> +               swapper_pmd[i] = pfn_pmd(PFN_DOWN(off + i * PMD_SIZE), prot);
>
>         swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
>                 pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pmd),
> @@ -215,11 +219,10 @@ asmlinkage void __init setup_vm(void)
>         trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
>                 pfn_pgd(PFN_DOWN(pa), prot);
>
> -       for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
> -               size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
> -
> -               swapper_pg_dir[o] =
> -                       pfn_pgd(PFN_DOWN(pa + i * PGDIR_SIZE), prot);
> +       for (i = 0; i < (-linear_start)/PGDIR_SIZE; ++i) {
> +               size_t o = (linear_start >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
> +               swapper_pg_dir[o] = pfn_pgd(PFN_DOWN(off + i * PGDIR_SIZE),
> +                                           prot);
>         }
>
>         swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> --
> 2.20.1
>

I understand that this patch is inline with your virtual memory layout cleanup
but the way we map virtual memory in swapper_pg_dir is bound to change.

We should not be mapping complete virtual memory in swapper_pd_dir()
rather we should only map based on amount of RAM available.

Refer, https://www.lkml.org/lkml/2019/3/24/3

The setup_vm() should only map vmlinux_start to vmlinux_end plus the
FDT. Complete virtual memory mapping should be done after we have
done early parsing of FDT when we know available memory banks in
setup_vm_final() (called from paging_init())

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

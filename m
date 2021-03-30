Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB4D8C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 09:48:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 637BF6148E
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 09:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 637BF6148E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E4bXjj9XvHuBzURBB883Dr1u+7khiNmnXTAMMJBY/dA=; b=Oxe40+p35ukxrLzU8Sfek4nut
	NWQGhKuSeV9bLw5EJVQXNnKu+6zFDBmi9lCAzVE99vQTJZfLutapDwzw4NERsnKQhoxjo2IoN/t7t
	StvrEkI8Le/CkiabpaX8Cro5LIuc5BxPDdJDAxif9n906/yrxFwsrayv5Ck0aB6HA0pK1gwCPUqEM
	o6A0O6tt8iGlOWXeR07x/Pjy7Ip8BLCzeBlNc/i2yWFNpj0vholw7cmEtDtjBLY1W6J3YipHp+GgI
	Ck8R0lOf7+Q6nxc4txR3/IH6AErKQ5gQEkEKnUhIJVLHWLP9fjzojH0YufBmmsnpqAgdg9qYYPnIz
	ErP7GsX1Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRAyZ-003I10-Vo; Tue, 30 Mar 2021 09:47:56 +0000
Received: from mail-ua1-f41.google.com ([209.85.222.41])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRAyM-003Hz7-SY
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 09:47:48 +0000
Received: by mail-ua1-f41.google.com with SMTP id e1so4853517uaa.4
 for <linux-riscv@lists.infradead.org>; Tue, 30 Mar 2021 02:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8y7oZIw1YMOjEvsLWyQcxtUBXg+Hq4822w/iibJY5oM=;
 b=qx8eV9xJS83gVRlMEV3nMKblrjnOfTow/8tUuGn8cnQiPW+EtbzxCTXUjSwvB+Q9Mh
 K3LZUL3Q1LAuYnzdYYaXCA2FWd1Cda9A5vF+PNJOZNFIMMiFAqDBJV2T/vp/zZZdpSmv
 LwEIvYsMqVTZ/TbKDpibgSdaLRor6hetV2/Ji7TdRySSb/HSS3ZlQlGqthV6tKILoF4L
 8HVtYfyYw/k/LDeBjqVJkFpBijc49MEB+lOJ3Ci+DfeHRFyw7aWrZUno4vmmNthBQAhv
 NrQclz5h4/lQyAjEZc/YttwHFZ1FCnx3UpD1wJFvAWxjn03QsRypIN8FtTfi7Mb6P0Jl
 nIQQ==
X-Gm-Message-State: AOAM533N/pHEAnnCf0VhdXF9XkH8J6cpkTjWvPuXlohi7SrauijA9hny
 6KSzKaF2BertEojfAWOpIkQvaOnG1f5bg/V9pkYW/gfEUb8=
X-Google-Smtp-Source: ABdhPJzhkj5xFc0mAROAfsnz9Aq+SS+wFmH/dfyW1W97iN/d1kjGziAqceJxycurA2IJG2AoR+JIsPKmioeY7xoYW60=
X-Received: by 2002:ab0:3393:: with SMTP id y19mr16748273uap.2.1617097661466; 
 Tue, 30 Mar 2021 02:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210313084505.16132-3-alex@ghiti.fr>
 <mhng-1a492a0c-049e-495e-8258-7513a4fa967a@palmerdabbelt-glaptop>
In-Reply-To: <mhng-1a492a0c-049e-495e-8258-7513a4fa967a@palmerdabbelt-glaptop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Mar 2021 11:47:30 +0200
Message-ID: <CAMuHMdXdhTUKuvJkJGUm=ESpwA6R06eKV5q6wFOJftJ1p3R7nw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] riscv: Cleanup KASAN_VMALLOC support
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: alex@ghiti.fr, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, nylon7@andestech.com, 
 Nick Hu <nickhu@andestech.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_104743_528568_6D58DB16 
X-CRM114-Status: GOOD (  32.37  )
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

Hi Palmer,

On Tue, Mar 30, 2021 at 7:08 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Sat, 13 Mar 2021 00:45:05 PST (-0800), alex@ghiti.fr wrote:
> > When KASAN vmalloc region is populated, there is no userspace process and
> > the page table in use is swapper_pg_dir, so there is no need to read
> > SATP. Then we can use the same scheme used by kasan_populate_p*d
> > functions to go through the page table, which harmonizes the code.
> >
> > In addition, make use of set_pgd that goes through all unused page table
> > levels, contrary to p*d_populate functions, which makes this function work
> > whatever the number of page table levels.
> >
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> > Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > ---
> >  arch/riscv/mm/kasan_init.c | 59 ++++++++++++--------------------------
> >  1 file changed, 18 insertions(+), 41 deletions(-)
> >
> > diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> > index 57bf4ae09361..c16178918239 100644
> > --- a/arch/riscv/mm/kasan_init.c
> > +++ b/arch/riscv/mm/kasan_init.c
> > @@ -11,18 +11,6 @@
> >  #include <asm/fixmap.h>
> >  #include <asm/pgalloc.h>
> >
> > -static __init void *early_alloc(size_t size, int node)
> > -{
> > -     void *ptr = memblock_alloc_try_nid(size, size,
> > -             __pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE, node);
> > -
> > -     if (!ptr)
> > -             panic("%pS: Failed to allocate %zu bytes align=%zx nid=%d from=%llx\n",
> > -                     __func__, size, size, node, (u64)__pa(MAX_DMA_ADDRESS));
> > -
> > -     return ptr;
> > -}
> > -
> >  extern pgd_t early_pg_dir[PTRS_PER_PGD];
> >  asmlinkage void __init kasan_early_init(void)
> >  {
> > @@ -155,38 +143,27 @@ static void __init kasan_populate(void *start, void *end)
> >       memset(start, KASAN_SHADOW_INIT, end - start);
> >  }
> >
> > -void __init kasan_shallow_populate(void *start, void *end)
> > +static void __init kasan_shallow_populate_pgd(unsigned long vaddr, unsigned long end)
> >  {
> > -     unsigned long vaddr = (unsigned long)start & PAGE_MASK;
> > -     unsigned long vend = PAGE_ALIGN((unsigned long)end);
> > -     unsigned long pfn;
> > -     int index;
> > +     unsigned long next;
> >       void *p;
> > -     pud_t *pud_dir, *pud_k;
> > -     pgd_t *pgd_dir, *pgd_k;
> > -     p4d_t *p4d_dir, *p4d_k;
> > -
> > -     while (vaddr < vend) {
> > -             index = pgd_index(vaddr);
> > -             pfn = csr_read(CSR_SATP) & SATP_PPN;
> > -             pgd_dir = (pgd_t *)pfn_to_virt(pfn) + index;
> > -             pgd_k = init_mm.pgd + index;
> > -             pgd_dir = pgd_offset_k(vaddr);
> > -             set_pgd(pgd_dir, *pgd_k);
> > -
> > -             p4d_dir = p4d_offset(pgd_dir, vaddr);
> > -             p4d_k  = p4d_offset(pgd_k, vaddr);
> > -
> > -             vaddr = (vaddr + PUD_SIZE) & PUD_MASK;
> > -             pud_dir = pud_offset(p4d_dir, vaddr);
> > -             pud_k = pud_offset(p4d_k, vaddr);
> > -
> > -             if (pud_present(*pud_dir)) {
> > -                     p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
> > -                     pud_populate(&init_mm, pud_dir, p);
> > +     pgd_t *pgd_k = pgd_offset_k(vaddr);
> > +
> > +     do {
> > +             next = pgd_addr_end(vaddr, end);
> > +             if (pgd_page_vaddr(*pgd_k) == (unsigned long)lm_alias(kasan_early_shadow_pmd)) {
> > +                     p = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
> > +                     set_pgd(pgd_k, pfn_pgd(PFN_DOWN(__pa(p)), PAGE_TABLE));
> >               }
> > -             vaddr += PAGE_SIZE;
> > -     }
> > +     } while (pgd_k++, vaddr = next, vaddr != end);
> > +}
> > +
> > +static void __init kasan_shallow_populate(void *start, void *end)
> > +{
> > +     unsigned long vaddr = (unsigned long)start & PAGE_MASK;
> > +     unsigned long vend = PAGE_ALIGN((unsigned long)end);
> > +
> > +     kasan_shallow_populate_pgd(vaddr, vend);
> >
> >       local_flush_tlb_all();
> >  }
>
> Thanks, this is on for-next.

Your for-next does not include your fixes branch, hence they now conflict,
and for-next lacks the local_flush_tlb_all().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

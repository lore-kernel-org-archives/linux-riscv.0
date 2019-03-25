Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC83C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 04:20:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC50B2087F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 04:20:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j14kWdO2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="FimwOVzQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC50B2087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vITsa9x9LLLk3DOievMAeZn7uBXWl0AmOo2ronwCjEo=; b=j14kWdO2MKInEJ
	Dwk6Chkk7pK4AARdd7okIuAdsAo4BgFNs5zR1HM6SlA7lExDKNvytvlkWAcJ632x95jqWfmfp0zF3
	1u1eF5i1s//Ovaw0jntuylPhgIHbMXkKmiE88bBtpn2ayIqoDAgePI8nqXYyp/DYzVDAMnwYWNhZS
	xl31RFDk8YESoDo3nAUKzL02185u2OdjyTbOdneRNA14XLflY3Q/PE9CWi0lDovJVbtfx0WgWgk4f
	j71rQKLczgitNoG40oFivit96jQGE0aohpYOUmbXXJ0JyywPHLZnbtuFP9m/O0l1m08NUbXpcB9iA
	jOR9z+yIziNoPHIrQHyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8H5s-0008NC-6f; Mon, 25 Mar 2019 04:20:16 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8H5n-0008Lw-SZ
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 04:20:14 +0000
Received: by mail-wr1-x442.google.com with SMTP id w1so8462472wrp.2
 for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2019 21:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UahRyYH4Ih3or75zRocpLOkjc4f1gcK5Sfy8DWfMjvw=;
 b=FimwOVzQtm3SYNym8xj5HugTEhzz+bFB2krZ7khQux0xtuG1ej9Z8mq0OBGl0jiQgB
 2pSMsRTQg6oUvjPRgwIUl2RqodOWCgwGJtPHsin3UHV6NhIAQTXafTgeFyvnLRCXQQmR
 3MTRxDiVElC2Jfl1O5B+zwi70bwizCZ70JBaabZE4MVqBGZOM1Rl8PHawaEZsBgCFijF
 nG05Joa+fjNuxrTKV91r7E6VqFyURu8OORMWZ7OvOlQHcY5t7ZMvDk1v2Yb5HrB9SRfF
 7ybnY3li3omD1k3zPRINiE4ZBXkF74lyQgAqEusI/shSD6mSoCiwOzHsrfJmH1flYEaF
 enEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UahRyYH4Ih3or75zRocpLOkjc4f1gcK5Sfy8DWfMjvw=;
 b=KebXYQCoZ1MgPwl6XHQTinsisfdf0ypmOIAa3pUO5MA6Rk5Iay8WhRSut/RLe/cGo0
 TJNujb9gVATSlkoYygIlRO61ABRHNAUaEfrJvMzjnDUYIAnNKmG7aJvuHtzYD5rdTkXX
 f4Ks5mffc5rG9R6PXiBq3YKrSHYRzaG7TXXCesnEsYGJJzg7XvTxun/NDUco+bWEY4My
 S+UdfEoKxByQZEPUaNClUGOYrdsynohR4aH6O5l+Pxg86Q8BnmL4nO2lqvQn725vdIf5
 q9TCW3+5BMUD6CQmPE6wyMX6wK8wDmdrhNoYzd2JI4x86c9nalAXcD6sS2WEnGTrYMND
 LGOg==
X-Gm-Message-State: APjAAAUGXzTSXEH6ClDTQJRWsLA4w/PjNM8SmLIxbdidlqFXzImZCPrr
 MqrdBo/N2X4uzvtoGM6m2JYwwzA/yDSbilMMqIoDf9IF
X-Google-Smtp-Source: APXvYqw/md2Z/vPYOnvWCNPDHtz5hq563mBSa30gBWnUvp1xdQG16LjCUqhbM32AyRETg4lOy16T+rVxWZTOu5rkueU=
X-Received: by 2002:a5d:4087:: with SMTP id o7mr2383979wrp.9.1553487607801;
 Sun, 24 Mar 2019 21:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190321094710.16552-1-anup.patel@wdc.com>
 <20190321094710.16552-3-anup.patel@wdc.com>
 <20190323154459.GC25149@rapoport-lnx>
In-Reply-To: <20190323154459.GC25149@rapoport-lnx>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Mar 2019 09:49:55 +0530
Message-ID: <CAAhSdy2pgoEknshuJT3z-QdPMMtw5fwWM2tzRUaGvZ1Hjn-SGQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] RISC-V: Make setup_vm() independent of GCC code
 model
To: Mike Rapoport <rppt@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_212012_871181_CC925217 
X-CRM114-Status: GOOD (  23.26  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Mar 23, 2019 at 9:15 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> On Thu, Mar 21, 2019 at 09:47:47AM +0000, Anup Patel wrote:
> > The setup_vm() must access kernel symbols in a position independent way
> > because it will be called from head.S with MMU off.
> >
> > If we compile kernel with cmodel=medany then PC-relative addressing will
> > be used in setup_vm() to access kernel symbols so it works perfectly fine.
> >
> > Although, if we compile kernel with cmodel=medlow then either absolute
> > addressing or PC-relative addressing (based on whichever requires fewer
> > instructions) is used to access kernel symbols in setup_vm(). This can
> > break setup_vm() whenever any absolute addressing is used to access
> > kernel symbols.
> >
> > With the movement of setup_vm() from kernel/setup.c to mm/init.c, the
> > setup_vm() is now broken for cmodel=medlow but it works perfectly fine
> > for cmodel=medany.
> >
> > This patch fixes setup_vm() and makes it independent of GCC code model
> > by accessing kernel symbols relative to kernel load address instead of
> > assuming PC-relative addressing.
> >
> > Fixes: 6f1e9e946f0b ("RISC-V: Move setup_vm() to mm/init.c")
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  arch/riscv/kernel/head.S |  1 +
> >  arch/riscv/mm/init.c     | 73 ++++++++++++++++++++++++++--------------
> >  2 files changed, 49 insertions(+), 25 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> > index fe884cd69abd..7966262b4f9d 100644
> > --- a/arch/riscv/kernel/head.S
> > +++ b/arch/riscv/kernel/head.S
> > @@ -62,6 +62,7 @@ clear_bss_done:
> >
> >       /* Initialize page tables and relocate to virtual addresses */
> >       la sp, init_thread_union + THREAD_SIZE
> > +     la a0, _start
> >       call setup_vm
> >       call relocate
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index b379a75ac6a6..e38f8195e45b 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -172,55 +172,78 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
> >       }
> >  }
> >
> > -asmlinkage void __init setup_vm(void)
> > +static inline void *__load_addr(void *ptr, uintptr_t load_pa)
> >  {
> >       extern char _start;
> > +     uintptr_t va = (uintptr_t)ptr;
> > +     uintptr_t sz = (uintptr_t)(&_end) - (uintptr_t)(&_start);
> > +
> > +     if (va >= PAGE_OFFSET && va <= (PAGE_OFFSET + sz))
> > +             return (void *)(load_pa + (va - PAGE_OFFSET));
> > +     return (void *)va;
> > +}
> > +
> > +#define __load_va(ptr, load_pa)      __load_addr(ptr, load_pa)
> > +#define __load_pa(ptr, load_pa)      ((uintptr_t)__load_addr(ptr, load_pa))
> > +
> > +asmlinkage void __init setup_vm(uintptr_t load_pa)
> > +{
> >       uintptr_t i;
> > -     uintptr_t pa = (uintptr_t) &_start;
> > +#ifndef __PAGETABLE_PMD_FOLDED
> > +     pmd_t *pmdp;
> > +#endif
> > +     pgd_t *pgdp;
> > +     phys_addr_t map_pa;
> > +     pgprot_t tableprot = __pgprot(_PAGE_TABLE);
> >       pgprot_t prot = __pgprot(pgprot_val(PAGE_KERNEL) | _PAGE_EXEC);
> >
> > -     va_pa_offset = PAGE_OFFSET - pa;
> > -     pfn_base = PFN_DOWN(pa);
> > +     va_pa_offset = PAGE_OFFSET - load_pa;
> > +     pfn_base = PFN_DOWN(load_pa);
> >
> >       /* Sanity check alignment and size */
> >       BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
> > -     BUG_ON((pa % (PAGE_SIZE * PTRS_PER_PTE)) != 0);
> > +     BUG_ON((load_pa % (PAGE_SIZE * PTRS_PER_PTE)) != 0);
> >
> >  #ifndef __PAGETABLE_PMD_FOLDED
> > -     trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> > -             pfn_pgd(PFN_DOWN((uintptr_t)trampoline_pmd),
> > -                     __pgprot(_PAGE_TABLE));
> > -     trampoline_pmd[0] = pfn_pmd(PFN_DOWN(pa), prot);
> > +     pgdp = __load_va(trampoline_pg_dir, load_pa);
> > +     map_pa = __load_pa(trampoline_pmd, load_pa);
> > +     pgdp[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
>
> Can we use pgd_index(PAGE_OFFSET) here as index to PGD?
>
> > +             pfn_pgd(PFN_DOWN(map_pa), tableprot);
>
> It seems that __load_pa result is always used with PFN_DOWN(), it's worth
> adding __load_pfn(). Then the last two statements become
>
>         map_pfn = __load_pfn(trampoline_pmd, load_pa);
>         pgdp[pgd_index(PAGE_OFFSET)] = pfn_pgd(map_pfn, tableprot);
>
> This applies to most of the mappings below as well.

Thanks for the comments.

I am going to drop this patch because we have other patch which uses
"CFLAGS_init.o := -cmodel=medany" in mm/Makefile

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

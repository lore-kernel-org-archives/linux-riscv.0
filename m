Return-Path: <SRS0=tx4i=TX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791C7C282DD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 May 2019 10:12:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4515F2081C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 May 2019 10:12:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KCvRl5Yd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7gqVbZJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4515F2081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+tWGd9ScmsDKdaSQeig5QGLZUGG/ATlJ/CVETDWMBc=; b=KCvRl5YdFfirVi
	CytqdnYtDjlwzWCnKLD7suDj7mdv9Es3y9ILkAROC3PZavH2RHl5mm2BZu/+qvGDqeIaaV3+FO5rA
	ct/SF4vD0sM+O1UDmfzqoiFyBwKsisU25WQR39N/WL8CmNcidJnHI8exhtNG5SiJuM8aqprniAlwH
	+E21rSJV2ywt9RedZHZNX5+iaadZ6kjnrfWooj2zwtWql/f7PrvaP/7/TP0AblAztthofCe+0yQ5o
	UFJnF0UWQTPyiVN9Talu/sjHMomfBIrxsWEE7YzQCu4BH387LhTYk5qWzbVSgvpcyeYmrz8Su0hKn
	xUsXE/KOCTOxn2qBJL8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTki5-00063o-8q; Thu, 23 May 2019 10:12:29 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTki2-00063T-JF
 for linux-riscv@lists.infradead.org; Thu, 23 May 2019 10:12:28 +0000
Received: by mail-pl1-x643.google.com with SMTP id gn7so2549858plb.10
 for <linux-riscv@lists.infradead.org>; Thu, 23 May 2019 03:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QmwI7NL87yVsQ9pHlxoEhhufyxUTQ/VJaFPR0NJPG9M=;
 b=X7gqVbZJi3T1F/reDUWg7Gw4qq7sPMxviKfhzW2gCNkpwZJynEN1i0AFuemylXUUIX
 bBuH6a9m3PLL4Svc23J3XvpV9rrprQYea3F73UX2iw1JoHDvAMRH0IaECPd+VhXPoEFT
 fzogxlmaUPnm/3U5Qh6R1RtlkvxQU5t8TqcSuMODEElIdBRP4GFmSkqWXvS5xvO4M3lR
 w55fjx8XBx/qKkd7xlHf0l03e10T4WfZS36HxPpMubRC+0EEWBM3n3H3PQFzSu2e9u7K
 ts+3IfQ1+uIQwWfF9bMP0vWLYOSjknllhmQY/NsOqNsrCx5mkOXLBK9/oZhJBZNlR3mO
 Xmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QmwI7NL87yVsQ9pHlxoEhhufyxUTQ/VJaFPR0NJPG9M=;
 b=Aio6MKLT8dcCgEwyTJ4vTKM+KMJ8bk3NUlRItZ/LwSZCaF4MQfmcTjUGWzHVPU46Og
 SG7icY42K60YRBEx8IFouTuG/bcuDN6/7PB9mtr6BM5o0LceGe3epYx1w5FNLoGaGUuk
 tLjdK4XZQJzvykqnfYN+gVbxR/KD4AbidJZse7mbHnnYvdIx0f9btrIKc+hHfaapHvgL
 C8JQYma328Gc4E0LPbIdb2kApqlT6us8ZyVvlppEKO0GAK4FpmWjXKdwgxdDPk1h9RBW
 d73BzVS0iOprgcx8U6GI/klf25x+lBYFUiu7+j4ksaJdmhJehjaSmwqXI8mNA4eaSJLs
 lweQ==
X-Gm-Message-State: APjAAAU7/t4q2CewoTYV4Y1uf5jSksCy7IOI1MaBCFgASM36k0dE+AKa
 BikPoG0xkoUMxaPyNOOLG7gx4k8CKKIUHQegf5Wo0Opk
X-Google-Smtp-Source: APXvYqzrm3qgoLGu7MFnE7kxiTkWBqa+jaIU2qQKHyVRiSKrOs9iYaMZBKf2ftyxE7C3AZT6r9v1tuSPLC36O8PpyIs=
X-Received: by 2002:a17:902:7d8a:: with SMTP id
 a10mr6348282plm.63.1558606345607; 
 Thu, 23 May 2019 03:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAHOvCC7EtFcYQDAQoenP7RdwW-4FQEex4FG5jLR2W0m+Q8t__Q@mail.gmail.com>
 <20190523095214.GD23850@rapoport-lnx>
In-Reply-To: <20190523095214.GD23850@rapoport-lnx>
From: JaeJoon Jung <rgbi3307@gmail.com>
Date: Thu, 23 May 2019 19:12:14 +0900
Message-ID: <CAHOvCC72URVWs8RswjqeewKn0rnoik2OespWkt+d+RNhdTHOAg@mail.gmail.com>
Subject: Re: [PATCH] riscv: using page table index in setup_vm()
To: Mike Rapoport <rppt@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_031226_678210_FC771B8B 
X-CRM114-Status: GOOD (  16.38  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Thanks for your professional advice.
I'd like to take your appropriate suggestion.

Sincerely yours,
JaeJoon Jung.

On Thu, 23 May 2019 at 18:52, Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> On Mon, May 20, 2019 at 05:48:24PM +0900, JaeJoon Jung wrote:
> > From: JaeJoon Jung <rgbi3307@gmail.com>
> >
> > The page table index macro are defined already in pgtable.h as below:
> > ///arch/riscv/include/asm/pgtable.h
> > #define pgd_index(addr)     (((addr) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
> > #define pte_index(addr)     (((addr) >> PAGE_SHIFT) & (PTRS_PER_PTE - 1))
> > ///arch/riscv/include/asm/pgtable-64.h
> > #define pmd_index(addr)     (((addr) >> PMD_SHIFT) & (PTRS_PER_PMD - 1))
> >
> > But, In the arch/riscv/mm/init.c,
> > I found that it does not use above macro in setup_vm().
> > I wat to use this macro in setup_vm() as below:
>
> I'd suggest the following changelog:
> -----------------------------------------
> riscv: setup_vm: use p?d_index() instead of its open coded implementation
>
> The page table indexing macros are defined in include/asm/pgtable.h, but
> setup_vm() uses an open coded implementation.
>
> Replace it with the appropriate macros.
> -----------------------------------------
>
>
> > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > Cc: Anup Patel <anup.patel@wdc.com>
> > Cc: linux-riscv@lists.infradead.org
>
> Otherwise
>
> Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
>
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index bc7b77e34d09..785954b776ac 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> >
> >  asmlinkage void __init setup_vm(void)
> >  {
> >         extern char _start;
> > @@ -223,13 +190,13 @@ asmlinkage void __init setup_vm(void)
> >         BUG_ON((pa % (PAGE_SIZE * PTRS_PER_PTE)) != 0);
> >
> >  #ifndef __PAGETABLE_PMD_FOLDED
> > -       trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> > +       trampoline_pg_dir[pgd_index(PAGE_OFFSET)] =
> >                 pfn_pgd(PFN_DOWN((uintptr_t)trampoline_pmd),
> >                         __pgprot(_PAGE_TABLE));
> >         trampoline_pmd[0] = pfn_pmd(PFN_DOWN(pa), prot);
> >
> >         for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
> > -               size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
> > +               size_t o = pgd_index(PAGE_OFFSET) + i;
> >
> >                 swapper_pg_dir[o] =
> >                         pfn_pgd(PFN_DOWN((uintptr_t)swapper_pmd) + i,
> > @@ -238,24 +205,23 @@ asmlinkage void __init setup_vm(void)
> >         for (i = 0; i < ARRAY_SIZE(swapper_pmd); i++)
> >                 swapper_pmd[i] = pfn_pmd(PFN_DOWN(pa + i * PMD_SIZE), prot);
> >
> > -       swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> > +       swapper_pg_dir[pgd_index(FIXADDR_START)] =
> >                 pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pmd),
> >                                 __pgprot(_PAGE_TABLE));
> > -       fixmap_pmd[(FIXADDR_START >> PMD_SHIFT) % PTRS_PER_PMD] =
> > +       fixmap_pmd[pmd_index(FIXADDR_START)] =
> >                 pfn_pmd(PFN_DOWN((uintptr_t)fixmap_pte),
> >                                 __pgprot(_PAGE_TABLE));
> >  #else
> > -       trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> > +       trampoline_pg_dir[pgd_index(PAGE_OFFSET)] =
> >                 pfn_pgd(PFN_DOWN(pa), prot);
> >
> >         for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
> > -               size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
> > +               size_t o = pgd_index(PAGE_OFFSET) + i;
> >
> >                 swapper_pg_dir[o] =
> >                         pfn_pgd(PFN_DOWN(pa + i * PGDIR_SIZE), prot);
> >         }
> > -
> > -       swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> > +       swapper_pg_dir[pgd_index(FIXADDR_START)] =
> >                 pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pte),
> >                                 __pgprot(_PAGE_TABLE));
> >  #endif
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
>
> --
> Sincerely yours,
> Mike.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF4EC2D0A3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 12:08:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B86BD20724
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 12:08:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yHJuKLkR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W39lchB7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B86BD20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cl6G7CNAvL358VGwvivnrX8rPyoDdeI3ZLK8nxEO1Cg=; b=yHJuKLkRPWpKfm5RpVgYOkxwO
	cb7+Q3Hju5eMaRWJDmEsgcdL+sGda/hQ72xiQXedgTnrCYkgqSHnzbJeLYM6ph6jyitC/7JN9Jz7f
	NYnBzviObJquGEaOGvp+4jSaMD69A8L18lcWRscDUT6n/bzFlXJsBAsO4mLBNUgcuKIk2UgXwBXen
	nuTDqriCRCOfz7XJ9DBlSP+V6ugAjzKsOJ5x+0KOCEj2S2zTCg99FkyNX7PN9IHTEE1ZzM0LJYEbw
	jV0Brv9Vhy1Z0Gd588yMzMKmwUWXaxnAirctiSmbeFWZ6XAsKy8Z1ypttmTDsDG0dYFPzc8Uc+SIB
	gWjgwqw1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb0Xv-0007ot-Po; Fri, 06 Nov 2020 12:08:47 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb0Xs-0007ne-B1
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 12:08:45 +0000
Received: by mail-yb1-xb44.google.com with SMTP id f6so955790ybr.0
 for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2020 04:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r1L3r2RzlBzHKsTDF0OeXHNQaTpvxkyyv5MNmEuctLA=;
 b=W39lchB7KaskjvlWPuz2Z2/2Qm81h5G56Ka6fkFGkRCfaVxQLXijhZYB8rn3yUUii6
 ri1bDJ4HY+hDpJ6ZVwORHMkIcfUYLrcB8OcMmPImYDYJouNgXhZXVRnlAnN9gc/Pnc97
 L3LSNoqhHqhVxbMrkc+vAjSmnz4sClZ0wlbtdyvRxVXtESppmJGkIEVBY+ON0OPHx0Y5
 M86Kqn3VM3K48rxGTLZJlZFoANfWjB8jYD2kSEwwL+7Rr9KXY20CDf58LITDSjTfErfo
 zYQEas0x4MOKvTnx5TrpwYsVyJBN37nqF3AeA3oFS5ygqSotKVEjR6i1W/L8vX6ikUc3
 Yo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r1L3r2RzlBzHKsTDF0OeXHNQaTpvxkyyv5MNmEuctLA=;
 b=a6sHWhgyTq1D9xpfBJBo5chIUKRY5YQn3zIUyJx+4m3vPH4sDTcGo7XIGDN8gZ0ULx
 ur/FvGSgskaIoO5AsQPW3CMZGCt1Z1XUbSaI7lRi5OoGucndM6Lky04ZtOJaI9Thhrwe
 UO2Sq9H2OWdcnFDwvz5WcPv0+lEBcCzid/ue12zuHUQqlCMvYkF0Av1HNt6sGLMQ553a
 iz83qqqrq0kUftfP9npexPe6JX5VBpA/0W95DyJjFU5GGWhlZas7+NLTiu/nFndITbTu
 ryzizbh+eLCXkJXTgpgaiYff0sO2y8hXlz1Y5wjgTr13XElF3r2cib+rKg0EO2PHyBwY
 ot8w==
X-Gm-Message-State: AOAM532UKDBolvo9LXhCY/3JLYwzZsrDdhoddCYX3b48dPFZxprpboXL
 iqLpbBO7SCtOgju7wEym0jw4d9mBvdrmAJtmSvs=
X-Google-Smtp-Source: ABdhPJwZy4f8gEDVDbX+sRxJ7kIPXekWsFS7OZHG7TzIBRrgcqiLbHCoAeDglqbUHNUqniLRaj2jOAl/x5cOz/40NIU=
X-Received: by 2002:a25:9c87:: with SMTP id y7mr2316878ybo.314.1604664517927; 
 Fri, 06 Nov 2020 04:08:37 -0800 (PST)
MIME-Version: 1.0
References: <20201104063713.3039035-1-anup.patel@wdc.com>
 <mhng-78d4f2c3-0a0a-4264-9578-72ed0babbf1b@palmerdabbelt-glaptop1>
 <CAAhSdy3k-uhaE_tFQbd6UXpY-DaujG1jrmLjs0QmzdNQ7EoQuw@mail.gmail.com>
In-Reply-To: <CAAhSdy3k-uhaE_tFQbd6UXpY-DaujG1jrmLjs0QmzdNQ7EoQuw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 6 Nov 2020 20:08:26 +0800
Message-ID: <CAEUhbmUQdsACKrT=smGO3H3vh_hkA-O3UWd5dOFWTWWkZBpWKg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Use non-PGD mappings for early DTB access
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_070844_412243_1F6868B4 
X-CRM114-Status: GOOD (  34.22  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Bin Meng <bin.meng@windriver.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 6, 2020 at 4:52 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Nov 6, 2020 at 1:30 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
> >
> > On Tue, 03 Nov 2020 22:37:13 PST (-0800), Anup Patel wrote:
> > > Currently, we use PGD mappings for early DTB mapping in early_pgd
> > > but this breaks Linux kernel on SiFive Unleashed because on SiFive
> > > Unleashed PMP checks don't work correctly for PGD mappings.
> > >
> > > To fix early DTB mappings on SiFive Unleashed, we use non-PGD
> > > mappings (i.e. PMD) for early DTB access.
> > >
> > > Fixes: 8f3a2b4a96dc ("RISC-V: Move DT mapping outof fixmap")
> > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > ---
> > >  arch/riscv/mm/init.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > >
> > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > index ea933b789a88..0d13d0c36a7d 100644
> > > --- a/arch/riscv/mm/init.c
> > > +++ b/arch/riscv/mm/init.c
> > > @@ -297,6 +297,7 @@ pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
> > >  #define NUM_EARLY_PMDS               (1UL + MAX_EARLY_MAPPING_SIZE / PGDIR_SIZE)
> > >  #endif
> > >  pmd_t early_pmd[PTRS_PER_PMD * NUM_EARLY_PMDS] __initdata __aligned(PAGE_SIZE);
> > > +pmd_t early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
> > >
> > >  static pmd_t *__init get_pmd_virt_early(phys_addr_t pa)
> > >  {
> > > @@ -494,6 +495,18 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> > >                                  load_pa + (va - PAGE_OFFSET),
> > >                                  map_size, PAGE_KERNEL_EXEC);
> > >
> > > +#ifndef __PAGETABLE_PMD_FOLDED
> > > +     /* Setup early PMD for DTB */
> > > +     create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
> > > +                        (uintptr_t)early_dtb_pmd, PGDIR_SIZE, PAGE_TABLE);
> > > +     /* Create two consecutive PMD mappings for FDT early scan */
> > > +     pa = dtb_pa & ~(PMD_SIZE - 1);
> > > +     create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA,
> > > +                        pa, PMD_SIZE, PAGE_KERNEL);
> > > +     create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA + PMD_SIZE,
> > > +                        pa + PMD_SIZE, PMD_SIZE, PAGE_KERNEL);
> > > +     dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PMD_SIZE - 1));
> > > +#else
> > >       /* Create two consecutive PGD mappings for FDT early scan */
> > >       pa = dtb_pa & ~(PGDIR_SIZE - 1);
> > >       create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
> > > @@ -501,6 +514,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> > >       create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA + PGDIR_SIZE,
> > >                          pa + PGDIR_SIZE, PGDIR_SIZE, PAGE_KERNEL);
> > >       dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PGDIR_SIZE - 1));
> > > +#endif
> > >       dtb_early_pa = dtb_pa;
> > >
> > >       /*
> >
> > We're starting to build up a handful of workarounds for these sorts of things.
> > The PMP trap vs WARL one was the last I could remember, but that's a bit
> > different as both of those behaviors were allowed by specifications at some
> > point.  IIRC there were also some TLB shootdown issues floating
> >
> > The best I can come up with is to add both some sort of "minimum support
> > specification version" Kconfig entry and an "quirks" set of Kconfig entries.
> > That would allow us to gradually jettison old ISAs as well as more cleanly add
> > support for broken hardware like this.
> >
> > Do you have a pointer to some datasheet type document that describes the issue?
>
> Unfortunately, we still don't know where all SiFive erratums are documented.
> Maybe you know the right person who can publish this ??

Last time Andrew said this erratum would be published but did not give
a name of whom from SiFive in charge ..

>
> The PMP checks not working correctly for PGD-mappings was discovered
> independently by Bin Meng on some other OS (almost 1.5 years back). Few

Yep, this undocumented erratum was initially discovered during our
VxWorks RISC-V port.

> discussions about this erratum have happened on OpenSBI mailing list as well
> although in a very different context. In fact, Andrew had confirmed about this
> erratum in sw-dev google groups.
> (Refer, https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/CfyT5Los5uA/m/yY0ES0dZBAAJ?pli=1)
> (Refer, https://github.com/riscv/opensbi/issues/103)

The issue is not just about gigapages. Using megapages also could
trigger this issue.

To me this erratum seems like: if any PTEs are set up to overlap with
PMP protected memory, FU540 will trigger an instruction access
exception as soon as SATP is written.

>
> Till now we have encountered two erratums for SiFive U54 cores:
> 1. SFENCE.VMA not working with "virtual address" parameter
> 2. PMP checks not working for PGD mappings
>
> The Microchip ICICLE kit has U54 cores but the PMP checks issue
> is only seen on SiFive Unleashed so I guess this issue is fixed
> in-between but we can't be sure without detailed documentation.

I believe Microchip PolarFire SoC suffers this same erratum but I did
not verify that. Currently PMP is configured to protect the eNVM range
on PolarFire, and this range is not mapped by any PTE yet in S-mode.

>
> > That'd probably be the line I'd like to draw for adding workarounds like this,
> > as otherwise we can't really be sure something is a hardware issue.
> >
> > That said, it's better to have the fix so this is on fixes.  I'll try to
> > remember it for the list of workarounds.
>
> I agree. At the moment, 5.10-rc2 does not boot on SiFive Unleashed
> but it boots on Microchip icicle kit and everywhere else because of
> the PMP checks issue.

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

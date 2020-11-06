Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4B3C2D0A3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 08:53:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37C68208B3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 08:53:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oVn4YCaD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="CMIX+ykz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37C68208B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TSJMMRLmfZF9ZdusUc3FYUdsftUXOA/WO0Nr/vanTXU=; b=oVn4YCaDyYEnAopWzdJmjKNNx
	J2mntnlis6L/kv2eWxJdcxMRDTu6vxv0o3Y7ui7BisiUgxL3l2TSuUZf+uPw3CIH1T8yGgoi8nTIP
	Vb1i7aj5ZxdTUZSJ+Xeu/P3IxtQyw5nXefvAvSlv34H30MCB8fqiln4EbtNt0qo4qciYf6jFp0rfW
	5TJdznPDpiwebmuEKYWJi/MRWHYrdDFpVZuv7EmSn08n9ongIu7kvIcGZjdOXnKPQUR6sF2Q4Zqol
	ZZjBfTJ06Fl+iVEA7Ibpr8cTqJ3MekrMii2pwVISpfMs2pUV3ncSM7CM8xf/322Yw06ADJEItdw0C
	OZHE6rGhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaxUO-0003Zd-9a; Fri, 06 Nov 2020 08:52:56 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaxUL-0003ZB-Pj
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 08:52:54 +0000
Received: by mail-wr1-x442.google.com with SMTP id b8so471568wrn.0
 for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2020 00:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1SlIddTQa6YnvwCKFNoc0Zc6N2GDs/YOmt73lg/h6iM=;
 b=CMIX+ykzx4ZW4zP5Hx5PbPAkifwInBnOURHV+C70jv97Jl8yMGbM/8E5kIi+AG8/hZ
 QHPHPFmSM2stfBD58jaxUtDqBwoLloMXo8bXDz3YLFJNP7d6CEX6mRRmCb//e4MkQiNh
 sv4PKoknzxggLZ/6vKGJXczN65VuIgI3kDjHMzz2b5NQj4DkjDRBGpVg+4o3lzlaeMoV
 pjK3ZPBNUqk5TXqXaXsf+d1F4dgB3nYGdR4c5sm2qgRpiUDjEJfIgrHgHv0NFp9mZt4Q
 P8L8+P1JkF2HXC2yclg8kntyuKKsP0hH9xJ7V6CWj3IQ0ltdLrSluOdR6SM27gMkVKWy
 xLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1SlIddTQa6YnvwCKFNoc0Zc6N2GDs/YOmt73lg/h6iM=;
 b=Ed1Ca774N/KPG7+EBpp0akUK7sDuY0veHNC2vgAmxvAQJMVuewLwk8RnhE4KT1z5G3
 JPhM6gfVSyAkDLUV9RlLuGhYYYfXsATOSOK9LMQ2rW+ESBLpZCHL9YKLXrxOkysq83Xs
 6un+e1s0lj9oZ4QVIxOQrNeWtVOqyuYJ2gSBZ/6FojOwu7y552/aqiHge++zVIwLDtd9
 817X84FbE+zfBvpxbnbEWpwUXJmJM+3l0Q3p7J4UMwKnOwg7F6LVxy282q5ZOK4DbORp
 3T/N54QQqfj5iyVU3HwjuNkrZxSU+pSiWKYCELjVPRUqPg1QI6Y3nCfLEXEOa5C1LA2F
 +o3g==
X-Gm-Message-State: AOAM530lMM+T44q8VTWV1IZyYfi2tQCAvzgZg0pLznENqDrm2SXfg2g5
 WeQytuOTWvGg4JNnvspBOmZDs/jpDU2OkXuTqDKrWg==
X-Google-Smtp-Source: ABdhPJz+PwltCv2d088wOAs6uZr5rRw6aOBLIBSyMVLFKyl+V0vA/PCQZU7Orrg0nyhOwZnTfA/LLwdR1S3+fQnyjvo=
X-Received: by 2002:adf:eec2:: with SMTP id a2mr1532933wrp.128.1604652772606; 
 Fri, 06 Nov 2020 00:52:52 -0800 (PST)
MIME-Version: 1.0
References: <20201104063713.3039035-1-anup.patel@wdc.com>
 <mhng-78d4f2c3-0a0a-4264-9578-72ed0babbf1b@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-78d4f2c3-0a0a-4264-9578-72ed0babbf1b@palmerdabbelt-glaptop1>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Nov 2020 14:22:40 +0530
Message-ID: <CAAhSdy3k-uhaE_tFQbd6UXpY-DaujG1jrmLjs0QmzdNQ7EoQuw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Use non-PGD mappings for early DTB access
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_035253_944633_AC009E0F 
X-CRM114-Status: GOOD (  27.81  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Bin Meng <bin.meng@windriver.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 6, 2020 at 1:30 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Tue, 03 Nov 2020 22:37:13 PST (-0800), Anup Patel wrote:
> > Currently, we use PGD mappings for early DTB mapping in early_pgd
> > but this breaks Linux kernel on SiFive Unleashed because on SiFive
> > Unleashed PMP checks don't work correctly for PGD mappings.
> >
> > To fix early DTB mappings on SiFive Unleashed, we use non-PGD
> > mappings (i.e. PMD) for early DTB access.
> >
> > Fixes: 8f3a2b4a96dc ("RISC-V: Move DT mapping outof fixmap")
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  arch/riscv/mm/init.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index ea933b789a88..0d13d0c36a7d 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -297,6 +297,7 @@ pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
> >  #define NUM_EARLY_PMDS               (1UL + MAX_EARLY_MAPPING_SIZE / PGDIR_SIZE)
> >  #endif
> >  pmd_t early_pmd[PTRS_PER_PMD * NUM_EARLY_PMDS] __initdata __aligned(PAGE_SIZE);
> > +pmd_t early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
> >
> >  static pmd_t *__init get_pmd_virt_early(phys_addr_t pa)
> >  {
> > @@ -494,6 +495,18 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> >                                  load_pa + (va - PAGE_OFFSET),
> >                                  map_size, PAGE_KERNEL_EXEC);
> >
> > +#ifndef __PAGETABLE_PMD_FOLDED
> > +     /* Setup early PMD for DTB */
> > +     create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
> > +                        (uintptr_t)early_dtb_pmd, PGDIR_SIZE, PAGE_TABLE);
> > +     /* Create two consecutive PMD mappings for FDT early scan */
> > +     pa = dtb_pa & ~(PMD_SIZE - 1);
> > +     create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA,
> > +                        pa, PMD_SIZE, PAGE_KERNEL);
> > +     create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA + PMD_SIZE,
> > +                        pa + PMD_SIZE, PMD_SIZE, PAGE_KERNEL);
> > +     dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PMD_SIZE - 1));
> > +#else
> >       /* Create two consecutive PGD mappings for FDT early scan */
> >       pa = dtb_pa & ~(PGDIR_SIZE - 1);
> >       create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
> > @@ -501,6 +514,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> >       create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA + PGDIR_SIZE,
> >                          pa + PGDIR_SIZE, PGDIR_SIZE, PAGE_KERNEL);
> >       dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PGDIR_SIZE - 1));
> > +#endif
> >       dtb_early_pa = dtb_pa;
> >
> >       /*
>
> We're starting to build up a handful of workarounds for these sorts of things.
> The PMP trap vs WARL one was the last I could remember, but that's a bit
> different as both of those behaviors were allowed by specifications at some
> point.  IIRC there were also some TLB shootdown issues floating
>
> The best I can come up with is to add both some sort of "minimum support
> specification version" Kconfig entry and an "quirks" set of Kconfig entries.
> That would allow us to gradually jettison old ISAs as well as more cleanly add
> support for broken hardware like this.
>
> Do you have a pointer to some datasheet type document that describes the issue?

Unfortunately, we still don't know where all SiFive erratums are documented.
Maybe you know the right person who can publish this ??

The PMP checks not working correctly for PGD-mappings was discovered
independently by Bin Meng on some other OS (almost 1.5 years back). Few
discussions about this erratum have happened on OpenSBI mailing list as well
although in a very different context. In fact, Andrew had confirmed about this
erratum in sw-dev google groups.
(Refer, https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/CfyT5Los5uA/m/yY0ES0dZBAAJ?pli=1)
(Refer, https://github.com/riscv/opensbi/issues/103)

Till now we have encountered two erratums for SiFive U54 cores:
1. SFENCE.VMA not working with "virtual address" parameter
2. PMP checks not working for PGD mappings

The Microchip ICICLE kit has U54 cores but the PMP checks issue
is only seen on SiFive Unleashed so I guess this issue is fixed
in-between but we can't be sure without detailed documentation.

> That'd probably be the line I'd like to draw for adding workarounds like this,
> as otherwise we can't really be sure something is a hardware issue.
>
> That said, it's better to have the fix so this is on fixes.  I'll try to
> remember it for the list of workarounds.

I agree. At the moment, 5.10-rc2 does not boot on SiFive Unleashed
but it boots on Microchip icicle kit and everywhere else because of
the PMP checks issue.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

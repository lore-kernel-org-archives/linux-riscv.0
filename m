Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DABC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 13:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9c1dnclA6bsUMmuKA2N9zN9DJudG3xs13pAohhrqNU=; b=kYPB6yYy2m3XZr
	jAsK7acy1+N1LuHWN6Hy1vXx/QZmU5r7foP+QJl1zPnOMTgE5NwC9XOQ1X+dU6t2fy2eMZe/ms/Lr
	ZXeu6xhalmv0g1+lBJnvvy2l+4bfLXKOSiY1lOwmjs4cjw/uwFRNW12UNLjvDxE0NrMKgZ3fhM0+R
	P57VibOotFgdY91VfchTQd1v373hjeg7cymJndMoUXt+QbSXFpRV+yUq/7kzRKF3dGK9D5j1RZk5t
	+RTZZF5cruHFtlLeagzrzbiAtHHNfEl+qN8/3IshUAs+Xs+dUKfraDoWX0x0rn42/RKDR6YQBUwRP
	VCOoOnnm2Yp84c3HuBUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8hhI-008DuW-Bx; Fri, 23 Dec 2022 13:02:48 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8hhA-008Dms-9n
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 13:02:42 +0000
Received: by mail-yb1-xb34.google.com with SMTP id i186so5197579ybc.9
        for <linux-riscv@lists.infradead.org>; Fri, 23 Dec 2022 05:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FgGdDK2lz6RD6lHxgpy8IA0EMFwDimB1CVAciou4PrA=;
        b=oTH4Pnq/W2nLZO77k8pog9TAxJBEpRvEMJtoC3fGyzsw/J558C2lOKy/v3kw8nOwHl
         HDpJ1OLlSr4Uva0yLTG7ffyPbRR2HwOvCYFbWecyxHjBe22zgNOhoGMMbtYYm76LYmvK
         g9DZ/rhkq0WBR2a29z3ptQCXs7rMHf0JebtOssHGgtS5mQP7YBeCbthLj7X7W+NLnlEs
         zsaDt0RAchYS9NpsKc1/JvXH3tZzunvbWO07q8rjoHXooEr7GAHEnI4NHTP1xPyqWpPc
         OnGIhA06NQlliAnDTnb/29eE9ylHQbClGrBLy/Z4bA3ZHePEWIzYOutK5VUORfwuBHpZ
         H0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgGdDK2lz6RD6lHxgpy8IA0EMFwDimB1CVAciou4PrA=;
        b=E6kiJFrvlAOhrAV+m+ii12zfpBhtUKS6Jna33WtlK79Xm/+guWkjQivqUAHCX5L2LR
         5/QH96QXFMmEKYae0P4VeFwmCVfNtfDRMPzrIv+8G8q6k7fWd/u1A7JIavUeP8yvlxED
         xbHfO3ba+unYr2lHgNu0vCixIeX6KhcfzbXdoVVuAZoTDxbMYDMgTEEdmLO1obUSe0C0
         8NlxR3wW5fOXoy164jj06GDdSEAXMYWPNylO+YpDa2ilZ/M74ft90YvcSNV5EDQ4mm+G
         /3x16BlDH0W4tqKlD3SwiWvBMgUr0pM7CxjWPdz+RwAwyK0AIumduMk68aJdc2cxQHwc
         G0kQ==
X-Gm-Message-State: AFqh2krByfbKyAwIfe5J1I2Hev55o9YeIUDp+i0qMnAZPXTG2+3OuoqM
	N6o81TgogSJzLkREpOseVgBT0N66grvAD9dICv8=
X-Google-Smtp-Source: AMrXdXvXC8OHBwH1Xsd6UcBj7Z+CDB9gdjQwmVPQGEiKa4NVWsHAPIcb5I2Xdq846MbGQRt6Y7gdtRe/Lf+4zg2gX8w=
X-Received: by 2002:a25:7650:0:b0:74a:79e2:3ab with SMTP id
 r77-20020a257650000000b0074a79e203abmr1022064ybc.119.1671800556006; Fri, 23
 Dec 2022 05:02:36 -0800 (PST)
MIME-Version: 1.0
References: <20220829205219.283543-1-geomatsi@gmail.com> <CA+V-a8uLmp33PSYGmJjf9FupJ0M8Hf7ef7A1G4va8GDL_61Qyw@mail.gmail.com>
 <Y6S1/kROC0p5CboA@curiosity> <CA+V-a8u0qUF81RUTF9+4T4F1GxW3=4P7RMTTjjsaMq4MiiQSMQ@mail.gmail.com>
 <Y6TIywUWZ3nrPeon@curiosity> <CA+V-a8tMQ-RaaXD5209HxT77VoiOanvjdbFCPsdWpDYswuY+ZQ@mail.gmail.com>
 <Y6TYNBgqgWuxhhHJ@curiosity>
In-Reply-To: <Y6TYNBgqgWuxhhHJ@curiosity>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 23 Dec 2022 13:02:10 +0000
Message-ID: <CA+V-a8tDi79M8cS7rVoby3sopQ4AwXXcNggfHYXW-W2wtEgQ4g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] riscv: mm: notify remote harts about mmu cache updates
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, 
	Alexandre Ghiti <alexandre.ghiti@canonical.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley <Conor.Dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_050240_455938_622623AE 
X-CRM114-Status: GOOD (  37.82  )
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

Hi Sergey,

On Thu, Dec 22, 2022 at 10:20 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> On Thu, Dec 22, 2022 at 09:26:07PM +0000, Lad, Prabhakar wrote:
> > Hi Sergey,
> >
> > On Thu, Dec 22, 2022 at 9:14 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > > > > > From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> > > > > > >
> > > > > > > Current implementation of update_mmu_cache function performs local TLB
> > > > > > > flush. It does not take into account ASID information. Besides, it does
> > > > > > > not take into account other harts currently running the same mm context
> > > > > > > or possible migration of the running context to other harts. Meanwhile
> > > > > > > TLB flush is not performed for every context switch if ASID support
> > > > > > > is enabled.
> > > > > > >
> > > > > > > Patch [1] proposed to add ASID support to update_mmu_cache to avoid
> > > > > > > flushing local TLB entirely. This patch takes into account other
> > > > > > > harts currently running the same mm context as well as possible
> > > > > > > migration of this context to other harts.
> > > > > > >
> > > > > > > For this purpose the approach from flush_icache_mm is reused. Remote
> > > > > > > harts currently running the same mm context are informed via SBI calls
> > > > > > > that they need to flush their local TLBs. All the other harts are marked
> > > > > > > as needing a deferred TLB flush when this mm context runs on them.
> > > > > > >
> > > > > > > [1] https://lore.kernel.org/linux-riscv/20220821013926.8968-1-tjytimi@163.com/
> > > > > > >
> > > > > > > Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> > > > > > > ---
> > > > > > >  arch/riscv/include/asm/mmu.h      |  2 ++
> > > > > > >  arch/riscv/include/asm/pgtable.h  |  2 +-
> > > > > > >  arch/riscv/include/asm/tlbflush.h | 18 ++++++++++++++++++
> > > > > > >  arch/riscv/mm/context.c           | 10 ++++++++++
> > > > > > >  arch/riscv/mm/tlbflush.c          | 28 +++++++++++-----------------
> > > > > > >  5 files changed, 42 insertions(+), 18 deletions(-)
> > > > > > >
> > > > <snip>
> > > > > > [  133.008752] Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
> > > > > > [  133.015338] Call Trace:
> > > > > > [  133.017778] [<ffffffff800055cc>] dump_backtrace+0x1c/0x24
> > > > > > [  133.023174] [<ffffffff80776836>] show_stack+0x2c/0x38
> > > > > > [  133.028214] [<ffffffff80780244>] dump_stack_lvl+0x3c/0x54
> > > > > > [  133.033597] [<ffffffff80780270>] dump_stack+0x14/0x1c
> > > > > > [  133.038633] [<ffffffff80776c00>] panic+0x102/0x29a
> > > > > > [  133.043409] [<ffffffff800137ba>] do_exit+0x704/0x70a
> > > > > > [  133.048362] [<ffffffff8001390e>] do_group_exit+0x24/0x70
> > > > > > [  133.053659] [<ffffffff8001de54>] get_signal+0x68a/0x6dc
> > > > > > [  133.058874] [<ffffffff8000494e>] do_work_pending+0xd6/0x44e
> > > > > > [  133.064427] [<ffffffff800036c2>] resume_userspace_slow+0x8/0xa
> > > > > > [  133.070249] ---[ end Kernel panic - not syncing: Attempted to kill
> > > > > > init! exitcode=0x0000000b ]---
> > > > > >
> > > > > > If I revert this patch [0] bonnie++ works as expected.
> > > > > >
> > > > > > Any pointers on what could be the issue here?
> > > > > >
> > > > > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=for-next&id=4bd1d80efb5af640f99157f39b50fb11326ce641
> > > > > >
> > > > > > Cheers,
> > > > > > Prabhakar
> > > > >
> > > > > Good catch. Thanks for reporting ! Discussion around the issue and
> > > > > possible ways to fix it can be found in the following email thread:
> > > > >
> > > > > https://lore.kernel.org/linux-riscv/20221111075902.798571-1-guoren@kernel.org/
> > > > >
> > > > > Could you please apply the patch from Guo Ren instead of [0] and check
> > > > > if you have any issues with your test ? Besides, could you please share
> > > > > your kernel configuration and the actual bonnie++ params from emmc_t_002.sh script ?
> > > > >
> > > > Thanks for the pointer, I'll undo my changes and test Guo's patch.
> > > >
> > > > I have pasted the script here [0] and attached config.
> > > >
> > > > [0] https://paste.debian.net/hidden/a7a769b5/
> > >
> > > Thanks for the script and config. Could you please also share the
> > > following information:
> > > - how many cores your system has
> > The Renesas RZ/Five SoC has a single Andes AX45MP core.
> >
> > > - does your system support ASID
> > >
> > With a quick look at [0] It does support ASID, unless there is a way
> > to disable it.
> >
> > [0] http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
>
> So you have a single-core system, but your kernel configuration enables
> CONFIG_SMP. Additional 'deferred TLB flush' logic is dropped at build
> time if CONFIG_SMP is disabled. On the other hand, system should not
> fail that way even if SMP is enabled.
>
I enabled CONFIG_SMP while doing some testing of PMA code and indeed
enabling this config should not introduce a failure.

> Let me double-check if anything can go wrong if cpumasks may have only
> a single cpu. Another suspect is a change in update_mmu_cache: probably
> making it asid-specific (and thus more granular) was a bad idea.
>
Thanks.

BTW I tested the patch [0] which you pointed out and that fixes the
issues seen earlier.

[0] https://patchwork.kernel.org/project/linux-riscv/patch/20221111075902.798571-1-guoren@kernel.org/

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

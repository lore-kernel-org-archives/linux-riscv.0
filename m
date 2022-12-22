Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12B4C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 22:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UdWhqSB0eBachOM02fuZXuVRRh2IHPFrqP9jCrOPhg=; b=zDPNlPMgn84Jls
	gH9mj6YtwHK0VhVnBne3rtsqHq9mQauEirysJ5+tVRPojysbVAGjqjeHoESfoKIbpHzsS2w/AUXOG
	IsyJvHOqswaITKS3tAKsqh8XClFwWJ/Qi4EA+zCBrm+zSXwFiqCIkpR5KcICjw0W7f6afLCJW9qNL
	6pKyhkAG6hYsCG68CFozKlX19Zs0eFDQul6PPyDzKshvhgOePILbuiq510wUOhInzRJzQOr6E9ajt
	h9IpqnEd9mOrVX0/ogGieW7NaP6OOAiEHy2lqi5H1Qhb8pPvrhEd93OlgKBsxEjLq+1syaLOanxcm
	ve48eE3tNrBKOAtA7Oyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Tvh-0005CW-Uf; Thu, 22 Dec 2022 22:20:45 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Tvd-0005Aa-VZ
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 22:20:43 +0000
Received: by mail-lf1-x130.google.com with SMTP id o6so4700536lfi.5
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 14:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HHE1uDVV02aTXLSeA7SUTgkt7ugOAsRPACu2QGMqouM=;
        b=IRoIBeH+iqDW5myZjHqQ9CShQ1eRuDYCvZSlz8EJYitUxJLmg7Qy8qXefVjV1+DJnK
         01syJVkK/YNj72iDD+f4Unp+otYlJbx51T5Cx7rt4RHJTafehnRnjcXSI3hb9hr7NLvB
         x2JUhr2nLjRKhxQYcirGqLGGRJ3bGtCPpb+CDrEPyW/xgwsvyxcpJpP0rz6OZVbvW+3J
         zKILvDWT4p4C4/tDAVB4VvropnOJHOhvsTS0AJTDdNU9RY/76FCXGXamwT5Bq2eRLpl4
         klCsRwLWUmr4iE5bdDrn2wKdlf39Id176HJzSTEg3fuV2HpDMdBcJcJ9fo1pc5/NqjVP
         bT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHE1uDVV02aTXLSeA7SUTgkt7ugOAsRPACu2QGMqouM=;
        b=IFBZ/lDhA215zTNYY6DgzQ1c8qIRVKUgoOEajTMhdn0F7Aztn5M/4fH86p0zjRWfcR
         PMSVwi2f0gnBDVV1Bs/ar4v65vdkUCbs+3QJz+EQVpS0RgbgCynvrWuTq0DvjEILqyej
         vN5z4NXbU2Aa8BknALp5pdnEEFY6gn4ilVvURy3JV3pWDvfF5WpJSsVP47mZKldqWc6A
         63I8pq61qJ1MCz9xe6yq6hSRWbRORyUiQ70LDxNVGmpZtl/EBuGEBmg76mSZwe6BNZeU
         7lmMULqJMYm+YvCrv0T3WNTiR24MUvzbXWIf1vENdU6crJcG61Zl3Afy8oUMkmTArye3
         1gXw==
X-Gm-Message-State: AFqh2kpnfa+S2BNUzMQMn9otP12B4UoNDb3oJH5xMINJVg+9KdHLZF8H
	UYZVMU+Q547dZYW6E3cH+n4=
X-Google-Smtp-Source: AMrXdXte/tuq0ApayS0uJzuE9x6BLxk8fVRrAORwutJ+90epsia47vuqhm7ihU5kviqbW323ycHorQ==
X-Received: by 2002:a05:6512:b28:b0:4ca:f42f:c6a4 with SMTP id w40-20020a0565120b2800b004caf42fc6a4mr370306lfu.36.1671747639146;
        Thu, 22 Dec 2022 14:20:39 -0800 (PST)
Received: from curiosity ([5.188.167.245])
        by smtp.gmail.com with ESMTPSA id s6-20020a056512314600b004bb766e01a4sm224541lfi.245.2022.12.22.14.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 14:20:37 -0800 (PST)
Date: Fri, 23 Dec 2022 01:20:36 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <Conor.Dooley@microchip.com>
Subject: Re: [RFC PATCH 1/1] riscv: mm: notify remote harts about mmu cache
 updates
Message-ID: <Y6TYNBgqgWuxhhHJ@curiosity>
References: <20220829205219.283543-1-geomatsi@gmail.com>
 <CA+V-a8uLmp33PSYGmJjf9FupJ0M8Hf7ef7A1G4va8GDL_61Qyw@mail.gmail.com>
 <Y6S1/kROC0p5CboA@curiosity>
 <CA+V-a8u0qUF81RUTF9+4T4F1GxW3=4P7RMTTjjsaMq4MiiQSMQ@mail.gmail.com>
 <Y6TIywUWZ3nrPeon@curiosity>
 <CA+V-a8tMQ-RaaXD5209HxT77VoiOanvjdbFCPsdWpDYswuY+ZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8tMQ-RaaXD5209HxT77VoiOanvjdbFCPsdWpDYswuY+ZQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_142042_103154_8919CC6F 
X-CRM114-Status: GOOD (  35.73  )
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

On Thu, Dec 22, 2022 at 09:26:07PM +0000, Lad, Prabhakar wrote:
> Hi Sergey,
> 
> On Thu, Dec 22, 2022 at 9:14 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> >
> > Hi Prabhakar,
> >
> > > > > > From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> > > > > >
> > > > > > Current implementation of update_mmu_cache function performs local TLB
> > > > > > flush. It does not take into account ASID information. Besides, it does
> > > > > > not take into account other harts currently running the same mm context
> > > > > > or possible migration of the running context to other harts. Meanwhile
> > > > > > TLB flush is not performed for every context switch if ASID support
> > > > > > is enabled.
> > > > > >
> > > > > > Patch [1] proposed to add ASID support to update_mmu_cache to avoid
> > > > > > flushing local TLB entirely. This patch takes into account other
> > > > > > harts currently running the same mm context as well as possible
> > > > > > migration of this context to other harts.
> > > > > >
> > > > > > For this purpose the approach from flush_icache_mm is reused. Remote
> > > > > > harts currently running the same mm context are informed via SBI calls
> > > > > > that they need to flush their local TLBs. All the other harts are marked
> > > > > > as needing a deferred TLB flush when this mm context runs on them.
> > > > > >
> > > > > > [1] https://lore.kernel.org/linux-riscv/20220821013926.8968-1-tjytimi@163.com/
> > > > > >
> > > > > > Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> > > > > > ---
> > > > > >  arch/riscv/include/asm/mmu.h      |  2 ++
> > > > > >  arch/riscv/include/asm/pgtable.h  |  2 +-
> > > > > >  arch/riscv/include/asm/tlbflush.h | 18 ++++++++++++++++++
> > > > > >  arch/riscv/mm/context.c           | 10 ++++++++++
> > > > > >  arch/riscv/mm/tlbflush.c          | 28 +++++++++++-----------------
> > > > > >  5 files changed, 42 insertions(+), 18 deletions(-)
> > > > > >
> > > <snip>
> > > > > [  133.008752] Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
> > > > > [  133.015338] Call Trace:
> > > > > [  133.017778] [<ffffffff800055cc>] dump_backtrace+0x1c/0x24
> > > > > [  133.023174] [<ffffffff80776836>] show_stack+0x2c/0x38
> > > > > [  133.028214] [<ffffffff80780244>] dump_stack_lvl+0x3c/0x54
> > > > > [  133.033597] [<ffffffff80780270>] dump_stack+0x14/0x1c
> > > > > [  133.038633] [<ffffffff80776c00>] panic+0x102/0x29a
> > > > > [  133.043409] [<ffffffff800137ba>] do_exit+0x704/0x70a
> > > > > [  133.048362] [<ffffffff8001390e>] do_group_exit+0x24/0x70
> > > > > [  133.053659] [<ffffffff8001de54>] get_signal+0x68a/0x6dc
> > > > > [  133.058874] [<ffffffff8000494e>] do_work_pending+0xd6/0x44e
> > > > > [  133.064427] [<ffffffff800036c2>] resume_userspace_slow+0x8/0xa
> > > > > [  133.070249] ---[ end Kernel panic - not syncing: Attempted to kill
> > > > > init! exitcode=0x0000000b ]---
> > > > >
> > > > > If I revert this patch [0] bonnie++ works as expected.
> > > > >
> > > > > Any pointers on what could be the issue here?
> > > > >
> > > > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=for-next&id=4bd1d80efb5af640f99157f39b50fb11326ce641
> > > > >
> > > > > Cheers,
> > > > > Prabhakar
> > > >
> > > > Good catch. Thanks for reporting ! Discussion around the issue and
> > > > possible ways to fix it can be found in the following email thread:
> > > >
> > > > https://lore.kernel.org/linux-riscv/20221111075902.798571-1-guoren@kernel.org/
> > > >
> > > > Could you please apply the patch from Guo Ren instead of [0] and check
> > > > if you have any issues with your test ? Besides, could you please share
> > > > your kernel configuration and the actual bonnie++ params from emmc_t_002.sh script ?
> > > >
> > > Thanks for the pointer, I'll undo my changes and test Guo's patch.
> > >
> > > I have pasted the script here [0] and attached config.
> > >
> > > [0] https://paste.debian.net/hidden/a7a769b5/
> >
> > Thanks for the script and config. Could you please also share the
> > following information:
> > - how many cores your system has
> The Renesas RZ/Five SoC has a single Andes AX45MP core.
> 
> > - does your system support ASID
> >
> With a quick look at [0] It does support ASID, unless there is a way
> to disable it.
> 
> [0] http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf

So you have a single-core system, but your kernel configuration enables
CONFIG_SMP. Additional 'deferred TLB flush' logic is dropped at build
time if CONFIG_SMP is disabled. On the other hand, system should not
fail that way even if SMP is enabled.

Let me double-check if anything can go wrong if cpumasks may have only
a single cpu. Another suspect is a change in update_mmu_cache: probably
making it asid-specific (and thus more granular) was a bad idea.

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

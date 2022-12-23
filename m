Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25130C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 17:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ku4QuH0Rt6uOOSNAWf5c7NErGjc0vWPb7OibydWGHFc=; b=xKE4I7IcItR0k2
	fq/5TrJbCX5IU5HkZ27qSQmPuegDL2aIcNbnyzSYVnv/xn6lhlrGrOIXGski/yF37+OQYyjEObkt/
	vB16Hrv1SEsCFEr4i3Nd80ckZdhu8QCazq7vuwlnlauU1rEK5pvbdItrLi6DOTBgTlQtApYF2y0GP
	Aj7iTVv7dSdGGXPzII1oChwYzEkiOpBZxPLpgv8Al7GpwSHUUKBYmL6H0pWtGezSJXN2dH03vY/5E
	U35Naiy35SYCby9bjVlzpz55iDInBuirNQgiqFB3y77QkjklgwDVLYqEXTTUsuAgcJIrsxYJv+xGs
	TYY1LNwhTj8SGI6tFEHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8lkd-00AN2F-3Y; Fri, 23 Dec 2022 17:22:31 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8lkQ-00AMru-3u
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 17:22:20 +0000
Received: by mail-lf1-x12c.google.com with SMTP id z26so7815056lfu.8
        for <linux-riscv@lists.infradead.org>; Fri, 23 Dec 2022 09:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5VdpzaYPk//fOlHS15b7gOcPpDbZ34OzCidjh7j86xg=;
        b=Hjjq++c35UeqSC0e4JA5xlU4Lq5dv1UQpvc5635/7o6xKlOxyxx4Drgl3T3VwrKchg
         55Z2gfqH5B509V95Zc9Ux1YfmS8x3rTtcX/1YVMDVHKy/YRvAyaRgQO+zgQ1/0abo6K2
         hHm+2TN+YeI8v6xcs+FA3t9yOUJCVuN2jZ37NPmPrKM+7nBShAOZ/BSK0TGexMakkWA1
         eNaaAChAuA/QQ+TlF3SfscBUQZTCTY0v+1LxIjVLX/QPzzM+3kcIcAuXIcpqZZ6MCjkA
         7C+KROdzI2F2z9PEdrXxmZyMcHz9RQSCGQ21J/i81ieiZ+YeLdRYEANOfT57JoZVyj0Z
         7zXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VdpzaYPk//fOlHS15b7gOcPpDbZ34OzCidjh7j86xg=;
        b=s7kT2v7UCYnphAMLuN8s0aeNDWrJlS5IllkL6Z9PcX+6nkXxhzrMITHqhoSiC/CahD
         tTBE5fcr1fwrq3WepOJUhbUeIYj6OlvqsHx6oV8zRIfIHikyXjQIiVMQGWH1kC9YpLcz
         WCbCLvhLHxYoJOKjS+xdxpUyXX4Pn81dK9QXGjdXGqpgAFYyTG47+bQ9FtQG/XvtOmmC
         CSPaAQALrb/hWFAHqGeFm4D2dZRMgrs7tBMqJ5cZA7cTjGCepTEh4H79SFb+1htrRffD
         /x6geMltWLFi6xL/MHStSXwaMYVb/hZkUZdi37P2gZtNZ3STPkbODTXQG3Z57wHupS+Y
         8KhA==
X-Gm-Message-State: AFqh2koxN8ZqVgwayUvV5k9qFmcehlNE1mb8++s009tEUwKku0ugjVmO
	OZpvZ5ykZCRUp7WnPKX6/RQ=
X-Google-Smtp-Source: AMrXdXsr3uja2WyybsvWi+wNf9UO9XQDiJ5XGzLk1t910Hwl8Hk/nutiygagzKMBlOvp1EWlNwPArQ==
X-Received: by 2002:a05:6512:340d:b0:4b6:ec96:bb9a with SMTP id i13-20020a056512340d00b004b6ec96bb9amr3856115lfr.60.1671816133968;
        Fri, 23 Dec 2022 09:22:13 -0800 (PST)
Received: from curiosity ([5.188.167.245])
        by smtp.gmail.com with ESMTPSA id a20-20020a056512201400b004cafa2bfb7dsm146651lfb.133.2022.12.23.09.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 09:22:11 -0800 (PST)
Date: Fri, 23 Dec 2022 20:22:10 +0300
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
Message-ID: <Y6Xjwg1dDYnwRbni@curiosity>
References: <20220829205219.283543-1-geomatsi@gmail.com>
 <CA+V-a8uLmp33PSYGmJjf9FupJ0M8Hf7ef7A1G4va8GDL_61Qyw@mail.gmail.com>
 <Y6S1/kROC0p5CboA@curiosity>
 <CA+V-a8u0qUF81RUTF9+4T4F1GxW3=4P7RMTTjjsaMq4MiiQSMQ@mail.gmail.com>
 <Y6TIywUWZ3nrPeon@curiosity>
 <CA+V-a8tMQ-RaaXD5209HxT77VoiOanvjdbFCPsdWpDYswuY+ZQ@mail.gmail.com>
 <Y6TYNBgqgWuxhhHJ@curiosity>
 <CA+V-a8tDi79M8cS7rVoby3sopQ4AwXXcNggfHYXW-W2wtEgQ4g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8tDi79M8cS7rVoby3sopQ4AwXXcNggfHYXW-W2wtEgQ4g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_092218_184830_03DA3DFF 
X-CRM114-Status: GOOD (  43.37  )
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

Hi Prabhakar,

On Fri, Dec 23, 2022 at 01:02:10PM +0000, Lad, Prabhakar wrote:
> Hi Sergey,
> 
> On Thu, Dec 22, 2022 at 10:20 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> >
> > On Thu, Dec 22, 2022 at 09:26:07PM +0000, Lad, Prabhakar wrote:
> > > Hi Sergey,
> > >
> > > On Thu, Dec 22, 2022 at 9:14 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> > > >
> > > > Hi Prabhakar,
> > > >
> > > > > > > > From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> > > > > > > >
> > > > > > > > Current implementation of update_mmu_cache function performs local TLB
> > > > > > > > flush. It does not take into account ASID information. Besides, it does
> > > > > > > > not take into account other harts currently running the same mm context
> > > > > > > > or possible migration of the running context to other harts. Meanwhile
> > > > > > > > TLB flush is not performed for every context switch if ASID support
> > > > > > > > is enabled.
> > > > > > > >
> > > > > > > > Patch [1] proposed to add ASID support to update_mmu_cache to avoid
> > > > > > > > flushing local TLB entirely. This patch takes into account other
> > > > > > > > harts currently running the same mm context as well as possible
> > > > > > > > migration of this context to other harts.
> > > > > > > >
> > > > > > > > For this purpose the approach from flush_icache_mm is reused. Remote
> > > > > > > > harts currently running the same mm context are informed via SBI calls
> > > > > > > > that they need to flush their local TLBs. All the other harts are marked
> > > > > > > > as needing a deferred TLB flush when this mm context runs on them.
> > > > > > > >
> > > > > > > > [1] https://lore.kernel.org/linux-riscv/20220821013926.8968-1-tjytimi@163.com/
> > > > > > > >
> > > > > > > > Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> > > > > > > > ---
> > > > > > > >  arch/riscv/include/asm/mmu.h      |  2 ++
> > > > > > > >  arch/riscv/include/asm/pgtable.h  |  2 +-
> > > > > > > >  arch/riscv/include/asm/tlbflush.h | 18 ++++++++++++++++++
> > > > > > > >  arch/riscv/mm/context.c           | 10 ++++++++++
> > > > > > > >  arch/riscv/mm/tlbflush.c          | 28 +++++++++++-----------------
> > > > > > > >  5 files changed, 42 insertions(+), 18 deletions(-)
> > > > > > > >
> > > > > <snip>
> > > > > > > [  133.008752] Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
> > > > > > > [  133.015338] Call Trace:
> > > > > > > [  133.017778] [<ffffffff800055cc>] dump_backtrace+0x1c/0x24
> > > > > > > [  133.023174] [<ffffffff80776836>] show_stack+0x2c/0x38
> > > > > > > [  133.028214] [<ffffffff80780244>] dump_stack_lvl+0x3c/0x54
> > > > > > > [  133.033597] [<ffffffff80780270>] dump_stack+0x14/0x1c
> > > > > > > [  133.038633] [<ffffffff80776c00>] panic+0x102/0x29a
> > > > > > > [  133.043409] [<ffffffff800137ba>] do_exit+0x704/0x70a
> > > > > > > [  133.048362] [<ffffffff8001390e>] do_group_exit+0x24/0x70
> > > > > > > [  133.053659] [<ffffffff8001de54>] get_signal+0x68a/0x6dc
> > > > > > > [  133.058874] [<ffffffff8000494e>] do_work_pending+0xd6/0x44e
> > > > > > > [  133.064427] [<ffffffff800036c2>] resume_userspace_slow+0x8/0xa
> > > > > > > [  133.070249] ---[ end Kernel panic - not syncing: Attempted to kill
> > > > > > > init! exitcode=0x0000000b ]---
> > > > > > >
> > > > > > > If I revert this patch [0] bonnie++ works as expected.
> > > > > > >
> > > > > > > Any pointers on what could be the issue here?
> > > > > > >
> > > > > > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=for-next&id=4bd1d80efb5af640f99157f39b50fb11326ce641
> > > > > > >
> > > > > > > Cheers,
> > > > > > > Prabhakar
> > > > > >
> > > > > > Good catch. Thanks for reporting ! Discussion around the issue and
> > > > > > possible ways to fix it can be found in the following email thread:
> > > > > >
> > > > > > https://lore.kernel.org/linux-riscv/20221111075902.798571-1-guoren@kernel.org/
> > > > > >
> > > > > > Could you please apply the patch from Guo Ren instead of [0] and check
> > > > > > if you have any issues with your test ? Besides, could you please share
> > > > > > your kernel configuration and the actual bonnie++ params from emmc_t_002.sh script ?
> > > > > >
> > > > > Thanks for the pointer, I'll undo my changes and test Guo's patch.
> > > > >
> > > > > I have pasted the script here [0] and attached config.
> > > > >
> > > > > [0] https://paste.debian.net/hidden/a7a769b5/
> > > >
> > > > Thanks for the script and config. Could you please also share the
> > > > following information:
> > > > - how many cores your system has
> > > The Renesas RZ/Five SoC has a single Andes AX45MP core.
> > >
> > > > - does your system support ASID
> > > >
> > > With a quick look at [0] It does support ASID, unless there is a way
> > > to disable it.
> > >
> > > [0] http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> >
> > So you have a single-core system, but your kernel configuration enables
> > CONFIG_SMP. Additional 'deferred TLB flush' logic is dropped at build
> > time if CONFIG_SMP is disabled. On the other hand, system should not
> > fail that way even if SMP is enabled.
> >
> I enabled CONFIG_SMP while doing some testing of PMA code and indeed
> enabling this config should not introduce a failure.
> 
> > Let me double-check if anything can go wrong if cpumasks may have only
> > a single cpu. Another suspect is a change in update_mmu_cache: probably
> > making it asid-specific (and thus more granular) was a bad idea.
> >
> Thanks.
> 
> BTW I tested the patch [0] which you pointed out and that fixes the
> issues seen earlier.
> 
> [0] https://patchwork.kernel.org/project/linux-riscv/patch/20221111075902.798571-1-guoren@kernel.org/

All looks good with cpumasks in the single-core case. So deferred TLB
flush logic is not even executed in your case. So the root cause
should be in update_mmu_cache change.

May I ask you to repeat the original emmc test on your platform from
for-next (i.e. with [0] and without [1]) with the following partial revert:

: diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
: index ec6fb83349ce..92ec2d9d7273 100644
: --- a/arch/riscv/include/asm/pgtable.h
: +++ b/arch/riscv/include/asm/pgtable.h
: @@ -415,7 +415,7 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
:  	 * Relying on flush_tlb_fix_spurious_fault would suffice, but
:  	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
:  	 */
: -	flush_tlb_page(vma, address);
: +	local_flush_tlb_page(address);
:  }
:  
:  static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,

[0] https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=for-next&id=4bd1d80efb5af640f99157f39b50fb11326ce641
[1] https://patchwork.kernel.org/project/linux-riscv/patch/20221111075902.798571-1-guoren@kernel.org/

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

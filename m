Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C0BC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 21:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5iMOEvl/psyn3A4V5W2p3fujjz2OeEEFwktYsk6USQM=; b=PVrFL2/XzujaZ/
	h4ansj0DAwprxejcApT17PkhkgzC3f7F7VflDGz2zJRdAQ66feJDj17HMzz2HtXMrvMN/XSZ0Nf4P
	frJtFELSjGF4hhlHiySEHe0/jPEWzKzCS3qEfIRb+bC/hby0L2tmpBnUYzVJT+A2bfKNMzbkNoQsE
	T+O1EmdxrIx0SDv9IkITxLw6/jDyeJI7kIxkLFyBI/EPvE6QUGeeHSIVpJUErnoZQLRvy4dpTh5b9
	sM9pkmbeL1bFMs/29sAopz50msj56zb6ot+HgrutKneZyII4L5NfpFbQw2R9Exi57K2SjkgLHT/AH
	0BCQAeF7IPhBe2Q8WmSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8T5a-00HKiv-Ly; Thu, 22 Dec 2022 21:26:54 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8T5L-00HKdu-HM
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 21:26:41 +0000
Received: by mail-ed1-x533.google.com with SMTP id d14so4642706edj.11
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 13:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2/aju8MHXTI2ZGOmi0rvK/Hhikp+XN7yBDPhwhpTH0M=;
        b=b7UXnY0SeTZ0XgTs8rXCpFz3yuNiGlJoG2lUL54te/8E8ABBN0eSRn3IxPQ7EIf6qz
         v7rqgizbyhDkjuoTP4tWGuWBR/mCXRtTvjT5Gl4QSRzSosuaHVwHXBufyiznvkFMV22u
         XqhlXu83NP2Si7LJC97AL/+MBXb5xJRyKUWSj5jkZwfpH/8FUy6HpYXesEHO9savsssB
         EoMV58nhllEIWutSpyZkG7mI11OtKR22bwX60ZmxZ63q+yUH8KMIfuhZ6259OqsI6zz7
         tQjCiJvFBLPRSHzvGT28vdMzpKygOunhMYXy1duzTj0Hjwj3psM87e/bHbWZtnshreJT
         V25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/aju8MHXTI2ZGOmi0rvK/Hhikp+XN7yBDPhwhpTH0M=;
        b=zi6euUZfplzYuxSB9Mubwjrpq086o6VwuSKT25ijKxQZ9Q8L1L25be0qhh9OM9LaWT
         ZWMhS3H5F12AlVpyKTghljFHeHUOr0h+nj0o97Ub4vepaY0Ho3UuEAlivUFsvDuTJeAy
         qyO4DLGn8a+ZSSZkNEmluic740OfP1A9U8CwchSdgVUBuBH2uc/49sagUkuehBa4yTqT
         DklMSzWl3jdRBOsVsfWPTP9ZV/uviCIdFySCKGhuc8q7SWnKwnyghgY62w0lcr5vNPLC
         tJYE0RBF3C4ldOxN21sxl2TyfgJ0XJs0S2ZAdCJxE5IHY1pSCyJaTcFTa9nma6VUe/3F
         9axQ==
X-Gm-Message-State: AFqh2koVsGbwhQwXUu05aJ0hkS9EHv1ynrW6rc5pyYESNQXSHEs/kddB
	Uae+WusHFqAjx8kbjfxeZa1E6m1rpnQG4GbwS/I=
X-Google-Smtp-Source: AMrXdXtpm0n9XDzYj18vV9bQfcxr+l5npw+G5/oHeGceo6frfpl1nb7oZdJsjcyTkhiQv/3Hdz6jVUT3UgLjU71gOyI=
X-Received: by 2002:aa7:c1c5:0:b0:47f:1a80:93e1 with SMTP id
 d5-20020aa7c1c5000000b0047f1a8093e1mr319245edp.275.1671744393964; Thu, 22 Dec
 2022 13:26:33 -0800 (PST)
MIME-Version: 1.0
References: <20220829205219.283543-1-geomatsi@gmail.com> <CA+V-a8uLmp33PSYGmJjf9FupJ0M8Hf7ef7A1G4va8GDL_61Qyw@mail.gmail.com>
 <Y6S1/kROC0p5CboA@curiosity> <CA+V-a8u0qUF81RUTF9+4T4F1GxW3=4P7RMTTjjsaMq4MiiQSMQ@mail.gmail.com>
 <Y6TIywUWZ3nrPeon@curiosity>
In-Reply-To: <Y6TIywUWZ3nrPeon@curiosity>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 22 Dec 2022 21:26:07 +0000
Message-ID: <CA+V-a8tMQ-RaaXD5209HxT77VoiOanvjdbFCPsdWpDYswuY+ZQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20221222_132639_642234_408E2090 
X-CRM114-Status: GOOD (  30.84  )
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

On Thu, Dec 22, 2022 at 9:14 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> Hi Prabhakar,
>
> > > > > From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> > > > >
> > > > > Current implementation of update_mmu_cache function performs local TLB
> > > > > flush. It does not take into account ASID information. Besides, it does
> > > > > not take into account other harts currently running the same mm context
> > > > > or possible migration of the running context to other harts. Meanwhile
> > > > > TLB flush is not performed for every context switch if ASID support
> > > > > is enabled.
> > > > >
> > > > > Patch [1] proposed to add ASID support to update_mmu_cache to avoid
> > > > > flushing local TLB entirely. This patch takes into account other
> > > > > harts currently running the same mm context as well as possible
> > > > > migration of this context to other harts.
> > > > >
> > > > > For this purpose the approach from flush_icache_mm is reused. Remote
> > > > > harts currently running the same mm context are informed via SBI calls
> > > > > that they need to flush their local TLBs. All the other harts are marked
> > > > > as needing a deferred TLB flush when this mm context runs on them.
> > > > >
> > > > > [1] https://lore.kernel.org/linux-riscv/20220821013926.8968-1-tjytimi@163.com/
> > > > >
> > > > > Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> > > > > ---
> > > > >  arch/riscv/include/asm/mmu.h      |  2 ++
> > > > >  arch/riscv/include/asm/pgtable.h  |  2 +-
> > > > >  arch/riscv/include/asm/tlbflush.h | 18 ++++++++++++++++++
> > > > >  arch/riscv/mm/context.c           | 10 ++++++++++
> > > > >  arch/riscv/mm/tlbflush.c          | 28 +++++++++++-----------------
> > > > >  5 files changed, 42 insertions(+), 18 deletions(-)
> > > > >
> > <snip>
> > > > [  133.008752] Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
> > > > [  133.015338] Call Trace:
> > > > [  133.017778] [<ffffffff800055cc>] dump_backtrace+0x1c/0x24
> > > > [  133.023174] [<ffffffff80776836>] show_stack+0x2c/0x38
> > > > [  133.028214] [<ffffffff80780244>] dump_stack_lvl+0x3c/0x54
> > > > [  133.033597] [<ffffffff80780270>] dump_stack+0x14/0x1c
> > > > [  133.038633] [<ffffffff80776c00>] panic+0x102/0x29a
> > > > [  133.043409] [<ffffffff800137ba>] do_exit+0x704/0x70a
> > > > [  133.048362] [<ffffffff8001390e>] do_group_exit+0x24/0x70
> > > > [  133.053659] [<ffffffff8001de54>] get_signal+0x68a/0x6dc
> > > > [  133.058874] [<ffffffff8000494e>] do_work_pending+0xd6/0x44e
> > > > [  133.064427] [<ffffffff800036c2>] resume_userspace_slow+0x8/0xa
> > > > [  133.070249] ---[ end Kernel panic - not syncing: Attempted to kill
> > > > init! exitcode=0x0000000b ]---
> > > >
> > > > If I revert this patch [0] bonnie++ works as expected.
> > > >
> > > > Any pointers on what could be the issue here?
> > > >
> > > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=for-next&id=4bd1d80efb5af640f99157f39b50fb11326ce641
> > > >
> > > > Cheers,
> > > > Prabhakar
> > >
> > > Good catch. Thanks for reporting ! Discussion around the issue and
> > > possible ways to fix it can be found in the following email thread:
> > >
> > > https://lore.kernel.org/linux-riscv/20221111075902.798571-1-guoren@kernel.org/
> > >
> > > Could you please apply the patch from Guo Ren instead of [0] and check
> > > if you have any issues with your test ? Besides, could you please share
> > > your kernel configuration and the actual bonnie++ params from emmc_t_002.sh script ?
> > >
> > Thanks for the pointer, I'll undo my changes and test Guo's patch.
> >
> > I have pasted the script here [0] and attached config.
> >
> > [0] https://paste.debian.net/hidden/a7a769b5/
>
> Thanks for the script and config. Could you please also share the
> following information:
> - how many cores your system has
The Renesas RZ/Five SoC has a single Andes AX45MP core.

> - does your system support ASID
>
With a quick look at [0] It does support ASID, unless there is a way
to disable it.

[0] http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

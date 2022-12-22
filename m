Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612DDC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 21:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30nL0ababrU1fPWYIT5B7DE/LiBiUZ+fp5j5uOo6Q9w=; b=BCz0FzQ4zASBKe
	/xl2hocfDqWR6BRX/5ENPqU1rGXN3RmHwZljlHJJVJsyaNu7FV8H3QXUjlyw+TAPoeev3gPVNAH/M
	eW4zo5tTI5C5xYFCcY999N2vFQ5t4Eb3cyo0rjP1awfl6eJnqhMw4lMgIz4R09G526yexkFctug4q
	P8gi0N8H/t9uhUYZs8UcURKU6BGyaf8wHgye7V/F4bWeMyU1ZS0z9s+4lxSCxPt2Gz34oDNwaX31+
	u3dox9VB/pjkhxIyf7CMCAf1ZaqVqhVOjDa910NpHHR15d8s8ny/7aTHM+sg1Ygtuw9LE2PEjI7pp
	ewvSYKfqYGIZ4p2IMtKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8SuN-00HGvo-3i; Thu, 22 Dec 2022 21:15:19 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Su1-00HGiS-QQ
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 21:14:59 +0000
Received: by mail-lf1-x133.google.com with SMTP id b3so4533982lfv.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 13:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HW2+bjL5qcgLG9JdMLBo7XGDnVwRZtk+Ec2M0tEXUp8=;
        b=pSB8tZnCe08Sqg9lkNhtlglRmDf/Z7I+XnwHDLWGwn45nh89IgReiIWx95oH4RtONS
         kNo7+Bfz8ZgjeZvBoF64FJeC3VEUqUFLNUf4CAzJxw8B+jkLqPcVfMkA4Z3R4tyLbYcJ
         i7lxHlKJ25KaAZGUv5I77Q9mxncJV+5CI/bi7IqDDTbrFZP88mBtRqJl7xf5srlpdoUW
         +q63Mdsx5/43rXF/W22Eyo9UsOY1xid9i+wE5YEWAB8LVej6yNjaqrL+u2rYq9RUnsJL
         wHLLWiEkKCHAfCO8xu0Ore2yRkLaAEAd6BKDpKBN4+T5395BCcSNL/yXJLBxfjBdR0QM
         5ZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HW2+bjL5qcgLG9JdMLBo7XGDnVwRZtk+Ec2M0tEXUp8=;
        b=Mw/Inoy70IJpZUgBSWWpbFgAhGn8fxI6OP2k0Fp8A5evht0h/B96Fio6V1NH91Jjt0
         aXwGqRE+sl9uixKltPBMppwic/qi5etcxSMD7TLjQ0RFCixQcObHJ6wwSc6oomP1tdCo
         o00Ukgj/8K/wIJO368Wuzti6c8Fu+QV9R+ChE8LlsafrFi8Zs0jtUVf0/MDWlZt/kcDI
         yzDEyPlModhq0mcEXGowe8gY3yInRqFqqBasYn7wD+igH6fRWHsW6FG2AEIYdEONLzSI
         YTtcYaKqKT5W3RvR9czkW20gTuVHJ9B4IoUC6AicNACrSlt5NdICww2M39NA0pHJNIhC
         W6WQ==
X-Gm-Message-State: AFqh2kqsPNeJD/LIKhXtdE1l7+d1aH+6DEX0uIhP9aWqQhXmQjL5PQxk
	SftAw5q2WYNO/5ApFOZcRzk=
X-Google-Smtp-Source: AMrXdXtrBKXawCl7/HCZlX1zZ4k9HkLiMK4L6fhINmlvAo5rK7FWVP6wuYlnXuG40+NPHGOOJ5DQug==
X-Received: by 2002:a05:6512:b14:b0:4ca:f5a1:8896 with SMTP id w20-20020a0565120b1400b004caf5a18896mr78728lfu.37.1671743693633;
        Thu, 22 Dec 2022 13:14:53 -0800 (PST)
Received: from curiosity ([5.188.167.245])
        by smtp.gmail.com with ESMTPSA id q16-20020a194310000000b004b5634f9b9dsm208206lfa.115.2022.12.22.13.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 13:14:52 -0800 (PST)
Date: Fri, 23 Dec 2022 00:14:51 +0300
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
Message-ID: <Y6TIywUWZ3nrPeon@curiosity>
References: <20220829205219.283543-1-geomatsi@gmail.com>
 <CA+V-a8uLmp33PSYGmJjf9FupJ0M8Hf7ef7A1G4va8GDL_61Qyw@mail.gmail.com>
 <Y6S1/kROC0p5CboA@curiosity>
 <CA+V-a8u0qUF81RUTF9+4T4F1GxW3=4P7RMTTjjsaMq4MiiQSMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8u0qUF81RUTF9+4T4F1GxW3=4P7RMTTjjsaMq4MiiQSMQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_131457_922875_992076F0 
X-CRM114-Status: GOOD (  29.15  )
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

> > > > From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> > > >
> > > > Current implementation of update_mmu_cache function performs local TLB
> > > > flush. It does not take into account ASID information. Besides, it does
> > > > not take into account other harts currently running the same mm context
> > > > or possible migration of the running context to other harts. Meanwhile
> > > > TLB flush is not performed for every context switch if ASID support
> > > > is enabled.
> > > >
> > > > Patch [1] proposed to add ASID support to update_mmu_cache to avoid
> > > > flushing local TLB entirely. This patch takes into account other
> > > > harts currently running the same mm context as well as possible
> > > > migration of this context to other harts.
> > > >
> > > > For this purpose the approach from flush_icache_mm is reused. Remote
> > > > harts currently running the same mm context are informed via SBI calls
> > > > that they need to flush their local TLBs. All the other harts are marked
> > > > as needing a deferred TLB flush when this mm context runs on them.
> > > >
> > > > [1] https://lore.kernel.org/linux-riscv/20220821013926.8968-1-tjytimi@163.com/
> > > >
> > > > Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> > > > ---
> > > >  arch/riscv/include/asm/mmu.h      |  2 ++
> > > >  arch/riscv/include/asm/pgtable.h  |  2 +-
> > > >  arch/riscv/include/asm/tlbflush.h | 18 ++++++++++++++++++
> > > >  arch/riscv/mm/context.c           | 10 ++++++++++
> > > >  arch/riscv/mm/tlbflush.c          | 28 +++++++++++-----------------
> > > >  5 files changed, 42 insertions(+), 18 deletions(-)
> > > >
> <snip>
> > > [  133.008752] Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
> > > [  133.015338] Call Trace:
> > > [  133.017778] [<ffffffff800055cc>] dump_backtrace+0x1c/0x24
> > > [  133.023174] [<ffffffff80776836>] show_stack+0x2c/0x38
> > > [  133.028214] [<ffffffff80780244>] dump_stack_lvl+0x3c/0x54
> > > [  133.033597] [<ffffffff80780270>] dump_stack+0x14/0x1c
> > > [  133.038633] [<ffffffff80776c00>] panic+0x102/0x29a
> > > [  133.043409] [<ffffffff800137ba>] do_exit+0x704/0x70a
> > > [  133.048362] [<ffffffff8001390e>] do_group_exit+0x24/0x70
> > > [  133.053659] [<ffffffff8001de54>] get_signal+0x68a/0x6dc
> > > [  133.058874] [<ffffffff8000494e>] do_work_pending+0xd6/0x44e
> > > [  133.064427] [<ffffffff800036c2>] resume_userspace_slow+0x8/0xa
> > > [  133.070249] ---[ end Kernel panic - not syncing: Attempted to kill
> > > init! exitcode=0x0000000b ]---
> > >
> > > If I revert this patch [0] bonnie++ works as expected.
> > >
> > > Any pointers on what could be the issue here?
> > >
> > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=for-next&id=4bd1d80efb5af640f99157f39b50fb11326ce641
> > >
> > > Cheers,
> > > Prabhakar
> >
> > Good catch. Thanks for reporting ! Discussion around the issue and
> > possible ways to fix it can be found in the following email thread:
> >
> > https://lore.kernel.org/linux-riscv/20221111075902.798571-1-guoren@kernel.org/
> >
> > Could you please apply the patch from Guo Ren instead of [0] and check
> > if you have any issues with your test ? Besides, could you please share
> > your kernel configuration and the actual bonnie++ params from emmc_t_002.sh script ?
> >
> Thanks for the pointer, I'll undo my changes and test Guo's patch.
> 
> I have pasted the script here [0] and attached config.
> 
> [0] https://paste.debian.net/hidden/a7a769b5/

Thanks for the script and config. Could you please also share the
following information:
- how many cores your system has
- does your system support ASID


Regards,
Sergey


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

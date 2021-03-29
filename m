Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED28AC433C1
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 17:03:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 603066191F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 17:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 603066191F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ey0BMCkW+cVp6aSi4UhcGxiXXkNTXmggJUBsAPbEPHA=; b=OdQWqZTwahQJSHyFJ+4NaLixF
	UOQgZDCm9A3NWlWKOJa1v9uBzo00q7fFEuCJ4uZHqpiqLgneDOgp/ZyataFl6+G3VIrM+A+qLcHAa
	JGawYGyA8U9JfbUkd5nBEQqFyT6K6gQQHr6+3maV3V2MDbmaRmPyQoPE5sQSLKDQO5SXU/PNERjoa
	y0IZFPAS4Bt9dqsbpXN+nqS8JonSfyP0GQ8OqhV63/fudsxTSEMf1coDLC0ml+5HjIucR81AOJnky
	hzczwtmzThwVGJrei+SUTVf+dmyEWRL9fABKDL6kSTqlclTAJt0P8j97pzzlKjMbWwrTjLkf+ShUe
	Ej53Vx+qA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQvID-000pnl-KJ; Mon, 29 Mar 2021 17:03:10 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQom6-000Z3F-1I
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 10:05:37 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MV6G6-1l26WV3Q4U-00S7Ji for <linux-riscv@lists.infradead.org>; Mon, 29 Mar
 2021 11:41:38 +0200
Received: by mail-ot1-f41.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so11683833otk.5
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 02:41:35 -0700 (PDT)
X-Gm-Message-State: AOAM530pUIsA9TV++e84WTUtoI3tsI0OoqtIrDiUdzzI5U6wzdbSTZh8
 p1CSOgpHwgffFTekHHaFwMz05kU6OUzsGjDOSMk=
X-Google-Smtp-Source: ABdhPJxL0UJP5P1kWHY4Vwg+0uu5/aXzFNnE6DPhiRa4ILVvkxMo1SzhkH24nsZdTPp3TzHp49EK1KZBWv4f9Ey1t6I=
X-Received: by 2002:a9d:316:: with SMTP id 22mr22008090otv.210.1617010894060; 
 Mon, 29 Mar 2021 02:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
In-Reply-To: <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 29 Mar 2021 11:41:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2bNH-1VjsZmZJkvGzzZY=ckaaOK9ZGL-oD0DH4jW-+kQ@mail.gmail.com>
Message-ID: <CAK8P3a2bNH-1VjsZmZJkvGzzZY=ckaaOK9ZGL-oD0DH4jW-+kQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Peter Zijlstra <peterz@infradead.org>
Cc: Guo Ren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Anup Patel <anup@brainfault.org>,
 Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
X-Provags-ID: V03:K1:I1ayIEcOD3yS2fflBYx545gBVRgYTrWiJ/xoNTrdxk/pvUk48nk
 dCJ3XXusjSQct7d5bZ+xGKW3pT/lXGYimnJ0l5QLUg5WKK0cCT46T5fAT2qisbBbYCbhmm/
 4CeVkdKKSPv2alJ8GamI2OPrBwv+XwvwqnO3onbSmL3RniyZNy5BtU3TQGUticxhl+M8Fnc
 TvPj0f76kh3oo8lJASviw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CjeQlZMgmo0=:Nocr4iD91gjfTmTufJDM6F
 giaJnkcluHMxqVQ1yD47Zy/OYqXpc9K5I7aHOy7l8ir1WYPIsZoA20b2oAz2jSgC/b3+7itXS
 siV7p51uhpWC2udynaMGewU+W6alaZLZSXEv47gesuh8EJMSMeh6OhPtYrzT999A1oLVdCrJ6
 aGbttA4sYibpGgkGHpuViElgThF9+AY/rwmfln18mq4cwmNOiwc9TQJqn23ZSDsocXGWSBc5q
 6TMnNKXXY1AmOT9rxCTlGtomCJF9/j5IgaZDcHncdbBSB1LJ8QAs4V5GBdqTmh5sm8+HO5bgZ
 TrdADyq/NONA1FZtU9rlzMSOddYy9LiprzrnN7Kh4V9zxoCN8YmgO8CuackJZQJOhrMFjdiQr
 i/h587IF+dZXH/i2aRAULNkmm+m0J2nD0boWrI+aChtxbRPRz52BmyX15HnLbn5P0Z9gVzMou
 QjllTIK5D6lDpyi1lsjTDgA15KiaVzA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_110534_217344_B7F2AB71 
X-CRM114-Status: GOOD (  27.98  )
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

On Mon, Mar 29, 2021 at 9:52 AM Peter Zijlstra <peterz@infradead.org> wrote:
> On Sat, Mar 27, 2021 at 06:06:38PM +0000, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Some architectures don't have sub-word swap atomic instruction,
> > they only have the full word's one.
> >
> > The sub-word swap only improve the performance when:
> > NR_CPUS < 16K
> >  *  0- 7: locked byte
> >  *     8: pending
> >  *  9-15: not used
> >  * 16-17: tail index
> >  * 18-31: tail cpu (+1)
> >
> > The 9-15 bits are wasted to use xchg16 in xchg_tail.
> >
> > Please let architecture select xchg16/xchg32 to implement
> > xchg_tail.
>
> So I really don't like this, this pushes complexity into the generic
> code for something that's really not needed.
>
> Lots of RISC already implement sub-word atomics using word ll/sc.
> Obviously they're not sharing code like they should be :/ See for
> example arch/mips/kernel/cmpxchg.c.

That is what the previous version of the patch set did, right?

I think this v4 is nicer because the code is already there in
qspinlock.c and just gets moved around, and the implementation
is likely more efficient this way. The mips version could be made
more generic, but it is also less efficient than a simple xchg
since it requires an indirect function call plus nesting a pair of
loops instead in place of the single single ll/sc loop in the 32-bit
xchg.

I think the weakly typed xchg/cmpxchg implementation causes
more problems than it solves, and we'd be better off using
a stronger version in general, with the 8-bit and 16-bit exchanges
using separate helpers in the same way that the fixed-length
cmpxchg64 is separate already, there are only a couple of instances
for each of these in the kernel.

Unfortunately, there is roughly a 50:50 split between fixed 32-bit
and long/pointer-sized xchg/cmpxchg users in the kernel, so
making the interface completely fixed-type would add a ton of
churn. I created an experimental patch for this, but it's probably
not worth it.

> Also, I really do think doing ticket locks first is a far more sensible
> step.

I think this is the important point to look at first. From what I can
tell, most users of ticket spinlocks have moved to qspinlock over
time, but I'm not sure about the exact tradeoff, in particular on
large machines without a 16-bit xchg operation.

FWIW, the implementations in the other SMP capable
architectures are

alpha    simple
arc      simple+custom
arm      ticket
arm64    qspinlock (formerly ticket)
csky     ticket/qrwlock (formerly simple+ticket/qrwlock)
hexagon  simple
ia64     ticket
mips     qspinlock (formerly ticket)
openrisc qspinlock
parisc   custom
powerpc  simple+qspinlock (formerly simple)
riscv    simple
s390     custom-queue
sh       simple
sparc    qspinlock
x86      qspinlock (formerly ticket+qspinlock)
xtensa   qspinlock

32-bit Arm is the only relevant user of ticket locks these days, but its
hardware has a practical limit of 16 CPUs and four nodes, with most
implementations having a single CPU cluster of at most four cores.

We had the same discussion about xchg16() when Sebastian submitted
the arm32 qspinlock implementation:
https://lore.kernel.org/linux-arm-kernel/20191007214439.27891-1-sebastian@breakpoint.cc/

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

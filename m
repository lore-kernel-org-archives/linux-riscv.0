Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7647FC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 05:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXa/W+dh40HVPHWPGh8PModn48ed4X6F89o4AfX/AxQ=; b=I4juhg1EzaB3PC
	4m2Jx+VbBXNUr5PTGypsp1zqG/2X5A440HL459Rvrnslm3XJMagajlXXtQPXxGVWHy/DLwgZ0AQe8
	pTZsbQdmuPRaR6RZ4c6anzlSIU0PwwdCSqJzFqEz7nySujulFsO70su1N4YV0Pdr6Qpm1goFnBIWL
	6nL9K+EUar1Kf5Z93vXdave4xBhhW16LkWK41bwCOrKiFC3+5Qx/1hDdqcBUOwaPkx6parUoI7Y4X
	FNJJ1zW/0X9oAd5UJ+U0cDC3fYjVf68lQ7SuONeyqBNMShKpiOXdpTvbNdhHfjXXjXAwkdJD1CFN4
	KlDMzFVaBunCy7mS3LAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh2y7-007QTH-PC; Wed, 20 Apr 2022 05:33:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh2y1-007QRE-74
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 05:33:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2FBE861766
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 05:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E10C385AE
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 05:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650432807;
 bh=O+/nEn2mJyhhn71+9IxwyXxxEqAUenQtbBMtmhNPlZ4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=F8XWcttAhn58uuRRQCfZPF4XR4sjrUNLlEOu7E4EnbPGA+ZUiCa3hSOwX96HY7H24
 l1kIK4aMq1Z0N9e35ItfcLgPzagAOw66G4sMnjmfvXfn9ds17S0ZOzNUuogFbMlO8m
 rSyNbnH1K8giaSEuXuzdrdqqdhQnCnx0xwffBS1oFSG+maukHZNmguAJaE2PxAmFiT
 xM9nSoqRjd3tOrpsMbxCLPNSZ3vOvRIAydywm1E9s7WciFYosZyruKQ9QfiiHbpkHU
 MVgd10fduek7QfJRqyrQUzIgCcIFjVml0fJ8Dec3Wa57ygHjjoC5Zc6LiDh0uiIYjQ
 b3hyYEIgEnDmg==
Received: by mail-ua1-f41.google.com with SMTP id o10so246678uar.0
 for <linux-riscv@lists.infradead.org>; Tue, 19 Apr 2022 22:33:27 -0700 (PDT)
X-Gm-Message-State: AOAM532Nz+5W94BVU5MakXZQUQa98TyJhZNpBQTPHAwraQVEYr9wN1Kn
 bIXeTtstOBYmWBad2FVvQ7a2zjguXE/Otmn5RWM=
X-Google-Smtp-Source: ABdhPJyGiHphDY/NN2jjsA9reE76seGGyg1Qp3EEewMxF5ur2Eod0CCcuEaMFxNqOaSuEE8GU6Hny7R/Sp6/S526sSw=
X-Received: by 2002:ab0:4306:0:b0:35c:df5b:d7ab with SMTP id
 k6-20020ab04306000000b0035cdf5bd7abmr5134224uak.83.1650432806290; Tue, 19 Apr
 2022 22:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220412034957.1481088-1-guoren@kernel.org>
 <YlbwOG46mCR8Q5tJ@tardis>
 <CAJF2gTRws6RqKmJHBdKsycWSkFgYna_MocJ+qp3Z9r1v7mQzsg@mail.gmail.com>
 <Ylt6zqPgimmKpJzg@tardis>
 <CAJF2gTTZnBh_z31VK81cYiBrTt5NRVpSahoPh35Zo4Ns5hCv7A@mail.gmail.com>
 <3f7dd397-2ccd-dfa3-a0ec-dcce6cbc0476@nvidia.com>
In-Reply-To: <3f7dd397-2ccd-dfa3-a0ec-dcce6cbc0476@nvidia.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 20 Apr 2022 13:33:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQzPsM0X-gib3V0EYYU=weMFXMQZCEbru9y+dDbV+9eXQ@mail.gmail.com>
Message-ID: <CAJF2gTQzPsM0X-gib3V0EYYU=weMFXMQZCEbru9y+dDbV+9eXQ@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] riscv: atomic: Optimize AMO instructions usage
To: Dan Lustig <dlustig@nvidia.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Andrea Parri <parri.andrea@gmail.com>, 
 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_223329_378727_FE6FA5DE 
X-CRM114-Status: GOOD (  29.79  )
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

Thx Dan,

On Wed, Apr 20, 2022 at 1:12 AM Dan Lustig <dlustig@nvidia.com> wrote:
>
> On 4/17/2022 12:51 AM, Guo Ren wrote:
> > Hi Boqun & Andrea,
> >
> > On Sun, Apr 17, 2022 at 10:26 AM Boqun Feng <boqun.feng@gmail.com> wrote:
> >>
> >> On Sun, Apr 17, 2022 at 12:49:44AM +0800, Guo Ren wrote:
> >> [...]
> >>>
> >>> If both the aq and rl bits are set, the atomic memory operation is
> >>> sequentially consistent and cannot be observed to happen before any
> >>> earlier memory operations or after any later memory operations in the
> >>> same RISC-V hart and to the same address domain.
> >>>                 "0:     lr.w     %[p],  %[c]\n"
> >>>                 "       sub      %[rc], %[p], %[o]\n"
> >>>                 "       bltz     %[rc], 1f\n".
> >>> -               "       sc.w.rl  %[rc], %[rc], %[c]\n"
> >>> +               "       sc.w.aqrl %[rc], %[rc], %[c]\n"
> >>>                 "       bnez     %[rc], 0b\n"
> >>> -               "       fence    rw, rw\n"
> >>>                 "1:\n"
> >>> So .rl + fence rw, rw is over constraints, only using sc.w.aqrl is more proper.
> >>>
> >>
> >> Can .aqrl order memory accesses before and after it (not against itself,
> >> against each other), i.e. act as a full memory barrier? For example, can
> > From the RVWMO spec description, the .aqrl annotation appends the same
> > effect with "fence rw, rw" to the AMO instruction, so it's RCsc.
> >
> > Not only .aqrl, and I think the below also could be an RCsc when
> > sc.w.aq is executed:
> > A: Pre-Access
> > B: lr.w.rl ADDR-0
> > ...
> > C: sc.w.aq ADDR-0
> > D: Post-Acess
> > Because sc.w.aq has overlap address & data dependency on lr.w.rl, the
> > global memory order should be A->B->C->D when sc.w.aq is executed. For
> > the amoswap
>
> These opcodes aren't actually meaningful, unfortunately.
>
> Quoting the ISA manual chapter 10.2: "Software should not set the rl bit
> on an LR instruction unless the aq bit is also set, nor should software
> set the aq bit on an SC instruction unless the rl bit is also set."
1. Oh, I've missed the behind half of the ISA manual. But why can't we
utilize lr.rl & sc.aq in software programming to guarantee the
sequence?

2. Using .aqrl to replace the fence rw, rw is okay to ISA manual,
right? And reducing a fence instruction to gain better performance:
                "0:     lr.w     %[p],  %[c]\n"
                 "       sub      %[rc], %[p], %[o]\n"
                 "       bltz     %[rc], 1f\n".
 -               "       sc.w.rl  %[rc], %[rc], %[c]\n"
 +              "       sc.w.aqrl %[rc], %[rc], %[c]\n"
                 "       bnez     %[rc], 0b\n"
 -               "       fence    rw, rw\n"

>
> Dan
>
> > The purpose of the whole patchset is to reduce the usage of
> > independent fence rw, rw instructions, and maximize the usage of the
> > .aq/.rl/.aqrl aonntation of RISC-V.
> >
> >                 __asm__ __volatile__ (                                  \
> >                         "0:     lr.w %0, %2\n"                          \
> >                         "       bne  %0, %z3, 1f\n"                     \
> >                         "       sc.w.rl %1, %z4, %2\n"                  \
> >                         "       bnez %1, 0b\n"                          \
> >                         "       fence rw, rw\n"                         \
> >                         "1:\n"                                          \
> >
> >> we end up with u == 1, v == 1, r1 on P0 is 0 and r1 on P1 is 0, for the
> >> following litmus test?
> >>
> >>     C lr-sc-aqrl-pair-vs-full-barrier
> >>
> >>     {}
> >>
> >>     P0(int *x, int *y, atomic_t *u)
> >>     {
> >>             int r0;
> >>             int r1;
> >>
> >>             WRITE_ONCE(*x, 1);
> >>             r0 = atomic_cmpxchg(u, 0, 1);
> >>             r1 = READ_ONCE(*y);
> >>     }
> >>
> >>     P1(int *x, int *y, atomic_t *v)
> >>     {
> >>             int r0;
> >>             int r1;
> >>
> >>             WRITE_ONCE(*y, 1);
> >>             r0 = atomic_cmpxchg(v, 0, 1);
> >>             r1 = READ_ONCE(*x);
> >>     }
> >>
> >>     exists (u=1 /\ v=1 /\ 0:r1=0 /\ 1:r1=0)
> > I think my patchset won't affect the above sequence guarantee. Current
> > RISC-V implementation only gives RCsc when the original value is the
> > same at least once. So I prefer RISC-V cmpxchg should be:
> >
> >
> > -                       "0:     lr.w %0, %2\n"                          \
> > +                      "0:     lr.w.rl %0, %2\n"                          \
> >                         "       bne  %0, %z3, 1f\n"                     \
> >                         "       sc.w.rl %1, %z4, %2\n"                  \
> >                         "       bnez %1, 0b\n"                          \
> > -                       "       fence rw, rw\n"                         \
> >                         "1:\n"                                          \
> > +                        "       fence w, rw\n"                    \
> >
> > To give an unconditional RSsc for atomic_cmpxchg.
> >
> >>
> >> Regards,
> >> Boqun
> >
> >
> >



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

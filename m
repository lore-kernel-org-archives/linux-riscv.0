Return-Path: <SRS0=oaCf=JC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C616DC433B4
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 16:17:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DC9761025
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 16:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DC9761025
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N9BkSDktzYlfwKQyvBBaMewWRWL8ZlAis4QCdYsnKy8=; b=VIJX3PEgLAZTZXVsI04pE3mh2
	Y1d2VrIJpmOA9hirlQoyBv5QgM+x3YxuEZtMtLzNo0jegSwKfHDx4Aiy/UN8p1/OE8QgC8wN71DzK
	L5VpF0OWveqY+UTfc02ILwTL+9H8IJJWv6ySXfEShwdLsKWeJ6hBVy/I9qiU96pw930J4vsnv3BIq
	3KqYzQ0qVQ195Wy7hrIzuqI1IUqqmQxoSEzwPtHaKnuhsmlevHrnk4cBz4J4C6Th0CFmrXqvDdLoW
	h5M5VOfvF7VrIhb10BVyq+gtO8+RAinJEoSzuy+YK3w0hHne3SKuE2/ivDagGtiLIfEVwza2ZmIAF
	aLReXl/mw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTRvB-0003xP-7X; Mon, 05 Apr 2021 16:17:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTRqh-00029R-5X
 for linux-riscv@lists.infradead.org; Mon, 05 Apr 2021 16:13:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4927A613A9
 for <linux-riscv@lists.infradead.org>; Mon,  5 Apr 2021 16:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617639189;
 bh=xy8R21hrTPrRLeZE3Iow50HkLLBJIhV008i585nefRw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SeFOi8/+3Le5xBQWXNW6n6C3HYppZhmwZ4LkGeyoV4qtJlERXR78lokgpt3CNkCfb
 Gd0GoDUH6eXEhmyo0IV3ZBFG0tafGxWzO2Q0NEKY/eJ1l4qVacxFoUhlzpkhpCo5TX
 cxS9sfNc/xGCX39WQi5n5A5lgKpabsdQ56Cz/Qf0GsvWqXuq8nqA6gRImQJNtxtTOq
 9hAt2p1o2UFh46hMdsmyKeZhPwSN7BjkuNCt2rWcmvT+z+mU2iIRLEmOGaOR705Ace
 HFwXTwjeIIrXo4fv3EGSr8w7TZsDqVuZx/nvtdNZ82lvVsktD47DxUfoXlSlBzafqN
 fg9RYqdcnXITA==
Received: by mail-lf1-f48.google.com with SMTP id 12so18047962lfq.13
 for <linux-riscv@lists.infradead.org>; Mon, 05 Apr 2021 09:13:09 -0700 (PDT)
X-Gm-Message-State: AOAM531CLxOuFRg5bvSI4O3md1E+o4PqLJmSpSoETFdQZV10LXB01MB7
 d9vfhww+8S0dSAnNu66kZKIMOYkXDDKdpKIU4Xs=
X-Google-Smtp-Source: ABdhPJyfiO0EIbWm2CPHFNjIUV1Ys8Y18EK39LJgff4lu0eaH9pwDtYDrwYUyulRL/XaEhAKr3B8Xz7p2aVOmQwL5XQ=
X-Received: by 2002:a05:6512:ba2:: with SMTP id
 b34mr17792144lfv.24.1617639187590; 
 Mon, 05 Apr 2021 09:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <CAK8P3a0DkbM=4oBBhA2DWvzMV7DwN1sqOU8Wa1qFtpd_w7iWmQ@mail.gmail.com>
 <CAJF2gTSGLn7katm6YAtkKWJcQRqw36_yqn+aK1pKUSRM5V1zUg@mail.gmail.com>
 <1706037.TLkxdtWsSY@rata>
In-Reply-To: <1706037.TLkxdtWsSY@rata>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 6 Apr 2021 00:12:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS1-onvC7i4gqEtK7-mC+TnQ2czR-kjKbPxZdX+4To4yw@mail.gmail.com>
Message-ID: <CAJF2gTS1-onvC7i4gqEtK7-mC+TnQ2czR-kjKbPxZdX+4To4yw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Paul Campbell <taniwha@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Anup Patel <anup@brainfault.org>,
 Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_171312_206503_5EA13311 
X-CRM114-Status: GOOD (  40.98  )
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

Hi Paul,

Thx for the explanation, here is my comment.

On Wed, Mar 31, 2021 at 1:33 PM Paul Campbell <taniwha@gmail.com> wrote:
>
> On Wednesday, 31 March 2021 5:18:56 PM NZDT Guo Ren wrote:
> > > > [1]
> > > > https://github.com/c-sky/csky-linux/commit/e837aad23148542771794d8a2fcc
> > > > 52afd0fcbf88> >
> > > > > It also seems that the current "amoswap" based implementation
> > > > > would be reliable independent of RsrvEventual/RsrvNonEventual.
> > > >
> > > > Yes, the hardware implementation of AMO could be different from LR/SC.
> > > > AMO could use ACE snoop holding to lock the bus in hw coherency
> > > > design, but LR/SC uses an exclusive monitor without locking the bus.
> > > >
> > > > RISC-V hasn't CAS instructions, and it uses LR/SC for cmpxchg. I don't
> > > > think LR/SC would be slower than CAS, and CAS is just good for code
> > > > size.
> > >
> > > What I meant here is that the current spinlock uses a simple amoswap,
> > > which presumably does not suffer from the lack of forward process you
> > > described.
> >
> > Does that mean we should prevent using LR/SC (if RsrvNonEventual)?
>
> Let me provide another data-point, I'm working on a high-end highly
> speculative implementation with many concurrent instructions in flight - from
> my point of view  both sorts of AMO (LR/SC and swap/add/etc) require me to
> grab a cache line in an exclusive modifiable state (so no difference there).
>
> More importantly both sorts of AMO instructions  (unlike most loads and
> stores) can't be speculated (not even LR because it changes hidden state, I
> found this out the hard way bringing up the kernel).
>
> This means that both LR AND SC individually can't be executed until all
> speculation is resolved (that means that they happen really late in the
> execute path and block the resolution of the speculation of subsequent
> instructions) - equally a single amoswap/add/etc instruction can't happen
> until late in the execute path - so both require the same cache line state,
> but one of these sorts of events is better than two of them.
>
> Which in short means that amoswap/add/etc is better for small things - small
> buzzy lock loops, while LR/SC is better for more complex things with actual
> processing between the LR and SC.
Seems your machine using the same way to implement LR/SC and AMO, but
some machines would differ them.

For AMO, I think it's would be like what you've described:
 - AMO would be separated into three parts: load & lock, ALU
operation, store & unlock
 - load & lock, eg: we could using ACE protocol -SNOOP channel to
holding the bus
 - Doing atomic AMO
 - store & unlock: Write the result back and releasing the ACE
protocol -SNOOP channel
I think the above is what you describe as how to "grab a cache line in
an exclusive modifiable state".

But for LR/SC, it's different. Because we have separated AMO into real
three parts of instruction:
 - LR
 - Operation instructions
 - SC
If we let LR holding ACE protocol -SNOOP channel and let SC release
channel, that would break the ISA design (we couldn't let an
instruction holding the snoop bus and made other harts hang up.)

So LR/SC would use address monitors for every hart, to detect the
target address has been written or not.
That means LR/SC won't be implemented fwd progress guarantees. If you
care about fwd progress guarantees, I think ISA should choose cmpxchg
(eg: cas) instead of LR/SC.


>
> ----
>
> Another issue here is to consider is what happens when you hit one of these
> tight spinlocks when the branch target cache is empty and they fail (ie loop
> back and try again) - the default branch prediction, and resulting
> speculation, is (very) likely to be looping back, while hopefully most locks
> are not contended when you hit them and that speculation would be wrong - a
> spinlock like this may not be so good:
>
>         li a0, 1
> loop:
>         amoswap a1, a0, (a2)
>         beqz    a1, loop
>         ..... subsequent code
>
> In my world with no BTC info the pipe fills with dozens of amoswaps, rather
> than  the 'subsequent code'. While (in my world) code like this:
>
>         li a0, 1
> loop:
>         amoswap a1, a0, (a2)
>         bnez    a1, 1f
>         .... subsequent code
>
> 1:      j loop
>
> would actually be better (in my world unconditional jump instructions are
> folded early and never see execution so they're sort of free, though they mess
> with the issue/decode rate). Smart compilers could move the "j loop" out of
> the way, while the double branch on failure is not a big deal since either the
> lock is still held (and you don't care if it's slow) or it's been released in
> which case the cache line has been stolen and the refetch of that cache line
> is going to dominate the next time around the loop
Thx for sharing the view of the spinlock speculative path. But I think
we should use smp_cond_load_acquire not looping.
That means we could use wfe/cpu_relax to let other harts utilized the
core's pipeline. So we needn't optimize the "subsequent code"
speculative path in the multi-threads processing core and just let the
hart relax.


>
> I need to stress here that this is how my architecture works, other's will of
> course be different though I expect that other heavily speculative
> architectures to have similar issues :-)
>
>         Paul Campbell
>         Moonbase Otago
>
>
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

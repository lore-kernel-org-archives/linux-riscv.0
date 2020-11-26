Return-Path: <SRS0=LTnX=FA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51877C56201
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 01:36:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3F7B206F7
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 01:36:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kP/p4VD9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wgO6ET37"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3F7B206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M7UjeebBB5UPvrJjeumwYjOXWXfxl5x0wEEBfsnSVuo=; b=kP/p4VD9BqWupEqZwb6I0XR9j
	G10G0cFTMqOQlKx6PrpXyc8RMsCv6rRa9hNEwQFu0/B6uc17InjOZA5Z8pJPgN0snv0qfAB1Sl0cX
	GFRuqXelGJGXOdhFBk5aUT6NbnKBHhKT0y7gtO89+MnzezRUBdxV6rfeVK9x40mkjFWczd1F+nOco
	SNpfDB3AprGE1Dbg6fvfqKynzYUCbRV/M3kHYWaLKTCt59qpTIHzn/zvnPrFgseH2ZStzLeE/vGhy
	zcM9Dj8jjlFT/u9Lbv3ZFfUYeCbXCXh2w8TENEpVf49Fw4kPLRR6M7wW9NMXCExYSf5o1KDAEW6e4
	SLOUtzVfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki6DM-0001AV-Nj; Thu, 26 Nov 2020 01:36:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki6DJ-00019C-Dy
 for linux-riscv@lists.infradead.org; Thu, 26 Nov 2020 01:36:50 +0000
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62F992075A
 for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2020 01:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606354607;
 bh=DHcTvmA/WJHw9Fef17EQ48UfNXJ4eOswow3HLd1nbKM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wgO6ET37DsEZWesI0u/8IZhSkcxPGnkLC6/msVEPGWZ2gUGmOgoDEsQec9/9c+Ocb
 H6klNG3OQpnQBad/oR19wBjx6AnQb90bTtMLNhD/RKkTHU9Wwd5Qs4EZI+LGohBOIH
 SsbAO57nvfdr653/S4KlTQlkoJZ/lIhplnag+vhE=
Received: by mail-lj1-f181.google.com with SMTP id y16so519533ljk.1
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 17:36:47 -0800 (PST)
X-Gm-Message-State: AOAM532/s0ZJk6J55XruKOmoFkxL4PAgDYmG7cVIOVsBUROb3LGADt7/
 27i2CA37wQdiejzUB//tlq91GaFP+Eh44dxguH8=
X-Google-Smtp-Source: ABdhPJynU3Q6OuiQr1gLVZT8RMGMk5PPaD9gUtqgzbi5KO1M0HS0fEeUJkhnusDypDgk9XMT4B+DIjg/pAozFIBwnNk=
X-Received: by 2002:a05:651c:203:: with SMTP id y3mr310118ljn.66.1606354605575; 
 Wed, 25 Nov 2020 17:36:45 -0800 (PST)
MIME-Version: 1.0
References: <1606225437-22948-1-git-send-email-guoren@kernel.org>
 <1606225437-22948-2-git-send-email-guoren@kernel.org>
 <20201124143931.GI2414@hirez.programming.kicks-ass.net>
 <CAK8P3a1ykYmpXtjVbeAjLPY0AtfQTpL9jJ8e6SokiTb=J9UhnQ@mail.gmail.com>
 <20201125141645.GB2414@hirez.programming.kicks-ass.net>
 <20201125143128.GC16159@willie-the-truck>
In-Reply-To: <20201125143128.GC16159@willie-the-truck>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 26 Nov 2020 09:36:34 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTD8NqegPGvqFhUeidGYiuiE6aT3AOELEs2e0JeE_CmUg@mail.gmail.com>
Message-ID: <CAJF2gTTD8NqegPGvqFhUeidGYiuiE6aT3AOELEs2e0JeE_CmUg@mail.gmail.com>
Subject: Re: [PATCH 2/5] riscv: Add QUEUED_SPINLOCKS & QUEUED_RWLOCKS supported
To: Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_203649_656974_5D8159E1 
X-CRM114-Status: GOOD (  20.94  )
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
Cc: Arnd Bergmann <arnd@kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Will,

On Wed, Nov 25, 2020 at 10:31 PM Will Deacon <will@kernel.org> wrote:
>
> On Wed, Nov 25, 2020 at 03:16:45PM +0100, Peter Zijlstra wrote:
> > @@ -207,6 +187,32 @@ static __always_inline void clear_pending_set_locked(struct qspinlock *lock)
> >       atomic_add(-_Q_PENDING_VAL + _Q_LOCKED_VAL, &lock->val);
> >  }
> >
> > +#endif /* _Q_PENDING_BITS == 8 */
> > +
> > +#if _Q_PENDING_BITS == 8 && ARCH_HAS_XCHG16
> > +
> > +/*
> > + * xchg_tail - Put in the new queue tail code word & retrieve previous one
> > + * @lock : Pointer to queued spinlock structure
> > + * @tail : The new queue tail code word
> > + * Return: The previous queue tail code word
> > + *
> > + * xchg(lock, tail), which heads an address dependency
> > + *
> > + * p,*,* -> n,*,* ; prev = xchg(lock, node)
> > + */
> > +static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
> > +{
> > +     /*
> > +      * We can use relaxed semantics since the caller ensures that the
> > +      * MCS node is properly initialized before updating the tail.
> > +      */
> > +     return (u32)xchg_relaxed(&lock->tail,
> > +                              tail >> _Q_TAIL_OFFSET) << _Q_TAIL_OFFSET;
> > +}
> > +
> > +#else /* !(_Q_PENDING_BITS == 8 && ARCH_HAS_XCHG16) */
>
> Why can't architectures just implement this with a 32-bit xchg instruction
> if they don't have one that operates on 16 bits? Sure, they'll store more
> data, but it's atomic so you shouldn't be able to tell... (ignoring parisc
> crazy).
>
> Also, I'm surprised qspinlock benefits riscv. On arm64, there's nothing in
> it over tickets for <= 16 CPUs.
NUMA is on the way:
https://lore.kernel.org/linux-riscv/20201119003829.1282810-1-atish.patra@wdc.com/

With your advice, I think we could using tickets lock when <= 16 CPUs
and using qspinlock when > 16 CPUs.
Is that right?

The next patchset plan is:
 - Using tickets & qspinlock together in riscv. Abandon 16bits
xchg/cmpxchg implementation.
 - Abanden qspinlock in csky, because it only could 4 CPUs' SMP.

>
> Will



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

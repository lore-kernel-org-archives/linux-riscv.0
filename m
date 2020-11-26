Return-Path: <SRS0=LTnX=FA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604DFC63777
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 08:54:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD931208CA
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 08:54:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lCAuFoYe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fps3RUNT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD931208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WwL3tZfx/tGALFm5skRf7rwVY2vbGO17sWn3cmeQ5s8=; b=lCAuFoYeh2fxFeFPHpZjcBkke
	+0ve4lpgRYZh4iQx6qXhYm1eAeYUIL9b5oVC2by6hHX/+I2IRZFwgU1zITV49VThuWf3Vtvf7/z4t
	7cFU5UXzI1d3VW+Bq1/gVOe6hXO06+lOPDNR7bjmtwiAUwV/+FTuNnvJao/EgIzzeLaOJzN9taOlT
	SqNwyb0k2raIcfQpf+6p1WbfD13YGeMy2IvXZkE/8+bgLnHr8rOpkIUjP5jCFGQHkyMim17hfKRYq
	IsA+SgeSyUmxNBAeIC1HTPe/KITIbg0aZApoANNl9Y4mLmrv1Ax9lSC5xyvwZUftK8yvJl+HzfieT
	f6xwwOrnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiD2M-00042P-Vk; Thu, 26 Nov 2020 08:53:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiD2H-00041m-Gc
 for linux-riscv@lists.infradead.org; Thu, 26 Nov 2020 08:53:54 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3EC2B208CA;
 Thu, 26 Nov 2020 08:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606380832;
 bh=QgT3huId6ytL516YbcEUvc9XJ34jPp0iYndtARK7j7g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fps3RUNTT6v4G7ajKtKqSUj2jXFhSwRjBEUhAc7zMVhuwc6iK2ugTVc5QxDir51Ll
 0YI0WlG22bHOBDH+2Ms77ivo4ky7Frt+8tzAyThYRrj9v6IUH74BoTQR7xaAheNRl+
 l3KTm98g20RAa1PZ1itQJ4uWPurNWa4XVGdVFjQ0=
Date: Thu, 26 Nov 2020 08:53:46 +0000
From: Will Deacon <will@kernel.org>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH 2/5] riscv: Add QUEUED_SPINLOCKS & QUEUED_RWLOCKS supported
Message-ID: <20201126085346.GB17797@willie-the-truck>
References: <1606225437-22948-1-git-send-email-guoren@kernel.org>
 <1606225437-22948-2-git-send-email-guoren@kernel.org>
 <20201124143931.GI2414@hirez.programming.kicks-ass.net>
 <CAK8P3a1ykYmpXtjVbeAjLPY0AtfQTpL9jJ8e6SokiTb=J9UhnQ@mail.gmail.com>
 <20201125141645.GB2414@hirez.programming.kicks-ass.net>
 <20201125143128.GC16159@willie-the-truck>
 <CAJF2gTTD8NqegPGvqFhUeidGYiuiE6aT3AOELEs2e0JeE_CmUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTD8NqegPGvqFhUeidGYiuiE6aT3AOELEs2e0JeE_CmUg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_035353_781294_B0F5B5BB 
X-CRM114-Status: GOOD (  25.83  )
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

On Thu, Nov 26, 2020 at 09:36:34AM +0800, Guo Ren wrote:
> On Wed, Nov 25, 2020 at 10:31 PM Will Deacon <will@kernel.org> wrote:
> > On Wed, Nov 25, 2020 at 03:16:45PM +0100, Peter Zijlstra wrote:
> > > @@ -207,6 +187,32 @@ static __always_inline void clear_pending_set_locked(struct qspinlock *lock)
> > >       atomic_add(-_Q_PENDING_VAL + _Q_LOCKED_VAL, &lock->val);
> > >  }
> > >
> > > +#endif /* _Q_PENDING_BITS == 8 */
> > > +
> > > +#if _Q_PENDING_BITS == 8 && ARCH_HAS_XCHG16
> > > +
> > > +/*
> > > + * xchg_tail - Put in the new queue tail code word & retrieve previous one
> > > + * @lock : Pointer to queued spinlock structure
> > > + * @tail : The new queue tail code word
> > > + * Return: The previous queue tail code word
> > > + *
> > > + * xchg(lock, tail), which heads an address dependency
> > > + *
> > > + * p,*,* -> n,*,* ; prev = xchg(lock, node)
> > > + */
> > > +static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
> > > +{
> > > +     /*
> > > +      * We can use relaxed semantics since the caller ensures that the
> > > +      * MCS node is properly initialized before updating the tail.
> > > +      */
> > > +     return (u32)xchg_relaxed(&lock->tail,
> > > +                              tail >> _Q_TAIL_OFFSET) << _Q_TAIL_OFFSET;
> > > +}
> > > +
> > > +#else /* !(_Q_PENDING_BITS == 8 && ARCH_HAS_XCHG16) */
> >
> > Why can't architectures just implement this with a 32-bit xchg instruction
> > if they don't have one that operates on 16 bits? Sure, they'll store more
> > data, but it's atomic so you shouldn't be able to tell... (ignoring parisc
> > crazy).
> >
> > Also, I'm surprised qspinlock benefits riscv. On arm64, there's nothing in
> > it over tickets for <= 16 CPUs.
> NUMA is on the way:
> https://lore.kernel.org/linux-riscv/20201119003829.1282810-1-atish.patra@wdc.com/

Well, they're patches not hardware (and I only see mention of QEMU over
there for the RISCV platform) ;)

> With your advice, I think we could using tickets lock when <= 16 CPUs
> and using qspinlock when > 16 CPUs.
> Is that right?

No, when I say "there's nothing in it", it means they're interchangeable.
It's just that qspinlock introduces a lot of complexity and I'm not keen
massively keen on changing the core code (which is used by many other
architectures) just because you don't have a 16-bit xchg() implementation.

So if you need qspinlock on riscv (not sure you do), then go ahead and make
that your one true lock implementation, but implement 16-bit xchg() at the
same time. Bonus points if you implement that in terms of 32-bit xchg() in
generic code (might need to watch out for endianness when shifting the new
value after aligning the base pointer).

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

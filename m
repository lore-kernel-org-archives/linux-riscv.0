Return-Path: <SRS0=Cgvv=JL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F07C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 09:05:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C144561166
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 09:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C144561166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bl91ygZiOE/tWbC+AnEq0fSBDwq9YgY3CWhxLoH6hv4=; b=QVE+IyZm4ASr/qO1K0TTcAj7T
	P2B8b8bGEu4gLVcmO9PZR8PkUn25qg+5nENn3wEc2KprnknIkIxPOINlU7B/qbu7y6/vwFWmKsDBV
	CWwDYxUinL73Vwvwvu43FyH9a57cgM0TDI2nvInufplTj6RRwUCKo9WUwlqXTgKcxx2+XTqvUayG0
	kNYyQSGcVHesem08d4mwgtpxCL3pUIhMt3E5kyci98C0Ki88VCYCkPwE9m4rdPZ13FhpYKT1YU+XO
	puV0HL6pyRk54okXJukC0lGpswqLJwrvv54+fMj2mYCN/aI7TdUsum0yFEbckEYInHf80F6NIfH13
	/GwwqyDGw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWbSk-00C5kg-HP; Wed, 14 Apr 2021 09:05:30 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lWbSf-00C5jq-7I; Wed, 14 Apr 2021 09:05:25 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 796E0300222;
 Wed, 14 Apr 2021 11:05:24 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5C0BF203CF7D7; Wed, 14 Apr 2021 11:05:24 +0200 (CEST)
Date: Wed, 14 Apr 2021 11:05:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Guo Ren <guoren@kernel.org>
Cc: Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
Message-ID: <YHawVOIHmDPbTmoB@hirez.programming.kicks-ass.net>
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <YHVTgfCpxpINc8sM@hirez.programming.kicks-ass.net>
 <CAJF2gTQaF8wBCp-L6vgJPcu6EnFRWmh_qZMX2PiEfj0Z70-Ykg@mail.gmail.com>
 <YHaU4uxr6emrivuu@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHaU4uxr6emrivuu@hirez.programming.kicks-ass.net>
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

On Wed, Apr 14, 2021 at 09:08:18AM +0200, Peter Zijlstra wrote:
> On Wed, Apr 14, 2021 at 10:26:57AM +0800, Guo Ren wrote:
> > Thx Peter,
> > 
> > On Tue, Apr 13, 2021 at 4:17 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Tue, Apr 13, 2021 at 10:03:01AM +0200, Peter Zijlstra wrote:
> > >
> > > > For ticket locks you really only needs atomic_fetch_add() and
> > > > smp_store_release() and an architectural guarantees that the
> > > > atomic_fetch_add() has fwd progress under contention and that a sub-word
> > > > store (through smp_store_release()) will fail the SC.
> > > >
> > > > Then you can do something like:
> > > >
> > > > void lock(atomic_t *lock)
> > > > {
> > > >       u32 val = atomic_fetch_add(1<<16, lock); /* SC, gives us RCsc */
> > > >       u16 ticket = val >> 16;
> > > >
> > > >       for (;;) {
> > > >               if (ticket == (u16)val)
> > > >                       break;
> > > >               cpu_relax();
> > > >               val = atomic_read_acquire(lock);
> > > >       }
> > Should it be?
> >        for (;;) {
> >                if (ticket == (u16)val) {
> >                        __atomic_acquire_fence();
> >                        break;
> >                }
> 
> No, atomic_fetch_add() is full smp_mb(), it even has a comment on that
> says so.
> 
> Also, __atomic_acquire_fence() is an implementation detail of atomic,
> and architectures need not provide it. On top of that, IIRC the atomic
> _acquire/_release have RCpc ordering, where we want our locks to have
> RCsc ordering (and very much not weaker than RCtso). Even more so,
> adding barriers to atomics should really not be conditional.

That made me look at the qspinlock code, and queued_spin_*lock() uses
atomic_try_cmpxchg_acquire(), which means any arch that uses qspinlock
and has RCpc atomics will give us massive pain.

Current archs using qspinlock are: x86, arm64, power, sparc64, mips and
openrisc (WTF?!).

Of those, x86 and sparc are TSO archs with SC atomics, arm64 has RCsc
atomics, power has RCtso atomics (and is the arch we all hate for having
RCtso locks).

Now MIPS has all sorts of ill specified barriers, but last time looked
at it it didn't actually use any of that and stuck to using smp_mb(), so
it will have RCsc atomics.

/me goes look at wth openrisc is..  doesn't even appear to have
asm/barrier.h :-/ Looking at wikipedia it also doesn't appear to
actually have hardware ...

I'm thinking openrisc is a prime candidate for this ticket_lock.h we're
all talking about.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

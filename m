Return-Path: <SRS0=Cgvv=JL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A84C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 12:56:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C8A3600CD
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 12:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C8A3600CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3oP4OrNtFat9g4gG6iraX5ejs+cduzaG4RNRoZnl9qQ=; b=T18um49Q4oGbhRfRgmNpOfTN1
	7WJO7ee/h9S/6jKNwaKjLSSs0O/uxYbI4Urr2o8ugNu2JSKucMvQUeqeBYYnqxqy6Q/QZQ74to6PG
	8itpFKu4W/AYd4zToHqI8aCS7gNTAHXuE5CvMg3XSNPhHkTfwK5i3swZP+wfps7SdJDKj4XZSi3nz
	+dDCqWL+oaX/vXjx2A4JrRp5CuUAKQXC3XV5YL7seMm4q7JLYaXpqQzoChTAMhHrGYjziGPWGaH9j
	vh3h3PipEIYbtKO1NAyqftikxwtJww/Hk6WEh6h+TWAPhJaUTr1f/hZbTlFj7gzz1LQgIxZexiexA
	xYwnqa1yg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWf4E-00CeXe-3R; Wed, 14 Apr 2021 12:56:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWf4C-00CeXQ-1r
 for linux-riscv@desiato.infradead.org; Wed, 14 Apr 2021 12:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Xvv1QEzJPf3S0gZF7Gup5VVBeUBTNACCxNNuZgdPkBs=; b=CO3wZOW6Mfb25oRUOR2ACzdI6x
 ILopvgZEOWCldFmiqIMGpnOEcMfpqhcSGI6VM16mkpHiqlYlibnvLdtR2xSwnSFm+tpoSoNM5wCI+
 noKQBvj8QIaOygEsA1/oQNlm0SJ4egamJCByKHuIKCmlGEUlbWUrYYhnQDNC9gpN3n88faM9GeWlo
 ds49BK+Ic3U52aJY98ydMPQodHo+tTUBP4nZJMQTp3AgPoJZsCVrNMSeWlYMZiImZ0K4ygFeVMNb9
 IlsQsqDhLngnjh7QbSIL7DQ1hC8LIzUREfjJx073+i1A3xhhT6axXPUJCHsQHAhWmhSoEelCZv5Px
 zJROLVMg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lWf3n-00782E-9P; Wed, 14 Apr 2021 12:56:12 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D7F9C300222;
 Wed, 14 Apr 2021 14:55:57 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id BA4532065A47C; Wed, 14 Apr 2021 14:55:57 +0200 (CEST)
Date: Wed, 14 Apr 2021 14:55:57 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Guo Ren <guoren@kernel.org>
Cc: Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Subject: Re: [RFC][PATCH] locking: Generic ticket-lock
Message-ID: <YHbmXXvuG442ZDfN@hirez.programming.kicks-ass.net>
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <YHVTgfCpxpINc8sM@hirez.programming.kicks-ass.net>
 <CAJF2gTQaF8wBCp-L6vgJPcu6EnFRWmh_qZMX2PiEfj0Z70-Ykg@mail.gmail.com>
 <YHaU4uxr6emrivuu@hirez.programming.kicks-ass.net>
 <YHawVOIHmDPbTmoB@hirez.programming.kicks-ass.net>
 <YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net>
 <CAJF2gTRsQQ=RunxK6R9MfK70dULt=RJOXXGCOT9oDPEsBgvKtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRsQQ=RunxK6R9MfK70dULt=RJOXXGCOT9oDPEsBgvKtQ@mail.gmail.com>
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

On Wed, Apr 14, 2021 at 08:39:33PM +0800, Guo Ren wrote:

> I've tested it on csky SMP*4 hw (860) & riscv SMP*4 hw (c910) and it's okay.

W00t :-)

> Hope you can keep
> typedef struct {
>         union {
>                 atomic_t lock;
>                 struct __raw_tickets {
> #ifdef __BIG_ENDIAN
>                         u16 next;
>                         u16 owner;
> #else
>                         u16 owner;
>                         u16 next;
> #endif
>                 } tickets;
>         };
> } arch_spinlock_t;
> 
> Using owner & next is much more readable.

That almost doubles the line-count of the thing ;-)


> > + * It further assumes atomic_*_release() + atomic_*_acquire() is RCpc and hence
> > + * uses atomic_fetch_add() which is SC to create an RCsc lock.

This ^^^ then vvv

> > +static __always_inline void ticket_lock(arch_spinlock_t *lock)
> > +{
> > +       u32 val = atomic_fetch_add(1<<16, lock); /* SC, gives us RCsc */
> atomic_fetch_add_acquire ?

Then we must rely on the arch to implement RCsc atomics. And I for one
can never tell wth Risc-V actually does.

> > +static __always_inline int ticket_is_locked(arch_spinlock_t *lock)
> > +{
> > +       u32 val = atomic_read(lock);
> > +
> > +       return ((val >> 16) != (val & 0xffff));
> I perfer:
> return !arch_spin_value_unlocked(READ_ONCE(*lock));
> > +}

> > +}
> > +
> > +static __always_inline int ticket_value_unlocked(arch_spinlock_t lock)
> > +{
> > +       return !ticket_is_locked(&lock);
> Are you sure to let ticket_is_locked->atomic_read(lock) again, the
> lock has contained all information?
> 
> return lock.tickets.owner == lock.tickets.next;

Yeah, I wrote then the wrong way around. Couldn't be bothered to go back
when I figured it out.

> > +
> > +static __always_inline int ticket_is_contended(arch_spinlock_t *lock)
> > +{
> > +       u32 val = atomic_read(lock);
> > +
> > +       return (s16)((val >> 16) - (val & 0xffff)) > 1;
> How big-endian ?

How not? Endian-ness only matters when you go poke at sub-words, which
the above does not. Only ticket_unlock() does and cares about that.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

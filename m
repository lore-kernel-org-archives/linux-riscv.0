Return-Path: <SRS0=SYmu=JK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E39AC433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 09:31:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E5AE610CA
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 09:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E5AE610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Szz/434icNcnBsFFZX2pUH5DM0QXBEsg9baCp5ssoHs=; b=ZrBjHRYdbQV/CBmgWr7HPXVfm
	tJKJO4q2bqKXB2+w2FyvmKPW3UmoVrFKmoi0FmCDSpHKJOaOMsHDZKofbKdKp8Wkzkxj6ylL35LS2
	oTdyFuITufR8CtKcxRA6SFlDd69/EBlgLNxk5XhrD9p0I9GRCLW1g0k1l/mF50Gy97g3q6ARRdlEd
	rpT4108SGwqIWs+emkoAQ6iqF4OfHNC1HsbC5sZrJIxUlojKqMebkPhHsthLbtxz+b1YKXN1s/gJ6
	xZu1g8iv+xsO4405sDeKetKRrW54RT7wIyImP8K/jS8Ola3wxEa96MCDMYV2SrOBEQE6bcl8f//++
	fQJ8j3e6A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWFO1-008iV9-Tk; Tue, 13 Apr 2021 09:31:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWFNy-008iUW-IX
 for linux-riscv@desiato.infradead.org; Tue, 13 Apr 2021 09:31:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=cUHex+FzSBdWYnFrFeQCHLHCGaVq+XLMvFksXbckuyI=; b=cIK8LofSpBk8gKamSBqHQoDihX
 L4XtFAEl3a8vuZmHWNsmlzjdE77qEBOMfzJ7BJHwrOaaQUPYo3FOAGRFKAFKDp9urHElWUgtlBDFz
 kLc1gX/wS5EVuT09jGiBrAa37wcs6HtBlX3M871nwCPhgsTSQMCsxYzB078p6yPEVx7Rethdwa0cG
 aIZfFA1PhhR2+bkUnJ1n1lbqQ1G0f6IsqZ3SfKK1XFoNrjwbhqiXuUXrYsUZRR23irRWQeQGA/UzB
 VVEef9QWvNkoqVuICSGQBNIxVPQMPedxYFV2PLDl1ipM1bqgyRyUKFVRJ9kKLpsGL1GDBNJky/8UK
 69t9+rjA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWFNv-006sdo-R4
 for linux-riscv@lists.infradead.org; Tue, 13 Apr 2021 09:31:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D94A6613B2;
 Tue, 13 Apr 2021 09:31:01 +0000 (UTC)
Date: Tue, 13 Apr 2021 10:30:59 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, will.deacon@arm.com,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
Message-ID: <20210413093059.GB15806@arm.com>
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <CAHB2gtTmGt=V4cUgbt3zGgi+y5h0f5ON0n+MdRC8P=su670qhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHB2gtTmGt=V4cUgbt3zGgi+y5h0f5ON0n+MdRC8P=su670qhQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_023103_939129_447FB6DF 
X-CRM114-Status: GOOD (  33.67  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 13, 2021 at 11:22:40AM +0200, Christoph M=FCllner wrote:
> On Tue, Apr 13, 2021 at 10:03 AM Peter Zijlstra <peterz@infradead.org> wr=
ote:
> > On Mon, Apr 12, 2021 at 11:54:55PM +0200, Christoph M=FCllner wrote:
> > > On Mon, Apr 12, 2021 at 7:33 PM Palmer Dabbelt <palmer@dabbelt.com> w=
rote:
> > > > My plan is to add a generic ticket-based lock, which can be selecte=
d at
> > > > compile time.  It'll have no architecture dependencies (though it'll
> > > > likely have some hooks for architectures that can make this go fast=
er).
> > > > Users can then just pick which spinlock flavor they want, with the =
idea
> > > > being that smaller systems will perform better with ticket locks and
> > > > larger systems will perform better with queued locks.  The main goal
> > > > here is to give the less widely used architectures an easy way to h=
ave
> > > > fair locks, as right now we've got a lot of code duplication becaus=
e any
> > > > architecture that wants ticket locks has to do it themselves.
> > >
> > > In the case of LL/SC sequences, we have a maximum of 16 instructions
> > > on RISC-V. My concern with a pure-C implementation would be that
> > > we cannot guarantee this (e.g. somebody wants to compile with -O0)
> > > and I don't know of a way to abort the build in case this limit excee=
ds.
> > > Therefore I have preferred inline assembly for OpenSBI (my initial id=
ea
> > > was to use closure-like LL/SC macros, where you can write the loop
> > > in form of C code).
> >
> > For ticket locks you really only needs atomic_fetch_add() and
> > smp_store_release() and an architectural guarantees that the
> > atomic_fetch_add() has fwd progress under contention and that a sub-word
> > store (through smp_store_release()) will fail the SC.
> >
> > Then you can do something like:
> >
> > void lock(atomic_t *lock)
> > {
> >         u32 val =3D atomic_fetch_add(1<<16, lock); /* SC, gives us RCsc=
 */
> >         u16 ticket =3D val >> 16;
> >
> >         for (;;) {
> >                 if (ticket =3D=3D (u16)val)
> >                         break;
> >                 cpu_relax();
> >                 val =3D atomic_read_acquire(lock);
> >         }
> > }
> >
> > void unlock(atomic_t *lock)
> > {
> >         u16 *ptr =3D (u16 *)lock + (!!__BIG_ENDIAN__);
> >         u32 val =3D atomic_read(lock);
> >
> >         smp_store_release(ptr, (u16)val + 1);
> > }
> >
> > That's _almost_ as simple as a test-and-set :-) It isn't quite optimal
> > on x86 for not being allowed to use a memop on unlock, since its being
> > forced into a load-store because of all the volatile, but whatever.
> =

> What about trylock()?
> I.e. one could implement trylock() without a loop, by letting
> trylock() fail if the SC fails.
> That looks safe on first view, but nobody does this right now.

Not familiar with RISC-V but I'd recommend that a trylock only fails if
the lock is locked (after LR). A SC may fail for other reasons
(cacheline eviction; depending on the microarchitecture) even if the
lock is unlocked. At least on arm64 we had this issue with an
implementation having a tendency to always fail the first STXR.

-- =

Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

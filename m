Return-Path: <SRS0=SYmu=JK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9605EC433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 10:47:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 563CE613BA
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 10:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 563CE613BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vgBBIYwqWsvmZ+sYrpNlTMoKPuCVdUcsx6zRiUzF2QA=; b=UWjqiytLVOp3hRyJKA3MGfIaX
	XvCfGYGcPZnutUxqiaGUVFcXg6WAcIXTTuHX5jkGtV9IA3tB7u2p33rkbcRgQnZrb8r9Zw07pUhFU
	Qru2huzUmk7Th1Ys3sti/VL8GKeX/saDY2A3Nl6kCiQzLoISAcIrgOfpqobhHkL4NFV6dajgRve/f
	rGZn6rMn2HTBajXd31XGR609zj+iQLvkLtOH8f7FDtkYxHxs/wYeBGFb+OpqIjzQ1UnhxZtZTZ3zx
	Qh602nbDX5uG+4HOfqUIumzoCVPlkmomXCMHGb+rS+JWb86mdGe0Dw3Q2SK98HermQ1qmYJlWVZnC
	upxOdD7cA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWGZB-008tvj-EV; Tue, 13 Apr 2021 10:46:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWGXf-008tlw-7F
 for linux-riscv@desiato.infradead.org; Tue, 13 Apr 2021 10:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=BKvyQwqP1CGF2nxDVwcn8Ks7rJV6J2Q0Qlvov3Bj5XM=; b=ae6H5RWNUDb+5PDtBusjDvXQL+
 9DH7AyN/N7DFRm/qansIx5EILI5aJLnq4IoyN5Y7lg4eAYs3RNoanB+6CEh54yc8gbql6hpFQQqV4
 viI5y0k6p8yR89caezFyjaSYL6IA4N5emSWnRYU3dN8ynoEmRiGw86Wfgv1kNMJ7IrS76uywnyhdF
 F9VWuzEvxPXzlkvipyA/VThKwcz90XA+tG050e0i3CX4hLBhj58U7UZZv3yehfiMPHujGkAMcsJIs
 aHsW7BD98OGK+VC+pFPXSCbUGLAU59ewgLjRrCtNXX486UaGVmRZBkiSSpDb1YqycyXQUa044t5K5
 cjdz9A8w==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWGXc-006vwh-Gj
 for linux-riscv@lists.infradead.org; Tue, 13 Apr 2021 10:45:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E2C461278;
 Tue, 13 Apr 2021 10:45:06 +0000 (UTC)
Date: Tue, 13 Apr 2021 11:45:03 +0100
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
Message-ID: <20210413104503.GD15806@arm.com>
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <CAHB2gtTmGt=V4cUgbt3zGgi+y5h0f5ON0n+MdRC8P=su670qhQ@mail.gmail.com>
 <YHVl8fFfdQDn+QYW@hirez.programming.kicks-ass.net>
 <CAHB2gtTzEuD7j-+5ztui0eV6UNiEisBTgoK+2Sr=Z0b4PPXRyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHB2gtTzEuD7j-+5ztui0eV6UNiEisBTgoK+2Sr=Z0b4PPXRyA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_034508_593891_647936E4 
X-CRM114-Status: GOOD (  19.25  )
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

On Tue, Apr 13, 2021 at 12:25:00PM +0200, Christoph M=FCllner wrote:
> On Tue, Apr 13, 2021 at 11:37 AM Peter Zijlstra <peterz@infradead.org> wr=
ote:
> > On Tue, Apr 13, 2021 at 11:22:40AM +0200, Christoph M=FCllner wrote:
> > > What about trylock()?
> > > I.e. one could implement trylock() without a loop, by letting
> > > trylock() fail if the SC fails.
> > > That looks safe on first view, but nobody does this right now.
> >
> > Generic code has to use cmpxchg(), and then you get something like this:
> >
> > bool trylock(atomic_t *lock)
> > {
> >         u32 old =3D atomic_read(lock);
> >
> >         if ((old >> 16) !=3D (old & 0xffff))
> >                 return false;
> >
> >         return atomic_try_cmpxchg(lock, &old, old + (1<<16)); /* SC, fo=
r RCsc */
> > }
> =

> This approach requires two loads (atomic_read() and cmpxchg()), which
> is not required.
> Detecting this pattern and optimizing it in a compiler is quite unlikely.
> =

> A bit less generic solution would be to wrap the LL/SC (would be
> mandatory in this case)
> instructions and do something like this:
> =

> uint32_t __smp_load_acquire_reserved(void*);
> int __smp_store_release_conditional(void*, uint32_t);
> =

> typedef union {
>     uint32_t v32;
>     struct {
>         uint16_t owner;
>         uint16_t next;
>     };
> } arch_spinlock_t;
> =

> int trylock(arch_spinlock_t *lock)
> {
>     arch_spinlock_t l;
>     int success;
>     do {
>         l.v32 =3D __smp_load_acquire_reserved(lock);
>         if (l.owner !=3D l.next)
>             return 0;
>         l.next++;
>         success =3D __smp_store_release_conditional(lock, l.v32);
>     } while (!success);
>     return success;
> }
> =

> But here we can't tell the compiler to optimize the code between LL and S=
C...

This indeed needs some care. IIUC RISC-V has similar restrictions as arm
here, no load/store instructions are allowed between LR and SC. You
can't guarantee that the compiler won't spill some variable onto the
stack.

BTW, I think the SC doesn't need release semantics above, only the LR
needs acquire semantics.

-- =

Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

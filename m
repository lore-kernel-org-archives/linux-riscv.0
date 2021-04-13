Return-Path: <SRS0=SYmu=JK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDA8C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 09:36:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AB3761222
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 09:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AB3761222
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JDMsBLVQHhELuj1iJY6kP4PWcdMtLuovwW36Xpo+WFA=; b=GB9ZixOyFLlDunmuri0AV7uOC
	bgO2b/ovsz89/xyayRMPrffZqgKdqF6gDitojJmBwD54VK5OKsME+VCfbiwSCh2vuu0t7DsIyISjx
	hwXSvEEPGxchl+5XSJK1x9VFunHg/hwBad3MJTMfwXhAvFAWeqArxea4ODjDgEU2xccJlakG84Tjc
	eZxNos48zKhlNXf62NskpANizWLIh+ERD34h0SGsBkmdNrrUcG0JJrPrSLE3YXmtcLmicel3eAEqG
	bKSrZCABjbTt8OsAB8Bbg/Mt7qXuI6ScXl8nJFmw9T73VUCfUEK3+f7Tclf44lpxkzIx/zWz8vdxt
	0EkuKX2GA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWFTG-008jWu-Dn; Tue, 13 Apr 2021 09:36:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWFT8-008jUY-Vn
 for linux-riscv@desiato.infradead.org; Tue, 13 Apr 2021 09:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=2nGPE59l8gWiF0CqV9jlYVOt/A6vHOQsPW2h6H+vfmY=; b=njzHTxASJJ2X0EikzjsaTCfbhp
 lLug7KEU5iaDbXwxTJVVGxKKWAY/U57Bh5gSWz7YYsj3H3UlKyKsy2HtKBjYALNuJm1doi6ZPQBtP
 f6bVmuh/l4f/MRJOLX7MM8U3TY6UJw5WRUIf/6lRlOsBGsEkxDAc9JrDxHuQaY1CIjrtrE84dEQMZ
 n7nE1c6o5xJVJEJX6KPhvu9lDyqCt8wp+TKsPWQZmmf8RSTSM0dSLTeS/j8PE9i0BAj0xQz7OU8RG
 bC2M6YyVC4utH/Tsxo4nT3NOEjs7jxTLmCNkC5j/2HNgJcok95Tm/iFpDR4wANIt/9Gn/dAfeB+vb
 xfEy/d8Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lWFSU-005Xmf-U9; Tue, 13 Apr 2021 09:36:06 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 933DC300033;
 Tue, 13 Apr 2021 11:35:45 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 534D02C4B2075; Tue, 13 Apr 2021 11:35:45 +0200 (CEST)
Date: Tue, 13 Apr 2021 11:35:45 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Guo Ren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, catalin.marinas@arm.com,
 will.deacon@arm.com, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
Message-ID: <YHVl8fFfdQDn+QYW@hirez.programming.kicks-ass.net>
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <CAHB2gtTmGt=V4cUgbt3zGgi+y5h0f5ON0n+MdRC8P=su670qhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHB2gtTmGt=V4cUgbt3zGgi+y5h0f5ON0n+MdRC8P=su670qhQ@mail.gmail.com>
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

Generic code has to use cmpxchg(), and then you get something like this:

bool trylock(atomic_t *lock)
{
	u32 old =3D atomic_read(lock);

	if ((old >> 16) !=3D (old & 0xffff))
		return false;

	return atomic_try_cmpxchg(lock, &old, old + (1<<16)); /* SC, for RCsc */
}

That will try and do the full LL/SC loop, because it wants to complete
the cmpxchg, but in generic code we have no other option.

(Is this what C11's weak cmpxchg is for?)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

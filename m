Return-Path: <SRS0=SYmu=JK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A7DC433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 08:04:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84D926120E
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 08:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84D926120E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cQUSzYDLfmFvcxjXLJGc6nqX4C6Hu6vx4RtsrMM3X2A=; b=ChnNLxPuqlEFdD4TzE/wEBCDQ
	RzRvo7bVYoPD3QjRm+QV26p4q+3SIryO28PBuu/5QzaCeXL0ID2GOZzbhhttt7N2hTwDKsrW84YLm
	pzBd+Wq2eRDsRz/itJhJA2OsX1gE4c9ks5q3dKLLs8TUc13OSUdL5NVARdqcDlzd1JklFvIkD/sAN
	TAC7LR4juGTvhtpJvhhQcrvIzW+2GW+PkwYQOpdxSR64V5zADdsf91A/JiAHMOkewbBLUaXYhc9pC
	WcXPrB72np777uUDWNaywWjpDyLb0Vx4mKXTBzGkRxzfOC40zQviYBVZD8PJiNfLV7/ghINO3fdO4
	Oriwt2hRg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWE20-008Yib-TJ; Tue, 13 Apr 2021 08:04:21 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lWE0k-008Ybv-LJ; Tue, 13 Apr 2021 08:03:18 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8ACBB300036;
 Tue, 13 Apr 2021 10:03:01 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 6FF6D200CF8CA; Tue, 13 Apr 2021 10:03:01 +0200 (CEST)
Date: Tue, 13 Apr 2021 10:03:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Guo Ren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, catalin.marinas@arm.com,
 will.deacon@arm.com, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
Message-ID: <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
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

On Mon, Apr 12, 2021 at 11:54:55PM +0200, Christoph M=FCllner wrote:
> On Mon, Apr 12, 2021 at 7:33 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:

> > My plan is to add a generic ticket-based lock, which can be selected at
> > compile time.  It'll have no architecture dependencies (though it'll
> > likely have some hooks for architectures that can make this go faster).
> > Users can then just pick which spinlock flavor they want, with the idea
> > being that smaller systems will perform better with ticket locks and
> > larger systems will perform better with queued locks.  The main goal
> > here is to give the less widely used architectures an easy way to have
> > fair locks, as right now we've got a lot of code duplication because any
> > architecture that wants ticket locks has to do it themselves.
> =

> In the case of LL/SC sequences, we have a maximum of 16 instructions
> on RISC-V. My concern with a pure-C implementation would be that
> we cannot guarantee this (e.g. somebody wants to compile with -O0)
> and I don't know of a way to abort the build in case this limit exceeds.
> Therefore I have preferred inline assembly for OpenSBI (my initial idea
> was to use closure-like LL/SC macros, where you can write the loop
> in form of C code).

For ticket locks you really only needs atomic_fetch_add() and
smp_store_release() and an architectural guarantees that the
atomic_fetch_add() has fwd progress under contention and that a sub-word
store (through smp_store_release()) will fail the SC.

Then you can do something like:

void lock(atomic_t *lock)
{
	u32 val =3D atomic_fetch_add(1<<16, lock); /* SC, gives us RCsc */
	u16 ticket =3D val >> 16;

	for (;;) {
		if (ticket =3D=3D (u16)val)
			break;
		cpu_relax();
		val =3D atomic_read_acquire(lock);
	}
}

void unlock(atomic_t *lock)
{
	u16 *ptr =3D (u16 *)lock + (!!__BIG_ENDIAN__);
	u32 val =3D atomic_read(lock);

	smp_store_release(ptr, (u16)val + 1);
}

That's _almost_ as simple as a test-and-set :-) It isn't quite optimal
on x86 for not being allowed to use a memop on unlock, since its being
forced into a load-store because of all the volatile, but whatever.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

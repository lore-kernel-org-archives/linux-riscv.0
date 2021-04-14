Return-Path: <SRS0=Cgvv=JL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F52C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 13:09:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D84A460E09
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 13:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D84A460E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sttCjiTZhorbOP78F6mZZFt4Q9IcUNshVSHv7j1ifg4=; b=nncsav39qpQ3bpar7jF5P5dYB
	X9TUarvR6iR/wg1jguNGCIaooFiuMP42ETvoeypCWpPA8KtRyPjGwDUc25gvejt97jqIQAKNRfgiv
	QiY95fD7tsObdTlkTODySjjahimN9a+LOSKQirQ5O1AK6jI9Ol7DO7BQH+radO3aV6EyomYj3Fg/S
	JseRJAE1A9qL4GK4fP5c6hmqJyAaH+BdzQigTS8slImxZATbkVdAUEPI22LkR3vE9oICcMEyde1iE
	/th+ENjES505TVIw1bDJd0HUH+ZXDGRqQ4hlxNl8jN8M0ORbimpRM5ROlxvyiyGqEjhs4lxLswnaf
	gTP0OJucQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWfGi-00Cga4-WE; Wed, 14 Apr 2021 13:09:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWfGZ-00CgZC-Ll
 for linux-riscv@desiato.infradead.org; Wed, 14 Apr 2021 13:09:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OxdMAk1LmEqVZwUMYasw5A7Q8hQ+IixVw/lGbUnnOh0=; b=sbxUAR1Ou6zsfaam6Yge0tIitq
 WUZqtRbnE6R5XHVcG880KxETwVIsTvEHS/9EJ4RuB8KgS2NCFb74vtv7LLFOX5muyUB7y0PBtjrD+
 uOsGjA33PLJukmCX8phq1CKCbb6xtqwTQAjLuOJIZlBH/LkLwjz860+HGdcFTaSoZRVRipRLMM116
 WEpGCEz2gJGFDrrWua9F8wO1Xi5LhjVHCNviO+o4caKjdagtlFlkTQeNwVUvoobcBmCdElN4XFNvI
 71tRGEzgEL0eW4wwERVBXTFJ65qo7aNjPl0uCAx9OyoK/0Op3nxNbCgmfXo7oqleltXqtPfoIKlDO
 PKlyfuKA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lWfFy-0078jp-Vr; Wed, 14 Apr 2021 13:08:42 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8071B30015A;
 Wed, 14 Apr 2021 15:08:34 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 4AAF02065A47D; Wed, 14 Apr 2021 15:08:34 +0200 (CEST)
Date: Wed, 14 Apr 2021 15:08:34 +0200
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
Message-ID: <YHbpUtIWaaP1Qod1@hirez.programming.kicks-ass.net>
References: <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <YHVTgfCpxpINc8sM@hirez.programming.kicks-ass.net>
 <CAJF2gTQaF8wBCp-L6vgJPcu6EnFRWmh_qZMX2PiEfj0Z70-Ykg@mail.gmail.com>
 <YHaU4uxr6emrivuu@hirez.programming.kicks-ass.net>
 <YHawVOIHmDPbTmoB@hirez.programming.kicks-ass.net>
 <YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net>
 <CAJF2gTRsQQ=RunxK6R9MfK70dULt=RJOXXGCOT9oDPEsBgvKtQ@mail.gmail.com>
 <YHbmXXvuG442ZDfN@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHbmXXvuG442ZDfN@hirez.programming.kicks-ass.net>
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

On Wed, Apr 14, 2021 at 02:55:57PM +0200, Peter Zijlstra wrote:
> On Wed, Apr 14, 2021 at 08:39:33PM +0800, Guo Ren wrote:

> > > + * It further assumes atomic_*_release() + atomic_*_acquire() is RCpc and hence
> > > + * uses atomic_fetch_add() which is SC to create an RCsc lock.
> 
> This ^^^ then vvv
> 
> > > +static __always_inline void ticket_lock(arch_spinlock_t *lock)
> > > +{
> > > +       u32 val = atomic_fetch_add(1<<16, lock); /* SC, gives us RCsc */
> > atomic_fetch_add_acquire ?
> 
> Then we must rely on the arch to implement RCsc atomics. And I for one
> can never tell wth Risc-V actually does.

Anyway, if we can mandate that atomic acquire/release is RCsc, then yes
we can do that but then we also need:

#define smp_mb__after_spinlock()	smp_mb__after_atomic()

But currently atomic acquire/release is not RCsc (at the very least
Power does RCtso -- and power gets to deal with any and all pain caused
by that).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

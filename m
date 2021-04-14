Return-Path: <SRS0=Cgvv=JL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E872CC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 07:08:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C70361220
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 07:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C70361220
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HMgEVTrOwThg1BYSgMtBi5Z3F2gSUEQmr2/bbZSjH3A=; b=FIz5vwzmHaPlnom7+TFVJSylD
	TsNIWuOvkzBZUAwO46YGxAMGOTRYfDsaaf6T0w6CsQ42jfmbulR1+DYb0daK2Jm5aelKx0wf5pJnH
	L0I9cM+m6E7QQJbe3IAZEsZDmjxWpQfVEXhQd46oCseY17NIIU2H6V2OuQb6G8BEUgIaIc7Ym9ilk
	P31fOP/vQr2lvWpMjEpQOzl8vr/hhhB0vlmwnuY23UmM5n8eza81ILFh/YPLY1Ge6bWCHKw7CV8Ck
	QdWYQzJ10turQuVA7gFWmLrYSlK3cRQ6z+4eJzysx6tPKGUiVqZ3XQmEwXgm9lX79lPCmjGV7WZDq
	C2kpwlupA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWZdU-00Bmcq-VV; Wed, 14 Apr 2021 07:08:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWZdR-00BmcS-3E
 for linux-riscv@desiato.infradead.org; Wed, 14 Apr 2021 07:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cPfVvcbK8T4D/6el7vVPft6WcH2dgQZt6307pfljaIs=; b=QoWGo05rX8BTJjkF5ptA2dFFAt
 fULA6iI1uxTwTXJF/lE3ZsWeMkLeKB1QnIs7RdgHjQaoiRpQ2+cGn+N5u/oDRXFuuI/1HKTqearur
 75+TDpMCNoM+vuMitFtxt4Hboytxc/SLq0NBKh1H4FVPRLFlsdCoscYcHZVBCXvZmS54Frsu8wCZj
 XnA0fPVx5HV3cD9/N1B6dymb7EahE6hQSKY0kdR0qZiLMdI/B3Ss+O2l7jxf9oGC5AXmAMtj2NOvJ
 2M7/a9OvGIpCK7mQYaBZe8yojj0cnlknsfb+kET4/81eiFYcHoaOgVDBL9Dr2/gjYoPfjEM3uq1QN
 5vgvzQzg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lWZdL-006mde-Sp; Wed, 14 Apr 2021 07:08:20 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 35C86300033;
 Wed, 14 Apr 2021 09:08:19 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id F1B4F203D395C; Wed, 14 Apr 2021 09:08:18 +0200 (CEST)
Date: Wed, 14 Apr 2021 09:08:18 +0200
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
Message-ID: <YHaU4uxr6emrivuu@hirez.programming.kicks-ass.net>
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <YHVTgfCpxpINc8sM@hirez.programming.kicks-ass.net>
 <CAJF2gTQaF8wBCp-L6vgJPcu6EnFRWmh_qZMX2PiEfj0Z70-Ykg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQaF8wBCp-L6vgJPcu6EnFRWmh_qZMX2PiEfj0Z70-Ykg@mail.gmail.com>
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

On Wed, Apr 14, 2021 at 10:26:57AM +0800, Guo Ren wrote:
> Thx Peter,
> 
> On Tue, Apr 13, 2021 at 4:17 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Tue, Apr 13, 2021 at 10:03:01AM +0200, Peter Zijlstra wrote:
> >
> > > For ticket locks you really only needs atomic_fetch_add() and
> > > smp_store_release() and an architectural guarantees that the
> > > atomic_fetch_add() has fwd progress under contention and that a sub-word
> > > store (through smp_store_release()) will fail the SC.
> > >
> > > Then you can do something like:
> > >
> > > void lock(atomic_t *lock)
> > > {
> > >       u32 val = atomic_fetch_add(1<<16, lock); /* SC, gives us RCsc */
> > >       u16 ticket = val >> 16;
> > >
> > >       for (;;) {
> > >               if (ticket == (u16)val)
> > >                       break;
> > >               cpu_relax();
> > >               val = atomic_read_acquire(lock);
> > >       }
> Should it be?
>        for (;;) {
>                if (ticket == (u16)val) {
>                        __atomic_acquire_fence();
>                        break;
>                }

No, atomic_fetch_add() is full smp_mb(), it even has a comment on that
says so.

Also, __atomic_acquire_fence() is an implementation detail of atomic,
and architectures need not provide it. On top of that, IIRC the atomic
_acquire/_release have RCpc ordering, where we want our locks to have
RCsc ordering (and very much not weaker than RCtso). Even more so,
adding barriers to atomics should really not be conditional.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

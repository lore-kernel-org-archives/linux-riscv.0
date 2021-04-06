Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDCBC433ED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 07:16:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02A8D601FF
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 07:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02A8D601FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XV5TFshJp98AoGqKuQL9fastLrA/iuUD/kMl50uvnHw=; b=i/VfVuu6O8Y9G3QPF1gQWxYU9
	nQNTBKcZlkOP7xUDyuVaQxJNmLHnbkuGTOO5t6Qsy/xuHzWiyPtWQ3fGqaOiEfiw7kVgU67yI0F9+
	9nKFlEa8uqYOq2klCHcteK3abHI/nfssyg9s2oVg0W/rOICHoG4o8nb3kd5i02HZfEdVT0zQjXdL0
	qxmywTPyp8eUbo12L7Ti3+PYTnSwByUD8ZGD5pH3ZREgWixT3EpVAaGUBStJchqu0qY0gacmitQXN
	FVqLpfM3oKhclGbeF7A7GNM24qRma5lFbvwXfKFmMpeXXnYMmGOvwWk5ZIVb4dGBWtJhVTVp8P2Hf
	jpqSoIpmg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTfwf-001k1r-S5; Tue, 06 Apr 2021 07:16:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTfwa-001k1P-VY
 for linux-riscv@desiato.infradead.org; Tue, 06 Apr 2021 07:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=aRGRQBCE7ZKsjbhrcqSn4Jo3nc9IkKbKN4abWLlyP80=; b=WvzcNuYnVyRbah4nxnWcWdoNU6
 H5wHYaDBfCISTQvHzRpzGRn91lc03dCUXiBbEEUDCPEB4Yeq63GiV6lLq8i8AZn/tWpZxZYSuhctd
 jzf6VVp1NOue0hMTMWxQ6mga6cVW6N5Z42Buoy8IX/h0NKUa+zFqx39wB3zP83mikjucbNP8MchX1
 FwnadXNwysORLciBkvj7UA/dLnA6M1F8WphRWx/kc45XKGGoqNFHveQGY09rmNhpPwFkIBPB2rDgH
 euma4zKdRl019WHxYogGJ9bTOK8qADgmVesbRspJNMCQ2pQLQNFFeKHZtm1/fK0PL76zCDW9f+atv
 w96mJ69g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lTfwF-00CQIw-Vj; Tue, 06 Apr 2021 07:16:00 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A7762301324;
 Tue,  6 Apr 2021 09:15:50 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 79FD12C1D199B; Tue,  6 Apr 2021 09:15:50 +0200 (CEST)
Date: Tue, 6 Apr 2021 09:15:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <YGwKpmPkn5xIxIyx@hirez.programming.kicks-ass.net>
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTS4jexKsSiXBY=5rz53LjcLUZ1K4pxjYJDVQCWx_8JTuA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTS4jexKsSiXBY=5rz53LjcLUZ1K4pxjYJDVQCWx_8JTuA@mail.gmail.com>
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

On Wed, Mar 31, 2021 at 11:22:35PM +0800, Guo Ren wrote:
> On Mon, Mar 29, 2021 at 8:50 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Mon, Mar 29, 2021 at 08:01:41PM +0800, Guo Ren wrote:
> > > u32 a = 0x55aa66bb;
> > > u16 *ptr = &a;
> > >
> > > CPU0                       CPU1
> > > =========             =========
> > > xchg16(ptr, new)     while(1)
> > >                                     WRITE_ONCE(*(ptr + 1), x);
> > >
> > > When we use lr.w/sc.w implement xchg16, it'll cause CPU0 deadlock.
> >
> > Then I think your LL/SC is broken.
> No, it's not broken LR.W/SC.W. Quote <8.3 Eventual Success of
> Store-Conditional Instructions>:
> 
> "As a consequence of the eventuality guarantee, if some harts in an
> execution environment are executing constrained LR/SC loops, and no
> other harts or devices in the execution environment execute an
> unconditional store or AMO to that reservation set, then at least one
> hart will eventually exit its constrained LR/SC loop. By contrast, if
> other harts or devices continue to write to that reservation set, it
> is not guaranteed that any hart will exit its LR/SC loop."

(there, reflowed it for you)

That just means your arch spec is broken too :-)

> So I think it's a feature of LR/SC. How does the above code (also use
> ll.w/sc.w to implement xchg16) running on arm64?
> 
> 1: ldxr
>     eor
>     cbnz ... 2f
>     stxr
>     cbnz ... 1b   // I think it would deadlock for arm64.
> 
> "LL/SC fwd progress" which you have mentioned could guarantee stxr
> success? How hardware could do that?

I'm not a hardware person; I've never actually build anything larger
than a 4 bit adder with nand gates (IIRC, 25+ years ago). And I'll let
Will answer the ARM64 part.

That said, I think the idea is that if you lock the line (load-locked is
a clue ofcourse) to the core until either: an exception (or anything
else that is guaranteed to fail LL/SC), SC or N instructions, then a
competing LL/SC will stall in the LL while the first core makes
progress.

This same principle is key to hardware progress for cmpxchg/cas loops,
don't instantly yield the exclusive hold on the cacheline, keep it
around for a while.

Out-of-order CPUs can do even better I think, by virtue of them being
able to see tight loops.


Anyway, given you have such a crap architecture (and here I thought
RISC-V was supposed to be a modern design *sigh*), you had better go
look at the sparc64 atomic implementation which has a software backoff
for failed CAS in order to make fwd progress.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

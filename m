Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91FCC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 19:05:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A7206195D
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 19:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A7206195D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ViHrrBNTuyRgAyX1Pk3/452k1z9Od/it+ux2hMy1Pcw=; b=rcahH+5csJ1pXR7T6pK/GN449
	Zw9Pw4fSPD29c2tHiiHohZ2ZCPFJQHQvCa0eMcbWo4FkK73q7Sr8ykBx2nup06BSeZo/bB7heoXNF
	9yPonl4uqtSYQGuh9BjtslGZs/3+00miP4bY7aOSoAgH+xm91srfLdc+khO4gYRuJYIy8nxroqQKc
	VDMnRpXHNs3ddvdboqJxpiOWVTbgkevaiMcv3qsLOP0cWsLdg9C7TVGxDVVOIsIEQW7TkVwKWutx5
	1NgCBijQceZOTPcUWzRMtCNkIBOy4fy1MwZnXg4bBQOsQ9PO24t9VF7DKswICpZvFkygBjR4X1VDA
	z7EG3azqw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxBx-001ALh-Vp; Mon, 29 Mar 2021 19:04:50 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lQq2e-000cHI-4x; Mon, 29 Mar 2021 11:26:44 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 857B83007CD;
 Mon, 29 Mar 2021 13:26:43 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 6C168207539C5; Mon, 29 Mar 2021 13:26:43 +0200 (CEST)
Date: Mon, 29 Mar 2021 13:26:43 +0200
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
Message-ID: <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
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

On Mon, Mar 29, 2021 at 07:19:29PM +0800, Guo Ren wrote:
> On Mon, Mar 29, 2021 at 3:50 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Sat, Mar 27, 2021 at 06:06:38PM +0000, guoren@kernel.org wrote:
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > Some architectures don't have sub-word swap atomic instruction,
> > > they only have the full word's one.
> > >
> > > The sub-word swap only improve the performance when:
> > > NR_CPUS < 16K
> > >  *  0- 7: locked byte
> > >  *     8: pending
> > >  *  9-15: not used
> > >  * 16-17: tail index
> > >  * 18-31: tail cpu (+1)
> > >
> > > The 9-15 bits are wasted to use xchg16 in xchg_tail.
> > >
> > > Please let architecture select xchg16/xchg32 to implement
> > > xchg_tail.
> >
> > So I really don't like this, this pushes complexity into the generic
> > code for something that's really not needed.
> >
> > Lots of RISC already implement sub-word atomics using word ll/sc.
> > Obviously they're not sharing code like they should be :/ See for
> > example arch/mips/kernel/cmpxchg.c.
> I see, we've done two versions of this:
>  - Using cmpxchg codes from MIPS by Michael
>  - Re-write with assembly codes by Guo
> 
> But using the full-word atomic xchg instructions implement xchg16 has
> the semantic risk for atomic operations.

What? -ENOPARSE

> > Also, I really do think doing ticket locks first is a far more sensible
> > step.
> NACK by Anup

Who's he when he's not sending NAKs ?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

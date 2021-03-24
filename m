Return-Path: <SRS0=4Q7i=IW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F7FC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Mar 2021 12:38:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E25EC61A09
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Mar 2021 12:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E25EC61A09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sMN5pTwEyKE1p/sg7u5an9hPJhW5GkdcEK1Tn92NEA0=; b=SKhKo/8HhXdkcuUWxc7Cugw0j
	qV97UAKviArtd1p9hgi5jMlbFAqbu4oG1TzGe03n/EleBX3LVsxNWACn7lk2Mx0xud8BDee4VdNCg
	WYcG5Ka5fmfSNlz6LOvhwWFv1OYs9wPKXAoYWABKnVBxH74/hwrFqRBdZsFgBmwzK9uxWDHUR5kXp
	93J/qsN5JCcsBSvOD3+LePEwj5KO754RUNj5b3bsFab3zk1jXBx7XETg2ibnMAsHX2EKAvyN4Mt0J
	ylAzylffO5io4HEWFFY1WvejKgPge6N/AhTBBiEJ+egfTV4+7iAwtNp5DZnWjkJKZ5TGW3naQUao1
	FCGDklcMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP2mD-00H6fg-MJ; Wed, 24 Mar 2021 12:38:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP2mA-00H6fI-ES
 for linux-riscv@desiato.infradead.org; Wed, 24 Mar 2021 12:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RrFr490dFRvD+R99oCaLdve7Nm3IkFIKrRyx/bsnPjw=; b=pCjx6OdE08VvbOSiDs5kXJYRfY
 lb6q5yV7oK21uCsJurgbts409+Y33BBPfIzSDl0cPL44qmR68W42PFq2xBQ0qGwVBugETmOVyaeot
 w1eswJnqfkAWVwstGiKCTAVFlNDVrkleJvnT+XxAU5SsNRpEGhEzIIQ7A4599wb8UzDRMpkgdU1IG
 AvWhv6UX1oD5IfuJZcBJk8R6ygN/zKr6YrqUgE+Uulzlozczzma83KFb7/s7Vi/mO81BfGLItSqux
 DI9uia8RCVxcbJr4sI09MAhA8ZTK1v/saDTRqlhCiK/sSHYl67RXk3MXvixORZZXJ+bQBVH1AedNa
 67chedKA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lP2lY-00BLAE-Vp; Wed, 24 Mar 2021 12:37:45 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 60B6B301A7A;
 Wed, 24 Mar 2021 13:37:40 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 4473E2BF5B73E; Wed, 24 Mar 2021 13:37:40 +0100 (CET)
Date: Wed, 24 Mar 2021 13:37:40 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Anup Patel <anup@brainfault.org>
Cc: Guo Ren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
Message-ID: <YFsylL7cJqVtVqBI@hirez.programming.kicks-ass.net>
References: <1616580892-80815-1-git-send-email-guoren@kernel.org>
 <CAAhSdy2FPHX7Mhg5bRUOTk8SAw+jfWxhKquGZpC6YD0MPLSu0A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy2FPHX7Mhg5bRUOTk8SAw+jfWxhKquGZpC6YD0MPLSu0A@mail.gmail.com>
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

On Wed, Mar 24, 2021 at 05:58:58PM +0530, Anup Patel wrote:
> On Wed, Mar 24, 2021 at 3:45 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > This patch introduces a ticket lock implementation for riscv, along the
> > same lines as the implementation for arch/arm & arch/csky.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will.deacon@arm.com>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/riscv/Kconfig                      |   1 +
> >  arch/riscv/include/asm/Kbuild           |   1 +
> >  arch/riscv/include/asm/spinlock.h       | 158 ++++++++++++--------------------
> >  arch/riscv/include/asm/spinlock_types.h |  19 ++--
> 
> NACK from myside.
> 
> Linux ARM64 has moved away from ticket spinlock to qspinlock.
> 
> We should directly go for qspinlock.

I think it is a sensible intermediate step, even if you want to go
qspinlock. Ticket locks are more or less trivial and get you fairness
and all that goodness without the mind bending complexity of qspinlock.

Once you have the ticket lock implementation solid (and qrwlock) and
everything, *then* start to carefully look at qspinlock.

Now, arguably arm64 did the heavy lifting of making qspinlock good on
weak architectures, but if you want to do it right, you still have to
analyze the whole thing for your own architecture.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

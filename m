Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBC6C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 16:28:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC85C613A0
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 16:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC85C613A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iIpNA+nt2ca7Ptpf2q7IjKFn9tAJw9TAjaYaDwEd3xo=; b=YZg//nsXDs2bd3
	+TtooZt4TyTlgNGMLFTshg1gIHuTmWde/ALh0rjA2DKIB5bfD2S40XqMNx93WSATtzWEOtiRM2j1f
	Pcq+OoTDAxI2Yl2DjHJbhCgAeWttc9NtoNBTS9u/R5XI6OCutrnAbP383ScDdtRhxiiJMFPrZ0Ull
	vi4IQM2LMkowA4O5ed9xzFod+P7fVbB88NGmbQTV4K3qnFj34o0VJRs1RmDiQxhLaQAsboJnA7NDn
	ZMSoxfbUXpY25YGu7pnUQYRl5di4Ykoyze2PXkMQFdpU4N93P4Mc550kNukESqCeFPJFkjggWCvA7
	hW6fBmDQ4kKlKpfnHxdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdavf-008MGf-Cd; Thu, 21 Oct 2021 16:28:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdave-008MF9-9T
 for linux-riscv@bombadil.infradead.org; Thu, 21 Oct 2021 16:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=izKpVidBKcjnuLaiC7PERWVHstuq6Xy5Uk1RXaoEYd4=; b=ZW3xZCE93YXUSeTAcEhUjrHvHw
 hFeyYDKiEVFap0+KcMXtDnAbFi7LkUuTEGhmT3j/jZUpMtvfvDI2lgUYR4ULyKLva7itVMXCVknie
 +ng3U3WeyQ0nzO1qwkGpnjDLqb4TQjn/iYRS6XB305+9Uj+BNiokI2WB56S8y8k+SzidOyW0Xl2J5
 wm3QMZt49rvCVE8eLXrd68VFkIYNB7A3kt/vCNqNjBzDtJlTkJ+cjPMO1qcIPPlqQZjp9WeaWN7DZ
 y4wCsMKvn8FPNDIge/oHmXE+ehL+H6YBVxF9fQRLZy5DpGiZ/5npcgybpjDHvqrb/dpbz+3k1qYk4
 wnvzD2DA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdavY-00BMwz-1W; Thu, 21 Oct 2021 16:28:26 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id ABD5030024D;
 Thu, 21 Oct 2021 18:28:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 93CC92C2287A1; Thu, 21 Oct 2021 18:28:22 +0200 (CEST)
Date: Thu, 21 Oct 2021 18:28:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Waiman Long <longman@redhat.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>,
 Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH] locking: Generic ticket lock
Message-ID: <YXGVJinHk3cOVyOw@hirez.programming.kicks-ass.net>
References: <YXFli3mzMishRpEq@hirez.programming.kicks-ass.net>
 <CAK8P3a2+=9jjyqN5dMOb4+bYJy=q5G3CxFaCW+=4xryz-S=zYA@mail.gmail.com>
 <YXGD5OFbI7TEDFTr@hirez.programming.kicks-ass.net>
 <CAK8P3a14NUvo40GFY5DfQcF28OO22=BiHJO1TzBTEMK0RAwtHg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a14NUvo40GFY5DfQcF28OO22=BiHJO1TzBTEMK0RAwtHg@mail.gmail.com>
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

On Thu, Oct 21, 2021 at 05:31:51PM +0200, Arnd Bergmann wrote:
> On Thu, Oct 21, 2021 at 5:14 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > On Thu, Oct 21, 2021 at 03:49:51PM +0200, Arnd Bergmann wrote:
> > I think for a load-store arch this thing should generate pretty close to
> > optimal code. x86 can do ticket_unlock() slightly better using a single
> > INCW (or ADDW 1) on the owner subword, where this implementation will to
> > separate load-add-store instructions.
> >
> > If that is actually measurable is something else entirely.
> 
> Ok, so I guess such an architecture could take the generic implementation
> and override just arch_spin_unlock() or just arch_spin_lock(), if that
> makes a difference for them.

Also, Pre EV5 Dec Alpha might have issues since it can only do 32bit
wide accesses, and it would need an ll/sc to unlock.

But yes, if/when needed we could allow overrides.

> Should we perhaps turn your modified openrisc asm/spinlock.h
> and asm/spin_lock_types.h the fallback in asm-generic, and
> remove the ones for the architectures that have no overrides
> at all?

Possibly, yes.

> > If your SMP arch is halfway sane (no fwd progress issues etc..) then
> > ticket should behave well and avoid the starvation/variablilty of TaS
> > lock.
> 
> Ok, and I guess we still need to keep the parisc and sparc32 versions
> anyway.

Yes, both those only have an xchg() (like) instruction and can
realistically only implement TaS locks and have to build everything else
on top of that... if only we could get rid of all that :-)

> > The big exception there is virtualized architectures, ticket is
> > absolutely horrendous for 'guests' (any fair lock is for that matter).
> 
> This might be useful information to put into the header, at least
> I had no idea about this distinction.

Yes indeed, I'd not thought of it until you asked.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

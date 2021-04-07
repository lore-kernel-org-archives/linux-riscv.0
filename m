Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C49C433B4
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 12:02:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AF8161074
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 12:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AF8161074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PQ1PKiU4gBT7QO0Y/48KjluCEKocBPUCaUI+sRA1+6k=; b=j23D9ghjXjlztm5rYIAUwDKr7
	fWTWQX9xKJiadGPNoW9JTsCrvb/V4vtxwyEknE5PeDG7Dje0to0TUsr+RjoiTIYA28meS+f+ctd7n
	f5ElqQttq8Xz1iGjTb9rtkbYQajeSOfHmEmCsGctXW4UUoStKyKAbQ4Wcrmk66lYPfD9k2deh/l23
	xTT2ExIwH/zPCrUuXhRDt2bnkpLsyQq+5yrlUpOFc+UWRsFD5E73FDwJwYg0/JxKNro5ScbX35Eaw
	HMcvh9x3i1b5p0Z26iPF88ofAoK+bySp/6oC8IdEurKJPrHwIQC7r46p7pTGf1b50WTSnXCGELOVq
	iVAN4ucvg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU6sy-004vyV-3u; Wed, 07 Apr 2021 12:02:17 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lU6su-004vyE-Ks; Wed, 07 Apr 2021 12:02:14 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 225723001FB;
 Wed,  7 Apr 2021 14:02:12 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 082A523D3AF84; Wed,  7 Apr 2021 14:02:12 +0200 (CEST)
Date: Wed, 7 Apr 2021 14:02:11 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stafford Horne <shorne@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <YG2fQ1tGDIMhyIHe@hirez.programming.kicks-ass.net>
References: <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
 <YGNNCEAMSWbBU+hd@hirez.programming.kicks-ass.net>
 <20210330223514.GE1171117@lianli.shorne-pla.net>
 <CAK8P3a0hj2pYr-CuNJkjO==RafZ=J+6kCo4HTWEwvvRXPcngJA@mail.gmail.com>
 <CAJF2gTRxPMURTE3M5WMQ_0q1yZ6K8nraGsFjGLUmpG9nYS_hng@mail.gmail.com>
 <20210406085626.GE3288043@lianli.shorne-pla.net>
 <CAK8P3a3Pf3TbGoVP7JP7gfPV-WDM8MHV_hdqSwNKKFDr1Sb3zQ@mail.gmail.com>
 <YG2ZTSFMGrikYWuL@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YG2ZTSFMGrikYWuL@hirez.programming.kicks-ass.net>
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

On Wed, Apr 07, 2021 at 01:36:45PM +0200, Peter Zijlstra wrote:
> On Wed, Apr 07, 2021 at 10:42:50AM +0200, Arnd Bergmann wrote:
> > Since there are really only a handful of instances in the kernel
> > that use the cmpxchg() or xchg() on u8/u16 variables, it would seem
> > best to just disallow those completely 
> 
> Not going to happen. xchg16 is optimal for qspinlock and if we replace
> that with a cmpxchg loop on x86 we're regressing.
> 
> > Interestingly, the s390 version using __sync_val_compare_and_swap()
> > seems to produce nice output on all architectures that have atomic
> > instructions, with any supported compiler, to the point where I think
> > we could just use that to replace most of the inline-asm versions except
> > for arm64:
> > 
> > #define cmpxchg(ptr, o, n)                                              \
> > ({                                                                      \
> >         __typeof__(*(ptr)) __o = (o);                                   \
> >         __typeof__(*(ptr)) __n = (n);                                   \
> >         (__typeof__(*(ptr))) __sync_val_compare_and_swap((ptr),__o,__n);\
> > })
> 
> It generates the LL/SC loop, but doesn't do sensible optimizations when
> it's again used in a loop itself. That is, it generates a loop of a
> loop, just like what you'd expect, which is sub-optimal for LL/SC.
> 
> > Not how gcc's acquire/release behavior of __sync_val_compare_and_swap()
> > relates to what the kernel wants here.
> > 
> > The gcc documentation also recommends using the standard
> > __atomic_compare_exchange_n() builtin instead, which would allow
> > constructing release/acquire/relaxed versions as well, but I could not
> > get it to produce equally good output. (possibly I was using it wrong)
> 
> I'm scared to death of the C11 crap, the compiler will 'optimize' them
> when it feels like it and use the C11 memory model rules for it, which
> are not compatible with the kernel rules.
> 
> But the same thing applies, it won't do the right thing for composites.

See the mess it makes:

https://godbolt.org/z/r7d13d4Kf

That should've been something like:


__xadd:
	mov r3, r0
	dmb ish
.L1:
	ldrex r0, [r3]
	adds r1, r0
	strex ip, r0, [r3]
	cmp ip, #0
	bne .L1
	dmb ish


Which I'll argue has stronger guarantees than the double loop. I'm
pretty sure branches can release the lock on some archs (Alpha is known
to do this).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

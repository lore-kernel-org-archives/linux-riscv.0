Return-Path: <SRS0=4Q7i=IW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AC2C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Mar 2021 12:54:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC21E61A09
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Mar 2021 12:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC21E61A09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vjNOljBs4ddSOGx13x/oH26jbjLBtvmOHJXjSR5W1iQ=; b=APgNEidPk8WCAVzgUimYYLfnW
	NHjZZUEdMgVqSq34UzbT/2fUHn//fieiEnIGFZphjREzcqyEF8pPd9/MgVu9fpyg0M1u0NZke2VMK
	GVN54Kq82P9nUOhc0ZwocCuNimEMmZnPaI5e9w67L6t2MEWWmod2zqGrUe5RFUo3kkEeYxaxqoIun
	Ei1B/aM2gVgkdu/y3f3pOeVK9pYpAOO1cbIm2Ycb4y4tXUF4O0/kEmMyStaTgx8/qDYPZ5Fv+Rakd
	kOQwGNBMJXpMlTT72JakD+4fg+OTrKPffw+Os5mZn639LimGx5y/mw3csFuHnLnaZKWjRUPvu0Xxt
	nYCvg5c9A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP31V-00H7U2-Lv; Wed, 24 Mar 2021 12:54:09 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP31P-00H7Td-VU
 for linux-riscv@lists.infradead.org; Wed, 24 Mar 2021 12:54:05 +0000
Received: by mail-lf1-x136.google.com with SMTP id 75so31762619lfa.2
 for <linux-riscv@lists.infradead.org>; Wed, 24 Mar 2021 05:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0x8/eOR8jBnzEM8stTetLIzcLMcnZLJokgA4zekf+j0=;
 b=IUsdx7gTHzToc2R8nVOw084aJxUAVpPQdGLRVFk3aSkpDZRQUSJ7a/f9KkLbM81RWy
 ceXojVRk5jfbOgZI4gNUC5KLnSkNaKvNLPG9EsNqDPkvoSkgbIyfJnCjCaciZyj0b7C8
 DHGsVCyQPXK+pMNgaJy2znETUe1ALYjz1yzJ+WCyiWjjqCx9tteYZREiYyBVMnLM7wP6
 HfAJrFlJe2QBlLD9FT+d5es32brgS9c5cY8ZUkfU6St8WIfre30ui1IRi0K1RYdxHBGC
 xl99QutYbN0T7beWSQ+/NZCv+1oLh9FOfwsokyVxcNNr7p6t54wtrrSB16IRoc8etrbi
 Ibew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0x8/eOR8jBnzEM8stTetLIzcLMcnZLJokgA4zekf+j0=;
 b=HyVQVWQSP951ebv7jCzrsShTpocoI2utmeXt9kCKEwBMiKd/d8JwyrKJdmsbKB1c49
 fsgS5S4R2Gy6sigb1IvNsKOaXyCJeyF7QyFjRlAIHiO+J6QbIzskiPtXSHyZzCXpvmp4
 aQ9YqJmCRKmfplK9Wr6GRp/eBR7FPrqs2LOcvPjnMoCAJREQ6Zn8K/UzE6H7K0GI+zlj
 U2aFbX5XKDpdV8wkwx7w3ybhADZpJJF8UnbC3GIs6ZeKioPY9xtwbPB0fPqUhafceFz3
 WOoSxbhpCTCC0C+T456ivp8pJojLzB8J+aA8XUTfLrAUOchY7JrBqKhR5PnXc/A1U/l2
 1ZDQ==
X-Gm-Message-State: AOAM532ARkvjEH/mirnaz01u4/4Wm5VZ2Joz6H8eypjmJmZK8BLSlkJz
 dr3g0BtgHvWEXDz0AH0C6Q+MnqnE6Lm7MgMvmFZnyw==
X-Google-Smtp-Source: ABdhPJw3zXWj17ytjGUcJXrPBhqSrf/SVUB//Qqzw55UnOxrq3HR3/eH04quGqhpPfVKlJ6pV8HKE+t1UT6KCYmskaE=
X-Received: by 2002:ac2:50d0:: with SMTP id h16mr1917793lfm.369.1616590443029; 
 Wed, 24 Mar 2021 05:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <1616580892-80815-1-git-send-email-guoren@kernel.org>
 <CAAhSdy2FPHX7Mhg5bRUOTk8SAw+jfWxhKquGZpC6YD0MPLSu0A@mail.gmail.com>
 <YFsylL7cJqVtVqBI@hirez.programming.kicks-ass.net>
In-Reply-To: <YFsylL7cJqVtVqBI@hirez.programming.kicks-ass.net>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 24 Mar 2021 18:23:51 +0530
Message-ID: <CAAhSdy1JHLUFwu7RuCaQ+RUWRBks2KsDva7EpRt8--4ZfofSUQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
To: Peter Zijlstra <peterz@infradead.org>
Cc: Guo Ren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_125404_176169_EC99915B 
X-CRM114-Status: GOOD (  23.16  )
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

On Wed, Mar 24, 2021 at 6:08 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Mar 24, 2021 at 05:58:58PM +0530, Anup Patel wrote:
> > On Wed, Mar 24, 2021 at 3:45 PM <guoren@kernel.org> wrote:
> > >
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > This patch introduces a ticket lock implementation for riscv, along the
> > > same lines as the implementation for arch/arm & arch/csky.
> > >
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: Will Deacon <will.deacon@arm.com>
> > > Cc: Peter Zijlstra <peterz@infradead.org>
> > > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > > Cc: Anup Patel <anup@brainfault.org>
> > > Cc: Arnd Bergmann <arnd@arndb.de>
> > > ---
> > >  arch/riscv/Kconfig                      |   1 +
> > >  arch/riscv/include/asm/Kbuild           |   1 +
> > >  arch/riscv/include/asm/spinlock.h       | 158 ++++++++++++--------------------
> > >  arch/riscv/include/asm/spinlock_types.h |  19 ++--
> >
> > NACK from myside.
> >
> > Linux ARM64 has moved away from ticket spinlock to qspinlock.
> >
> > We should directly go for qspinlock.
>
> I think it is a sensible intermediate step, even if you want to go
> qspinlock. Ticket locks are more or less trivial and get you fairness
> and all that goodness without the mind bending complexity of qspinlock.
>
> Once you have the ticket lock implementation solid (and qrwlock) and
> everything, *then* start to carefully look at qspinlock.

I do understand qspinlock are relatively complex but the best thing
about qspinlock is it tries to ensure each CPU spins on it's own location.

Instead of adding ticket spinlock now and later replacing it with qspinlock,
it is better to straight away explore qspinlock hence my NACK.

>
> Now, arguably arm64 did the heavy lifting of making qspinlock good on
> weak architectures, but if you want to do it right, you still have to
> analyze the whole thing for your own architecture.

Most of the RISC-V implementations are weak memory ordering so it
makes more sense to explore qspinlock first.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

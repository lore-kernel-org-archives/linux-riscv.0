Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AADCC433ED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 03:51:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D197C613AE
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 03:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D197C613AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fFvIpD9s0MsE7mMzErQG7jWaH06lixrXzEqbUFX/M/o=; b=lhoSVWPLqX7OPxueUmFL812cy
	ViA7mrV+pxScnrhSG9RWkCgzi1EHSp2ix0YywYQRKoaaPpRjJ+Dh/GwtDpXbLQXO7GdH/9c/Bllzt
	6hlwCUILzpTaqRxE9ZbdNWozxwmA/xdfLSx3upmLlUUyxBR3+2QNb4wx1uMcwIrLE9ZiioL1ZmbKu
	HSuu0/O8FPDMAdomFO2AtOY2ANFT9lOC0YWj+vsX5ETKNPkX+kp3FzeZjpjPgL3HSkvgwFVjxauvY
	R1BezosFps5Af8zViWSw2s/4vLLdaNm+nWQ62Z6uHFK+KIZwlMWFDNX8VjG5iJh2O4qw7h2pwgt3N
	df1+gVhgg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTcjz-001O1p-BE; Tue, 06 Apr 2021 03:50:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTcjt-001O16-Oe
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 03:50:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDC1D613BE
 for <linux-riscv@lists.infradead.org>; Tue,  6 Apr 2021 03:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617681052;
 bh=szRR4JcrQICDR26E7y2EmbZ8ojtgg1rHPlcrE0/d3ls=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Xh7LyhlX8SgYtaHo207MEW2YT8a8f1clTe8y0Yi2E7VuF9cUTfe3JNTF/XGwPyFR1
 7J0Gpiyo8cIbAloHohpmQUYB4YgDXxaKIbx9OdCUDVq2Mfr7ffFqOl5g2SeEDwbRJp
 kjeZVx00J+1BGWp5Uu85JuFeWRfHJDIk+Y9CTprTvQJ9+wtB9KeZgyeXFLxGYq+9UD
 oUYNEKYxSHPACshu3nkz63R73hwAtR4zoTEqdh2ulp7EwSnwEN/5VZNrTZIXtGpeHz
 C6yA+io5tq4xzb/4cKCGwLiVQjlYVXb7m29lq4j4/n9F1YwCFYKJZyxY5au3/vHiU6
 Uz++RocqdA5lQ==
Received: by mail-lf1-f54.google.com with SMTP id w28so20464238lfn.2
 for <linux-riscv@lists.infradead.org>; Mon, 05 Apr 2021 20:50:51 -0700 (PDT)
X-Gm-Message-State: AOAM532WHTGlaufdWLxUw3nHqSJLM16I7czzLwaiVHH548ucGVEiXHmM
 FyW9TQjbCTPE9v+2dVajGasCsiGm8DsuIfxTU3E=
X-Google-Smtp-Source: ABdhPJxz7vekhbYxQi/US2gfIUiFffiADC+caHLoxoXMbnk8SvvFWk5EFQrEYzPpfuBRSNV+B6LNPvDCyqdYyVLCZPM=
X-Received: by 2002:a19:f501:: with SMTP id j1mr20502473lfb.231.1617681050232; 
 Mon, 05 Apr 2021 20:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
 <YGNNCEAMSWbBU+hd@hirez.programming.kicks-ass.net>
 <20210330223514.GE1171117@lianli.shorne-pla.net>
 <CAK8P3a0hj2pYr-CuNJkjO==RafZ=J+6kCo4HTWEwvvRXPcngJA@mail.gmail.com>
In-Reply-To: <CAK8P3a0hj2pYr-CuNJkjO==RafZ=J+6kCo4HTWEwvvRXPcngJA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 6 Apr 2021 11:50:38 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRxPMURTE3M5WMQ_0q1yZ6K8nraGsFjGLUmpG9nYS_hng@mail.gmail.com>
Message-ID: <CAJF2gTRxPMURTE3M5WMQ_0q1yZ6K8nraGsFjGLUmpG9nYS_hng@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stafford Horne <shorne@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_045054_443825_4480D115 
X-CRM114-Status: GOOD (  20.08  )
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

On Wed, Mar 31, 2021 at 3:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Mar 31, 2021 at 12:35 AM Stafford Horne <shorne@gmail.com> wrote:
> >
> > I just want to chime in here, there may be a better spot in the thread to
> > mention this but, for OpenRISC I did implement some generic 8/16-bit xchg code
> > which I have on my todo list somwhere to replace the other generic
> > implementations like that in mips.
> >
> >   arch/openrisc/include/asm/cmpxchg.h
> >
> > The idea would be that architectures just implement these methods:
> >
> >   long cmpxchg_u32(*ptr,old,new)
> >   long xchg_u32(*ptr,val)
> >
> > Then the rest of the generic header would implement cmpxchg.
>
> I like the idea of generalizing it a little further. I'd suggest staying a
> little closer to the existing naming here though, as we already have
> cmpxchg() for the type-agnostic version, and cmpxchg64() for the
> fixed-length 64-bit version.
>
> I think a nice interface between architecture-specific and architecture
> independent code would be to have architectures provide
> arch_cmpxchg32()/arch_xchg32() as the most basic version, as well
> as arch_cmpxchg8()/arch_cmpxchg16()/arch_xchg8()/arch_xchg16()
> if they have instructions for those.
>
> The common code can then build cmpxchg16()/xchg16() on top of
> either the 16-bit or the 32-bit primitives, and build the cmpxchg()/xchg()
> wrapper around those (or alternatively we can decide to have them
> only deal with fixed-32-bit and long/pointer sized atomics).
I think these emulation codes are suitable for some architectures but not riscv.

We shouldn't export xchg16/cmpxchg16(emulated by lr.w/sc.w) in riscv,
We should forbid these sub-word atomic primitive and lets the
programmers consider their atomic design.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

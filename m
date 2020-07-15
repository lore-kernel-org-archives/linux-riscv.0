Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86726C433E7
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 14:48:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5790320658
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 14:48:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LqXm9ILk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="LmX9hblC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5790320658
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6fqzHAeNLeVZ6vFMMaN/SD2Rm9FbFlBCuOvEMHxfPQ8=; b=LqXm9ILkoDtgJ1sJ/aEEWkZfv
	OI7pqO0c6kStiTQm1V5JFeQcp8+mdQeDMCulLRO5ynxtCoJ77huucamR1secMTBunvUIGxL0k/nLX
	yNesbUgE+3aRHa5lttSzZAHIq0sqVvpuJZgC0ZWUpwm8ab/MF5CJC5hKxJNDZNKzcZqvA2UEoMwac
	PWqcHFTlQ9hwO+tlXnJVkfYEcYfREv2UeybJHXjTNK8u/5wDH1toQgFGF/Q7DNCZPLjbbPq9PJEeS
	qdQwPHlNP99SfH6dPLxCZhR3HhYSxa4jo4ld4hg5nukqmC3W+BSQk0giUG3tgvAjE7PYTbTx4JMRr
	Z7c17Ndnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvihg-0004KJ-8j; Wed, 15 Jul 2020 14:48:12 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvihd-0004Jk-Uu
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 14:48:10 +0000
Received: by mail-wm1-x343.google.com with SMTP id g10so3629366wmc.1
 for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2020 07:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZyFp2ZwNj27+Pm86N/oRm7EnGf00LSdqUmM2ahChaug=;
 b=LmX9hblCupQDIq8vRiIIJVKj9lrmYJye5uhwLazH2TUdoBf7KfeGipdNZK113XcKLp
 XSTmwIlzx0ljbwXHgC7z+FNQ8DTmxDLQogDyadpNmrt71emc3K+JE+440kVnDf8cDFXK
 4dtJoB+Tk658icw9fAYxk40RWrjvp71wyE55uxvMej1bLo4ZBA6k74EIZBPJ0P1wg9Pv
 TCBoDfBBs+/WkCgyyCZ1BaVNBakmTmUDarTt07osC2iZ4M61S/BYVy0eKt1k9pGsz+92
 vSAUH0qcuhecpH/+puTsXR/un3IvScQE8KqFLdF9VPjq4khYNjyd8s6QpTgLwdTUNLDa
 btTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZyFp2ZwNj27+Pm86N/oRm7EnGf00LSdqUmM2ahChaug=;
 b=HaStLrVCvqmXodkD5oNzxcCphGyMi6bgXeHmMxDugpK1c5T/vijhZ85AGL2Odr/uNI
 IJp5ZFRCObiSFqCY5OJi1R58Dsre31OoVeDPLttNZOj2auHogNt3obrkFKZov+lzZDRR
 Y09+vCaSkXJeDLSLGrSP9KswrCyIIm1rMy2NAkrv5fpF//RWOCrB9j8BOeuYKRsDEMIm
 /LR52a3R0CYWJCFnWlfUJCA5OFhhKveQ7IxewT8A/TqdQ2Q4Juzt1cSOD70gMsYwJ4eH
 JqS2FWd5IZFQi1OfLRbsSHj1wm5SdDaGm9leSJKxDvQrb3Mw7BzeE5d7CTUDEYgmklzJ
 GOQQ==
X-Gm-Message-State: AOAM5330VxC1NnOReu5Tn2dViQx80FVwZ/ixIflhEx1fZuC20/32DBFl
 9A0wP/DNCEKVcNcdeApD5UtxNQ==
X-Google-Smtp-Source: ABdhPJwp1OCWItGy798FROjyLWVrh5ZNFOkjVWpcV143keOkgdHsNPw7qCTTCoDn7ukNUC/TnkOXgA==
X-Received: by 2002:a7b:cc85:: with SMTP id p5mr8828226wma.18.1594824488859;
 Wed, 15 Jul 2020 07:48:08 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:f693:9fff:fef4:a833])
 by smtp.gmail.com with ESMTPSA id 129sm3823702wmd.48.2020.07.15.07.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 07:48:08 -0700 (PDT)
Date: Wed, 15 Jul 2020 15:48:06 +0100
From: Will Deacon <willdeacon@google.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] asm-generic/mmiowb: Get cpu in mmiowb_set_pending
Message-ID: <20200715144806.GA3443108@google.com>
References: <20200715104246.GA3143299@google.com>
 <mhng-4a6c3dd9-b035-49c8-9e92-e881c0d1027c@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-4a6c3dd9-b035-49c8-9e92-e881c0d1027c@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_104810_036822_2E78766F 
X-CRM114-Status: GOOD (  37.19  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, kernel@esmil.dk, Arnd Bergmann <arnd@arndb.de>,
 guoren@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 15, 2020 at 07:03:49AM -0700, Palmer Dabbelt wrote:
> On Wed, 15 Jul 2020 03:42:46 PDT (-0700), Will Deacon wrote:
> > Hmm. Although I _think_ something like the diff below ought to work, are you
> > sure you want to be doing MMIO writes in preemptible context? Setting
> > '.disable_locking = true' in 'sifive_gpio_regmap_config' implies to me that
> > you should be handling the locking within the driver itself, and all the
> > other regmap writes are protected by '&gc->bgpio_lock'.
> 
> I guess my goal here was to avoid fixing the drivers: it's one thing if it's
> just broken SiFive drivers, as they're all a bit crusty, but this is blowing up
> for me in the 8250 driver on QEMU as well.  At that point I figured there'd be
> an endless stream of bugs around this and I'd rather just.

Right, and my patch should solve that.

> > Given that riscv is one of the few architectures needing an implementation
> > of mmiowb(), doing MMIO in a preemptible section seems especially dangerous
> > as you have no way to ensure completion of the writes without adding an
> > mmiowb() to the CPU migration path (i.e. context switch).
> 
> I was going to just stick one in our context switching code unconditionally.
> While we could go track cumulative writes outside the locks, the mmiowb is
> essentially free for us because the one RISC-V implementation treats all fences
> the same way so the subsequent store_release would hold all this up anyway.
> 
> I think the right thing to do is to add some sort of arch hook right about here
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index cfd71d61aa3c..14b4f8b7433f 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3212,6 +3212,7 @@ static struct rq *finish_task_switch(struct task_struct *prev)
> 	prev_state = prev->state;
> 	vtime_task_switch(prev);
> 	perf_event_task_sched_in(prev, current);
> +	finish_arch_pre_release(prev);
> 	finish_task(prev);
> 	finish_lock_switch(rq);
> 	finish_arch_post_lock_switch();
> 
> but I was just going to stick it in switch_to for now... :).  I guess we could
> also roll the fence up into yet another one-off primitive for the scheduler,
> something like

What does the above get you over switch_to()?

> > diff --git a/include/asm-generic/mmiowb.h b/include/asm-generic/mmiowb.h
> > index 9439ff037b2d..5698fca3bf56 100644
> > --- a/include/asm-generic/mmiowb.h
> > +++ b/include/asm-generic/mmiowb.h
> > @@ -27,7 +27,7 @@
> >  #include <asm/smp.h>
> > 
> >  DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
> > -#define __mmiowb_state()       this_cpu_ptr(&__mmiowb_state)
> > +#define __mmiowb_state()       raw_cpu_ptr(&__mmiowb_state)
> >  #else
> >  #define __mmiowb_state()       arch_mmiowb_state()
> >  #endif /* arch_mmiowb_state */
> > @@ -35,7 +35,9 @@ DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
> >  static inline void mmiowb_set_pending(void)
> >  {
> >         struct mmiowb_state *ms = __mmiowb_state();
> > -       ms->mmiowb_pending = ms->nesting_count;
> > +
> > +       if (likely(ms->nesting_count))
> > +               ms->mmiowb_pending = ms->nesting_count;
> 
> Ya, that's one of the earlier ideas I had, but I decided it doesn't actually do
> anything: if we're scheduleable then we know that pending and count are zero,
> thus the check isn't necessary.  It made sense late last night and still does
> this morning, but I haven't had my coffee yet.

What it does is prevent preemptible writeX() from trashing the state on
another CPU, so I think it's a valid fix. I agree that it doesn't help
you if you need mmiowb(), but then that _really_ should only be needed if
you're holding a spinlock. If you're doing concurrent lockless MMIO you
deserve all the pain you get.

I don't get why you think the patch does nothing, as it will operate as
expected if writeX() is called with preemption disabled, which is the common
case.

> I'm kind of tempted to just declare "mmiowb() is fast on RISC-V, so let's do it
> unconditionally everywhere it's necessary".  IIRC that's essentially true on
> the existing implementation, as it'll get rolled up to any upcoming fence
> anyway.  It seems like building any real machine that relies on the orderings
> provided by mmiowb is going to have an infinate rabbit hole of bugs anyway, so
> in that case we'd just rely on the hardware to elide the now unnecessary fences
> so we'd just be throwing static code size at this wacky memory model and then
> forgetting about it.

If you can do that, that's obviously the best approach.

> I'm going to send out a patch set that does all the work I think is necessary
> to avoid fixing up the various drivers, with the accounting code to avoid
> mmiowbs all over our port.  I'm not sure I'm going to like it, but I guess we
> can argue as to exactly how ugly it is :)

Ok.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

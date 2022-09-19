Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A42C54EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 08:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaqAORnO2dQ0COwyx/MIMCUB/PbZYIJxJH3dF/Tel4g=; b=W00vywCFgRf3Ha
	FNr3Nb/nkAhMwO9rhZZwkSaNH+LXjtYofCCOYWvS4D+WqFR73EgNEdvAMs765iRPWA15txV8OfBvQ
	RZHGitos3Nx/vMjY/cQ+vf1HSuzPujkeMH43fJCqlbKpHEKB5Y1Nr6RnNVfxqzCVW28EoeUlV/hm6
	25M+OG7FiAokp1b89/d8rlGMYsI+SlFtrp2eLwNWmRqu79m4ZK2wD8mgMvjiHH58IJhjgATQwLGLv
	tlQvZmnVjpKHwZhxlzFJqFMXmHyYVzop0UAGcd4M+yy0WPLQOtUa2Eq8122J7QjX59RKuzPOKpVbR
	oiQKbYTv+4ab2sHkFtOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCFl-00AAKP-9U; Mon, 19 Sep 2022 08:35:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCFL-00AA0v-Gg
	for linux-riscv@lists.infradead.org; Mon, 19 Sep 2022 08:35:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0E6DB6182A
	for <linux-riscv@lists.infradead.org>; Mon, 19 Sep 2022 08:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE64C43143
	for <linux-riscv@lists.infradead.org>; Mon, 19 Sep 2022 08:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663576517;
	bh=NDnqlZhtaXp4aa68lUPaptwqfteRjFznv1jId6XcsS8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FwYz92tNSMouuBkIr5MB0ikWNhkT/ojXPVaqBFo9x9Qw3AXpQX6EkpNmq951GANP0
	 B3ExHYccC0OeCAXhQJNx/NZEmoIsrh0R7SFhbWr150UmDA5LTSqL6Tt+IJu8SH1OXD
	 Yhf7sBYd1MELMeun3wN9cfGTH0sQa5yCwugRti/T36YHMfV5oFbGSWkixlQfDH578O
	 h2o+cGoqTG2kyd8EPEB4gcrGSbT8Ogq2c8ldeYoB90/RfqO8UPZV9ozspdXOhhG8zy
	 vXQdfurH6njPs1BbzxIxa3r81/RpXmOczYU6+hZiUGYsAceYNwtJJrp9zz2f6WBwCk
	 5wufF9xkOWJTA==
Received: by mail-oi1-f178.google.com with SMTP id m81so12084465oia.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Sep 2022 01:35:17 -0700 (PDT)
X-Gm-Message-State: ACgBeo1fo7vooDCkjgSpSjAtcGp+Ewk2j8oRIuWABk7AbvlBr0Ff5G+P
	IRf2nKpS+DOh7f7BG4MAD2rE0DIVz756+aREBHo=
X-Google-Smtp-Source: AA6agR5ITfiPWZ9F9F5lkDqO0GA/3OeLcDmqgx/nf0vJ/sBZgtsKJFlK/BPu0y1OEMjk0otXRqR3awY0W+PQUuOvZvM=
X-Received: by 2002:a05:6808:201f:b0:34f:9fdf:dbbf with SMTP id
 q31-20020a056808201f00b0034f9fdfdbbfmr11418144oiw.19.1663576516813; Mon, 19
 Sep 2022 01:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220908022506.1275799-1-guoren@kernel.org> <20220908022506.1275799-9-guoren@kernel.org>
 <4babce64-e96d-454c-aa35-243b3f2dc315@www.fastmail.com> <CAJF2gTQAMCjNyqrSOvqDAKR5Z-PZiTVxmoK9cvNAVQs+k2fZBg@mail.gmail.com>
 <8817af55-de0d-4e8f-a41b-25d01d5fa968@www.fastmail.com>
In-Reply-To: <8817af55-de0d-4e8f-a41b-25d01d5fa968@www.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 19 Sep 2022 16:35:04 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRoKfJ25brnA=_CqNw9DPt8XKhcyNzmCbD6wX1q-jiR1w@mail.gmail.com>
Message-ID: <CAJF2gTRoKfJ25brnA=_CqNw9DPt8XKhcyNzmCbD6wX1q-jiR1w@mail.gmail.com>
Subject: Re: [PATCH V4 8/8] riscv: Add config of thread stack size
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Jisheng Zhang <jszhang@kernel.org>, lazyparser@gmail.com, falcon@tinylab.org, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Linux-Arch <linux-arch@vger.kernel.org>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>, Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_013519_668810_2C941B29 
X-CRM114-Status: GOOD (  27.45  )
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

On Sun, Sep 11, 2022 at 12:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Sep 10, 2022, at 2:52 PM, Guo Ren wrote:
> > On Thu, Sep 8, 2022 at 3:37 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >> On Thu, Sep 8, 2022, at 4:25 AM, guoren@kernel.org wrote:
> >> > From: Guo Ren <guoren@linux.alibaba.com>
> >> - When VMAP_STACK is set, make it possible to select non-power-of-two
> >>   stack sizes. Most importantly, 12KB should be a really interesting
> >>   choice as 8KB is probably still not enough for many 64-bit workloads,
> >>   but 16KB is often more than what you need. You probably don't
> >>   want to allow 64BIT/8KB without VMAP_STACK anyway since that just
> >>   makes it really hard to debug, so hiding the option when VMAP_STACK
> >>   is disabled may also be a good idea.
> > I don't want this config to depend on VMAP_STACK. Some D1 chips would
> > run with an 8K stack size and !VMAP_STACK.
>
> That sounds like a really bad idea, why would you want to risk
> using such a small stack without CONFIG_VMAP_STACK?
>
> Are you worried about increased memory usage or something else?
>
> >  /* thread information allocation */
> > -#ifdef CONFIG_64BIT
> > -#define THREAD_SIZE_ORDER      (2 + KASAN_STACK_ORDER)
> > -#else
> > -#define THREAD_SIZE_ORDER      (1 + KASAN_STACK_ORDER)
> > -#endif
> > +#define THREAD_SIZE_ORDER      CONFIG_THREAD_SIZE_ORDER
> >  #define THREAD_SIZE            (PAGE_SIZE << THREAD_SIZE_ORDER)
>
> This doesn't actually allow additional THREAD_SIZE values, as you
> still round up to the nearest power of two.
>
> I think all the non-arch code can deal with non-power-of-2
> sizes, so you'd just need
>
> #define THREAD_SIZE round_up(CONFIG_THREAD_SIZE, PAGE_SIZE)
>
> and fix up the risc-v specific code to do the right thing
> as well. I now see that THREAD_SIZE_ORDER is not actually
> used anywhere with CONFIG_VMAP_STACK, so I suppose that
> definition can be skipped, but you still need a THREAD_ALIGN
> definition that is a power of two and at least a page larger
> than THREAD_SIZE.
Sorry, I missed this part. I would RESEND v5

>
>      Arnd



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

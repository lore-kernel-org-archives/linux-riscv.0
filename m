Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D2FC6FA82
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Sep 2022 01:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eNPeuu7VvRGjF/MpWWKXq5eoT1Xqj3Fg8aytlPBWgc=; b=q7FaWa0XEFlfPI
	cuhkmZ8GONNAY8axNzCy2do+asIoQAxmls743pDdcm8yq3poKqIYaa/aPJNhu42RUHYYiFBlYJFE1
	G3Dfy9PFF5pFg4uYiEqFJKvYAOpAObMbJoABvxkgyJx0fRxE/LGQZmB+vwYOrqn123pXYnW9eRElK
	19nxV35wGh5Z7BVijbvBj24qwiP+VAFrqhPbc8HQEtqENqwbBS4XdVokulo0kvUfDPHebCBmqOEZ1
	ZBLDgSw4NTZ9rc2sJvMeuX5RJ4aSTx3TkiND6v6o6EEaietT96a+XPtuv8EKBz9GiUqdK61qy/aOi
	sQbVwZfxsMEYudOtuS1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXBXs-00F0qs-1W; Sun, 11 Sep 2022 01:14:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXBXp-00F0px-D0
	for linux-riscv@lists.infradead.org; Sun, 11 Sep 2022 01:13:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB94F60EFC
	for <linux-riscv@lists.infradead.org>; Sun, 11 Sep 2022 01:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7D3C4314C
	for <linux-riscv@lists.infradead.org>; Sun, 11 Sep 2022 01:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662858835;
	bh=MeoerLBAPT9yREBhU9oRAJcpZt/hWhuixo7TStbdTjk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tvPWlhbtbekWBecfnQ74hnjTB2kcC5KUKgVBnPXCUYV23W7UT5LogKs9HEbKTC5Co
	 g3QE/DM67eW4RjCYDw0u6uOOH+50DigwNHFExDOtsmQRZEoSeHVmNjemHKJoZ6b5WC
	 mLBB2itN1xC46kD3SbErY/iIaS0O8+1xJOi5wNnEEplOlKuq+Gug1wUVBFUl4WZPaX
	 vF5bG3nwwW7j8goNgh7M8KBR4mix3SOc4H5z9VdgDbqhHeNP+8mBeE70OZrnv3Y4XM
	 dGYQmXotoRQzmKRiltJjhsPat1aL9dD3B70oOy0Kpg/f2/j/6v5wdl1FQipgmjAB/u
	 CXbb2zW56GHxA==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-12803ac8113so14123251fac.8
        for <linux-riscv@lists.infradead.org>; Sat, 10 Sep 2022 18:13:55 -0700 (PDT)
X-Gm-Message-State: ACgBeo3gRmMeIlxIYz8rJajcILhaMJ+/AcvaGq8gXmukWY/NOU2rJl76
	8HVg2egRdBtr18R6tlaHA+IFyKb3zYucNtcDo0k=
X-Google-Smtp-Source: AA6agR4bcGzrnAq5Tqy6Eqx1fM4d1eSVwcSJsOIm24Kg6cAY2vOjkeUWe5EEaM5Rgubow59jC/8cP9IImnLFMMmOgb0=
X-Received: by 2002:a05:6808:2028:b0:344:246d:2bed with SMTP id
 q40-20020a056808202800b00344246d2bedmr6237639oiw.19.1662858834117; Sat, 10
 Sep 2022 18:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220908022506.1275799-1-guoren@kernel.org> <20220908022506.1275799-7-guoren@kernel.org>
 <YxoTdxk772vneG53@linutronix.de> <0ff315c978d24215b00c42df51f51b2d@AcuMS.aculab.com>
In-Reply-To: <0ff315c978d24215b00c42df51f51b2d@AcuMS.aculab.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 11 Sep 2022 09:13:42 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQFwYDtBUpOViYMrWPVKCXJsNwmL9o16jEhpV_v7FjZyA@mail.gmail.com>
Message-ID: <CAJF2gTQFwYDtBUpOViYMrWPVKCXJsNwmL9o16jEhpV_v7FjZyA@mail.gmail.com>
Subject: Re: [PATCH V4 6/8] riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
To: David Laight <David.Laight@aculab.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "arnd@arndb.de" <arnd@arndb.de>, 
	"palmer@rivosinc.com" <palmer@rivosinc.com>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"peterz@infradead.org" <peterz@infradead.org>, "luto@kernel.org" <luto@kernel.org>, 
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>, "heiko@sntech.de" <heiko@sntech.de>, 
	"jszhang@kernel.org" <jszhang@kernel.org>, "lazyparser@gmail.com" <lazyparser@gmail.com>, 
	"falcon@tinylab.org" <falcon@tinylab.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"apatel@ventanamicro.com" <apatel@ventanamicro.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_181357_541784_05BFB913 
X-CRM114-Status: GOOD (  30.73  )
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

On Fri, Sep 9, 2022 at 3:30 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Sebastian Andrzej Siewior
> > Sent: 08 September 2022 17:08
> >
> > On 2022-09-07 22:25:04 [-0400], guoren@kernel.org wrote:
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index a07bb3b73b5b..a8a12b4ba1a9 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -433,6 +433,14 @@ config FPU
> > >
> > >       If you don't know what to do here, say Y.
> > >
> > > +config IRQ_STACKS
> > > +   bool "Independent irq stacks"
> > > +   default y
> > > +   select HAVE_IRQ_EXIT_ON_IRQ_STACK
> > > +   help
> > > +     Add independent irq stacks for percpu to prevent kernel stack overflows.
> > > +     We may save some memory footprint by disabling IRQ_STACKS.
> >
> > Do you really think that it is needed to save memory here? Avoiding
> > stack overflows in deep call chains is probably more important than
> > saving ~8KiB per CPU.
Original riscv is !IRQ_STACKS, I just give a config to make it back.
So I would add a CONFIG_EXPERT in the next version.

Actually, I have a similar opinion to you, IRQ_STACKS should be force
enabled. But as a new feature, we should give users a choice - use or
not.

>
> Particularly if a 64bit build is using small stacks.
>
> Without static analysis of actual call chain depth it is
> really difficult to trim the stack size.
>
> I'd bet (a few beers) that the deepest stack use in inside
> the console print code form a printk() (eg warn_on_once)
> in an obscure error path somewhere.
> This won't be hit during any normal testing.
That means stack overflow would be hidden a lot. But we could enable
VMAP_STACK & STACK_LEAK [1].

[1]: https://lore.kernel.org/lkml/20220907014809.919979-1-guoren@kernel.org/

>
> I think that the analysis objtool does is getting close
> to be able to generate the raw data that can be used for
> static stack depth analysis.
> You need the 'CFI' constants for indirect calls and
> some assumptions about depth of recursive calls.
> But apart from that the code to process the raw output
> isn't that complex.
>
> A nice task for someone with some spare time.
>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

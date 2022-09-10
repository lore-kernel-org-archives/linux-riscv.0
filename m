Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C43C6FA82
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Sep 2022 23:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eGZMUZ9mqNyi9wmsC8aJEgmDxajk5fLkz8SF4hyWpaY=; b=R1hpFkXZsPAYD0
	YkD1lN/W/hbfg57/dAryKanP7FPkR23Ruqc2c06V8E/8JWkKtG4b1cIV8m7ru9eeXCUEDTiTsQD2f
	4is71WuKwHqLX2k0ax+ISdArN2ox1He61duT3O1ey4us9679P9WT8o/EKlTM+yv1bCSLRBt1CadYk
	zymkgzDCM2whduoeDSEbbczvpfgC3zolgQBWccNA6stXHa2/qsUis0FQm0zHl5lCE9mmbjL60uwrl
	iB6A1MmyyHugQmTOhwramZkwG4sbNVXhfYRZspAI9cil7EUrXqKD7Jh7Fq9nyXq4epyyDG5I0jkGk
	afc73lpl5x+9eyQBhyow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXA10-00EQMu-SZ; Sat, 10 Sep 2022 23:35:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXA0x-00EQLW-9L
	for linux-riscv@lists.infradead.org; Sat, 10 Sep 2022 23:35:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 80D1760DF0
	for <linux-riscv@lists.infradead.org>; Sat, 10 Sep 2022 23:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5BA0C433D6
	for <linux-riscv@lists.infradead.org>; Sat, 10 Sep 2022 23:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662852951;
	bh=Jyry0XnrQIPqshqAkfeJHzTrGEg9eXK2L5XeBnmM7CM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OsfSqYt5l9fd4iMfoFsDotSaKztUTUbh3zc6xN1Sg74aXG1SrUTyOsv5rJ3Gn7F+W
	 ugXrsV9/RUnl+gOJfHDYsHODdqipCWQ6u4RbAH0/qozcaEndKW421Er2hfTL35YlGO
	 f8wOWSlg4znvqGeFIPm2fGYKMyieXHhMQwJHQkNsZwerkIvENITqoesUEa1Y/Zy7nt
	 p8MU0ZKFw8CFZI+QPT8WLErdMPXHNc+mP6HVtxEFLpyC45DUyaSslzXCF1VBPn2M34
	 ULdZJK+R4+ZDjYtjGz1tbby/rqv/EooteWgk7CdTcfQg4j05Y852D/HpvYlQVrbHT1
	 pcdOsmdEcboTA==
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1274ec87ad5so13843595fac.0
        for <linux-riscv@lists.infradead.org>; Sat, 10 Sep 2022 16:35:51 -0700 (PDT)
X-Gm-Message-State: ACgBeo1pTQyDq9FaUCZcNE2FVxuSp+GjDuj+c0hKQ9LMzifk27eWWBMh
	uo8/Zlt/iqFt+2h42qr1Xo24PDKzDKRQwyZReZA=
X-Google-Smtp-Source: AA6agR7RtqaOODDWYKkxH5TzeX1qOCOc/G9NUqz5ZalFaE3cf1czgLZCSlqReaiO2M/LgeXi3fx7b5MFvk6FSovIaXs=
X-Received: by 2002:a05:6808:2028:b0:344:246d:2bed with SMTP id
 q40-20020a056808202800b00344246d2bedmr6134101oiw.19.1662852950944; Sat, 10
 Sep 2022 16:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220908022506.1275799-1-guoren@kernel.org> <20220908022506.1275799-9-guoren@kernel.org>
 <4babce64-e96d-454c-aa35-243b3f2dc315@www.fastmail.com> <CAJF2gTQAMCjNyqrSOvqDAKR5Z-PZiTVxmoK9cvNAVQs+k2fZBg@mail.gmail.com>
 <8817af55-de0d-4e8f-a41b-25d01d5fa968@www.fastmail.com>
In-Reply-To: <8817af55-de0d-4e8f-a41b-25d01d5fa968@www.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 11 Sep 2022 07:35:38 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRnY+vc2nKbqubTZvv+FWVgO3yCK4LcwpeNgx51JuETzw@mail.gmail.com>
Message-ID: <CAJF2gTRnY+vc2nKbqubTZvv+FWVgO3yCK4LcwpeNgx51JuETzw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220910_163555_428251_9954A981 
X-CRM114-Status: GOOD (  26.48  )
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
The requirement is from [1], and I think disabling CONFIG_VMAP_STACK
would be the last step after serious testing.

[1] https://www.cnx-software.com/2021/10/25/allwinner-d1s-f133-risc-v-processor-64mb-ddr2/



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
>
>      Arnd



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B596ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 06:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bs+OHtycZcRHBbcEMPQ6tW7BEDdwHSdccMJu7fMHH4=; b=2IDpIn9zHgeSuB
	x4NdzIbWiSAfESykiImmLlO/EEBbRu0qG81EBKJPa1RXOaOASipMXlE6H6GSgrGaQYFzjdUeNzV18
	jp8bj6ivAv40+AppSm1yHO3CfNDZ+Ad+oaYYBF/SswAIQFN+urBaFEFSZlwCLZYKPJX133PlXVpIx
	uK+fHnDLJ3es0Y3VvT0LV78RQdGHFyaejpNOlXRo5kSDVUUPC1oB/D9aehsIpADl94l4DEhJJcjVh
	PUP0OVoqJTyVFxytNsgdbt5Md1VMfYb5Y4mE4F2yGMmNjAwZvlkjLAq58T01ld1NgUbsOwbiEabVv
	rti2+oBvfQoDUez0DTfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oasxX-009ChF-UW; Wed, 21 Sep 2022 06:11:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oasxU-009Cg1-Jw
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 06:11:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0F9B562AAC
	for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 06:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD3CC43148
	for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 06:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663740701;
	bh=gH9Ski2xTYL8v4gkhUeBQyCrdw3Fy4fRS2TNCxB/HMc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OiIo3nyiup7t5cubl5wo0ulrrg4kIwS5HB4XloEwdGH+mszNwOAl3PzDLZhg62LQi
	 bSThkjVBsF9fC8JGxXA6DJjxR2ls74Afg2IsVe1UvwTREhSckaHzXn7gNMSw9GU2OI
	 JQu+axS9AGleHtpjFeMotoSKxrIa7pQbbsp31vxtBjAN7S54Biehy/r1jl4uEb/yxM
	 GGDN2SISq+cwqgoSsBgLA1FYYdtgqirewNwQh2vkoxT0I0SxKNQZToYuUg8g+m3WED
	 0LwGfiVhDniSq6WPFSlKiTGjNeTqWc5x/QtxZO9s1ddWYlUddo1HXhsrbmo4jPpg6d
	 PcdatBm1/HVLQ==
Received: by mail-oi1-f173.google.com with SMTP id j188so6847357oih.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 23:11:41 -0700 (PDT)
X-Gm-Message-State: ACrzQf1vAri8TKMWdxPwpnckq4dWsan+yChSeUCjF66QrrDj+NfnI06K
	/OCw3KlURVIc8o8w/zadXJLKtxnGSLLIF4YmdQU=
X-Google-Smtp-Source: AMsMyM6+iL281iADWwJADpMlN3AK4Wsnm5yixhuu8iSUo6zhNyURpR9orru8QFczyFY+Y4K4m4KzqFMleGCsaaCNrYY=
X-Received: by 2002:a05:6808:151f:b0:350:1b5e:2380 with SMTP id
 u31-20020a056808151f00b003501b5e2380mr3236680oiw.112.1663740700715; Tue, 20
 Sep 2022 23:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220908022506.1275799-1-guoren@kernel.org> <20220908022506.1275799-9-guoren@kernel.org>
 <4babce64-e96d-454c-aa35-243b3f2dc315@www.fastmail.com> <CAJF2gTQAMCjNyqrSOvqDAKR5Z-PZiTVxmoK9cvNAVQs+k2fZBg@mail.gmail.com>
 <8817af55-de0d-4e8f-a41b-25d01d5fa968@www.fastmail.com> <CAJF2gTRoKfJ25brnA=_CqNw9DPt8XKhcyNzmCbD6wX1q-jiR1w@mail.gmail.com>
 <CAJF2gTRVH6pVqBn+n+wbccBcMWraRP3m4CbXz4g_y+=nPEU=Yw@mail.gmail.com> <542a9b2e-016a-4e09-9edb-c268bfae885f@www.fastmail.com>
In-Reply-To: <542a9b2e-016a-4e09-9edb-c268bfae885f@www.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 21 Sep 2022 14:11:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTXRyPJG924ZMQRaHehcmX0=MdtO0-vtKVzTrgDKH+QMA@mail.gmail.com>
Message-ID: <CAJF2gTTXRyPJG924ZMQRaHehcmX0=MdtO0-vtKVzTrgDKH+QMA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220920_231144_739204_B605613D 
X-CRM114-Status: GOOD (  24.87  )
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

On Tue, Sep 20, 2022 at 3:15 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Sep 20, 2022, at 2:46 AM, Guo Ren wrote:
>
> >
> > How about this one: (only THREAD_SIZE, no THREAD_ORDER&SHIFT.)
> >
> > -
> >  /* thread information allocation */
> > -#ifdef CONFIG_64BIT
> > -#define THREAD_SIZE_ORDER      (2 + KASAN_STACK_ORDER)
> > -#else
> > -#define THREAD_SIZE_ORDER      (1 + KASAN_STACK_ORDER)
> > -#endif
> > -#define THREAD_SIZE            (PAGE_SIZE << THREAD_SIZE_ORDER)
> > +#define THREAD_SIZE            CONFIG_THREAD_SIZE
>
>
> So far looks fine.
>
> >
> >  /*
> >   * By aligning VMAP'd stacks to 2 * THREAD_SIZE, we can detect overflow by
> > - * checking sp & (1 << THREAD_SHIFT), which we can do cheaply in the entry
> > - * assembly.
> > + * checking sp & THREAD_SIZE, which we can do cheaply in the entry assembly.
> >   */
> >  #ifdef CONFIG_VMAP_STACK
> >  #define THREAD_ALIGN            (2 * THREAD_SIZE)
> > @@ -36,7 +24,6 @@
> >  #define THREAD_ALIGN            THREAD_SIZE
> >  #endif
>
> The THREAD_ALIGN does not, this only works for power-of-two numbers of
> THREAD_SIZE,
We double THREAD_SIZE to simplify the detection. See the commit log:

    The overflow detect is performed before any attempt is made to access
    the stack and the principle of stack overflow detection: kernel stacks
    are aligned to double their size, enabling overflow to be detected with
    a single bit test. For example, a 16K stack is aligned to 32K, ensuring
    that bit 14 of the SP must be zero. On an overflow (or underflow), this
    bit is flipped. Thus, overflow (of less than the size of the stack) can
    be detected by testing whether this bit is set.

I would try to optimize the size of VMAP_STACK in another patch.

>
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 426529b84db0..1e35fb3bdae5 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -29,8 +29,8 @@ _restore_kernel_tpsp:
> >
> >  #ifdef CONFIG_VMAP_STACK
> >         addi sp, sp, -(PT_SIZE_ON_STACK)
> > -       srli sp, sp, THREAD_SHIFT
> > -       andi sp, sp, 0x1
> > +       srli sp, sp, PAGE_SHIFT
> > +       andi sp, sp, (THREAD_SIZE >> PAGE_SHIFT)
>
> I think this needs to use THREAD_ALIGN, not THREAD_SIZE.
No, it's BIT[14], when THREAD_SIZE = 16K.

>
>       Arnd



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

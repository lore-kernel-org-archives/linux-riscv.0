Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E06ECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 06:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PGBP6gx7PIdwqrSMCC/SJ/jN98OCUvYKaCxK6ZBLEmo=; b=G4JOi4NbazT4KF
	rzKdJ7/w5cIZJXuL+3tprEf+UiwPJ7BrmR0Q6aBMMdoqpahmINtJS6gROn/RL2cXQnweKXycK60P2
	lTHpNkuAIj/flEkHdW8+CQvpO47k5TER229u1pTL36SixjpV7coWZEw9USJGB5Iv7JXKBMkPAgUgB
	7mBiy9DH3/BrW6MEf1XmAsDrMyS34/vpuxx0v1gLm8rmDk6Egr/IfIYJtmvZeQlz/Cj7v9IuuWcKr
	8WiKwwhWUugEbO86WRQHp+7NplN/m3u4LmEBdz5xXHCbHAAQX2lzXjzp/SsV6vD3eqpbEllHn7+Dd
	I58HHPOYIWOHTrWUyQew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaWRY-000tfa-2K; Tue, 20 Sep 2022 06:09:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaWRU-000tdL-As
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 06:09:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9FDCE62392
	for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 06:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4C8C4314D
	for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 06:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663654149;
	bh=zfzusDb14FFN7gQb0UhtuJazqWZoNGqu03mLfuxOeXs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ps1PsyGxPrAcs2wOCrD5ibE2AUuAVG0yYa8JdBws8Ab39LUmVPlXjkGv5ScivJ6jp
	 IS9vZAyDQtDT+sBUS/w8sLz3fAkCBjU9lUtUK7hlnswcZsxJtoUNZji9UMAmmb7TvV
	 OAN9YaaS7qElJXllpsv0U3B+Bgd9G/jsPhw5kVQV1a2dm//RT4a3g3NzZLfTJp8L2h
	 t5EydDGiCjR3LZBAtIxanXELJ2bxg/igljlCB6QjKOF0RvCiwd17uDghMKdnM21nIl
	 R6BEQIdv+iQ3baMyQJfWrkL2s72fDiRTvwu6z9q4mnwiZIG9+xvArEcXMKaccvsONb
	 7i4WrJZMAyEXQ==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-12c8312131fso2792264fac.4
        for <linux-riscv@lists.infradead.org>; Mon, 19 Sep 2022 23:09:08 -0700 (PDT)
X-Gm-Message-State: ACrzQf3H2Er5NMl2I2TwfqQNs1sLFHugLISX4/CvIErSXOnXOTNHOqB3
	6+6Y9JVFrOgdUkfPmETs29SSkLUvQXgtKTklepU=
X-Google-Smtp-Source: AMsMyM5/BTTDa5v+eF4g4y/fFcD46UVeV81LVzz0xqS4N4SXQrDzkSWMO2JEIpuBTgQQr/IPW3RpNyik4vHqQmdADDU=
X-Received: by 2002:a05:6870:5803:b0:12c:c3e0:99dc with SMTP id
 r3-20020a056870580300b0012cc3e099dcmr1079696oap.19.1663654147825; Mon, 19 Sep
 2022 23:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220918155246.1203293-1-guoren@kernel.org> <20220918155246.1203293-9-guoren@kernel.org>
 <Yyhyap+Xi3UtV+T0@hirez.programming.kicks-ass.net>
In-Reply-To: <Yyhyap+Xi3UtV+T0@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 20 Sep 2022 14:08:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS9rFTndZXvDG+XNOOEwZYC_Hbu9TOO_F+4gQo1mRF2bQ@mail.gmail.com>
Message-ID: <CAJF2gTS9rFTndZXvDG+XNOOEwZYC_Hbu9TOO_F+4gQo1mRF2bQ@mail.gmail.com>
Subject: Re: [PATCH V5 08/11] riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
To: Peter Zijlstra <peterz@infradead.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org, 
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org, 
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org, 
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, mark.rutland@arm.com, zouyipeng@huawei.com, 
	bigeasy@linutronix.de, David.Laight@aculab.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>, keescook@chromium.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_230912_619389_AF382C59 
X-CRM114-Status: GOOD (  17.32  )
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

On Mon, Sep 19, 2022 at 9:45 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Sun, Sep 18, 2022 at 11:52:43AM -0400, guoren@kernel.org wrote:
>
> > +ENTRY(call_on_stack)
> > +     /* Create a frame record to save our ra and fp */
> > +     addi    sp, sp, -RISCV_SZPTR
> > +     REG_S   ra, (sp)
> > +     addi    sp, sp, -RISCV_SZPTR
> > +     REG_S   fp, (sp)
> > +
> > +     /* Save sp in fp */
> > +     move    fp, sp
> > +
> > +     /* Move to the new stack and call the function there */
> > +     li      a3, IRQ_STACK_SIZE
> > +     add     sp, a1, a3
> > +     jalr    a2
> > +
> > +     /*
> > +      * Restore sp from prev fp, and fp, ra from the frame
> > +      */
> > +     move    sp, fp
> > +     REG_L   fp, (sp)
> > +     addi    sp, sp, RISCV_SZPTR
> > +     REG_L   ra, (sp)
> > +     addi    sp, sp, RISCV_SZPTR
> > +     ret
> > +ENDPROC(call_on_stack)
>
> IIRC x86_64 moved away from a stack-switch function like this because it
> presents a convenient exploit gadget.
I found:
https://lore.kernel.org/all/20210204204903.350275743@linutronix.de/

  - The fact that the stack switching code ended up being an easy to find
    exploit gadget.

What's the exploit gadget? Do you have a ref link? Thx.

>
> I'm not much of an exploit writer and I've no idea how effective our
> inline stategy is, perhaps other can comment.
It seems that I should move to an inline flavor. a0cfc74d0b00
("x86/irq: Provide macro for inlining irq stack switching")

-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

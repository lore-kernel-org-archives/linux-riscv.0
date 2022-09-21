Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF251C6FA90
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 06:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qybm2RwKHQQGQQzum5xwvg8A+nYsVZLPsJ6zpO4n9HI=; b=ZQekkgf82POLP7
	m2TRzlNMZXsWa8PFcVOLxFxs/IVgZgOwhi0LRu0WDmCCdjku9ZeePJfUqN0fRhGf6iIr5v5+Flet1
	KlfEFIidwtso6923l6quxT4MIpLD+dfwT3AJ2hRDmGGwz0Hw/8eMC1tsGL4+zutp6eG8Ao9XoSf/x
	rCpbGErw3vwS/KqhlgLz+i33W7h4Gi5NwAvdgJfJ4FlG4IVJclcjMe2yjSoTSj4HBy4HcXkQ9pD5g
	W40bEpbTLhr+qX7T+t7zibUoBB+1+Ohrauia4EJfs6m2dTeIpi3VcCCLwbJ5xezw2nvVXxZLzktkC
	7y9HZ0a3zm1w5rrxdmlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oat22-009ERM-2n; Wed, 21 Sep 2022 06:16:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oat1y-009ENY-1D
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 06:16:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1E260B81100
	for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 06:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3355AC43147
	for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 06:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663740976;
	bh=cNqXuM4/r1oFK58tkWe1aNJ1OBze/WTcp9aFMeMbeMM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rb9o1/w9KyR+0qq4bAv7Ys8e0MjLjiM6hglaayZCV1n9XdVdl71DqeurYgYuHEr7m
	 llwnKslrNGyuuSxETwvf1PlnAsJpgsHutrQBlSly53VjIMroowyLF038KEInV8RsS0
	 cjUfbD6+PwMrbJHfeIQQg2RkyS1RTOySgXb54zQxmko3GF56TQzqIFqM+8nXBsDrqO
	 AIljj2ZKCDcF6hZzxAD6ePG0i1AEnV1y89pAy99Y5aqTeFdbvF1Wec8LjEPx8hovKH
	 etpbY9XAFA2BfR+SRV6ZQWm2Rfm4BABhc7Mb5ed3i5Exa9uSPT6XzfG0BoNHhMttPz
	 ylp2+gTDiPTTA==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1278a61bd57so7639054fac.7
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 23:16:16 -0700 (PDT)
X-Gm-Message-State: ACrzQf2XX+npKRZf8PbzfYRvSZnFdjztDjphi23VGCsq8cdqxzsqJX0E
	wagJPW0MjhrcppEVHwiqaTkDfQzYrNU8k8SpDkc=
X-Google-Smtp-Source: AMsMyM7K4lu41kJXQ0pd8zcm4aW2MCuxwDMR4j5oGDnAq7EXvY5dlsWZpoSRwWsOhQij/CqlEP3XnbdNnx/lqcqf89o=
X-Received: by 2002:a05:6870:5803:b0:12c:c3e0:99dc with SMTP id
 r3-20020a056870580300b0012cc3e099dcmr3993282oap.19.1663740975257; Tue, 20 Sep
 2022 23:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220918155246.1203293-1-guoren@kernel.org> <20220918155246.1203293-9-guoren@kernel.org>
 <Yyhyap+Xi3UtV+T0@hirez.programming.kicks-ass.net> <CAJF2gTS9rFTndZXvDG+XNOOEwZYC_Hbu9TOO_F+4gQo1mRF2bQ@mail.gmail.com>
 <Yylrd77Eh9v7OKLj@hirez.programming.kicks-ass.net> <Yyls+xIUsLCIa7pj@hirez.programming.kicks-ass.net>
In-Reply-To: <Yyls+xIUsLCIa7pj@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 21 Sep 2022 14:16:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTFLEV47OT6hM0DwaSbm+4-Q_s+x0Wc3MFjpv1Kr4rbKQ@mail.gmail.com>
Message-ID: <CAJF2gTTFLEV47OT6hM0DwaSbm+4-Q_s+x0Wc3MFjpv1Kr4rbKQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220920_231622_425147_9C0650B0 
X-CRM114-Status: GOOD (  25.43  )
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

On Tue, Sep 20, 2022 at 3:34 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Sep 20, 2022 at 09:27:51AM +0200, Peter Zijlstra wrote:
> > On Tue, Sep 20, 2022 at 02:08:55PM +0800, Guo Ren wrote:
> > > On Mon, Sep 19, 2022 at 9:45 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > > >
> > > > On Sun, Sep 18, 2022 at 11:52:43AM -0400, guoren@kernel.org wrote:
> > > >
> > > > > +ENTRY(call_on_stack)
> > > > > +     /* Create a frame record to save our ra and fp */
> > > > > +     addi    sp, sp, -RISCV_SZPTR
> > > > > +     REG_S   ra, (sp)
> > > > > +     addi    sp, sp, -RISCV_SZPTR
> > > > > +     REG_S   fp, (sp)
> > > > > +
> > > > > +     /* Save sp in fp */
> > > > > +     move    fp, sp
> > > > > +
> > > > > +     /* Move to the new stack and call the function there */
> > > > > +     li      a3, IRQ_STACK_SIZE
> > > > > +     add     sp, a1, a3
> > > > > +     jalr    a2
> > > > > +
> > > > > +     /*
> > > > > +      * Restore sp from prev fp, and fp, ra from the frame
> > > > > +      */
> > > > > +     move    sp, fp
> > > > > +     REG_L   fp, (sp)
> > > > > +     addi    sp, sp, RISCV_SZPTR
> > > > > +     REG_L   ra, (sp)
> > > > > +     addi    sp, sp, RISCV_SZPTR
> > > > > +     ret
> > > > > +ENDPROC(call_on_stack)
> > > >
> > > > IIRC x86_64 moved away from a stack-switch function like this because it
> > > > presents a convenient exploit gadget.
> > > I found:
> > > https://lore.kernel.org/all/20210204204903.350275743@linutronix.de/
> > >
> > >   - The fact that the stack switching code ended up being an easy to find
> > >     exploit gadget.
> > >
> > > What's the exploit gadget? Do you have a ref link? Thx.
> >
> > Sadly no, I do not. Kees might. But basically it boils down to this
> > function taking both a stack pointer and a function pointer as
> > arguments (@a1 and @a2 resp. if I'm not reading this wrong).
> >
> > If an attacker can call this with arguments of its choice then it gains
> > full control of subsequent execution.
>
> If you inline it the hope is that the function pointers go away or at
> least the encompassing function doesn't have quite such a 'convenient'
> signature to hijack control flow.
Thanks for mentioning it. I would change to an inline style.


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

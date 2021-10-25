Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD34C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 13:33:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3186760C49
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 13:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3186760C49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZgldHhwAZW3YWS5++/10Qdkhj3+OiSmY6m2TD9p/yN8=; b=Yiu0C9APSUlVeg
	IaBco8zUiDFUOikAu5slXpcJoIDmggY5rtsXIkUNy08emUE8oho6kwowhrQUjn+Y1OERSACBRH7de
	RYieasEjGOUI9Z8wJjL8ydHMG9hAus6iX2GBpwZTpufdWjXtKy0Pa6iwyRKS2H5XlnUqRJbT7kI+Y
	3Z1EbTVh1pVHl7YQp353/Dq5e30waLh95LXysnbfLvjB9OnFqO6aJtQ1UN0/7ttj2g9NbtsY4YD6d
	6GDQLWZSK0/IakKTTxlj75mUPxfU+QBYv0eTyc33kZuIVS86AdX7j/PNScLSrrqxapZXhm8a6LuOR
	+H4EpaVKYYSIpiX0ef5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf06g-00GY1q-CX; Mon, 25 Oct 2021 13:33:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf06e-00GY0y-63
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 13:33:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9EB0E60FE8
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 13:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635168819;
 bh=EJ45t84sWIEH4MsSQhX2PuBQrfefoAybdOzP/rNZ+W0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OombQE/tLFdXcoqTbOKCFBEoPkjNSZACFBrDM2ZUyFWNwvqMk5D9UcGaRRacva9y2
 JEkF5mg0tyglX17CJpImlDl71pFmOoDhemZlk35I4pLE3UhWOvGoUfp4RQU/q3zEGf
 88BHvNtZCfKIA5r7/3qm5FQg63dxvzRQTU4f/Ry9f2o9BP0535VjbcAvT1AfRKp2EP
 0qgiakvfCle5yZB2Lq3hIKKAw+GK3uDKotmIcRxy//YjAghnBu2aEJFCLdRmTMNPHZ
 7mgOU1C+q/2KuTGKSed2+/wCipyItHdlnXzsTpqIR7cNa1VyVYKvgZCSu+pT7U17q6
 WXdiCVfJJTxBg==
Received: by mail-vk1-f182.google.com with SMTP id d130so719120vke.0
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 06:33:39 -0700 (PDT)
X-Gm-Message-State: AOAM533KD/wOgOmPatja0YN8Fgw2SEohRIdhDgt7Hhmjv8EAiPRDlelf
 NL0STWBVUqCo8gr9LwxMaYvbQkgCIVUnUxkyUPI=
X-Google-Smtp-Source: ABdhPJwdtSXSO9me5cbpVx8umGxqAOBbaLGaFF8sdWMN1yxlQDvJkj80Gy8e7N7zebHiShNk+776CXMa7XvtZT+wyo8=
X-Received: by 2002:a05:6122:788:: with SMTP id
 k8mr14826563vkr.8.1635168818708; 
 Mon, 25 Oct 2021 06:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211024013303.3499461-1-guoren@kernel.org>
 <20211024013303.3499461-4-guoren@kernel.org>
 <87a6ixbcse.wl-maz@kernel.org>
In-Reply-To: <87a6ixbcse.wl-maz@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 25 Oct 2021 21:33:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTw136y8tzwOJQcNymGGWA2Zz127ozFEnGrRXwQUU7o8Q@mail.gmail.com>
Message-ID: <CAJF2gTTw136y8tzwOJQcNymGGWA2Zz127ozFEnGrRXwQUU7o8Q@mail.gmail.com>
Subject: Re: [PATCH V5 3/3] irqchip/sifive-plic: Fixup thead,c900-plic
 request_threaded_irq with ONESHOT
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_063340_288713_3937DC21 
X-CRM114-Status: GOOD (  26.93  )
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

On Mon, Oct 25, 2021 at 6:48 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sun, 24 Oct 2021 02:33:03 +0100,
> guoren@kernel.org wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > When using "devm_request_threaded_irq(,,,,IRQF_ONESHOT,,)" in the driver,
> > only the first interrupt could be handled, and continue irq is blocked by
> > hw. Because the thead,c900-plic couldn't complete masked irq source which
> > has been disabled in enable register. Add thead_plic_chip which fix up
> > c906-plic irq source completion problem by unmask/mask wrapper.
> >
> > Here is the description of Interrupt Completion in PLIC spec [1]:
> >
> > The PLIC signals it has completed executing an interrupt handler by
> > writing the interrupt ID it received from the claim to the claim/complete
> > register. The PLIC does not check whether the completion ID is the same
> > as the last claim ID for that target. If the completion ID does not match
> > an interrupt source that is currently enabled for the target, the
> >                          ^^ ^^^^^^^^^ ^^^^^^^
> > completion is silently ignored.
>
> Given this bit of the spec...
>
> > +static void plic_thead_irq_eoi(struct irq_data *d)
> > +{
> > +     struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> > +
> > +     if (irqd_irq_masked(d)) {
> > +             plic_irq_unmask(d);
> > +             writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> > +             plic_irq_mask(d);
> > +     } else {
> > +             writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> > +     }
> > +}
> > +
>
> ... it isn't obvious to me why this cannot happen on an SiFive PLIC.
I'm not sure about SiFive PLIC. Maybe they didn't follow that to implement.

>
> And it isn't only for threaded interrupts in oneshot mode. Any driver
> can mask an interrupt from its handler after having set the
> IRQ_DISABLE_UNLAZY flag, and the interrupt would need the exact same
> treatment.
Thx for mentioned here, and I'll add it in the comment of next version patch.

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

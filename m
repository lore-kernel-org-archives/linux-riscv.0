Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58260C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 14:52:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13EA960F57
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 14:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13EA960F57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBZNQNNbOSpzqB7EeH1FItQFLLPpT5XEAvuzB6ZYnt8=; b=lWBilnE4tyODJV
	MoSiJMlaMlQWOTvPLR0C3dogU8Ushy3Rvqu1ApA2CnEx/wXt1dDQf3wRwD40HYIXNfPiaz18D9fcS
	NLkqQ6aSz5IQ9c6KReiYmrhynrLRvxPmdMOEitkMm9NfyPCGYneI8jA/TGDGlWc+oXBBqjgAyJo0l
	sVOLQ80yybtU2euCbrW6L5tbn9gwA1gbekp7fQRQaeNPQaS0eAt6SUfper5uML2h5L2yhfHjawGss
	cjB7Yb0iHGjzbYKEOSuOjr9gxtP4JKvJztkEWrwgQ5U54AdrL+kETy+DMQjdL4T5nEJlHfTQz/Fy7
	Wu9rJeBlB1Vp1SGUzcIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdCwe-004qOt-Jz; Wed, 20 Oct 2021 14:51:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCfK-004mWo-OK
 for linux-riscv@lists.infradead.org; Wed, 20 Oct 2021 14:34:04 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so10748381wmz.2
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 07:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2cFhehtw2gzRQk7Qa6LrKMw4p/s424MMljllyART0OQ=;
 b=AozxwGNX1yZicLViDzo3g9qk+ZLtZUTbsDbPza3yuLLX0exN8SQocXpMAs82x0J2Fj
 ShRocDJEA4dvWf4HAr6z48A1cFOCacAAw5fAaIlnUSK4yzz2tkBKJmmM9b7VrNFkV+PL
 lqGheu4GzqpDpXsz4JXS9FZexzPqvdbukqLcPf4+k/HhevODyvG6P70pGICcWnIRQozY
 PolO+6ZnHvvvEBw6ADvUY///dRLh0dXNmoK3BX+xl4e7VSgS0U4mbrNq3d5BkCMxyCJD
 flpOopZQDSR/xkCf3HoxX4DhyDvhfYEmU8ipxoq0pPanRXNzG+UdRbOHrBxxryfOhWBj
 NzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2cFhehtw2gzRQk7Qa6LrKMw4p/s424MMljllyART0OQ=;
 b=pRQHn1pPvGzEXnqNHpo0vY8f1HAc5UfJToL+NZK99FbCpSw5gcYNBMNglQB0ETf2Mq
 6Ax2bOmcxCtHB+YVaD+gTPg55m/hfQASeSl/xqP2KVf3KWMZtpzVPInGqEZabjrt9tsK
 bGZ0ck4b1n5qs4XLtNaBV2ToTP1MQz4CjInFG58+PJjAYZGwqo+J2bHlAr81IP8H2ap2
 nwnJ7wtM5kkzDxkrEngq96iCr7YkU3gipx+o8vSmZGLjP+r0EUtpYkIUwRuahGq7XulG
 prSBFpnKgsYCn/9aMVQSvKaaKAHop/AHoLZUe9dmHaW0xU+qy70bWH/zbhvCC6hWdV3e
 FdHQ==
X-Gm-Message-State: AOAM532wWOoC2izlQ/GY/YIcvOX0Q3iygo5613FUT8C351Rg9cH6lisX
 QP85Q9JTPzqHyB/Vctb++nax7eDfX/hXmeJbSotUHrRIMKZ8/w==
X-Google-Smtp-Source: ABdhPJxOi8BJgXt9VNr5faBTIJ6D21SoWMk2EhW2bVdZhetIJAIWNF4EaEbsXB80didI86Wohcyh6UJsDvVe+okzzcU=
X-Received: by 2002:adf:f60e:: with SMTP id t14mr68513wrp.199.1634740441250;
 Wed, 20 Oct 2021 07:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211016032200.2869998-1-guoren@kernel.org>
 <20211016032200.2869998-2-guoren@kernel.org>
 <8be1bdbd-365d-cd28-79d7-b924908f9e39@sholland.org>
 <f850af365f2ac77af79ec59f92e6434a@kernel.org>
 <CAJF2gTShT8Tvk0z6B52zKEi0vq_toc-7mAKWFKj3j-zg=OhpYQ@mail.gmail.com>
 <8735oxuxlq.wl-maz@kernel.org>
 <CAJF2gTSmyu9nA5M3QLeR1LdGMkeGb7jE93Z9zjixcpb_freLMw@mail.gmail.com>
 <875ytrddma.wl-maz@kernel.org>
In-Reply-To: <875ytrddma.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 20 Oct 2021 20:03:49 +0530
Message-ID: <CAAhSdy0TwOjv_RDMRsKqcqTE8PSO_A_EttMGBiDbb-0PTRizZg@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] irqchip/sifive-plic: Add thead,c900-plic support
To: Marc Zyngier <maz@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Atish Patra <atish.patra@wdc.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_073402_831315_456F8AC9 
X-CRM114-Status: GOOD (  25.06  )
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

On Wed, Oct 20, 2021 at 7:04 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 19 Oct 2021 14:27:02 +0100,
> Guo Ren <guoren@kernel.org> wrote:
> >
> > On Tue, Oct 19, 2021 at 6:18 PM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Tue, 19 Oct 2021 10:33:49 +0100,
> > > Guo Ren <guoren@kernel.org> wrote:
> > >
> > > > > If you have an 'automask' behavior and yet the HW doesn't record this
> > > > > in a separate bit, then you need to track this by yourself in the
> > > > > irq_eoi() callback instead. I guess that you would skip the write to
> > > > > the CLAIM register in this case, though I have no idea whether this
> > > > > breaks
> > > > > the HW interrupt state or not.
> > > > The problem is when enable bit is 0 for that irq_number,
> > > > "writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM)" wouldn't affect
> > > > the hw state machine. Then this irq would enter in ack state and no
> > > > continues irqs could come in.
> > >
> > > Really? This means that you cannot mask an interrupt while it is being
> > > handled? How great...
> > If the completion ID does not match an interrupt source that is
> > currently enabled for the target, the completion is silently ignored.
> > So, C9xx completion depends on enable-bit.
>
> Is that what the PLIC spec says? Or what your implementation does? I
> can understand that one implementation would be broken, but if the
> PLIC architecture itself is broken, that's far more concerning.

Yes, we are dealing with a broken/non-compliant PLIC
implementation.

The RISC-V PLIC spec defines a very different behaviour for the
interrupt claim (i.e. readl(claim)) and interrupt completion (i.e.
writel(claim)). The T-HEAD PLIC implementation does things
different from what the RISC-V PLIC spec says because it will
mask an interrupt upon interrupt claim whereas PLIC spec says
it should only clear the interrupt pending bit (not mask the interrupt).

Quoting interrupt claim process (chapter 9) from PLIC spec:
"The PLIC can perform an interrupt claim by reading the claim/complete
register, which returns the ID of the highest priority pending interrupt or
zero if there is no pending interrupt. A successful claim will also atomically
clear the corresponding pending bit on the interrupt source."

Refer, https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc

Regards,
Anup

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

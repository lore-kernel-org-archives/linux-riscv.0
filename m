Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B71C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 16:09:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E78561183
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 16:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E78561183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmJZlzKxC67IrefjvomZrGV2B987w8KVFx4PdoKhOlc=; b=sIliwrbPs2Kns3
	iT6JBJQCuFqs5eaPPWjmnLKFnoPVjqSBAC+hQ7GYpIJ0XRnxg8H7VpBqD1cudM3kSGm13V8aZbZJX
	M4n/QO0Q1a6tPr/XxXCoQHYTRcktyc58JiFerTTstNdzqHggBSCDWDtH0ftFvfM/cn/yDseS7Ig+o
	ZRMBJFxcvT/Aoez+Rbn+SN+OqAlc3DBoBq1VbQGpmD8K/KwPEEAWCrJRwBK+wqanKkUWRfFNwNwjS
	wWPfa9rKIsqGLFwNtWeu7TgCsJa4N+6WeyEw1PZjoUFkI36zcIRtLqlpaPML3EWCsW7xOI0vaXN/A
	nL0IJvEHnmzOuGzntmtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdE96-005Bpy-4z; Wed, 20 Oct 2021 16:08:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdE93-005Boe-Dm
 for linux-riscv@lists.infradead.org; Wed, 20 Oct 2021 16:08:51 +0000
Received: by mail-wm1-x333.google.com with SMTP id v127so20134463wme.5
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 09:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jU6so7/xmOAFW/5s5ePQjgzisbppTQiQVv9ulVydV04=;
 b=iNttK7oYUXsKvaJ8rzn//EimD6P+6OHcX+mwgg0gJuTPMnGd7PnIyjAhZLvN/vEpWh
 W6YleLtRhL/OoHrY/X/jDl2zkirtDaTHhjrbPzUlyTfX/5dwLrMvBUpxdT29XfuAU580
 xwvDyj7K9KwQ29+7iiRltTXU8r01rWEaCib8cAOOpwvTRPqMamVpub9TfySxzKwlL1m4
 bxUWaAbd6WEt1VRrBhTRezlPY3k1Y2s9FtLvEmdQcP/n5riV5qhpb4JkaX0RArtt8Krf
 rqyeV11RlV9pOUWdPXpsFuOsmPNzyEFtnasEY/EX9VKO/Ve75P20cdW555lN02yeDlX5
 HoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jU6so7/xmOAFW/5s5ePQjgzisbppTQiQVv9ulVydV04=;
 b=f+w9NlxGJOfZ8e6vTH1BAudzhiGSd4S3N8DzW1rM+VA21ThgzZPLitYSnBgEh/cfbv
 bnZdpALsJOUGuJneMcKAFFf8gwS/vzPeuIynMinfxcRhtSstuAWHzYc5oxZ3r3jq6OE6
 dm3JtkPSncEDc7pB7P9gh6U/cLKOwJLVnqw7+gVJZgJG6nERyzF7N3iG8CcsvhomXv9n
 VlvAGdQByV9gzkXFi5Twm8HFvQzI1y8T7jH4Z9ipueOaBl63hpmTesc0FHVfIF2HQozR
 OexOzZhwkT4c29wPUtvd8eBkLLksPvHea03jDHYLg3qnciZazinQnmQjWbNsAYWa9jS5
 zZ4A==
X-Gm-Message-State: AOAM530SpwiwEaKwC9zZ7FsKH9d+GBrHyhvl/fHVa/fqypS1TUzl5VOK
 RzonWxFeD0GHuNT8Ivb6NcethtU9d8g863BpkjERDnG/a+I=
X-Google-Smtp-Source: ABdhPJw0lgiD+qkfnFE0ywDfuTzMV+8e+bVIm3cOn/bK21wlW0F0sSuD8murJaR508c7NLifiZ3ei8uq1COTmdDPJSE=
X-Received: by 2002:a05:600c:354c:: with SMTP id
 i12mr133300wmq.59.1634746127808; 
 Wed, 20 Oct 2021 09:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211016032200.2869998-1-guoren@kernel.org>
 <20211016032200.2869998-2-guoren@kernel.org>
 <8be1bdbd-365d-cd28-79d7-b924908f9e39@sholland.org>
 <f850af365f2ac77af79ec59f92e6434a@kernel.org>
 <CAJF2gTShT8Tvk0z6B52zKEi0vq_toc-7mAKWFKj3j-zg=OhpYQ@mail.gmail.com>
 <8735oxuxlq.wl-maz@kernel.org>
 <CAJF2gTSmyu9nA5M3QLeR1LdGMkeGb7jE93Z9zjixcpb_freLMw@mail.gmail.com>
 <875ytrddma.wl-maz@kernel.org>
 <CAAhSdy0TwOjv_RDMRsKqcqTE8PSO_A_EttMGBiDbb-0PTRizZg@mail.gmail.com>
 <871r4fd996.wl-maz@kernel.org>
In-Reply-To: <871r4fd996.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 20 Oct 2021 21:38:36 +0530
Message-ID: <CAAhSdy24WRZP70C0HUA1y0nVf0yWdj4SYY8HhGSfxQzDdafYnQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211020_090849_548879_CFDBC257 
X-CRM114-Status: GOOD (  35.57  )
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

On Wed, Oct 20, 2021 at 8:38 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 20 Oct 2021 15:33:49 +0100,
> Anup Patel <anup@brainfault.org> wrote:
> >
> > On Wed, Oct 20, 2021 at 7:04 PM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Tue, 19 Oct 2021 14:27:02 +0100,
> > > Guo Ren <guoren@kernel.org> wrote:
> > > >
> > > > On Tue, Oct 19, 2021 at 6:18 PM Marc Zyngier <maz@kernel.org> wrote:
> > > > >
> > > > > On Tue, 19 Oct 2021 10:33:49 +0100,
> > > > > Guo Ren <guoren@kernel.org> wrote:
> > > > >
> > > > > > > If you have an 'automask' behavior and yet the HW doesn't record this
> > > > > > > in a separate bit, then you need to track this by yourself in the
> > > > > > > irq_eoi() callback instead. I guess that you would skip the write to
> > > > > > > the CLAIM register in this case, though I have no idea whether this
> > > > > > > breaks
> > > > > > > the HW interrupt state or not.
> > > > > > The problem is when enable bit is 0 for that irq_number,
> > > > > > "writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM)" wouldn't affect
> > > > > > the hw state machine. Then this irq would enter in ack state and no
> > > > > > continues irqs could come in.
> > > > >
> > > > > Really? This means that you cannot mask an interrupt while it is being
> > > > > handled? How great...
> > > > If the completion ID does not match an interrupt source that is
> > > > currently enabled for the target, the completion is silently ignored.
> > > > So, C9xx completion depends on enable-bit.
> > >
> > > Is that what the PLIC spec says? Or what your implementation does? I
> > > can understand that one implementation would be broken, but if the
> > > PLIC architecture itself is broken, that's far more concerning.
> >
> > Yes, we are dealing with a broken/non-compliant PLIC
> > implementation.
> >
> > The RISC-V PLIC spec defines a very different behaviour for the
> > interrupt claim (i.e. readl(claim)) and interrupt completion (i.e.
> > writel(claim)). The T-HEAD PLIC implementation does things
> > different from what the RISC-V PLIC spec says because it will
> > mask an interrupt upon interrupt claim whereas PLIC spec says
> > it should only clear the interrupt pending bit (not mask the interrupt).
> >
> > Quoting interrupt claim process (chapter 9) from PLIC spec:
> > "The PLIC can perform an interrupt claim by reading the claim/complete
> > register, which returns the ID of the highest priority pending interrupt or
> > zero if there is no pending interrupt. A successful claim will also atomically
> > clear the corresponding pending bit on the interrupt source."
> >
> > Refer, https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc
>
> That's not the point I'm making. According to Guo, the PLIC (any
> implementation of it) will ignore a write to claim on a masked
> interrupt.

Yes, write to claim on a masked interrupt is certainly ignored but
read to claim does not automatically mask the interrupt.

>
> If that's indeed correct, then a sequence such as:
>
> (1) irq = read(claim)

This will return highest priority pending interrupt and clear the
pending bit as-per RISC-V PLIC spec.

> (2) mask from the interrupt handler with the right flags so that it
> isn't done lazily
> (3) write(irq, claim)
>
> will result in an interrupt blocked in ack state (and probably no more
> interrupt for this CPU at this priority). That would be an interesting
> bug in the current code, but also a pretty bad architectural choice.

The interrupt claim/completion is for each interrupt and not at CPU
level so if an interrupt is masked then only that interrupt is blocked
for all CPUs but other interrupts can still be raised.

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

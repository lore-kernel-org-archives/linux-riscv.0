Return-Path: <SRS0=We8W=PS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6FEC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Oct 2021 10:27:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB1D960724
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Oct 2021 10:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB1D960724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qrk5ypEbFkgWn5tS4xakxjlEX37Y2IL6bvhRP6HZ+vw=; b=V4oikgNJFuOE5l
	XNGeVz3ZqjgJds0blhFlvwrDdf1MuAfICa9dWzsczhSo/tLWsZnWAuremXptaY05+O7G5OViooXTV
	MMVx7Zw/I7IHD6XdBxWq6hRlXsnwFNoZms2G7iplMQ023Zk5ZjzXM/Z1oGL+Sqa3mxNzFoQDGA28p
	HynBbhkjOb0wQXhVspf8+wjysKqPuPJbbea0RCqfc2xzl+kJBDr1goTFvX34bejcTShsMYorjyZXo
	u/Z6CeRrwKJEZUoXo6DWehAnIdqgyqi0l4c/eTT7tYpRYj0xTJLreCNoSSG0EqC+GY/2q4m+/fg1v
	so/h4PMbm1SqrxqMvHZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mglaH-00Cyr0-LR; Sat, 30 Oct 2021 10:27:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mglaE-00CyqK-NP
 for linux-riscv@lists.infradead.org; Sat, 30 Oct 2021 10:27:33 +0000
Received: by mail-wr1-x430.google.com with SMTP id d3so20619329wrh.8
 for <linux-riscv@lists.infradead.org>; Sat, 30 Oct 2021 03:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=00D8zl/w7yQbU3CfyVaAz58+MxxvUD0z083tR5Sb+l4=;
 b=PmsNF0xHqLuHIOEmmF3lWCKBywHii0lbygo2kOEIqSn1ji0Q3egoRkxdlzJn494Xkm
 BV/Ry7BsmScRNpVG+ZFVy7H06u8NTJ2Kj3Klsa62537XqzzjryBs0YljJRfByfNv+F1I
 nkKJ2AgeGdABQTZu/eSXMAmlhZ2YFaqpg3bGM8Py1ACFVfjNmS37FhcIcN/YwnayCK07
 zgQ7uR7416/mGw2q3vLPqA41JFkG0+DSwV1z6/iblDUwgjfQO7Y8RDWFgBCFG+BNcIq+
 fC+8CtL9sLn3m3O2B2eVExuBy3L8iboNg3TMUSYbGPXqgUCgqlHPQ6WSSbcz94ahhAyH
 gJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=00D8zl/w7yQbU3CfyVaAz58+MxxvUD0z083tR5Sb+l4=;
 b=jVMoONpnyHVO3koobJc0o5tltZGtVn9/0neD802wzlidA6kwZTY3iCvHZt+blYJZzb
 D0ew/46fCA6yrXU0CUo9Nc4r2byuTEUirBTymI4UbvOBNUNspu8VOL4NwWs3UUwpFVF2
 8E2iqT/0IVWjtV7VnXpxa8RibHtvtPxwyEKAEYHzN+XiiPYqKA5Bs+MC26f28d6HKuvA
 bBndJdRm+2HyRxJJisAUCelNpZUzQCC0/wF5elaGoZR3AvOGbY0VyyzmkVq6goFSn8Wt
 rKp4QGBYeyc8Rd6dbcjP17X12ftLBlP1NC9v4CQrnq/tmKE2td3bRLRIbPTBv8u90wIc
 t0EQ==
X-Gm-Message-State: AOAM53201xWl8X3dta7V3aqJkHEFarrbKGYow0XpvK73eGAU6Q6U/iYW
 LcsFfvMUYSWrf5aAaQ8Xn72SDlQsciQSSmzu57dv9g==
X-Google-Smtp-Source: ABdhPJxVqlYF2HwtysH6iDwffuQq6BB03SGMWpDRIMQpOak0tjIikXlTh2VE13NHeGmqYIf6q0xgeSEMw5FodUyCPkQ=
X-Received: by 2002:a05:6000:1a89:: with SMTP id
 f9mr21361369wry.249.1635589647516; 
 Sat, 30 Oct 2021 03:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211024013303.3499461-1-guoren@kernel.org>
 <20211024013303.3499461-4-guoren@kernel.org>
 <87a6ixbcse.wl-maz@kernel.org>
 <20211028135523.5cf4b66b@redslave.neermore.group>
 <87sfwl9oxg.wl-maz@kernel.org>
In-Reply-To: <87sfwl9oxg.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 30 Oct 2021 15:57:16 +0530
Message-ID: <CAAhSdy3+vaUODbVbjQtUbB+exjrsrY3CitNvzEEcrh_nSBg6yA@mail.gmail.com>
Subject: Re: [PATCH V5 3/3] irqchip/sifive-plic: Fixup thead, c900-plic
 request_threaded_irq with ONESHOT
To: Marc Zyngier <maz@kernel.org>
Cc: Nikita Shubin <nikita.shubin@maquefel.me>, Guo Ren <guoren@kernel.org>, 
 Atish Patra <atish.patra@wdc.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211030_032731_643499_2C7EF201 
X-CRM114-Status: GOOD (  32.83  )
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

On Thu, Oct 28, 2021 at 8:28 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 28 Oct 2021 11:55:23 +0100,
> Nikita Shubin <nikita.shubin@maquefel.me> wrote:
> >
> > Hello Marc and Guo Ren!
> >
> > On Mon, 25 Oct 2021 11:48:33 +0100
> > Marc Zyngier <maz@kernel.org> wrote:
> >
> > > On Sun, 24 Oct 2021 02:33:03 +0100,
> > > guoren@kernel.org wrote:
> > > >
> > > > From: Guo Ren <guoren@linux.alibaba.com>
> > > >
> > > > When using "devm_request_threaded_irq(,,,,IRQF_ONESHOT,,)" in the
> > > > driver, only the first interrupt could be handled, and continue irq
> > > > is blocked by hw. Because the thead,c900-plic couldn't complete
> > > > masked irq source which has been disabled in enable register. Add
> > > > thead_plic_chip which fix up c906-plic irq source completion
> > > > problem by unmask/mask wrapper.
> > > >
> > > > Here is the description of Interrupt Completion in PLIC spec [1]:
> > > >
> > > > The PLIC signals it has completed executing an interrupt handler by
> > > > writing the interrupt ID it received from the claim to the
> > > > claim/complete register. The PLIC does not check whether the
> > > > completion ID is the same as the last claim ID for that target. If
> > > > the completion ID does not match an interrupt source that is
> > > > currently enabled for the target, the ^^ ^^^^^^^^^ ^^^^^^^
> > > > completion is silently ignored.
> > >
> > > Given this bit of the spec...
> > >
> > > > +static void plic_thead_irq_eoi(struct irq_data *d)
> > > > +{
> > > > + struct plic_handler *handler =
> > > > this_cpu_ptr(&plic_handlers); +
> > > > + if (irqd_irq_masked(d)) {
> > > > +         plic_irq_unmask(d);
> > > > +         writel(d->hwirq, handler->hart_base +
> > > > CONTEXT_CLAIM);
> > > > +         plic_irq_mask(d);
> > > > + } else {
> > > > +         writel(d->hwirq, handler->hart_base +
> > > > CONTEXT_CLAIM);
> > > > + }
> > > > +}
> > > > +
> > >
> > > ... it isn't obvious to me why this cannot happen on an SiFive PLIC.
> >
> > This indeed happens with SiFive PLIC. I am currently tinkering with
> > da9063 RTC on SiFive Unmatched, and ALARM irq fires only once. However
> > with changes proposed by Guo Ren in plic_thead_irq_eoi, everything
> > begins to work fine.
> >
> > May be these change should be propagated to plic_irq_eoi instead of
> > making a new function ?
>
> That's my impression too. I think the T-Head defect is pretty much
> immaterial when you consider how 'interesting' the PLIC architecture
> is. Conflating EOI and masking really is a misfeature...

Unfortunately, the PLIC implementation is the same across existing
boards (except T-HEAD) so this issue is there on all existing boards.

I double checked the upcoming RISC-V AIA specification and this
problem is not there in RISC-V AIA because the interrupt claim/completion
is different.
(Refer, https://github.com/riscv/riscv-aia/releases/download/0.2-draft.27/riscv-interrupts-027.pdf)

I plan to send-out RFC PATCH for AIA soon so that we get early
feedback from everyone on LKML.

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

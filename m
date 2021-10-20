Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93607C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 16:19:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49293611B0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 16:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 49293611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1OU+OBrYXmV7w9X22XiBpxcy1YrF3BOl8tePAk/Lyeg=; b=O0Pg7Zpy4J9L5W9VzCX7q4D3R6
	GLzJCEbmF1SWQTV6L+7smpFUBFImRkGyC7HhEtAo5WsdGYKGxEkSO1eZLzdZw5M5LWYKqD5TGt6Z9
	TKLMoCdb05UGfH8kQ5bwe0xIAimGLE6sWq8RJOfWKBdP5Uzp88YAnspSCQk+erhzpy44/V1qow/vJ
	A0C4dcNoVtMYMy36fRK7FzyZamtBAnM77W8KMkQKXfhIGf9fiXDMRkDk2DAZu6cpQY33R1oRhaSiJ
	hWjYuz9lppJQhXJqCLLDjoVR0p1GV66G7IBQvSEHBAEW32LlddBcQuCWa1w6qRn6SY/6ELsUXBl8J
	JAOCNNEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdEIp-005Ddr-0c; Wed, 20 Oct 2021 16:18:55 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdEIl-005Dcw-Pf
 for linux-riscv@lists.infradead.org; Wed, 20 Oct 2021 16:18:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 o24-20020a05600c511800b0030d9da600aeso11478893wms.4
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 09:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=RpDaphKaULN4/89C8L4bD1DcIqBybhRsQBUxIBBeNZg=;
 b=kUprcAR2htHrBKfjlDZ75+0TfgTGJ7mUB2W2QoT1ebBXuZD6CgaBOHQ0sskcNqyspB
 Ce+zCkoQFhHtOwwsxQ/jWh91yCUs2nHQfdFUsX54h+heArdNsQ1Wi1ldGyoC3/L0IHpb
 /GwAowqyK7TbukDad86HgttnmD+4wS91cVvUsf9gplFAeUCzC0Yom30tl6QRAX6wGULq
 0O/SjmaEXWNmktVuNeSyXNmT5n4QuKYGlIgjY+F5Qqm7YJA0W1Z4xBwXdQjXdB7fSCRR
 ZdAl8702GCr07s39QjoOwUmNmHduGyLNBH7hD9GF4YzhvkS3imn038m5AeEXmW3ZWLeH
 b7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=RpDaphKaULN4/89C8L4bD1DcIqBybhRsQBUxIBBeNZg=;
 b=I8zIL/LXGBBSKHcldGCJqodA9ykuZN3jwlPj8qKEtNil/CgabGXV+GUKiVoLyh1NL/
 23AzGJy4wdTH0shW7K3ceW8+/jt1kTXzp/hwV/dVcGxV6JEYHr1NFYT09xkI9TpZ6GaL
 r93QUXquIVuLpUXltaovWPBxhEDGUKdyvrVAPAxh9PJB7Z8q8VWZT0JbHAlJcwSAQ8s0
 nlE8jttbi+gNuyrOSSmveMI2Y5F6KzaMBR80u2e6F4j2Wy889Rv5dJ87MDNAnVWPTmd6
 Pgekevmdp+onedIQ1k11TfiV5PswltdYv+VEeFtSTqmjof1DV3swUvAzllszpN1k9zD3
 cFyg==
X-Gm-Message-State: AOAM532oj/lyFj82f9eJ9/zACfLNVEUtr03uU3XCEa8RyXOLRX6lHJzp
 DQ48VDC5US9T0HsbtgytgW9M3pYxaPRtjaXv44wQyGi/7As=
X-Google-Smtp-Source: ABdhPJwLBRyQtWG7x7CWXuH1W3s6K3jBd6D+Z46Mv0MN16GIwgS2GF3/OsPoN2Fr1EXpMi48GJkBydY5lP97XUbFXC0=
X-Received: by 2002:a5d:5849:: with SMTP id i9mr167911wrf.331.1634746728173;
 Wed, 20 Oct 2021 09:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211016032200.2869998-1-guoren@kernel.org>
 <20211016032200.2869998-2-guoren@kernel.org>
 <8be1bdbd-365d-cd28-79d7-b924908f9e39@sholland.org>
 <f850af365f2ac77af79ec59f92e6434a@kernel.org>
 <CAJF2gTShT8Tvk0z6B52zKEi0vq_toc-7mAKWFKj3j-zg=OhpYQ@mail.gmail.com>
 <8735oxuxlq.wl-maz@kernel.org>
 <CAJF2gTSmyu9nA5M3QLeR1LdGMkeGb7jE93Z9zjixcpb_freLMw@mail.gmail.com>
 <875ytrddma.wl-maz@kernel.org>
 <CAJF2gTRfBxXnG57Y+9z0O+GfwgoB9POmb=HL=CMCpu=uwfYY3w@mail.gmail.com>
 <YXAu7OS82G1k28bZ@bruce.bluespec.com>
In-Reply-To: <YXAu7OS82G1k28bZ@bruce.bluespec.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 20 Oct 2021 21:48:36 +0530
Message-ID: <CAAhSdy1FS+rTO8JWfqKVMLPBUOzmy0d5D1s=psfxbm4s6QrBCA@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] irqchip/sifive-plic: Add thead,c900-plic support
To: Guo Ren <guoren@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@wdc.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_091851_860616_25652542 
X-CRM114-Status: GOOD (  30.85  )
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

On Wed, Oct 20, 2021 at 8:29 PM Darius Rad <darius@bluespec.com> wrote:
>
> On Wed, Oct 20, 2021 at 10:19:06PM +0800, Guo Ren wrote:
> > On Wed, Oct 20, 2021 at 9:34 PM Marc Zyngier <maz@kernel.org> wrote:
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
> > Here is the description of Interrupt Completion in PLIC spec [1]:
> >
> > The PLIC signals it has completed executing an interrupt handler by
> > writing the interrupt ID it received from the claim to the claim/complete
> > register. The PLIC does not check whether the completion ID is the same
> > as the last claim ID for that target. If the completion ID does not match
> > an interrupt source that is currently enabled for the target, the
> >                                       ^^ ^^^^^^^^^ ^^^^^^^
> > completion is silently ignored.
> >
> > [1] https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc
> >
> > Did we misunderstand the PLIC spec?
> >
>
> That clause sounds to me like it is due to the SiFive implementation, which
> the RISC-V PLIC specification is based on.  Since the PLIC spec is still a
> draft I would expect it to change before release.

The SiFive PLIC has been adopted by various RISC-V platforms (including
SiFive themselves). Almost all existing RISC-V boards have PLIC as the
interrupt controller.

Considering the wide usage of PLIC across existing platforms, the RISC-V
International has adopted it as an official RISC-V non-ISA spec. Of course,
the RISC-V PLIC spec needs to follow the process for RISC-V non-ISA spec
but changing the RISC-V PLIC spec now would mean all existing RISC-V
platforms will become non-compliant.

The RISC-V AIA spec is intended to replace the RISC-V PLIC spec as the
new interrupt controller spec for future RISC-V platforms.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

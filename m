Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94458C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 08:47:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5496361038
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 08:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5496361038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1IiVX4w/qa4mJ24jkVMjwIrB7DXm8AILjNQikSfA+Go=; b=lAdHzN4VySxyaykA8DpMq6BuO7
	Ik1cZSnCjOFhDj6ZbM7qA8oIHcRRP3q5pDCPd4p33ycPcNCs4JgZmTxVQd6q4U9o161l21JWJ5Uwa
	R3KvupXlLW6+LY75q63mba7AtiXKuMRfCuFYeWbtHLAplQ4ZJFmrPxamZOpsaqPQTLH7j4eKXRQUO
	kcOyLc+9eYFxZQmFNhQOC3U1r8zwc8eiTAdVae51K+8ttQCLfYLeDQcET/WXuMaU3yZhfOZ8awBlk
	xTLD/IQ9F/QjywNSn8fkzYUyScQCplAgQsRDUYwit1V/FRejoWfFcj1zNoTcqE4wQAW6yIU3V+OaI
	t5xvPDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdTjV-006toY-KY; Thu, 21 Oct 2021 08:47:29 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdTjL-006tkn-W5
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 08:47:22 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso13923wmb.3
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 01:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=paZl2g6HHY69VKf6Y8X+ghPjPvGR1ETeK09s2XBFvzg=;
 b=AciGL0quv1VLtQW8hKxFL4HSl9/34w7CeQuR12Hl+p34yqNCMk9z84Cib3F9Q5c0xW
 sg9QrDE1X+4YdwHQqqNTlVITcKZ4BB3y2q2KvkHdYbcIBIJg+BLniONjI4JhKzhMzDwj
 XWT1bpjrr0fdmoyXtlwuCTYCmNpgw9HJcdiZDxJt26jTTtKl2AP7/daU9pu1uOXJ7+AU
 NpfSyWY9OmMBiEavA3XKZoUmp8UnpazdrWMrF6B5cW+xSC3bIuYZVuiO8OtrHZg+fgnM
 V8f4Fygp9ncNaa/oeZaFeNjjS/Nay3kBDMUSsT2u1XVXxP3t/kfO/GS7SWarZVrhzFIg
 TF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=paZl2g6HHY69VKf6Y8X+ghPjPvGR1ETeK09s2XBFvzg=;
 b=zVn9pJUjwNMTKjjoBPS3d9tl+bW0jtQw1b3hDjY+zO8/wopZ0DNIBno7U2j5OAmPMg
 XBK15QlxLkYyz+ntgSVZNRvkLZAKD6+928NuE2u/tKk3AAzBOoAW1EK5VaGUB9ZV9xA8
 wqsv2Hxl/5Zql+TK4Z9YAuQbwGDYLTkRvahddI6NSVaGc7XUFcVxlduaAi7VZU4lYllI
 FeZDVYwpxLud5m3RIrYXXDxYNOtrITC2CgHDrK+ha2lMGDyX50gRJUYlr9jUIyApBUaQ
 r/carMp9tPHwPjNbDgWk0h8p0hpl0mGRGjiqYa2k107Diu5me+2qOuqeHsKhjJ9gkESb
 mJ6w==
X-Gm-Message-State: AOAM5323oSjvhEdN3vWByohCphrijEddqsSol013uLUtQlM4UOvqtVsH
 /qIaffDg5NCzXtpVTGCoDyabT+jklXwiEDYlVHfhS0Gc9wq3PA==
X-Google-Smtp-Source: ABdhPJyWK2AbuighiygWHPrsWyJw2Y9IobM9qXRytPdIIPHY4IxfMYmXnY9s2QCAxyVM0AeaP1ZHum6tGnKdWRnMxHk=
X-Received: by 2002:a05:600c:4111:: with SMTP id
 j17mr19602240wmi.59.1634806037719; 
 Thu, 21 Oct 2021 01:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211016032200.2869998-2-guoren@kernel.org>
 <8be1bdbd-365d-cd28-79d7-b924908f9e39@sholland.org>
 <f850af365f2ac77af79ec59f92e6434a@kernel.org>
 <CAJF2gTShT8Tvk0z6B52zKEi0vq_toc-7mAKWFKj3j-zg=OhpYQ@mail.gmail.com>
 <8735oxuxlq.wl-maz@kernel.org>
 <CAJF2gTSmyu9nA5M3QLeR1LdGMkeGb7jE93Z9zjixcpb_freLMw@mail.gmail.com>
 <875ytrddma.wl-maz@kernel.org>
 <CAJF2gTRfBxXnG57Y+9z0O+GfwgoB9POmb=HL=CMCpu=uwfYY3w@mail.gmail.com>
 <YXAu7OS82G1k28bZ@bruce.bluespec.com>
 <CAAhSdy1FS+rTO8JWfqKVMLPBUOzmy0d5D1s=psfxbm4s6QrBCA@mail.gmail.com>
 <YXBZlrz2ythccKp0@bruce.bluespec.com>
In-Reply-To: <YXBZlrz2ythccKp0@bruce.bluespec.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 21 Oct 2021 14:17:05 +0530
Message-ID: <CAAhSdy29uw75n1nCJB9Zxs667Nx-Er3EFeGTja2SGuU1S7s57A@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] irqchip/sifive-plic: Add thead,c900-plic support
To: Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
 Marc Zyngier <maz@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Atish Patra <atish.patra@wdc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_014720_082820_A961569C 
X-CRM114-Status: GOOD (  37.29  )
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

On Wed, Oct 20, 2021 at 11:32 PM Darius Rad <darius@bluespec.com> wrote:
>
> On Wed, Oct 20, 2021 at 09:48:36PM +0530, Anup Patel wrote:
> > On Wed, Oct 20, 2021 at 8:29 PM Darius Rad <darius@bluespec.com> wrote:
> > >
> > > On Wed, Oct 20, 2021 at 10:19:06PM +0800, Guo Ren wrote:
> > > > On Wed, Oct 20, 2021 at 9:34 PM Marc Zyngier <maz@kernel.org> wrote:
> > > > >
> > > > > On Tue, 19 Oct 2021 14:27:02 +0100,
> > > > > Guo Ren <guoren@kernel.org> wrote:
> > > > > >
> > > > > > On Tue, Oct 19, 2021 at 6:18 PM Marc Zyngier <maz@kernel.org> wrote:
> > > > > > >
> > > > > > > On Tue, 19 Oct 2021 10:33:49 +0100,
> > > > > > > Guo Ren <guoren@kernel.org> wrote:
> > > > > > >
> > > > > > > > > If you have an 'automask' behavior and yet the HW doesn't record this
> > > > > > > > > in a separate bit, then you need to track this by yourself in the
> > > > > > > > > irq_eoi() callback instead. I guess that you would skip the write to
> > > > > > > > > the CLAIM register in this case, though I have no idea whether this
> > > > > > > > > breaks
> > > > > > > > > the HW interrupt state or not.
> > > > > > > > The problem is when enable bit is 0 for that irq_number,
> > > > > > > > "writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM)" wouldn't affect
> > > > > > > > the hw state machine. Then this irq would enter in ack state and no
> > > > > > > > continues irqs could come in.
> > > > > > >
> > > > > > > Really? This means that you cannot mask an interrupt while it is being
> > > > > > > handled? How great...
> > > > > > If the completion ID does not match an interrupt source that is
> > > > > > currently enabled for the target, the completion is silently ignored.
> > > > > > So, C9xx completion depends on enable-bit.
> > > > >
> > > > > Is that what the PLIC spec says? Or what your implementation does? I
> > > > > can understand that one implementation would be broken, but if the
> > > > > PLIC architecture itself is broken, that's far more concerning.
> > > >
> > > > Here is the description of Interrupt Completion in PLIC spec [1]:
> > > >
> > > > The PLIC signals it has completed executing an interrupt handler by
> > > > writing the interrupt ID it received from the claim to the claim/complete
> > > > register. The PLIC does not check whether the completion ID is the same
> > > > as the last claim ID for that target. If the completion ID does not match
> > > > an interrupt source that is currently enabled for the target, the
> > > >                                       ^^ ^^^^^^^^^ ^^^^^^^
> > > > completion is silently ignored.
> > > >
> > > > [1] https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc
> > > >
> > > > Did we misunderstand the PLIC spec?
> > > >
> > >
> > > That clause sounds to me like it is due to the SiFive implementation, which
> > > the RISC-V PLIC specification is based on.  Since the PLIC spec is still a
> > > draft I would expect it to change before release.
> >
> > The SiFive PLIC has been adopted by various RISC-V platforms (including
> > SiFive themselves). Almost all existing RISC-V boards have PLIC as the
> > interrupt controller.
> >
> > Considering the wide usage of PLIC across existing platforms, the RISC-V
> > International has adopted it as an official RISC-V non-ISA spec. ...
>
> You mean is in the process of adopting it, right?

Yes, it in the process.

>
> > ... Of course,
> > the RISC-V PLIC spec needs to follow the process for RISC-V non-ISA spec
> > but changing the RISC-V PLIC spec now would mean all existing RISC-V
> > platforms will become non-compliant.
> >
>
> I would expect the review process to produce a proper specification, rather
> than a verbatim copy of the SiFive datasheet, and clarify some ambgiuous
> and implementation specific language.  Clarifying the specification does
> not necessarily make all existing implementations non-compliant, as this
> has been done numerous times with other RISC-V specifications.

Yes, clarification can be definitely done.

Regards,
Anup

>
> > The RISC-V AIA spec is intended to replace the RISC-V PLIC spec as the
> > new interrupt controller spec for future RISC-V platforms.
> >
> > Regards,
> > Anup
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

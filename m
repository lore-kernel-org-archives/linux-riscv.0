Return-Path: <SRS0=oXW+=7N=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A43C433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 31 May 2020 10:06:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEC6E20707
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 31 May 2020 10:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fa0VSWcL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="gvLcAle4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEC6E20707
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2hPeXGDljymjoN8cxh2DsvjXD31g09/x8EqEDUlr2Cs=; b=fa0VSWcL8esjZ8lSWeAuCjnBv
	18LwvyF8XqK2BjT0FgM/BjShacP2f53DqfeSiNBZgmb0d9n1ediWcrUmydcnAa3Tfq7renubPA/ej
	nO7mNBBjZSLoMGxj/ymYuBNXqR0igKXzLKJEQigDoIMQ0dAu0SrdH2B8EbkZui3HZ3yCLSzg7QzDy
	dS4zfSEMiozw6g28BUSXz8QI74gAORin2obd4kCNd/E6w1tT7HuqfzbbjhQqjc0GXsQR1bu+0/7j3
	D7lRnnYaUNW9HUWmFAkv2SpSpdTDWx6tZ8jkREM7CRtYai7B1gSFZaiufH8WLK399veYmWaC0pF1W
	vhVCh5fug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfKrM-000837-3X; Sun, 31 May 2020 10:06:28 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfKrJ-00082H-Aa
 for linux-riscv@lists.infradead.org; Sun, 31 May 2020 10:06:26 +0000
Received: by mail-wm1-x343.google.com with SMTP id f5so8484792wmh.2
 for <linux-riscv@lists.infradead.org>; Sun, 31 May 2020 03:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2hPeXGDljymjoN8cxh2DsvjXD31g09/x8EqEDUlr2Cs=;
 b=gvLcAle4FOVMTZ4Ko1hxhk71DlaCLYZJAMxcJeowYNUkUwx9IiyifHx+bndCRzZa+e
 T5H7XF44coZYUmYSArfEgHOm2BkVqv/w21FT5IHjZ9JZvVbYbI22oNC4S2J+mBzeMvE+
 +sKfmYZQPInVjwtfuekdp7iKKZiPmjMgqnkTJPRCgYSVKKaPIGhKugNam2UiBQ4qjh2k
 YGOKYVpq13Sqx6O4BX4cXf5EZ4mK55gqpMJ7PhwFScqwrbXkOOUzFRstGmNdgBx1D/D+
 rBiVKbCiIwrY6F9YoMrI32gMWskoTNhNerRFVRonGWOCCg9KTzZANIj1ibLzxUxh2BBx
 ccdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2hPeXGDljymjoN8cxh2DsvjXD31g09/x8EqEDUlr2Cs=;
 b=iKr1OHSDLV7j3E15Ue7ybdFlscXlyTqNBVKt2H4eUI/vGg1mBxww9GZtY67C7N+Nyv
 NHqK46KOtX0G9DlGDYUeIslGNgp7G2+s8IwIlg3tFGaIbCYHFubbZheKdPbOQ2RlVpTx
 WU5dtVn6basrAtIHlVI068Ve3OJrlrQGf3HfA/15nYoTDNQtUR86e7nnjy+r/4+6FnKM
 ZZjffw2xE7S0fSEqLEvTub+EUq4HSAv3oOEmueRlWuAIlovNMiMuvLuG3f5yJcwLphdX
 kV1I1/n7tr1aEpLTsI5Ykx+XFGWxpPx/VJltufF3XnZbtRYmMjcCxo4epq1FIbbzPbBp
 Gieg==
X-Gm-Message-State: AOAM5300b0dZ0GX2DG6kDcdv7CTz/8NyW+j3mOtJQvNvZSKLmMC8XF5B
 phrI6yqvHXYN25KkfKvoN9cX1rHr9h4XQx/3fqTNsQ==
X-Google-Smtp-Source: ABdhPJxJ2FPXa9Nr1myO0y2r9HfyzVcfviGIX3PrtHiaVKQVCVHp/aGHpXMEGZ4xcyhSPC5dEdWerG/g610dIjt6hcw=
X-Received: by 2002:a1c:1b17:: with SMTP id b23mr16536717wmb.3.1590919580005; 
 Sun, 31 May 2020 03:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200530100725.265481-1-anup.patel@wdc.com>
 <20200530100725.265481-4-anup.patel@wdc.com>
 <cd4a5513197b73e3b8d335f09117bb8d@kernel.org>
 <CAAhSdy3cnZwnjpqWkixmZ5-fi=GK1cSUsjah=P3Yp5hjv382hg@mail.gmail.com>
 <a5f1346544aec6e6da69836b7a6e0a6e@kernel.org>
In-Reply-To: <a5f1346544aec6e6da69836b7a6e0a6e@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 31 May 2020 15:36:08 +0530
Message-ID: <CAAhSdy2fJ1cd2OjAWODOmSbkWUBfvvr4rvsTqh4qNxZjTTKo5A@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] irqchip: RISC-V per-HART local interrupt
 controller driver
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200531_030625_418552_52AE1BD4 
X-CRM114-Status: GOOD (  21.59  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, May 31, 2020 at 3:03 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-05-31 06:36, Anup Patel wrote:
> > On Sat, May 30, 2020 at 5:31 PM Marc Zyngier <maz@kernel.org> wrote:
>
> [...]
>
> >> >       plic_set_threshold(handler, PLIC_DISABLE_THRESHOLD);
> >>
> >> Why do you need to both disable the interrupt *and* change the
> >> priority
> >> threshold? It seems to be that one of them should be enough, but my
> >> kno9wledge of the PLIC is limited. In any case, this would deserve a
> >> comment.
> >
> > Okay, I will test and remove "disable the interrupt" part from
> > plic_dying_cpu().
>
> Be careful, as interrupt enabling/disabling is refcounted in order
> to allow nesting. If you only enable on CPU_ON and not disable
> on CPU_OFF, you will end-up with a depth that only increases,
> up to the point where you hit the roof (it will take a while though).
>
> I would keep the enable/disable as is, and drop the priority
> setting from the CPU_OFF path.

The PLIC threshold is like GICv2 CPU interface enable/disable.

Based on your comment, we should only program the PLIC threshold
in CPU_ON and don't touch the PLIC threshold in CPU_OFF. Right??

>
> >> >       return 0;
> >> > @@ -260,7 +266,11 @@ static int plic_starting_cpu(unsigned int cpu)
> >> >  {
> >> >       struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> >> >
> >> > -     csr_set(CSR_IE, IE_EIE);
> >> > +     if (plic_parent_irq)
> >> > +             enable_percpu_irq(plic_parent_irq,
> >> > +                               irq_get_trigger_type(plic_parent_irq));
> >> > +     else
> >> > +             pr_warn("cpu%d: parent irq not available\n");
> >>
> >> What does it mean to carry on if the interrupt cannot be signaled?
> >> Shouldn't you error out instead, and leave the CPU dead?
> >
> > The CPU is not dead if we cannot enable RISC-V INTC external
> > interrupt because the Timer and IPIs interrupts are always through
> > RISC-V INTC. The PLIC external interrupt not present for a CPU
> > only means that that CPU cannot receive peripherial interrupts.
> >
> > On a sane RISC-V system, if PLIC is present then all CPUs should
> > be able to get RISC-V INTC external interrupt. Base on this rationale,
> > I have put a warning for plic_parent_irq == 0.
>
> Fair enough.
>
>          M.
> --
> Jazz is not dead. It just smells funny...

Regards,
Anup


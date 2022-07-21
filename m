Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955C1C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 09:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kap01c3sDKU5UKvbCsLpJZKa0h3umkGU1GRrMcO1rU4=; b=rsXuxNbE92A7ph
	3fKpgSWQkhDwGdnR851kPhRuQox6CjRbRtcg5XydwEbwZgra1t1aRroIvAbyT2xvhBPuY1feFk42C
	d/infpqHEUXe+fK60vRwd9aL0h8mt1q5BFsleC+jj+ALYhlYcFog+H9E6+3Xo0cBvnzrd0jRfkgae
	qNWLezvyV1iId6Vmw7tXaBOIY4RXNZ4AB9SU8uGD3XMKyZ5mE/iMeXAyPme0ngxk0PbJ4lG38n35d
	pXNG+3xurveCqfQB2z+ceMaXAubFRyG71mJ03yt9oOPS945aPMpigZIDbrunArB/TG4fD8ubvpcN9
	FSQgKk/O7EO07CP5Wc/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESkk-003Tf7-Fs; Thu, 21 Jul 2022 09:45:54 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESkh-003TcP-Ix
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 09:45:53 +0000
Received: by mail-lj1-x230.google.com with SMTP id w2so1156565ljj.7
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 02:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rATgYaRc06yup3B9vQoeZCRxplvBjG7cGBY1+cZOcR0=;
        b=lQtaZPe4+cFvvzkekGvWGs1/h1VvwEnVqlZbeIzGv47QEApdtNWinAkHczWThbeHan
         y4WnW9ZrUXUfBtR8qo8nI7Ozu6RrqpmV4x/3IeBD3MHphexBmhZ7/pbDs6cWBB9oheQ7
         S8iLgkk9jKb1hQDQ2j+3N+X2gA+D8dNgr4pmct7Yl83DCkhuZTSCjJElFZLt4azjUr4w
         IlWV7OM/sK5olfXpXp8iWIIUkSdia7JwcOrMPlLHksQ+lxRkJ1x+XJ0CYMSxfj7T0LEb
         wx4V309mo09SWsr5yDhbNFYjIzNp6Nxeb9F9ChPy5Mj1XvUgFs3sCPEdDHyWcq4Li8+w
         MK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rATgYaRc06yup3B9vQoeZCRxplvBjG7cGBY1+cZOcR0=;
        b=IcUi9bhN9pHATkNrHYN3G+I+FKZqBe17DOXUZikAA5r7JbXRmJeXnZUyxNjt0kNPnm
         knmH4c57nGFSwgtmqDclClfqRFwT1mDmrjAMeoSjmEp/f5iYgFMEGPMKDGk0wL5Bu26O
         uLlS569bRkOwyjKu3qSUIfKdyyv6dO10Xwzp8yugndW1m+Ap/sb1bgWdra8u2nr4PQk7
         wSqUbAG9vzAfoDxQphe1jrNPAd/Z/pMLTJcBw1n5+Z2gkcCdoZwh02BVXND60e5An8Oc
         vKlfHduL0MOm7qeFCqJXvFqRmb/GB0BzaqixxcmUWTn1F8mspnUOT98dPuFdkVazCiXH
         iz2w==
X-Gm-Message-State: AJIora/v1FAV1RXyiVhIvavRw/BgmRIo7OkgEvcvj3wmxW/mZp65iwLX
	Nj/ak//1Ren6FycsSabo09oZOffwK7wSgoDFO7Dcxw==
X-Google-Smtp-Source: AGRyM1sB1eQ5rWzg3axoBKsTIsw/olo2zDoZljUFFhOhipu0awj1+20YmiCgzI410ZaVmMyLHQpqpg40o4F+tQWhxGU=
X-Received: by 2002:a05:651c:12cb:b0:25b:fa3f:c3f with SMTP id
 11-20020a05651c12cb00b0025bfa3f0c3fmr19485233lje.364.1658396747462; Thu, 21
 Jul 2022 02:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220719054729.2224766-1-apatel@ventanamicro.com>
 <20220719054729.2224766-3-apatel@ventanamicro.com> <315d9850-e660-f71e-2321-b0684f7df950@sholland.org>
In-Reply-To: <315d9850-e660-f71e-2321-b0684f7df950@sholland.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 21 Jul 2022 15:15:33 +0530
Message-ID: <CAK9=C2UZ_o+DJ3s0Q5ET43CYhfu8A4TTfosor1wyUdPO2mjn_g@mail.gmail.com>
Subject: Re: [PATCH 2/2] clocksource: timer-riscv: Set CLOCK_EVT_FEAT_C3STOP
 based on DT property
To: Samuel Holland <samuel@sholland.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_024551_659771_F8D73674 
X-CRM114-Status: GOOD (  32.52  )
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

On Tue, Jul 19, 2022 at 12:12 PM Samuel Holland <samuel@sholland.org> wrote:
>
> Hi Anup,
>
> On 7/19/22 12:47 AM, Anup Patel wrote:
> > We should set CLOCK_EVT_FEAT_C3STOP for a clock_event_device only when
> > riscv,timer-always-on DT property is not present for the corresponding
> > CPU.
>
> The timer maintaining its context (and continuing to count) during non-retentive
> CPU suspend is not sufficient to drop CLOCK_EVT_FEAT_C3STOP.
>
> Another requirement is that the timer interrupt is generated and routed outside
> the CPU's power/reset domain, to whatever hardware is responsible for turning
> the CPU back on. It does not matter if the timer interrupt fires, if that
> interrupt cannot wake up the CPU.
>
> So something closer to "riscv,timer-can-wake-cpu" would be a more accurate
> property name for how you are using it.

I agree with your suggestion. Let's make this DT property name aligned with
what it is doing.

>
> And even then, that ability is a property of the SBI implementation, not just
> the hardware. In the motivating example for the flag (Allwinner D1), the CLINT
> cannot wake the CPU from reset, but the SoC contains other MMIO timers that can.
> So the capability of the SBI timer extension depends on which timer hardware the
> SBI implementation chooses to use. So I am not sure that the property belongs in
> the CPU node.
>
> Maybe it makes sense to report this capability via a function in the SBI timer
> extension?

Well, the timer interrupt not firing in non-retentive suspend is an attribute of
underlying platform and not of the SBI implementation (firmware/hypervisor)
hence should be described in DT or ACPI.

Also, the timer interrupt not firing in non-retentive suspend is also possible
with RISC-V Sstc extension (i.e stimecmp CSRs) so the proposed DT
property will be useful for platforms with Sstc extension as well.

Regards,
Anup

>
> Regards,
> Samuel
>
> > This way CLOCK_EVT_FEAT_C3STOP feature is set for clock_event_device
> > based on RISC-V platform capabilities rather than having it set for
> > all RISC-V platforms.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  drivers/clocksource/timer-riscv.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> > index 593d5a957b69..3015324f2b59 100644
> > --- a/drivers/clocksource/timer-riscv.c
> > +++ b/drivers/clocksource/timer-riscv.c
> > @@ -34,7 +34,7 @@ static int riscv_clock_next_event(unsigned long delta,
> >  static unsigned int riscv_clock_event_irq;
> >  static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
> >       .name                   = "riscv_timer_clockevent",
> > -     .features               = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_C3STOP,
> > +     .features               = CLOCK_EVT_FEAT_ONESHOT,
> >       .rating                 = 100,
> >       .set_next_event         = riscv_clock_next_event,
> >  };
> > @@ -65,9 +65,13 @@ static struct clocksource riscv_clocksource = {
> >  static int riscv_timer_starting_cpu(unsigned int cpu)
> >  {
> >       struct clock_event_device *ce = per_cpu_ptr(&riscv_clock_event, cpu);
> > +     struct device_node *np = of_get_cpu_node(cpu, NULL);
> >
> >       ce->cpumask = cpumask_of(cpu);
> >       ce->irq = riscv_clock_event_irq;
> > +     if (!of_property_read_bool(np, "riscv,timer-always-on"))
> > +             ce->features |= CLOCK_EVT_FEAT_C3STOP;
> > +     of_node_put(np);
> >       clockevents_config_and_register(ce, riscv_timebase, 100, 0x7fffffff);
> >
> >       enable_percpu_irq(riscv_clock_event_irq,
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

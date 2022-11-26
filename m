Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B96CC4167B
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 16:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uUC35rintWjnZvgUEP0czn4MjpBk3jwbqINPA1LrJnU=; b=Z+VMZ3fl+UQ9gr
	sBuA8QAGOoAhNUoB+5s+3i6TkMuqM0NQEt4pgesZgu6ZQi3oNWuBMCM2w5W1LTyGPkbxaYu347qTy
	C+QFcN9QR7EFnhh/h15ghDFT+DqhSpY3VId1CkS3uT71Put5RG61HSJyq3fxjTfAHenWl+YOZ01gm
	Tkk3qOsU/UOMEeNVl89rArGukmMxomb/M5W43vZNLrhbh/g6LoZ3GKT0JlTB4ZLW1N8uVxe8DeH8Q
	BacbsbNNJ/M3FhYwb6eApjwfpceKxGmO/4vpebyBmpwaiLLLRreA/1wEjZ2EtEo+W0l3oPu7nH1pU
	JBe/VEWeGb0anUy3DSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyxbl-0071MC-Ls; Sat, 26 Nov 2022 16:00:49 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyxbi-0071Jm-Pv
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 16:00:48 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-141ca09c2fbso8380193fac.6
        for <linux-riscv@lists.infradead.org>; Sat, 26 Nov 2022 08:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wpP6JR3ohpFtxNxi+eQL8kVyFvR7jXdT/GTV32yyhaQ=;
        b=kofHMRzIYR+4yok+psbGjNw6OL2V8qRtJW6d0Tb9Z/tdOqPn3OkZQFgFAOnI0+F6Lk
         Nuyvd+wJ3W5mJlTQjlXEBngB5lzzs2FHj8YXcBEnudGLl6kb+JsE08kpBoQr/MVfU3Tq
         VVHMJKNaIto1H7BzgeGp4q3Oa+A5rwYyGS3P59UiBUHRNkZq+4QyFz2rzdQGhVWP7v8a
         ku6Ko8H8ZWWhjK+gazLuQ/3gPbOm8ipfNZefedBKHyikDJ9a4DP8aF2AEWgEX8lI/zhG
         Ocl6hMJmT+4jiwhoWivL82vx8XQNIk+11ka59vd1gSkK+7BVfGX9aypZaHDQwXzZNpbo
         HDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wpP6JR3ohpFtxNxi+eQL8kVyFvR7jXdT/GTV32yyhaQ=;
        b=1VTCiIHIsphqRV100cXh1ApoKnLjN6q2TJw5fX3Uek0ZGO91E9KLtI9jd161oOn+b6
         iluTRYAs9NmLWVseyAoLBM/YHu0LUH5xkoXoHZZOrUQAyBYmKTeD9PWGh82xxQsXUYoB
         7xTPDaquRtRiy3S0mNF4G79XUpM+dTBWFkYT91M3AG7j1crPbxeI+fFTXBFXicr52dW1
         22jzLxBhjLqd09D9EKrC3uRh0wjaNvFQP0HOmyZyBaGc6BueUW5xc5576GjSKHPhGqdk
         C7NttL5Tfz8YsT03Odcbmq0klBgtlkKSVMP9BbYm1Webo+vid84G7Gcnujp7BxCuiA+o
         S6Mg==
X-Gm-Message-State: ANoB5pkHlLyBtSyRE+/9rGnA4Ovh9CsjxJYMhvdDyDrIVv9lH5cOIWXa
	Q0pmAEyXawqp/RGkSDHtFDkQIc5yr8DjUu2s2Y9ZiQ==
X-Google-Smtp-Source: AA0mqf5T3W5wYZEA20m4aqdjFwdIOFOK3DoSU1V4DKJiwp6OUmqa/TjZw9wDOAtKYpyETFIWvYiKOJF6IpYeCCkFUPE=
X-Received: by 2002:a05:6870:3b0a:b0:142:ff0f:3db with SMTP id
 gh10-20020a0568703b0a00b00142ff0f03dbmr14192735oab.17.1669478442429; Sat, 26
 Nov 2022 08:00:42 -0800 (PST)
MIME-Version: 1.0
References: <20221114093904.1669461-1-apatel@ventanamicro.com>
 <20221114093904.1669461-4-apatel@ventanamicro.com> <87y1rxubty.wl-maz@kernel.org>
 <CAK9=C2UeMVnMBKOgO_nseUZnmvG+CUu7xaRXtt6j3Esr+ap04g@mail.gmail.com> <87sfi5u6wx.wl-maz@kernel.org>
In-Reply-To: <87sfi5u6wx.wl-maz@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 26 Nov 2022 21:30:31 +0530
Message-ID: <CAK9=C2V351pAjjP4pkrOuUDzOv1xBKO7+iJvPJgQ2swoBFo=8w@mail.gmail.com>
Subject: Re: [PATCH v11 3/7] genirq: Add mechanism to multiplex a single HW IPI
To: Marc Zyngier <maz@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Atish Patra <atishp@atishpatra.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_080046_866910_A8AFED89 
X-CRM114-Status: GOOD (  29.50  )
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

On Sat, Nov 26, 2022 at 7:58 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sat, 26 Nov 2022 13:31:46 +0000,
> Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > On Sat, Nov 26, 2022 at 6:12 PM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Mon, 14 Nov 2022 09:39:00 +0000,
> > > Anup Patel <apatel@ventanamicro.com> wrote:
> > > >
> > > > +struct ipi_mux_control {
> > > > +     void                            *data;
> > > > +     unsigned int                    nr;
> > >
> > > Honestly, I think we can get rid of this. The number of IPIs Linux
> > > uses is pretty small, and assuming a huge value (like 32) would be
> > > enough. It would save looking up this value on each IPI handling.
> >
> > I had kept in-case some driver wanted to create fewer (< 32)
> > muxed IPIs.
>
> I'm fine with being able to specifying the max, but I'm not sure there
> is a need to keep track of it any further. Certainly, the overhead of
> loading this value on each IPI could be removed. On most architecture,
> for_each_set_bit() and co and better optimised with a fixed number of
> bits.

Okay, I will update like you suggested.

>
> > > > +static const struct irq_chip ipi_mux_chip = {
> > > > +     .name           = "IPI Mux",
> > > > +     .irq_mask       = ipi_mux_mask,
> > > > +     .irq_unmask     = ipi_mux_unmask,
> > > > +     .ipi_send_mask  = ipi_mux_send_mask,
> > > > +};
> > >
> > > I really think this could either be supplied by the irqchip, or
> > > somehow patched to avoid the pointless imux->ops->ipi_mux_send
> > > indirection. Pointer chasing hurts.
> >
> > Once we remove ipi_mux_pre/post_handle() callbacks, the
> > "ops" will be pointless and we will be able to remove one level
> > of indirection here.
> >
> > We certainly need a mux irqchip to implement the
> > mask/unmask semantics for muxed IPIs.
>
> I'm not disputing that last point.
>
> > > > +/**
> > > > + * ipi_mux_create - Create virtual IPIs multiplexed on top of a single
> > > > + * parent IPI.
> > > > + * @parent_virq:     virq of the parent per-CPU IRQ
> > > > + * @nr_ipi:          number of virtual IPIs to create. This should
> > > > + *                   be <= BITS_PER_TYPE(int)
> > > > + * @ops:             multiplexing operations for the parent IPI
> > > > + * @data:            opaque data used by the multiplexing operations
> > >
> > > What is the use for data? If anything, that data should be passed via
> > > the mux interrupt. But the whole point of this is to make the mux
> > > invisible. So this whole 'data' business is a mystery to me.
> >
> > This is added only to pass back driver data in ipi_mux_send().
>
> Again, what is the purpose of such data? If you need per-interrupt
> data, this should be provided by the requester of the interrupt.

Currently, the irqchip drivers that we care about don't need this
data pointer so I will remove it. If required we can add it in future.

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

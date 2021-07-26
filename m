Return-Path: <SRS0=HVPl=MS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53414C4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 15:22:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01B9E60F51
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 15:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01B9E60F51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72EmplstPzFmW2MSM0Jg3qrQRWldnDv8L/vTEl8bWU8=; b=0DP/os55CDMBI4
	pSUvq/THerMDfg73k0sTi5O8RDRinHRs5clxVm2GnvnouArdpLxdJEQTftkqUhQR3wnsdVksVFxum
	WwFPYS4T0gPzWY47tY/U3GPYWD/0kUHhngrNf5GGy3hFkO+xJG8nnG/OkyIWgjRyNuJ/w89lzmWEL
	VgBr+AFHTofYVORETUvvPZDDSau2w815VR5GqFBp4haC3u+7YOX9eUaa/TxcU9LD39fbaJNa+alw7
	xdYZmVRV83v1EkF+YnzvnDpZwS83AlsuKjhM8GMH8O2eUdrTOSR0KVFgWhVoWm3fg4P1ZKsqPfU0M
	WpraFGW8xoWESpR2Zsdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m82RC-00Bl4B-Be; Mon, 26 Jul 2021 15:22:38 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m82R9-00Bl3i-Mu
 for linux-riscv@lists.infradead.org; Mon, 26 Jul 2021 15:22:37 +0000
Received: by mail-wr1-x433.google.com with SMTP id b7so11552233wri.8
 for <linux-riscv@lists.infradead.org>; Mon, 26 Jul 2021 08:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=avDShFOnRifoiKTiQKCeIkAP138nxzPrnp0tkIoBLys=;
 b=LG0MkcBw3Z8/VwJ4qdyP2VQUN3bST3lAmhEB7ChPfdR1gEwwIuYBgiN/RXIjg2IypI
 JZDI6pM94yYdb1m7jGnbk6OK7ppwXgVaqF/AuCaSXl/V69s/EC3aevtYsFPQ8DCWHhbJ
 BDHi2MYfoFNrbPwhrvKoLCDgNAXqXIZUQQiZMoNwUmOOPaUsa2liD2V59LICIMvMzkHV
 WC1XX9f/bx5A6PU0H7krRq+N/59uSo18rJuCA5QO1oaObAt2braN1ZHR3n/c80akk5vN
 elUrX0N53yel+hJ+nLwZZFsXE1M7kQiaLEs6O8SYeKxPpxIEv/qOSHM4+dKv7BXK9niZ
 3c0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=avDShFOnRifoiKTiQKCeIkAP138nxzPrnp0tkIoBLys=;
 b=MrkcxjUyhvORJh85fYAfpsPe+u7Q4y1/XyhFNmB98as8T7GtQKRfNY1zLsCIGlr5jv
 p55Fo8ZsW3Abz0ub++Z1yLKj/AuFPmCWky7arWllBOdTi8K5QtBVyL53XwjKL4u4eZUt
 Zxk7lMPnscpopG9y8onGm+KqIWX5yLfpl3PpV/LDNFax7AjSRkOjpl7xz6e09Zotu7VD
 5VhrFjFNSWnYITecXUFFMWWgizuUwvsbePRbdyJCZHuruKeI921ftBYJNH2fm/7vAH0Z
 q7Ep4tou29aKYU0Oa/QPnUfOWS9XOUnAxBkSM5PjQPWx5F0vg5By9q8aigMdyvUQVmgc
 srGw==
X-Gm-Message-State: AOAM5329UQrJW1sUaVWcCJszkzH+uzA4ABQu6wTH05x5rmiOolNPcJ7c
 CTINN2Bm2AdCSPtYNQSqfXoZk3CFaU/zGa52q/TC4g==
X-Google-Smtp-Source: ABdhPJxS1dRI/OSfH5W9DS2t09aCkQ4v/mCbJyOLuy5wMIvH2nM9dj7G3bhhBdXNRi0ux2I+OSdKyT7lKWDbq822IjU=
X-Received: by 2002:a5d:424d:: with SMTP id s13mr10302527wrr.356.1627312954415; 
 Mon, 26 Jul 2021 08:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210618123851.1344518-1-anup.patel@wdc.com>
 <20210618123851.1344518-3-anup.patel@wdc.com>
 <87lf5tdw9z.wl-maz@kernel.org>
In-Reply-To: <87lf5tdw9z.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Jul 2021 20:52:23 +0530
Message-ID: <CAAhSdy3tLNPsdLEW2zSqFSUS5iuoVCLrcmwQkcw4w75DPHXUyw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/11] RISC-V: Use common print prefix in smp.c
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, Bin Meng <bmeng.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_082235_797166_7FF8871B 
X-CRM114-Status: GOOD (  23.27  )
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

On Mon, Jul 26, 2021 at 7:14 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 18 Jun 2021 13:38:42 +0100,
> Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We add "#define pr_fmt()" in smp.c to use "riscv:" as common
> > print prefix for all pr_xyz() statements in this file.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >  arch/riscv/kernel/smp.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> > index 547dc508f7d1..eea0c9d11d9f 100644
> > --- a/arch/riscv/kernel/smp.c
> > +++ b/arch/riscv/kernel/smp.c
> > @@ -8,6 +8,7 @@
> >   * Copyright (C) 2017 SiFive
> >   */
> >
> > +#define pr_fmt(fmt) "riscv: " fmt
> >  #include <linux/cpu.h>
> >  #include <linux/clockchips.h>
> >  #include <linux/interrupt.h>
> > @@ -114,7 +115,7 @@ static void send_ipi_mask(const struct cpumask *mask, enum ipi_message_type op)
> >       if (ipi_ops && ipi_ops->ipi_inject)
> >               ipi_ops->ipi_inject(mask);
> >       else
> > -             pr_warn("SMP: IPI inject method not available\n");
> > +             pr_warn("IPI inject method not available\n");
> >  }
> >
> >  static void send_ipi_single(int cpu, enum ipi_message_type op)
> > @@ -126,7 +127,7 @@ static void send_ipi_single(int cpu, enum ipi_message_type op)
> >       if (ipi_ops && ipi_ops->ipi_inject)
> >               ipi_ops->ipi_inject(cpumask_of(cpu));
> >       else
> > -             pr_warn("SMP: IPI inject method not available\n");
> > +             pr_warn("IPI inject method not available\n");
>
> "SMP:" made a lot more sense. I assume that the user knows that they
> are using a RISC-V machine. On the other hand, seeing a "SMP:" prefix
> for a message indicates the provenance of the message.
>
> I honestly don't see the point in this change.

The intention was to distinguish arch specific prints from
generic kernel prints at boot-time because "SMP: " prefix
was not making it obvious that these are arch specific prints.

I am certainly fine dropping this patch as well.

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

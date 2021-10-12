Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62878C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 14:08:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E488660EFE
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 14:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E488660EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYk2xZYhVh/m8qYXdz/cxb95f50Mp8sY3MlaSSpkYsQ=; b=DEhSvwPQpNosrv
	p/r2nCVL2f3IeNnfV1ZaegyXRMvIJsuve1hZtTGKYPr7FqoOMFs0M8U55SPLSMqZqvYOpYR+o+pBR
	/7ZHpZjC6/fQYdcrhKIjC3m7gPdgq00pIcbmSe8WQWZ7jObvT+LbGOYmlA6FDxTqQ4bzEUFtFBq/9
	2DjzkqKPxx0F85TVOBQm+c7XK2M/kRo5AjaL51cVc/H6eJcv3C2Wp0is5eS8KSDr8OOrz2BNhfs/G
	tp9mCf95W/4VU+alIp38k1Etvo0Xo6p2y+PO/DdJQFjtwHprG1cpduQP1TEXFEwb/UsbCUnTHHlLA
	9VBh6ALE/BAFFgmnDPng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maISJ-00D8SG-7g; Tue, 12 Oct 2021 14:08:35 +0000
Received: from mail-pg1-f171.google.com ([209.85.215.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maISG-00D8Qj-GV
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 14:08:34 +0000
Received: by mail-pg1-f171.google.com with SMTP id a73so14033571pge.0
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 07:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P3TH6V659MxdOd+Pk6btaCI+yJuhu8J1R8RRJ47agS4=;
 b=Nm4DhGd8ZV3I/VKtgbD9SQhk014SSAhfQPvh3MSdkh4LCGjF7vG9f61mpNejBRKWLx
 YM3ULnlSrKxslo7VG981BK/EPALshmi7LdR//erIxAhDq2uZFaKVrSx8pEuf21+Qf0+Z
 5TX0XATA8tpc0n6jkzqwzqTTCYgaWcLuLd3dVsX50mSNXH0JKlfzUSVkpCYJYmbrwpN0
 cSWC2D5bT36QNy3Dirkzb5RnQix9teuA4jrcb/k9b9J0vGtif/yo9p185K5Zy3ngb0fk
 7RoNAurDg3rTcETOKCnzq0Q6gw1S64FykInJWNyzoBggRH4jfrvvMbwFQMAsKQtGiart
 jusQ==
X-Gm-Message-State: AOAM533+RpK6IQe3SM4UdpPZcPCfIA66dnaSZEszO927fW5MmenChyHN
 rD7269LjFhfuiVmFIHmbrruNIcY4eQLpA4OSXaE=
X-Google-Smtp-Source: ABdhPJzFrwjhxpd8SX+RnC+WUd6r6R0aV04or0zTVrWXoTh7KJaFn5n/i+9iDY4cxS4j9PbgkDw29jCmvh5xes/0tPA=
X-Received: by 2002:a63:b11:: with SMTP id 17mr22878865pgl.51.1634047711216;
 Tue, 12 Oct 2021 07:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-10-kernel@esmil.dk>
 <9446163d07a2ff135965c7bff249f76bd0da5fb8.camel@pengutronix.de>
In-Reply-To: <9446163d07a2ff135965c7bff249f76bd0da5fb8.camel@pengutronix.de>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 12 Oct 2021 16:08:19 +0200
Message-ID: <CANBLGcwYu1P7=S4hj9eZXKjStKw9o_Ah0OOWLpCkPzrJ9qHWKw@mail.gmail.com>
Subject: Re: [PATCH v1 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk@vger.kernel.org, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-serial@vger.kernel.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_070832_584761_4A3C0196 
X-CRM114-Status: GOOD (  20.37  )
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

On Tue, 12 Oct 2021 at 16:06, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> Hi Emil,
>
> On Tue, 2021-10-12 at 15:40 +0200, Emil Renner Berthing wrote:
> > Add a driver for the StarFive JH7100 reset controller.
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > ---
> >  MAINTAINERS                           |   7 ++
> >  drivers/reset/Kconfig                 |   8 ++
> >  drivers/reset/Makefile                |   1 +
> >  drivers/reset/reset-starfive-jh7100.c | 164 ++++++++++++++++++++++++++
> >  4 files changed, 180 insertions(+)
> >  create mode 100644 drivers/reset/reset-starfive-jh7100.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d2b95b96f0ec..f7883377895e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17854,6 +17854,13 @@ F:   Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
> >  F:   drivers/clk/starfive/clk-starfive-jh7100.c
> >  F:   include/dt-bindings/clock/starfive-jh7100.h
> >
> > +STARFIVE JH7100 RESET CONTROLLER DRIVER
> > +M:   Emil Renner Berthing <kernel@esmil.dk>
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> > +F:   drivers/reset/reset-starfive-jh7100.c
> > +F:   include/dt-bindings/reset/starfive-jh7100.h
> > +
> >  STATIC BRANCH/CALL
> >  M:   Peter Zijlstra <peterz@infradead.org>
> >  M:   Josh Poimboeuf <jpoimboe@redhat.com>
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index be799a5abf8a..8345521744b3 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -92,6 +92,14 @@ config RESET_INTEL_GW
> >         Say Y to control the reset signals provided by reset controller.
> >         Otherwise, say N.
> >
> > +config RESET_STARFIVE_JH7100
> > +     bool "StarFive JH7100 Reset Driver"
> > +     depends on SOC_STARFIVE || COMPILE_TEST
> > +     depends on OF
> > +     default SOC_STARFIVE
> > +     help
> > +       This enables the reset controller driver for the StarFive JH7100 SoC.
> > +
>
> Please keep these in alphabetical (config symbol name) order.

Argh, sorry. I injected the _STARFIVE_ late and forgot about ordering.
Will fix, thanks!

> regards
> Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

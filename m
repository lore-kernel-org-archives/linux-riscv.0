Return-Path: <SRS0=3Oe1=PR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04298C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 13:05:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6CB660FC4
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 13:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6CB660FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCqe2xMb42NAsjD596NIPWkegaQVDLx1UeDPGfh37i8=; b=OVlfiSJnK6lq53
	FAqKVjBBgwM/sO+Ar6aPUcs/As8phJsd8u8hfZUx9Ts5TOHuuGr4fbTpJlGHo7Nk6rS2bBmMZkz4O
	D5DpDX1wpjkkLXnIjQxWNfPumaXxeCt4FwSyYIwh6/JDD4iCsWAJJNJsN1GQoMXqwFBCKInj4eP9P
	GhO5M29C2Udf7r0UawGraed28XGnmO10K51zKST4MCjmIppLPaTsxitOCG+8LOdSXvrbwXNU9UbJY
	nB3Z03U2i3HOPv28XnizBrV6VB3L5gbiuS+zluxv6NdPrn8N3QG+XPrMVh74LcKGm0whyz9jIAqmI
	U5CFOTsMiFugIGSL4Elw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgRZS-00B0v3-T1; Fri, 29 Oct 2021 13:05:22 +0000
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgRZQ-00B0tU-Cm
 for linux-riscv@lists.infradead.org; Fri, 29 Oct 2021 13:05:21 +0000
Received: by mail-pj1-f54.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so7336639pjb.4
 for <linux-riscv@lists.infradead.org>; Fri, 29 Oct 2021 06:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KufboUyCprK+9fF7rZgzoYUlaXceRx+Ob+I3zrllYAQ=;
 b=pjlo5IUTXTsPVCxH8DVi22MqVr/k0zjVmUknEBNWrcysHLgg+qgg07+uRy/74bIoD6
 4vNI6YYm4cQfMphHTBMArqgd4eliciVEXpe0cJd68GlS+BDzDmlniz5jf3rHnyjmiLaJ
 MuTY7ceur1nMAXkELzDfDBYR0D/2gf1+z1tqlHz+xUIgMnN0ek/N92lejHSwcYaocgJS
 BlFQcDt6XSu5wSD9s9uVdNFZHVjzTwL7k/KFTbxNci+ScNZiGQPFYLzvzOJT+wRPLlnX
 Yv5FUXHcNwPrLm4hnRbBMX68ReLUd8fv5N3lkuBv2sNe1CiFEynjVOOFmeS4yKYj7Kl6
 HSpA==
X-Gm-Message-State: AOAM532csNEY/krVXczDdI3pu9WY2rt3bbN/E5lwruZHL6OXgE+Nmkad
 aOyLKkzmGGI3iQ9CdJhtreIuNft7X7wJvmvmFSo=
X-Google-Smtp-Source: ABdhPJw9MG05yAh3HecVfqDjx7H9rcaDkE4VNJAwOxc2B4ZcG9HCIowvT8QcnxoBpBLNidPLtYA44mxQGJEw/QZ0CsY=
X-Received: by 2002:a17:90a:5b0c:: with SMTP id
 o12mr11538833pji.194.1635512714212; 
 Fri, 29 Oct 2021 06:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-6-kernel@esmil.dk>
 <YXtRhwULuIzvmOnt@robh.at.kernel.org>
In-Reply-To: <YXtRhwULuIzvmOnt@robh.at.kernel.org>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Fri, 29 Oct 2021 15:05:02 +0200
Message-ID: <CANBLGcwVh593U78tbA+rT2wDnLytQ359ErbxFBroM5tmDXSMCQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] dt-bindings: clock: starfive: Add JH7100 bindings
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Drew Fustini <drew@beagleboard.org>, 
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Michael Zhu <michael.zhu@starfivetech.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Sagar Kadam <sagar.kadam@sifive.com>, 
 Matteo Croce <mcroce@microsoft.com>, Marc Zyngier <maz@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Michael Turquette <mturquette@baylibre.com>, Anup Patel <anup.patel@wdc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Jiri Slaby <jirislaby@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_060520_453756_51C48D9F 
X-CRM114-Status: GOOD (  13.28  )
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

On Fri, 29 Oct 2021 at 03:42, Rob Herring <robh@kernel.org> wrote:
> On Thu, 21 Oct 2021 19:42:12 +0200, Emil Renner Berthing wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > Add device tree bindings for the StarFive JH7100 clock generator.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > ---
> >  .../clock/starfive,jh7100-clkgen.yaml         | 56 +++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thank you! For the reset bindings you said to remove unused labels in
the example. If you don't mind I'll do that here too, but keep the
tag.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

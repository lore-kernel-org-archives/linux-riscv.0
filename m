Return-Path: <SRS0=3Oe1=PR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB72C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 14:45:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21919610CB
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 14:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21919610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4erUfKiG+OkM/8V6lzn0taATLF7DWJZaTY6cb0vMxo=; b=pt0fcisrh9eG4D
	fNSjd4dyPEyPS6vYdrdTyY1XiqBe67IGCGYRif1dmbb9qRYbNIDHRzQYPrVIA1kEb0AuTRIFUobnJ
	ATdd9R4Z9mvKLz/y5Wa1pC+f2M2Mq3LrspE5NufvV8IoEbUxKgYeFCaWTU7gAbiIZefDveXq1dDtx
	7idaAJInn8JpqRbDUvpY922iGJo1uMVSPjwfgZLAYSoV1s4dev/bppXPJjBfd57La2ztkR15UNdzC
	vl/hYyn9grVbpl3i8e1M/LXqWUopsShcR/5xxP0nOAjvVdQ7ZhbUfcpi9Rr1bzZEDlHYy6mdJuBgV
	DdW6mmGGJCyAXdCANzEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgT7e-00BES0-V1; Fri, 29 Oct 2021 14:44:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgT7c-00BER2-NV
 for linux-riscv@lists.infradead.org; Fri, 29 Oct 2021 14:44:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAEA1610E8
 for <linux-riscv@lists.infradead.org>; Fri, 29 Oct 2021 14:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635518684;
 bh=JXq063lxP5NdObYVfsylEOeDpQ9heda2NljDpPAKCVY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pwIj0TbCChJdPc7ZRljY9/z91EdKF/FwQJvaAalrsJxPz7mrgEECL8PcZXoM9vSl5
 tYKW3kl6h1zRV+580CPZdqJwcC0mw6W+o+ZZbRd830NMSOkU1TV7zkeLsL5WBoGhlP
 sp0xydfFgSaSocdQEPLvSMWwVvpCSw3hNHIBuviafOjJna+lSAZPCTKJiA7EbsrCLN
 4aQedFp+HHqccwyRw2wWrHtYFaQ5I8JOF0SO2x3v6j8PTmaIB40QXYSwTqRqG6VcQn
 dFvDh1pEMaJDqJQT0hcxcLWp7wCQvTtXSOiELuxnprUksK+wuAPSnMeVggopNPf6vZ
 rRKI5ksr0b0xg==
Received: by mail-ed1-f44.google.com with SMTP id r12so39680379edt.6
 for <linux-riscv@lists.infradead.org>; Fri, 29 Oct 2021 07:44:43 -0700 (PDT)
X-Gm-Message-State: AOAM533nEyL1ZJGDo71+s/0JC5GFp6aL80F9wgRIC4IZW2DZB9MHUIFb
 f2z0CzAwHYz3MKgrlEzqZqWIr7WPCeJWgvaFNw==
X-Google-Smtp-Source: ABdhPJzgKku5UI29pWp+EBd22f3zuolB3qfN6dXWo83KbECOM1/m8h0OEK7iECxDyOFCsyGMYpk0WwXYpKdvn2KU2O0=
X-Received: by 2002:a17:906:d553:: with SMTP id
 cr19mr13689318ejc.128.1635518682351; 
 Fri, 29 Oct 2021 07:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-12-kernel@esmil.dk>
 <YXtTUGC5P41JtvoR@robh.at.kernel.org>
 <CANBLGcx3L1DmqjzqRAb+vEYWZTTxeGNUVx=BUfDuw=h3q5Nkgg@mail.gmail.com>
In-Reply-To: <CANBLGcx3L1DmqjzqRAb+vEYWZTTxeGNUVx=BUfDuw=h3q5Nkgg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 29 Oct 2021 09:44:30 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLBZV6ADY-B+3HCkxT1KpBJ5s3kcUfewSYf_rJ8HTu9Mw@mail.gmail.com>
Message-ID: <CAL_JsqLBZV6ADY-B+3HCkxT1KpBJ5s3kcUfewSYf_rJ8HTu9Mw@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] dt-bindings: pinctrl: Add StarFive JH7100
 bindings
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_074444_846506_24169F48 
X-CRM114-Status: GOOD (  23.19  )
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

On Fri, Oct 29, 2021 at 8:00 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> On Fri, 29 Oct 2021 at 03:50, Rob Herring <robh@kernel.org> wrote:
> > On Thu, Oct 21, 2021 at 07:42:18PM +0200, Emil Renner Berthing wrote:
> > > +patternProperties:
> > > +  '-[0-9]*$':
> >
> > Can you make this more specific. As-is, '-' and 'foo-' are valid.
> >
> > > +    type: object
> > > +    patternProperties:
> > > +      '-pins*$':
> >
> > So foo-pinsssssss is okay? Drop the '*' or use ? if you intend to
> > support 'foo-pin'.
>
> Ah, thanks. Both this and the pattern above was taken from
> pinctrl/mediatek,mt6779-pinctrl.yaml if anyone feels like fixing that
> too. I see now that '-[0-9]+$' and '-pins$' is more common. I'll just
> use that.
>
> > > +        type: object
> > > +        description: |
> > > +          A pinctrl node should contain at least one subnode representing the
> > > +          pinctrl groups available on the machine. Each subnode will list the
> > > +          pins it needs, and how they should be configured, with regard to
> > > +          muxer configuration, bias, input enable/disable, input schmitt
> > > +          trigger enable/disable, slew-rate and drive strength.
> > > +        $ref: "/schemas/pinctrl/pincfg-node.yaml"
> > > +
> > > +        properties:
> > > +          pins:
> > > +            description: |
> > > +              The list of pin identifiers that properties in the node apply to.
> > > +              This should be set using either the PAD_GPIO or PAD_FUNC_SHARE
> > > +              macro. Either this or "pinmux" has to be specified.
> > > +
> > > +          pinmux:
> > > +            description: |
> > > +              The list of GPIO identifiers and their mux settings that
> > > +              properties in the node apply to. This should be set using the
> > > +              GPIOMUX macro. Either this or "pins" has to be specified.
> > > +
> > > +          bias-disable: true
> > > +
> > > +          bias-pull-up:
> > > +            type: boolean
> >
> > Already has a type. Need to reference the common schema.
>
> Right, but the common schema specifies one of boolean or uint32. Is
> there a way to reference that, but still say that this binding
> supports only the boolean version?

Okay, then keep this.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

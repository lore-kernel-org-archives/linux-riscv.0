Return-Path: <SRS0=3Oe1=PR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7535BC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 13:00:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D31A260F93
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 13:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D31A260F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBEY8/mK7H6ziZ0oXkgylS+JsjbGI2jxdqnB9PIe4C4=; b=Ml3HZLt7AH70St
	9O4xzMAg+4uY3fcjdiiAnWoegh9XcB7cwAxj3gdgLwkPbW8VnfAxV/mavl+4604FNa/7SPtHO7g+t
	j4A4DhAPIShJqulj3jJJl5Ni++Sfdx9KwZKbzi05HFNeoAGhG4Gg0inrwnamNNWEaXPd9f0lPxCwF
	U/6OKvRt5+LNNh7oJiISPuhz3N2Suk8/YXWXhA3NdZFobxfLM+oKfVgrdZD2O3XyMS/yRlnacwK6E
	BLt++4g5BiZJiHvIeprf+NVXD3xrbrG1aoZvouPKu7EvUDWEY+3mQgWVnfuxpWVhv9q/ueq5ztJpR
	NxXdxRPoRj0knCFSdvAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgRUc-00AzdY-Pw; Fri, 29 Oct 2021 13:00:22 +0000
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgRUZ-00Azcj-Vj
 for linux-riscv@lists.infradead.org; Fri, 29 Oct 2021 13:00:21 +0000
Received: by mail-pj1-f51.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so7325335pjb.4
 for <linux-riscv@lists.infradead.org>; Fri, 29 Oct 2021 06:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vci1DyK0tNZcKwN8+74I1l8VTd7Fc9WtyWPYQLOUtNM=;
 b=vzUojC8pWAOvMjVz7Dj2PPkUvSxb8cZPgq6y6pSf+NQh0AUq7Z2pgCLijCY++BG2iB
 qHcMqP6iJjt3oOXON0qDJoSRFknmG6yVQGtK9hL59DcMUc5ek4QI6FGazB55B5hi7frx
 Qaf59SGLvi+jQA3hZGWt9UEIMSi3QIyBRezXc7g8MEn4ONDEhO4UU3z3GOgS8Nlukeuj
 UHVhN0DxsIH3v6icbcEixIg2LFLu9qyQ9WeuooRrf7P5+fQMHuyv8I4WMwDBvcOSqMoQ
 pM3o1r7hGHvWX3ZDCMNdw8aBgkRjMK1R3QQTK+co/KpYjWgS0afn20shn93/cEnW3AEM
 22/A==
X-Gm-Message-State: AOAM531ZKsZS4NfcaSX4Kbhf1w/FqerytmhGEmf85KYcdKqaha4TwCZs
 rexTa4GgPbODCy6v/BLjdDOA0h5rCWuXo3v1h2M=
X-Google-Smtp-Source: ABdhPJxsp4eURPFfgHBqWP+J4XlcL6ko0y3ikmW0sFVG++7P+Et7Yhh+lE5BR8RUsKI/L2xnep1G6HRqNfFSCc/WsFk=
X-Received: by 2002:a17:903:11c5:b0:13f:ef40:e319 with SMTP id
 q5-20020a17090311c500b0013fef40e319mr9604054plh.33.1635512418019; Fri, 29 Oct
 2021 06:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-12-kernel@esmil.dk>
 <YXtTUGC5P41JtvoR@robh.at.kernel.org>
In-Reply-To: <YXtTUGC5P41JtvoR@robh.at.kernel.org>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Fri, 29 Oct 2021 15:00:05 +0200
Message-ID: <CANBLGcx3L1DmqjzqRAb+vEYWZTTxeGNUVx=BUfDuw=h3q5Nkgg@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] dt-bindings: pinctrl: Add StarFive JH7100
 bindings
To: Rob Herring <robh@kernel.org>
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
X-CRM114-CacheID: sfid-20211029_060020_064798_14F653C7 
X-CRM114-Status: GOOD (  21.35  )
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

On Fri, 29 Oct 2021 at 03:50, Rob Herring <robh@kernel.org> wrote:
> On Thu, Oct 21, 2021 at 07:42:18PM +0200, Emil Renner Berthing wrote:
> > +patternProperties:
> > +  '-[0-9]*$':
>
> Can you make this more specific. As-is, '-' and 'foo-' are valid.
>
> > +    type: object
> > +    patternProperties:
> > +      '-pins*$':
>
> So foo-pinsssssss is okay? Drop the '*' or use ? if you intend to
> support 'foo-pin'.

Ah, thanks. Both this and the pattern above was taken from
pinctrl/mediatek,mt6779-pinctrl.yaml if anyone feels like fixing that
too. I see now that '-[0-9]+$' and '-pins$' is more common. I'll just
use that.

> > +        type: object
> > +        description: |
> > +          A pinctrl node should contain at least one subnode representing the
> > +          pinctrl groups available on the machine. Each subnode will list the
> > +          pins it needs, and how they should be configured, with regard to
> > +          muxer configuration, bias, input enable/disable, input schmitt
> > +          trigger enable/disable, slew-rate and drive strength.
> > +        $ref: "/schemas/pinctrl/pincfg-node.yaml"
> > +
> > +        properties:
> > +          pins:
> > +            description: |
> > +              The list of pin identifiers that properties in the node apply to.
> > +              This should be set using either the PAD_GPIO or PAD_FUNC_SHARE
> > +              macro. Either this or "pinmux" has to be specified.
> > +
> > +          pinmux:
> > +            description: |
> > +              The list of GPIO identifiers and their mux settings that
> > +              properties in the node apply to. This should be set using the
> > +              GPIOMUX macro. Either this or "pins" has to be specified.
> > +
> > +          bias-disable: true
> > +
> > +          bias-pull-up:
> > +            type: boolean
>
> Already has a type. Need to reference the common schema.

Right, but the common schema specifies one of boolean or uint32. Is
there a way to reference that, but still say that this binding
supports only the boolean version?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

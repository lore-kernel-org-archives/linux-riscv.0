Return-Path: <SRS0=WjcT=PM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49843C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 23:11:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C69560F9C
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 23:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C69560F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aERFc8lsofJXpqZXFg2Z1budoXDCzC0SNXXknanCbg8=; b=2vmyhulPfW7NgT
	xqmhpwS3iOUx1NrhSICLBNy/cAv+TG7I5K2pI5RfeFxcOg38e/Wezwvm5LYRgVE1AfomQkwNgAC7Q
	K6IxLCyv98RWZ17rRGvPZrZzWI+Qej09JMtdBdQ6SgFWNewmGJK5f6e1ZSoR0O9fMvtPHeuNXAINh
	xLIwoa4s1/LJqC8272Xemn5no6s+O1SJt4AdcApJ/I8Qd0Nt/x/EsiCemwcqbUWl8+kp9RokxUA4h
	Lg7Emeu8nl9xFGWIO4h+pGe+PV/gP5xhiHDbyNIw+jWkjpOCjXT+2BcIuUS4ywhref6j2y8OgrrRt
	rUbhcCCtRT6bJ2OjZnPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1memeB-00EkRV-N6; Sun, 24 Oct 2021 23:11:23 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meme8-00EkRB-3j
 for linux-riscv@lists.infradead.org; Sun, 24 Oct 2021 23:11:22 +0000
Received: by mail-lj1-x22f.google.com with SMTP id f16so3491264ljo.12
 for <linux-riscv@lists.infradead.org>; Sun, 24 Oct 2021 16:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1vsRSHd5ol8s+6s2RmI1HSUriW3Srp1b0zXswHBU7Sk=;
 b=Fbe4EIds06j7G15aUzedORb13lKIjQ6UiPypMt2r3Za3UkwMy3eZjMeqrH72ZYFrTs
 r8q7Xz0FkqCRKj57sd4OSEzXDwuhh3wq32AKWpty61ch5UA/SFwkpc+7dDPJEdkrrbAE
 mVDrQsy3h3IongKhzglUoxh8y3AIsZA27Fq6xk2oaDprAjT9vW1Xox4IaQisRGixQYr5
 OqySCDG5ZsJMLA8aSr6+JqAwIRDuHGCbAlt4SA3g6LphVfONBIDlGoYC7VW/MfBllOq+
 yZt55HEO30faBn4r38/QxRyweFJ9NRLRmVtzqWNka692YwBWW15nQAEUQ8dEWs9C18+9
 FtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1vsRSHd5ol8s+6s2RmI1HSUriW3Srp1b0zXswHBU7Sk=;
 b=wTA+OarM/oN7dDoPgmNMRzsarIQfUOtuJ6qxPeMFZRA6EaXwybAzKIetRmMgUC5lqA
 B8WDjnfAiMxDAzk6aDaoaM0usQRmJaeMZJVbYNFK3ZfbkyScJRR/jhdh7AWsnKVWMtHE
 iULiKa0cvjPDrpRbQPKftSKvXnNqS4PeAbfdle0yDB6TUW0l6X31Y+7qCm8mCuKPt3/3
 PrJD9vy3T88cl7lgp80DPxJ47DjiQwXUxutgTcA1rY2wkEwHZy81tf9P9RQn/pWrdiKy
 tJ7vR/PmUh1+IgS1R6xkt12NQk04ML5CRugW8YDTXlV+G3G+TdA06pbDDkMZzQWm8yzS
 +UeQ==
X-Gm-Message-State: AOAM533G5dgVoAOwP30hYIYfWBVo2Yu12Wh0ZYKRnJYRafhLPblOTHpK
 IINuH2KiygvDFXxiDqKNHXiZWpKXDDQWX44ikdlvPg==
X-Google-Smtp-Source: ABdhPJxpFfDTust0osAQmfxwkSpS6S7VhiwJS8EWyFLBIURethZXfMtoI8uRXG2acFxprQg+kqMuagHZV9BMfu8ocAA=
X-Received: by 2002:a05:651c:111:: with SMTP id
 a17mr14808602ljb.145.1635117078094; 
 Sun, 24 Oct 2021 16:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-12-kernel@esmil.dk>
In-Reply-To: <20211021174223.43310-12-kernel@esmil.dk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Oct 2021 01:11:06 +0200
Message-ID: <CACRpkdYZzKtFcBUM8sV4uze2T_EbfOGG=QkO9miDKKq=1mws_A@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] dt-bindings: pinctrl: Add StarFive JH7100
 bindings
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_161120_215155_6B18FFDA 
X-CRM114-Status: GOOD (  21.91  )
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

On Thu, Oct 21, 2021 at 7:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

> Add bindings for the StarFive JH7100 GPIO/pin controller.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

That is a very terse commit message for an entirely new
SoC, please put a little blurb about this silicon there.
Like mention that it is RISC-V at least.

Overall quite interesting!

> +$id: http://devicetree.org/schemas/pinctrl/starfive,jh7100-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7100 Pin Controller Device Tree Bindings
> +
> +maintainers:
> +  - Emil Renner Berthing <kernel@esmil.dk>
> +  - Drew Fustini <drew@beagleboard.org>

Add description: talking about that this is a RISC-V SoC
and other implicit things that are really good to know.

> +  starfive,signal-group:
> +    description: |
> +      The SoC has a global setting selecting one of 7 different pinmux
> +      configurations of the pads named GPIO[0:63] and FUNC_SHARE[0:141]. After
> +      this global setting is chosen only the 64 "GPIO" pins can be further
> +      muxed by configuring them to be controlled by certain peripherals rather
> +      than software.
> +      Note that in configuration 0 none of GPIOs are routed to pads, and only
> +      in configuration 1 are the GPIOs routed to the pads named GPIO[0:63].
> +      If this property is not set it defaults to the configuration already
> +      chosen by the earlier boot stages.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3, 4, 5, 6]

This still is hard for me to understand. Does it mean that 0..6 define
how the direct-to-peripheral-pins are set up?

Then it would make sense to describe what happens for 0, 1, 2 ...6
i.e. what the different set-ups are.

Actually this is what we call group-based pin multiplexing in Linux,
this property seems to avoid using that concept.
See for example:
Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt

> +    patternProperties:
> +      '-pins*$':
> +        type: object
> +        description: |
> +          A pinctrl node should contain at least one subnode representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to
> +          muxer configuration, bias, input enable/disable, input schmitt
> +          trigger enable/disable, slew-rate and drive strength.
> +        $ref: "/schemas/pinctrl/pincfg-node.yaml"

Nice that you use pincfg-node.yaml

> +        properties:
> +          pins:
> +            description: |
> +              The list of pin identifiers that properties in the node apply to.
> +              This should be set using either the PAD_GPIO or PAD_FUNC_SHARE
> +              macro. Either this or "pinmux" has to be specified.
> +
> +          pinmux:
> +            description: |
> +              The list of GPIO identifiers and their mux settings that
> +              properties in the node apply to. This should be set using the
> +              GPIOMUX macro. Either this or "pins" has to be specified.

What about referencing
Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
for this?

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

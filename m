Return-Path: <SRS0=0ydX=ER=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F20C55ABD
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 14:32:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 487B92072C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 14:32:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OaAC4YyF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFrzd16C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 487B92072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jEt0LDftI4eDY9Xd55Y1fD5qCn4jvgLVFD80aWGi4TE=; b=OaAC4YyF/06f+iA4jsBCeNPax
	mkJlBzmESjZPcZu36XbEfKe09M5t9IZGkwdQ2Jk+aHlPzawqIK0dDisSm+zCrhPmkYg2WNt/IGnGt
	1CWwLN75MbK4p7iy+RAMAn8zlSO+HG3022XNIhWGMUhlJgTsFwcuGAbe6LOldlK64bCiYhno18+0U
	llVpCVbeqqWOPvHER8RrJxSNOB+h0+UTTcZTBAW1TXHQpcEYCaD5/M5MDwWWi2O+zUTY8DIzwUuqa
	Gc4i7KyWF6BlACfhLnC25kj9Tq0va4NOum8cVqnNOcmtf11VxceVkJVcGK5nVJ9wVQHpgDZfSJ71m
	9Cwt7CMTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcrAb-0007F1-Uo; Wed, 11 Nov 2020 14:32:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcrAY-0007EE-Ld
 for linux-riscv@lists.infradead.org; Wed, 11 Nov 2020 14:32:19 +0000
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 83F2220809
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 14:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605105136;
 bh=muSLYibs0ZGONy3L3c3n/+gux1chNtnCxNxW3stscoY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hFrzd16CQbRJJPLAQQTpdLQo9C4aF3SuO8TVnJGuUByiW/sFMF7U+EjQcJUgQWl8q
 jT9hFgWFtHhUE2CXdk2ELs2U4FsIWQ1qB7qnEyINQQ+BFMIXXvXLTNnvwtf33vgQl0
 06CfiJvGvJuGCsWAn9fthW6u8Of7C0n1Dv8/H0FQ=
Received: by mail-oi1-f177.google.com with SMTP id w145so2349445oie.9
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 06:32:16 -0800 (PST)
X-Gm-Message-State: AOAM531fBuEQA5RHyowTRBKF6TB+RK89k6yik9+GnQRRt69AOZ4yVonR
 eAR9kS59QXw2MNGimJqRYzKLQ+jI7MmOZfAP2Q==
X-Google-Smtp-Source: ABdhPJyBAmSgmXMjpq6AAOkmqmbZGZptg0qCA3HGPghqhOTq/+URiIjllWXA/wYIci1U+X2mffVzaZzIIAj2IJIQudY=
X-Received: by 2002:aca:5dc2:: with SMTP id r185mr2316288oib.106.1605105135706; 
 Wed, 11 Nov 2020 06:32:15 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-25-damien.lemoal@wdc.com>
 <20201109153625.GB1330401@bogus>
 <04b266c7-bba9-d847-a526-f64f76c11a50@gmail.com>
In-Reply-To: <04b266c7-bba9-d847-a526-f64f76c11a50@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 11 Nov 2020 08:32:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJy_6ALEKdk7ZOEaM58Xi6NLBYd_aYNeVr2CpyjSBVpmA@mail.gmail.com>
Message-ID: <CAL_JsqJy_6ALEKdk7ZOEaM58Xi6NLBYd_aYNeVr2CpyjSBVpmA@mail.gmail.com>
Subject: Re: [PATCH 24/32] dt-bindings: Document kendryte,k210-fpioa bindings
To: Sean Anderson <seanga2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_093218_880567_96AD858C 
X-CRM114-Status: GOOD (  22.99  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi <linux-spi@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Frank Rowand <frowand.list@gmail.com>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 9, 2020 at 9:45 AM Sean Anderson <seanga2@gmail.com> wrote:
>
> On 11/9/20 10:36 AM, Rob Herring wrote:
> > On Sat, Nov 07, 2020 at 05:14:12PM +0900, Damien Le Moal wrote:
> >> Document the device tree bindings for the Kendryte K210 SoC Fully
> >> Programmable IO Array (FPIOA) pinctrl driver in
> >> Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
> >>
> >> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> >> ---
> >>  .../bindings/pinctrl/kendryte,k210-fpioa.yaml | 106 ++++++++++++++++++
> >>  1 file changed, 106 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml b/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
> >> new file mode 100644
> >> index 000000000000..8730add88ee0
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
> >> @@ -0,0 +1,106 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/pinctrl/kendryte,k210-fpioa.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Kendryte K210 FPIOA (Fully Programmable IO Array) Device Tree Bindings
> >> +
> >> +maintainers:
> >> +  - Damien Le Moal <damien.lemoal@wdc.com>
> >> +
> >> +description:
> >> +  The Kendryte K210 SoC Fully Programmable IO Array controller allows assiging
> >> +  any of 256 possible functions to any of 48 IO pins. Pin function configuration
> >> +  is performed on a per-pin basis.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: kendryte,k210-fpioa
> >> +
> >> +  reg:
> >> +    description: FPIOA controller register space base address and size
> >> +
> >> +  clocks:
> >> +    minItems: 2
> >> +    maxItems: 2
> >
> > Can drop these. Implied by 'items' length.
> >
> >> +    items:
> >> +      - description: Controller reference clock source
> >> +      - description: APB interface clock source
> >> +
> >> +  clock-names:
> >> +    minItems: 2
> >> +    maxItems: 2
> >> +    items:
> >> +      - const: ref
> >> +      - const: pclk
> >> +
> >> +  resets:
> >> +    maxItems: 1
> >> +
> >> +  kendryte,sysctl:
> >> +    minItems: 1
> >> +    maxItems: 1
> >> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> >> +    description: |
> >> +      phandle to the system controller node
> >> +
> >> +  kendryte,power-offset:
> >> +    minItems: 1
> >> +    maxItems: 1
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +    description: |
> >> +      Offset of the power domain control register of the system controller.
> >
> > Sounds like you should be using power-domains binding.
>
> This is for pin power domains. E.g. pins 0-5 can be set to 1V8 or 3V3 logic levels.

Okay, please make that clear in the description. You can combine the
above 2 properties into one which is a phandle+offset.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

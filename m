Return-Path: <SRS0=5I1x=EZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1179BC2D0E4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 10:58:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26F73246B0
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 10:58:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZyzIn758"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26F73246B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2XJtdF/FDjlHcqu3z+14rJtsIZIHHJM4Ika7+a2CPTM=; b=ZyzIn758JdwxfaoGq/KWa7HRU
	goJQx+s31UG7+sB26PhTRqgSHiadv6CBcp7aXiJun+grBHNpJfyTo9Ok6Gu4jUs3uM3kKZrJg+xxw
	rH/H0TnzgB5l9Ir/kLSfuLEY2ewbZJAvVzVahUFTgu0Al6MJCMJR92TKIr76kGWMS0f1ZmJrfPeJM
	y3dB05J6AFU6FT78zp6E7nuCAyPfue2zLTD3NZhcZicz615yz9YJCJxUDuylD5iShrfqY8XWqx2Av
	/5DiNV3LY+nckhSXENwAq/ojXxm0WDD20iXYW8WVbp/+Q/MOyGQTB+TPN3LM9ctzpD/7TUR4lCy9p
	Sp6HKKM0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfhdh-0001xY-Jc; Thu, 19 Nov 2020 10:58:09 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfhdd-0001wT-Kj
 for linux-riscv@lists.infradead.org; Thu, 19 Nov 2020 10:58:06 +0000
Received: by mail-oi1-f193.google.com with SMTP id f11so5858715oij.6
 for <linux-riscv@lists.infradead.org>; Thu, 19 Nov 2020 02:58:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PBDnVKEHNkn0XEpRmNcq0P71nm9E4KnrTMVqPCmJvVk=;
 b=rY8nFv9ccSavzl0ZY+24dYpVLqBD7CIqU3Z3lIUvCBmR3M/KwqAnqLTC6XdZQgVsSX
 C9qAiJeJNB6AgT3vcJGsTL1jpt/0CDrwYtz6Qq4bNJw0FHQcnSxQDmPN2JDhM1ko2z15
 wcsVSLpznW8NcD2hLQ9l5qWee0fUV48vdVIh+3imYTOOlCCcChso1QV6hdiH4NQarvTx
 eo2FcAnb0jCiiQK38pRmegOuGH7s1SF7hV4fbCMxLSD8CTDyQH95vV2lXhhHLD6QSYdA
 rWofHwlFcHRAiNqFfTeEIMbxDK3bYUiQRzAHtfBUT8xulds5Eava1cljKVkolo0U29Ds
 fLiQ==
X-Gm-Message-State: AOAM5304W9xE/ugr5nB3PUKYvlxoDk3z5dBgGOQicTD0XHNB/m2EK0jM
 PY45O8BgSmi8SygsGoNQ8FYCKWDK5pyEfzA47Gk=
X-Google-Smtp-Source: ABdhPJyc0kbDdNA5pI8yJr3UWxbQERyJ/f1qUShZVxXxSs6+FyWRdbsuMRhkSp143Tedxp9sefucC/ULV5Ar4S3QU28=
X-Received: by 2002:aca:c3c4:: with SMTP id t187mr2269568oif.148.1605783483057; 
 Thu, 19 Nov 2020 02:58:03 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-25-damien.lemoal@wdc.com>
 <20201109153625.GB1330401@bogus>
 <04b266c7-bba9-d847-a526-f64f76c11a50@gmail.com>
In-Reply-To: <04b266c7-bba9-d847-a526-f64f76c11a50@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Nov 2020 11:57:51 +0100
Message-ID: <CAMuHMdV0GL-GoY5=cgsW5QEWPB=ySK-8EyVeKLwt=6oODV4z3A@mail.gmail.com>
Subject: Re: [PATCH 24/32] dt-bindings: Document kendryte,k210-fpioa bindings
To: Damien Le Moal <damien.lemoal@wdc.com>, Sean Anderson <seanga2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_055805_732512_7D312532 
X-CRM114-Status: GOOD (  17.05  )
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
Cc: Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
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

Hi Damien, Sean,

On Mon, Nov 9, 2020 at 4:46 PM Sean Anderson <seanga2@gmail.com> wrote:
> On 11/9/20 10:36 AM, Rob Herring wrote:
> > On Sat, Nov 07, 2020 at 05:14:12PM +0900, Damien Le Moal wrote:
> >> Document the device tree bindings for the Kendryte K210 SoC Fully
> >> Programmable IO Array (FPIOA) pinctrl driver in
> >> Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
> >>
> >> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml

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

Which brings to my attention the power-source property is not
documented below...

> >> +      The value should be the macro K210_SYSCTL_POWER_SEL defined in
> >> +      dt-bindings/mfd/k210-sysctl.h.
> >> +
> >> +patternProperties:
> >> +  '^.*$':
> >> +    if:
> >> +      type: object
> >> +    then:

As the driver supports e.g. bias and drive-strength, these should be
documented here, too.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

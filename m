Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003D1C2D0E4
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 09:49:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81C3920684
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 09:49:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gfrpSuaZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81C3920684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cdGRHd5/NVMpusF5dcI/DiG03vQIHX1iZ3ej4GEMars=; b=gfrpSuaZEIXivJ8+z+qxCz7K2
	Gp+Lch/aeXC4z7sYMHBHOvtaK+OTbULzaVNrS8EqwwDpnAwWFpDwn7CBGb3g4ZQBBDoRusvuCGz3W
	sUmTNaa9ZseqqYb5fyDKPWeJ1cn5tPpuHc22mEGvS1RNxB/nsYiktYVsd05x8SsvDLavjl8R5JEpT
	BRG6ZmTNCkEjzvu95Pw+7PpfIRKXn06jT9f3QMUAsvkwRSJLMgsUvKTKcTTCV3tEbj0V/fzhw+C03
	BUfNvRFFZyYuzU1EJ3IIJAi/CpEwnlFBeqmmsSeWuXORc7y9nHQiOSKvjL/v+eTj2a6mURaieeKt2
	qt+4Yws8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khUwn-0002GS-4a; Tue, 24 Nov 2020 09:49:17 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khUwk-0002EF-Is
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 09:49:15 +0000
Received: by mail-ot1-f66.google.com with SMTP id f16so18748712otl.11
 for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2020 01:49:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mBoBDmbswRP+f/TlioNfn5J/ITMiXwI/C+Hc6TcJgzU=;
 b=UbqbUyAZYWJxDK51tr16UoMgs3Zgs9N+TsYkCDs79lWZodjx4e5RohcX1pXUs/kBj4
 y5brSqlNYYRLJpSzzmz2oiaM2QxfxOg7UAIYK8fJQVJZ4nT3OF1582Oa4IqiduN9lv5B
 NkgSN2pCyivt3q08XPwWPq45iVsi82FVeDTS24YIq1nfzbjT3iyMcUqwo7A3D+uEIeT+
 7murxNnvFUormt7kpihPa6CX3s49AWTz8SSkkSDeH989IJ9OF7b6pV0kna70AADZbTY/
 n9+SPncRzS+aVS45emtf+klog/xvwnPmK2VzJaZ8l/ApM9WRI5tsbCOOYc/rvbJZ8L8C
 7qVQ==
X-Gm-Message-State: AOAM531go5RpDxwa6LdoOpWpSg93DTg2IEllamtRfj1g2+ny0jCz4FP8
 /SpaG7C3fa91YtEcNi04rY7a5LD9W1/Xp3lpj9U=
X-Google-Smtp-Source: ABdhPJz6Irq78spBVJCaLnpjMMDP1gMl71i0GUJM0pl7Y1kWkNP5zH9k8WezE7l7eQvPgrURVWHQIqBizil9lQFKdNE=
X-Received: by 2002:a05:6830:210a:: with SMTP id
 i10mr2653636otc.145.1606211350289; 
 Tue, 24 Nov 2020 01:49:10 -0800 (PST)
MIME-Version: 1.0
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
 <20201124043728.199852-10-damien.lemoal@wdc.com>
In-Reply-To: <20201124043728.199852-10-damien.lemoal@wdc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Nov 2020 10:48:59 +0100
Message-ID: <CAMuHMdXov3Dr7EmAeE7yrKRmtu_L3539u9cjeiGiaRu32YVPQQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] dt-bindings: Document canaan, k210-fpioa bindings
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_044914_642594_9E6BD865 
X-CRM114-Status: GOOD (  16.52  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Anderson <seanga2@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Damien,

On Tue, Nov 24, 2020 at 5:40 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> Document the device tree bindings for the Canaan Kendryte K210 SoC
> Fully Programmable IO Array (FPIOA) pinctrl driver in
> Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml. The
> new header file include/dt-bindings/pinctrl/k210-fpioa.h is added to
> define all 256 possible pin functions of the SoC IO pins, as well as
> macros simplifying the definition of pin functions in a device tree.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml

> +  canaan,k210-sysctl-power:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      phandle of the K210 system controller node and offset of the its

of its

> +      power domain control register.

Your k210-sysctl-v15 branch has a bogus trailing space here.

> +
> +patternProperties:

> +  '-pins$':
> +    type: object
> +    $ref: /schemas/pinctrl/pincfg-node.yaml
> +    description:
> +      FPIOA client devices use sub-nodes to define the desired
> +      configuration of pins. Client device sub-nodes use the
> +      properties below.
> +
> +    properties:

> +      input-schmitt: true
> +
> +      input-schmitt-enable: true

Do you need both?
Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml documents
input-schmitt-enable and input-schmitt-disable, but not input-schmitt.

> +
> +      intput-polarity-invert:

input-polarity-invert

> +        description:
> +          Enable or disable pin input polarity inversion.

Still, this is a non-standard property.  Do you need it, or can this be
handled by the software GPIO_ACTIVE_LOW flag?

> +      output-polarity-invert:
> +        description:
> +          Enable or disable pin output polarity inversion.

Same comment as for input.

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

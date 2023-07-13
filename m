Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F603EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DqGVSu1MzOo8z+u2EaFY+m8q3lyGF1ENrBYSd8jW06E=; b=fbZPz7DDbvaRRb
	NaAKRWSZzUtqvZwF3D/qSQEcRf4h9g40ws23TmA30nxNvDm4dFr3YIHuioFMMaSlKgpvoHIsgnsxM
	ExkJRdxN4yayjBtVvEfxi2y0Pc2q0fz11wKzklE9wrNkKOWQP3o5jEfx7ASKsu8owiW8aqW91TWzg
	hAE1U9EFm98w1vKUzl6qCtGgoqGBtLmu4QMiSrXOfFxa9NwDuCG29gGZeTKFw7LvIp0sWkO8RrUWj
	OffHEdSQ4jAeh6lAq9hQtNntSWOXaubqSh4aW8SnLRhtu9ZjY2o4zE+c1DrqjKcBE0Eg/jjl25OZJ
	cKEJ/AUWAKxgToOuPPOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvUZ-003FeD-0p;
	Thu, 13 Jul 2023 12:32:19 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvUU-003FdM-1W
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 12:32:17 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 18E8C3F18D
	for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 12:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689251531;
	bh=OmJAYdfXr11pAMCyImFxnsohime3j/dmz8eTaaKAUKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=EeOpKdTeWsUGMegm/tpIcxtC2im00+Rw8yg4uxkIcIu2zO+7WewGTzQOFPuYLW7r8
	 +67aAoaPh6gG/Tr6Wc8oy04srXVCRi5TfXpNW/Y+l4NhsXE1e3oNo+bXqfpvK4j9Pw
	 2IGe3YCbVfGe2+qM9R03sN8QjrJjF1LlZL6ktSj7SP1E3U0a386dmJEWPyEdY3dNy+
	 vfpgTwn93eoqO2jxQKRGU8ZH9x2rO3CZPpH+S3rgdQuBosdMsR3D54zO0Rjro/ujDI
	 bzPw3n9Ai9QDNQoAI2eBz8bGCuE63XJxl17hRotOknEO7WnB+35QRhzsv95VbM0hoC
	 tnKx2Onhhm3vQ==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-3f9e556c7d8so13955191cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 05:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689251529; x=1691843529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmJAYdfXr11pAMCyImFxnsohime3j/dmz8eTaaKAUKk=;
        b=M2xUMJwuvHC3lphVHODecXLMFQyI6zGJjV9Dnb6UAOBXpJlB19AmCy3ljn32ANtUD4
         Ho9/INvaq1Odz/H2wydYKWp0znGylD6gAfC8lJyq1054ePcT0ZLSI/CHhkeN5erkZAWB
         h3/f52vZPDF1MTA1dXCuRVMwyMg7LxpelEgp+sM9jRX6iE/CY4Mm0NpZAuBuUOaZ0/b/
         mDqAKXjGRSXYl1m8fxxT5zGMKJTydPv6+vZ2iRvCt9MrtYjXpLIU2hsgn51QF+WtDCZU
         2wTiExYvs8bJRfMqStGm94fi9fQlUlJZA1C3ff4wYn6EG75SPUl6ykGpNLrBHpRozTmh
         RT+g==
X-Gm-Message-State: ABy/qLYZO0IopdnquToF4CY4F0miar+LUCbmlCV30AkAoCMmHnJgRhug
	1PBoRXS+j+hYGsvFJpOaxm4lfYvDoPzXyKeq//kTGM5sPtCaqOUvTEyh8dagcWD684yI8cWTR6E
	6iEp31x2rzXqky7sm9xKnQtExTsmSvqLfiqgEUWnvWGckmlfAxml+BOiUw8QOuw==
X-Received: by 2002:a05:622a:13d3:b0:400:9346:bf36 with SMTP id p19-20020a05622a13d300b004009346bf36mr1833920qtk.17.1689251529219;
        Thu, 13 Jul 2023 05:32:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHA5vK3hxfhXcY8G5rQmLZDXTBJyd7aSNs425ysD//K9J5R9Fx3mszf1d/OFc5OhPAt3GVAQ5/HeZZIq31NJYo=
X-Received: by 2002:a05:622a:13d3:b0:400:9346:bf36 with SMTP id
 p19-20020a05622a13d300b004009346bf36mr1833884qtk.17.1689251528953; Thu, 13
 Jul 2023 05:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com> <20230704064610.292603-3-xingyu.wu@starfivetech.com>
In-Reply-To: <20230704064610.292603-3-xingyu.wu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 13 Jul 2023 14:31:52 +0200
Message-ID: <CAJM55Z_G-OA_zmYoYueOGgYKMFHjPurJYAypTBw=P4WLkyn9Bw@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 2/7] dt-bindings: soc: starfive: Add StarFive
 syscon module
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Hal Feng <hal.feng@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_053214_669422_F777FE7B 
X-CRM114-Status: GOOD (  17.33  )
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

On Tue, 4 Jul 2023 at 08:49, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> From: William Qiu <william.qiu@starfivetech.com>
>
> Add documentation to describe StarFive System Controller Registers.
>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 93 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  2 files changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> new file mode 100644
> index 000000000000..0039319e91fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 SoC system controller
> +
> +maintainers:
> +  - William Qiu <william.qiu@starfivetech.com>
> +
> +description:
> +  The StarFive JH7110 SoC system controller provides register information such
> +  as offset, mask and shift to configure related modules such as MMC and PCIe.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: starfive,jh7110-sys-syscon
> +          - const: syscon
> +          - const: simple-mfd
> +      - items:
> +          - enum:
> +              - starfive,jh7110-aon-syscon
> +              - starfive,jh7110-stg-syscon
> +          - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-controller:
> +    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
> +    type: object
> +
> +  "#power-domain-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-sys-syscon
> +    then:
> +      required:
> +        - clock-controller
> +    else:
> +      properties:
> +        clock-controller: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-aon-syscon
> +    then:
> +      required:
> +        - "#power-domain-cells"
> +    else:
> +      properties:
> +        "#power-domain-cells": false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@10240000 {
> +        compatible = "starfive,jh7110-stg-syscon", "syscon";
> +        reg = <0x10240000 0x1000>;
> +    };
> +
> +    syscon@13030000 {
> +        compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
> +        reg = <0x13030000 0x1000>;
> +
> +        clock-controller {
> +            compatible = "starfive,jh7110-pll";
> +            clocks = <&osc>;
> +            #clock-cells = <1>;
> +        };
> +    };
> +
> +    syscon@17010000 {
> +        compatible = "starfive,jh7110-aon-syscon", "syscon";
> +        reg = <0x17010000 0x1000>;
> +        #power-domain-cells = <1>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 35e19594640d..58ba04bd0bc8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20127,6 +20127,12 @@ S:     Supported
>  F:     Documentation/devicetree/bindings/mmc/starfive*
>  F:     drivers/mmc/host/dw_mmc-starfive.c
>
> +STARFIVE JH7110 SYSCON
> +M:     William Qiu <william.qiu@starfivetech.com>
> +M:     Xingyu Wu <xingyu.wu@starfivetech.com>
> +S:     Supported
> +F:     Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> +
>  STARFIVE JH71X0 CLOCK DRIVERS
>  M:     Emil Renner Berthing <kernel@esmil.dk>
>  M:     Hal Feng <hal.feng@starfivetech.com>
> @@ -20164,6 +20170,7 @@ STARFIVE SOC DRIVERS
>  M:     Conor Dooley <conor@kernel.org>
>  S:     Maintained
>  T:     git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:     Documentation/devicetree/bindings/soc/starfive/
>  F:     drivers/soc/starfive/
>
>  STARFIVE TRNG DRIVER
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

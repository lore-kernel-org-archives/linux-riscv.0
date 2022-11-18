Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2BFC43217
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 16:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7m5GKsvyq+2aP+jvJoSWT2cuEqz/ApBnya6cwatXi1k=; b=xDORH+JN7lQQFa
	6CNhLw9YVB3zKTEd0PXNataV/IJYUfKJG/wTgaDQuk+GENxAETFSyvgTSmXmCpbFgPZK3ZW4+XwfY
	NjbnGiFnX2h/ztNhZW0/rpKWaU4W5RLpjMlrTgfmd5z2s7cFSSLbqam0LBF6EcmxK2FLxmLPI3OFr
	tLyafP9J2tpUP6LLPDHzeck7+njNKvUpNu+I1je8xzD4jU07MglsNto4N+pyUbcW/2XRePYqsY4Z4
	6BNx88sIgbjTBHEFZ8GJXuTGyZmAjmVldhsny2NuSIx5156LWh9r3+VMQ+6iYe8SCNPWcciFSB1hm
	NR423I7+n3fG31UyJ3dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow4aI-005WZ0-4n; Fri, 18 Nov 2022 16:51:22 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow4Zw-005WKY-K3
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 16:51:03 +0000
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C99813F20D
	for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 16:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1668790258;
	bh=D7JhrXwjD/BBBqSqzrNVCIT+3QaOVEAS69GN8n0gs5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=KDNziP3fPO3np8WiRdyO0CL9VFYuN0SltJ0zKs27M9jZqlezrbVnXyxbVkQ9nz7CO
	 7/7oeJaT67cEt2Hpbi5NggGR4Y9E3vfzR1IhnvIJpzDxTrra4PsTjhBD0tmfTTmNf6
	 1NZNh3gMA8qmdgYGA/TJpIbLwtyyU3IiYzfK0k5YMJkE5boP9u+xOhysdmBQ+Tj9Rh
	 Dqd4CpJRcfEzoCXj06ysQ5DHmYP2/p7QeaY1zQ6of7LzavHe9o/BlZXzTdLjZIvr5d
	 qIex18V6vML69hybFtBEex6rkMtkNfKWOScd+BKtljD+2I5BeJLoWObtVymY+JWhF8
	 ZZCrrSKE91xvg==
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-348608c1cd3so54472957b3.10
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 08:50:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7JhrXwjD/BBBqSqzrNVCIT+3QaOVEAS69GN8n0gs5k=;
        b=7XdFMolL22wzDTUa9j3ps5IYI7qUkxb5kT2NQBsvhsWdii8FZAz2sDWhSZ7fKb7FKt
         4uUbrFHZvLFCq7lB73XGBH7qc/cqrWmp6cBOz8kT0Kd/F6vHY8Fc9k841fONBeCVeo2P
         nUZahCOSzSVbGpPa7f+l1UZgRK01yYHJB9tfX4IoweoEeheum/ycZmlztRoSpmXP0Evu
         fhQXzxi5OtFeuzvMLUY0sa631RMEjavq3xC9z6ZwkiBM60PWjy0fTMUY5FzLn7q4M19L
         axS2Mfd5/iL48QrNxXnVBiuEiTqjrVO7vby7pkXDWzPVaRqto+0qm+aSiaJtcqbxnqWe
         o7xQ==
X-Gm-Message-State: ANoB5pnYLI7kFzXy16NnDHtwLmVKAG0YAHkujAaNO1RkM6+djsaHDmDt
	69zs45Oa335wePoZdGIj7+N2+pjcdLRQn7UrBRgX2OT2o4Q4LJy2iKUMXHCHsOCLd8M4vDsXcil
	dOAM6UwbUwu2NagJZRIgM0ZuLZOTJUaIJpSSNykeo9pILxyk8FwGF8hg0MriyVA==
X-Received: by 2002:a0d:cad3:0:b0:36f:d611:a5fe with SMTP id m202-20020a0dcad3000000b0036fd611a5femr7231973ywd.230.1668790257887;
        Fri, 18 Nov 2022 08:50:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4tElp8nJoQLvE/hqWEoMn1u151CU6SJLh+Fi0lqoLGYR8AyP+OgUb500asOPg169mEZCCEMqafDTTt4wcsAHo=
X-Received: by 2002:a0d:cad3:0:b0:36f:d611:a5fe with SMTP id
 m202-20020a0dcad3000000b0036fd611a5femr7231956ywd.230.1668790257679; Fri, 18
 Nov 2022 08:50:57 -0800 (PST)
MIME-Version: 1.0
References: <20221118010627.70576-1-hal.feng@starfivetech.com> <20221118010627.70576-10-hal.feng@starfivetech.com>
In-Reply-To: <20221118010627.70576-10-hal.feng@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 18 Nov 2022 17:50:41 +0100
Message-ID: <CAJM55Z_Gq22NiVYHawvjsehL8j3agvp_b2RCgabdTki+ovWa8Q@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_085101_107809_ED0064CB 
X-CRM114-Status: GOOD (  19.02  )
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

On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> From: Emil Renner Berthing <kernel@esmil.dk>
>
> Add bindings for the system clock and reset generator (SYSCRG) on the
> JH7110 RISC-V SoC by StarFive Ltd.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-syscrg.yaml         | 80 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  2 files changed, 81 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> new file mode 100644
> index 000000000000..a8cafbc0afe2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-syscrg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 System Clock and Reset Generator
> +
> +maintainers:
> +  - Emil Renner Berthing <kernel@esmil.dk>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-syscrg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Main Oscillator (24 MHz)
> +      - description: RMII reference clock
> +      - description: RGMII RX clock
> +      - description: I2S TX bit clock
> +      - description: I2S TX left/right clock
> +      - description: I2S RX bit clock
> +      - description: I2S RX left/right clock
> +      - description: TDM
> +      - description: mclk

Maybe you could ask your colleagues for a better description of these clocks.

> +
> +  clock-names:
> +    items:
> +      - const: osc
> +      - const: gmac1_rmii_refin
> +      - const: gmac1_rgmii_rxin
> +      - const: i2stx_bclk_ext
> +      - const: i2stx_lrck_ext
> +      - const: i2srx_bclk_ext
> +      - const: i2srx_lrck_ext
> +      - const: tdm_ext
> +      - const: mclk_ext
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/starfive-jh7110.h> for valid indices.
> +
> +  '#reset-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/reset/starfive-jh7110.h> for valid indices.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@13020000 {
> +        compatible = "starfive,jh7110-syscrg";
> +        reg = <0x13020000 0x10000>;
> +        clocks = <&osc>, <&gmac1_rmii_refin>,
> +                 <&gmac1_rgmii_rxin>,
> +                 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
> +                 <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
> +                 <&tdm_ext>, <&mclk_ext>;
> +        clock-names = "osc", "gmac1_rmii_refin",
> +                      "gmac1_rgmii_rxin",
> +                      "i2stx_bclk_ext", "i2stx_lrck_ext",
> +                      "i2srx_bclk_ext", "i2srx_lrck_ext",
> +                      "tdm_ext", "mclk_ext";
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eeab26f5597c..ec6647e2772f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19602,7 +19602,7 @@ STARFIVE CLOCK DRIVERS
>  M:     Emil Renner Berthing <kernel@esmil.dk>
>  M:     Hal Feng <hal.feng@starfivetech.com>
>  S:     Maintained
> -F:     Documentation/devicetree/bindings/clock/starfive,jh7100-*.yaml
> +F:     Documentation/devicetree/bindings/clock/starfive*
>  F:     drivers/clk/starfive/
>  F:     include/dt-bindings/clock/starfive*
>
> --
> 2.38.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

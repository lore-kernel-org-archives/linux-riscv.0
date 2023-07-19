Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB42EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kqq2DpBn8y6kqNu9taMhhgLPc4ncY+SVFhpGFRgAttc=; b=ZsQWBZ7k32SBlj
	zH0gy5Vf6avzp3VMadtYoqP71Bof9P3FIP02sTyo1Tvm93Nw4j8ZeLp+OsD1VlBd2FqLK+yFhnWBH
	Dc/tnEQYK50Xe1yEaL3DPAYU3lofHPPgxRkcZmkEjM7PmLKNO1VE72R+fstKONa47v+iUUY0butOb
	+P+Mx7xWi03c8BuBqkK2k2ZsxW72/vQoXndUs+wR2o3hXM+qEUysT1hSbU3hPXduvY8Y/+0P9M5iX
	+Rj6XodPOa6tDfqnP7RGPP+3A1NQ5UCaBWynij86HmJyv+4P6CLt6WBwmUJwyoiRZHWuPPk7EFPZb
	ccxU2zPA63NycfmrUFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9Mx-007z5T-0B;
	Wed, 19 Jul 2023 15:45:39 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9Mt-007z4Z-1G
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 15:45:37 +0000
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5E0C43F171
	for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 15:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689781532;
	bh=bJD7aE/rIe6c3FFU/UVaWfG6cXGm2QJmqrPvjRg5gaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Z2JJId5Ku9Bc5CRpk8AGAjyCA68XgukimWXd8dS9ZLaXui/jn0NBQC+JNIxvmlDqB
	 rLa8W6GT+JvG03K/oj1I3DdXUK8ioPIMOY7YUSQbqLnnaTJXLtSAeUhSKWp/UqDVMO
	 i+cjHeiwhovbXZ5c6lEapJHUBPriMmsnYRhJhuCWachAsISf3/woYFbCbNdBN0PjKg
	 RTTN+YzUDHL9kzVn3fdmivpJY+gaD4myWRkQ4UvXSAWFCYGJFVoIjtkmyjtzQT1mfg
	 eJqGY48oza+9exRjmcvjI3KcdbPu4zqikhcZY4u/JNfqRlOXK49mXes6cEnSm9v48N
	 spmMpuk1Bzxhg==
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-765a44ce88aso78888785a.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 08:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689781531; x=1690386331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJD7aE/rIe6c3FFU/UVaWfG6cXGm2QJmqrPvjRg5gaY=;
        b=DhtCkVGqovahTUowfIEt3iSy/zXCtVK8vKhrOvH85B8IiioL5MVevBGkn+6JFY1f5w
         7bkpvidMVcX6YN7+HG1el/FdlV1t96xj7vD7KXxSSMu049NAg58r7MaUymB2jo7ptcJO
         vzRlepPLO6oG4ZL9N6N6yEI/vOnu8ByxjNOO46MPyW/uN/CNlbzs8EE+m7vvfaXNTEX/
         ov1+xpSb3x+4vOFKF3nui8PmC4dmnFLQakr1MhDRqsGnskPNrSjHFYSQPMZenAMZrg+7
         cJ+EZyoBXXlMkMZPgKQZYcMMBVAkU2mZrT69gmR8M8JYgM2GSklYfWMEwK5Tv3K+fN9u
         p7WQ==
X-Gm-Message-State: ABy/qLZZP9DTlSBari2hSmWgiHR/74skmQTOTI6/QSttbFVUhc2aMw2f
	icUjH7XrrQVMalaxxnCwPzWKsIvDyyyUet1s84Tr+d0eN0x0yiEE6ZOhF7STXc8j2sFnROhzMsu
	Rq89Ueuyt4q2xCskTDi5MLkmtcPyTJhBMp/6FD7KHBfCNrSDTpA6domxbjqEvjA==
X-Received: by 2002:a05:620a:4155:b0:766:f972:73e1 with SMTP id k21-20020a05620a415500b00766f97273e1mr2968768qko.26.1689781531340;
        Wed, 19 Jul 2023 08:45:31 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEgOZHqVyytZCi4Dmyj+T4kdUCY46MCEOc5/aq2hMRc989Ipy34EdmzvPv2BTt9oGjxyPIrXj6QLDKGJmpUDGw=
X-Received: by 2002:a05:620a:4155:b0:766:f972:73e1 with SMTP id
 k21-20020a05620a415500b00766f97273e1mr2968746qko.26.1689781531078; Wed, 19
 Jul 2023 08:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230717023040.78860-1-xingyu.wu@starfivetech.com> <20230717023040.78860-2-xingyu.wu@starfivetech.com>
In-Reply-To: <20230717023040.78860-2-xingyu.wu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 19 Jul 2023 17:45:14 +0200
Message-ID: <CAJM55Z_daAVJim+aS3DsWTv3RoG40p24qh-MZ92NgJHCVKN+3A@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] dt-bindings: clock: Add StarFive JH7110 PLL clock generator
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
X-CRM114-CacheID: sfid-20230719_084535_582243_C38F0EC3 
X-CRM114-Status: GOOD (  18.99  )
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

On Mon, 17 Jul 2023 at 04:30, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Add bindings for the PLL clock generator on the JH7110 RISC-V SoC.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../bindings/clock/starfive,jh7110-pll.yaml   | 46 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jh7110-crg.h   |  6 +++
>  2 files changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
> new file mode 100644
> index 000000000000..be8300ce86d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-pll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 PLL Clock Generator
> +
> +description:
> +  These PLLs are high speed, low jitter frequency synthesizers in the JH7110.
> +  Each PLL works in integer mode or fraction mode, with configuration
> +  registers in the sys syscon. So the PLLs node should be a child of
> +  SYS-SYSCON node.
> +  The formula for calculating frequency is
> +  Fvco = Fref * (NI + NF) / M / Q1
> +
> +maintainers:
> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-pll
> +
> +  clocks:
> +    maxItems: 1
> +    description: Main Oscillator (24 MHz)
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/starfive,jh7110-crg.h> for valid indices.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller {
> +      compatible = "starfive,jh7110-pll";
> +      clocks = <&osc>;
> +      #clock-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
> index 06257bfd9ac1..3fb5e31c3be4 100644
> --- a/include/dt-bindings/clock/starfive,jh7110-crg.h
> +++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
> @@ -6,6 +6,12 @@
>  #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>  #define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>
> +/* PLL clocks */
> +#define JH7110_PLLCLK_PLL0_OUT                 0
> +#define JH7110_PLLCLK_PLL1_OUT                 1
> +#define JH7110_PLLCLK_PLL2_OUT                 2
> +#define JH7110_PLLCLK_END                      3
> +
>  /* SYSCRG clocks */
>  #define JH7110_SYSCLK_CPU_ROOT                 0
>  #define JH7110_SYSCLK_CPU_CORE                 1
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

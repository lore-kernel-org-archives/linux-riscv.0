Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564E6C001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 12:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N3Ctm886CeNQ46Di14uLeqL+Zjbt9G55R3RSD6S3oqY=; b=oHbzQ9Y4U9mM7N
	JBoMtvjAiLHwH5YzWIbyyD0W2EPaL02ZAk2X5nqFwd5f6us8aoqvoZEiCnCwQVGxQy0ReqccT6dY7
	Slx1TKzo1zrUiDe07K5r5JOxNKIYsPtmTfY6cFLrH+dEc9Hp8PNk6mJssjPJsdcCapGFIZ5hV0Bkb
	iVwbjW2OGjyaw8k5nNIwqirgy7jXyr2HY7niXyVCo4C+MpPPBEnf+XLK+3WWWSbrtRWPkgbGO9Lx7
	v64n2wQqyVhvpYo1vTgE1jifdi2X7mt+eME4tgtqh1twD14oeSE1GOGxnnEIf+gH47lWoS6ZkvjXj
	If+ZnxVQ2t6QLWJ6pUwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvPb-003EwE-2r;
	Thu, 13 Jul 2023 12:27:11 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvPX-003Ev7-2p
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 12:27:10 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E35763F71D
	for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 12:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689251221;
	bh=MsO02jH+ViDHvNLshcafKBuW3XX0NRCU1Az8N0nWX44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=MI8819JTf4cvauEwJYdoMRYHhkUDTtMBjj2hzDPO4mTxdM+inLKp71PK4yN8D8S2S
	 DgIxTDpxp5eJq4WZ7Fz7xu9CdJe/lsunYNc9dqIhs/JB07sQ3Ko9l9ywUauYRlSPDd
	 aYdVgUcDE2vcu+GW8E83qiyL6AWT/jK5pR4mtmY+DQQxNtIzKh33wj4ZwtgfYx+8yu
	 tFvdCNOJvjqt3AC4mwIzJK/x72Ppri9nYsyC89Sxzohp52ZS+PFBMp5MSCujKU+NCZ
	 gUcKOaIVQZNoiYs3x+/Y5N5IXOqrBUorkwKwoT9bTlGTxHk960vcYVf7rzAR82DGkz
	 UbCdRX5rc9D4A==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-40327302341so6185531cf.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 05:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689251219; x=1691843219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsO02jH+ViDHvNLshcafKBuW3XX0NRCU1Az8N0nWX44=;
        b=b3msKEfYEWrj8PaILyAuEQ9JFJKkgIjSebei/YGnfcdsIziNoIMfoRbHXGpPPPksz6
         m5tyWPwoqL9kuZePrMTP34LwVQP06IkQHI57YpDsfaTERH8D5lkCdP+4YAoiyRp04WPC
         Khqdtr+mgMMvrFUIaGEzjlESnqwjXGwXABHsq4MdF+/4b3iwu9PBs/zvb4td7EcaAfPa
         XkZxPkWzPCo5R3LO/B2+2lESTZW4Qrou5r/BjlvBDFvwJ/UdNmbrGvb//PLkjrFyxzaF
         cRaL0oorELR1ov1UEKomqDc/KlP9BkwPv+19Vn/UfIkrzjLDK5ckZefW1wTpVvbtAEPV
         He/A==
X-Gm-Message-State: ABy/qLaNl9Bw87i9q7jBigwGOlNQNVs/8RVUUzaR/fjqYa86z5UuNn6e
	aiZTvFnm31A1qys5vhsi5tFUpBO0/RRHXfDH1YQIAhV8g1fLqOZbJVEBnTDyGElYU1iXJf+hFW5
	riwfUySWKHYarr2SmrF7SXcsJ8fiKq0FSSz9SuA4Zd/JGULW5jfS1AFwgpILoRg==
X-Received: by 2002:a05:622a:1003:b0:403:a927:1947 with SMTP id d3-20020a05622a100300b00403a9271947mr1557734qte.23.1689251218753;
        Thu, 13 Jul 2023 05:26:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHiJAYN6Pa6kcyaVBR/pEfPZkiEZPz1qi+73jGLWtlr2nXCVmtaDK8lr5QdSWsD1G3HyAJnAeHte89dSxxB+Rw=
X-Received: by 2002:a05:622a:1003:b0:403:a927:1947 with SMTP id
 d3-20020a05622a100300b00403a9271947mr1557722qte.23.1689251218536; Thu, 13 Jul
 2023 05:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com> <20230704064610.292603-2-xingyu.wu@starfivetech.com>
In-Reply-To: <20230704064610.292603-2-xingyu.wu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 13 Jul 2023 14:26:42 +0200
Message-ID: <CAJM55Z8vj6KvpKZxRVh0+G_LCXrpnXzOR+oBad-igkHVTD_J=Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 1/7] dt-bindings: clock: Add StarFive JH7110 PLL
 clock generator
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
X-CRM114-CacheID: sfid-20230713_052708_330680_C659FA77 
X-CRM114-Status: GOOD (  18.73  )
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
> Add bindings for the PLL clock generator on the JH7110 RISC-V SoC.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../bindings/clock/starfive,jh7110-pll.yaml   | 46 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jh7110-crg.h   |  6 +++
>  2 files changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
> new file mode 100644
> index 000000000000..beb78add5a8d
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
> +  These PLLs are high speed, low jitter frequency synthesizers in JH7110.

..synthesizers in the JH7110.

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
> index 06257bfd9ac1..086a6ddcf380 100644
> --- a/include/dt-bindings/clock/starfive,jh7110-crg.h
> +++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
> @@ -6,6 +6,12 @@
>  #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>  #define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>
> +/* PLL clocks */
> +#define JH7110_CLK_PLL0_OUT                    0
> +#define JH7110_CLK_PLL1_OUT                    1
> +#define JH7110_CLK_PLL2_OUT                    2
> +#define JH7110_PLLCLK_END                      3

It would be nice if these names followed the same pattern as the
clocks below. Eg. something like JH7110_PLLCLK_PLL?_OUT and
JH7110_PLLCLK_END.

But maybe these defines are not even needed, since you just do <&pll
0>, <&pll 1> and it's obvious what that means.

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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB3EC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 12:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKWHIfUL08yZ6ynEzCk0BLUis0oltk6MflBdQu35l6I=; b=3sTSgroyitV1AX
	a9sKH51gvPlwqbyy1dD3HtKpiJem83abllFa5TDMgFAm+4HrNpqFR/25TMNprif104MTfgCCVit60
	NXCM9Gki76kvoOdWUlnCN+t0EbuNfjenwGVjTV5QB06oeWKC1vsGm7qwFe21NzanbZtiDmFEoTg0x
	5X84rwlpX2HpqwlKz1AC35bsdIjTX4n8CpctJiMDvjvVjzfSB3/UrNZYrlykZLFYXL6UxIMxfGVjj
	ivoSkmPgGt4SD/dBVXEL5+SHziENDK5gYlxI4vVKsdJsl5qtFThYG5ej3z3Dggp0i2vHnxLNSeLgY
	bcWOQNjMB837gHl07gmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeFTy-009FHG-QL; Fri, 30 Sep 2022 12:51:10 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeFTv-009FG9-TO
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 12:51:09 +0000
Received: by mail-oo1-f49.google.com with SMTP id u19-20020a4a9e93000000b004757198549cso2161299ook.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 Sep 2022 05:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=BKN6pqBF7loqZ839qOR8sDSeqrGBR2M9kkbIljc9QgQ=;
        b=078VT0WjxAn9YnNXN6YX5G17SRX/lk5ebzo9jbs8RPKTmla+oVfd4TFi2CtjrkRoh7
         gEZe79SeD33/i21DblswoZAdIoxvbQiLIZF4fM6wOC3cbKzYYpWhvjEHdyBD/iuxZOrv
         wKM6NDxkHRLfaGIGiFA2rsnDs6aTKGt/otYiU8S4GTUwmNcRs5n8Zq3Le2+xbKE7ypjq
         Qz6bidYtgOMSwzkd532NA/cJkOWNTvcLBQoJOTb5KbGiEvNEjhamOHlaKdCM1C05ztZt
         BCcqOx72LyAj+wmYkEjtnNtEDYH70h48H7HRtcoK/RVttdkgttabR0OaUMxb1B7VXr5o
         /amg==
X-Gm-Message-State: ACrzQf08hmDlcyFRwmOK+t+YaPdwMJfd+B1pKGqVcjvnDoot8uA595ve
	Ruv2dJzxsEh5f5qnpTbzVw==
X-Google-Smtp-Source: AMsMyM72ktgqnPB0ybe/B6VZXT6Kl6bUWcvvBo5Ci6aR/i1omOc8r4PKjbOczRXFwoDN4TtO+evoZg==
X-Received: by 2002:a4a:434d:0:b0:441:9b4:ffad with SMTP id l13-20020a4a434d000000b0044109b4ffadmr3293506ooj.31.1664542266341;
        Fri, 30 Sep 2022 05:51:06 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b2-20020a9d7542000000b00637032a39a3sm560382otl.6.2022.09.30.05.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 05:51:05 -0700 (PDT)
Received: (nullmailer pid 95617 invoked by uid 1000);
	Fri, 30 Sep 2022 12:51:05 -0000
Date: Fri, 30 Sep 2022 07:51:05 -0500
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@linux.starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 20/30] dt-bindings: clock: Add
 starfive,jh7110-clkgen-aon bindings
Message-ID: <20220930125105.GA93753-robh@kernel.org>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220930055632.5136-1-hal.feng@linux.starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220930055632.5136-1-hal.feng@linux.starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_055107_970226_2F79A4C5 
X-CRM114-Status: GOOD (  16.35  )
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

On Fri, Sep 30, 2022 at 01:56:32PM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add bindings for the always-on clock generator on the JH7110
> RISC-V SoC by StarFive Technology Ltd.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> ---
>  .../clock/starfive,jh7110-clkgen-aon.yaml     | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-clkgen-aon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-clkgen-aon.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-clkgen-aon.yaml
> new file mode 100644
> index 000000000000..029ff57b9e3e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-clkgen-aon.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-clkgen-aon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 Always-On Clock Generator
> +
> +maintainers:
> +  - Emil Renner Berthing <kernel@esmil.dk>
> +  - Xingyu Wu <xingyu.wu@linux.starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-clkgen-aon
> +
> +  clocks:
> +    items:
> +      - description: Main Oscillator
> +      - description: RTC clock
> +      - description: RMII reference clock
> +      - description: RGMII RX clock
> +      - description: STG AXI/AHB clock
> +      - description: APB Bus clock
> +
> +  clock-names:
> +    items:
> +      - const: osc
> +      - const: clk_rtc
> +      - const: gmac0_rmii_refin
> +      - const: gmac0_rgmii_rxin
> +      - const: stg_axiahb
> +      - const: apb_bus_func
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/starfive-jh7110-aon.h> for valid indices.

No 'reg'? How do you access this h/w then? If it is part of some block, 
we need to see the full picture.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

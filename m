Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBB4C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 11:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6AkWuQBxf3E/GaAsxhvfASUTfOGBcgY9KVfGJ6QdBs=; b=PkeDFl1Xl72lrD
	IfkIKdeepdo6/4npWRzq+gKTNpsNkPcA9Srm6IbI34Um7EZuqBPFb6A79MHaZvTgC28a2hxOPOnq7
	tN1upNYrdDGcbOMklLkp2Hq8o+L9S/Wd3AWKtJBUnvTVHjj5LhfQUlS7/RwTYAfbTp/4stHo7vmrS
	1j0RiyNJDVp2Crb2I90wVHeeityr/JPvlUf33tORq+0m288Sw4gRkT+oKcZyKPmoj0V1Lw6PVDs7n
	bq/jnZrya2wVqd+/KTrp6D0y6JSHUsOlMrJXIFv8Xkk1auNtqbf5jhVdi+Ee940cYnbbF2QemWAM/
	5LDDFwlbsf+CRzMdhGYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJa0G-00EzCU-G5; Mon, 14 Feb 2022 11:58:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJZ4i-00Ef54-J6; Mon, 14 Feb 2022 10:59:22 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nJZ4E-00080o-TO; Mon, 14 Feb 2022 11:58:50 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Philipp Zabel <p.zabel@pengutronix.de>, Anson Huang <anson.huang@nxp.com>,
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Rahul Tanwar <rtanwar@maxlinear.com>, Jeff LaBundy <jeff@labundy.com>,
 Yash Shah <yash.shah@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Vignesh R <vigneshr@ti.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 06/15] dt-bindings: pwm: rockchip: include generic pwm
 schema
Date: Mon, 14 Feb 2022 11:58:49 +0100
Message-ID: <2270696.mDkAqzPR1c@diego>
In-Reply-To: <20220214081605.161394-6-krzysztof.kozlowski@canonical.com>
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
 <20220214081605.161394-6-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_025920_692097_86B684AA 
X-CRM114-Status: GOOD (  17.51  )
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

Am Montag, 14. Februar 2022, 09:15:56 CET schrieb Krzysztof Kozlowski:
> Include generic pwm.yaml schema, which enforces PWM node naming and
> brings pwm-cells requirement.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  .../devicetree/bindings/pwm/pwm-rockchip.yaml | 74 ++++++++++---------
>  1 file changed, 38 insertions(+), 36 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
> index 81a54a4e8e3e..a336ff9364a9 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
> @@ -51,42 +51,44 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - "#pwm-cells"
> -
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - rockchip,rk3328-pwm
> -          - rockchip,rv1108-pwm
> -
> -then:
> -  properties:
> -    clocks:
> -      items:
> -        - description: Used to derive the functional clock for the device.
> -        - description: Used as the APB bus clock.
> -
> -    clock-names:
> -      items:
> -        - const: pwm
> -        - const: pclk
> -
> -  required:
> -    - clocks
> -    - clock-names
> -
> -else:
> -  properties:
> -    clocks:
> -      maxItems: 1
> -      description:
> -        Used both to derive the functional clock
> -        for the device and as the bus clock.
> -
> -  required:
> -    - clocks
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3328-pwm
> +              - rockchip,rv1108-pwm
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Used to derive the functional clock for the device.
> +            - description: Used as the APB bus clock.
> +
> +        clock-names:
> +          items:
> +            - const: pwm
> +            - const: pclk
> +
> +      required:
> +        - clocks
> +        - clock-names
> +
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +          description:
> +            Used both to derive the functional clock
> +            for the device and as the bus clock.
> +
> +      required:
> +        - clocks
>  
>  additionalProperties: false
>  
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

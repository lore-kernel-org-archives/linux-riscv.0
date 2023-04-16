Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDE6C77B61
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Apr 2023 15:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJR7a8g/5KOLN6kQ/+urW38BMa1hQ9UQOCLkhE0nyWI=; b=MCgUt96Z+ZAPnT
	OPhqF3yJAsEuWpA0OVcl8ZkMketIdVq/6bD/MXyaUo7XVdIin8q16RUqbmU5BmahFN5t540cTArFd
	+7jxzm5qxRHgR2l7/W2bCVMuY2EB+D60tJLLw5rD8i4+SSYzdZB/2tYXCUo5n8JssGPbX0rt9XLbb
	YYoh7uqbasIHdb7SPcO5E1GyxLIOBUEyu727nk5YXx3doeFzJg0JnO+eAhZK+OPVPEAX/ahqAJAUG
	8h+Tn5Y16lp7OHXQnbmDPdoMkRB2uGOzUwb451315OrLhUNI7eeyyf9j8hPCr/JeaCAlk6xjhkwIt
	cRVoGj7RbvaIF731lgiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1po4hh-00E3Sk-2e;
	Sun, 16 Apr 2023 15:54:13 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1po4hf-00E3S6-04
	for linux-riscv@lists.infradead.org;
	Sun, 16 Apr 2023 15:54:12 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3293e4b2cb5so16895235ab.3
        for <linux-riscv@lists.infradead.org>; Sun, 16 Apr 2023 08:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681660450; x=1684252450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bimSNd6xEhIq8jA9htH7BjEd6GsGtZ/bQFysqXyDsPY=;
        b=L9fdHOkaueZCGnggsVEqGNsBL0NjmhD0edl9v1kf3/xgWmYnGmNi9nm5+0owWt3k6D
         Ws4GmQpIw2XcEgZVUfljQBuUTjQLTzDdBm8DbNkZDyavieXNCRGTz885287fCPrkbZni
         p5VdUVQCztd7vSH1cXOZghBxxmob304rzZ28GiZ427CHTBMHggsVsYKu78iQhXHg28g3
         TPHkIhEn7Zb8nv3s9Om+MISSRBTDw33+viGyP1T5ekY2c//XnUNJ5+5AHV5c0um8up6p
         /q0FE6wdhNAnV4SMCNGrS5TaZOQ8gIhyY9BiiXWW6UN5rbHn6tqsD9Vk1XQT90laYeIH
         YIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681660450; x=1684252450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bimSNd6xEhIq8jA9htH7BjEd6GsGtZ/bQFysqXyDsPY=;
        b=MWcPNHxBqAatY7732z0OoLP/uEO1wd9BEQHcpB31dsyh4+2xJ12drWZ0GEcOXtBOa7
         ptv3Kv8cnyIe+cbh4J4UaZlbZWDvx/tQ1Pmei5Df6ooSKIRVm/98u/zYViY/ZcWUoZ/i
         8a9lSreodaGHfe8KmFad6do8klZFs4U55OKp6GnIeyY8fNkA2CCLsdqyLvFU8UoMezX/
         yNmSWDV9Bqls0s8ad2ILRr0SosG2OzlccjL6DJqa5ayi6zRLnv+XC8rFW6c2w054hwnZ
         xoPljOY2NMmuI3xXobS22ORFeo8MBOxjamuP15Tcq4ljTjlMtEDJiYbrswiv2rf/iHiu
         o2mA==
X-Gm-Message-State: AAQBX9eoipmwVY+ObIpp3jbqTPvXXDpeIV7KusogHczqLqQVYam5Adhc
	UrUWFPXpLhezRTHYB6+gUN7wVr2YCr8=
X-Google-Smtp-Source: AKy350aA9rPo+hX+AvG1x5sHeivprQVL5lRx1/5+WpZEEcsnnCnWdPQ23HTHmHO/EpDW+GqtgmsvzQ==
X-Received: by 2002:a92:c648:0:b0:32a:dfdd:1d80 with SMTP id 8-20020a92c648000000b0032adfdd1d80mr2923101ill.23.1681660449768;
        Sun, 16 Apr 2023 08:54:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y10-20020a927d0a000000b00312f2936087sm1021391ilc.63.2023.04.16.08.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 08:54:09 -0700 (PDT)
Date: Sun, 16 Apr 2023 08:54:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Samin Guo <samin.guo@starfivetech.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: watchdog: Add watchdog for StarFive
 JH7100 and JH7110
Message-ID: <e53e0441-b125-4a21-8b89-3406fd89d830@roeck-us.net>
References: <20230314132437.121534-1-xingyu.wu@starfivetech.com>
 <20230314132437.121534-2-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230314132437.121534-2-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_085411_113373_C3F4173B 
X-CRM114-Status: GOOD (  18.53  )
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

On Tue, Mar 14, 2023 at 09:24:35PM +0800, Xingyu Wu wrote:
> Add bindings to describe the watchdog for the StarFive JH7100/JH7110 SoC.
> And Use JH7100 as first StarFive SoC with watchdog.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../watchdog/starfive,jh7100-wdt.yaml         | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
> new file mode 100644
> index 000000000000..68f3f6fd08a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/starfive,jh7100-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive Watchdog for JH7100 and JH7110 SoC
> +
> +maintainers:
> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
> +  - Samin Guo <samin.guo@starfivetech.com>
> +
> +description:
> +  The JH7100 and JH7110 watchdog both are 32 bit counters. JH7100 watchdog
> +  has only one timeout phase and reboots. And JH7110 watchdog has two
> +  timeout phases. At the first phase, the signal of watchdog interrupt
> +  output(WDOGINT) will rise when counter is 0. The counter will reload
> +  the timeout value. And then, if counter decreases to 0 again and WDOGINT
> +  isn't cleared, the watchdog will reset the system unless the watchdog
> +  reset is disabled.
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - starfive,jh7100-wdt
> +      - starfive,jh7110-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: APB clock
> +      - description: Core clock
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: core
> +
> +  resets:
> +    items:
> +      - description: APB reset
> +      - description: Core reset
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    watchdog@12480000 {
> +        compatible = "starfive,jh7100-wdt";
> +        reg = <0x12480000 0x10000>;
> +        clocks = <&clk 171>,
> +                 <&clk 172>;
> +        clock-names = "apb", "core";
> +        resets = <&rst 99>,
> +                 <&rst 100>;
> +    };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

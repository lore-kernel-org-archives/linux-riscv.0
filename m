Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02ACC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 20:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7uS1Yi9W/F5ef1Wh949rZqDn8njkKjXGfWpHTXrWhFQ=; b=wdqo8AksKebv0Q
	ZSCXM1StT8w6q6SEXkG/WhWj2sNpBxREezu88b2+5JbQK2UTfRBsbv6mRyYB8WZR/N6GxN1S5zmXo
	+xBPn+SYicoUEXQ2LlOzLjVdUwfqVlaD54mC8ueXi+mviprld2BrTV4/zKlL83qOP7x7Zmc81XE6r
	ZfBDltyN8yoHpadEQiXsgz2DhTD9k14ZizHk63twD9UHtfDbeBfVtMTOlu5cYA2H6TkI4tzRysMQI
	vjmDLUuMcWchqtubEH0rnbxEnySx5Y6pShp4V59ZAgHiTpnfE/PWnOzGHcDcDAUdSA0d6vyGzqCOe
	IpvpbyQ4SVd3FPTzy4tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeMwc-00BVbK-E4; Fri, 30 Sep 2022 20:49:14 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeMwZ-00BVZ8-QV
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 20:49:13 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-131dda37dddso5808144fac.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 Sep 2022 13:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=YN8qEL8DJBJUXwLGIJhhXCICK2Erz7u2/C6FcnHwxvw=;
        b=Jrr1NFtO/io77ERsMJYPkYeA8ZQDwby/efij7aKO5uQ5KsGPtrNzJ+wFQJtXWiunf9
         0yZ/6bRqROMpQGbH7ntEXNa+cFRB0dnY6AXz7Q3e4u1unG11kN+0PaBGjN+H4WA4wCTC
         qEtV581SdIRuBaD9DRhMlB0/WuBJ52+zyqBjlapVWWyf9Wt3J0l8ZyaeOUJTn2uhlUw9
         ZIYAd1gOmvOt8hbC0e3qZKczxkPeT71fUqdG+GuBJi+Qlp3GQd5d9/mpoAV8cdbOZ47S
         MeDyCmoJRCWM7TPNxZdQHrkkPiEBTO25kmkyj4Qj2kIKJ+4fVRBjIkaCqYYkTAf9if49
         kEIA==
X-Gm-Message-State: ACrzQf17weL6fT4Ybr2or3E+IeIgNGqbrBVBGjRHZZjniN29XOTn2QkZ
	SsTXoTwOr4XTFNL0CP5yHBVNuUvJnw==
X-Google-Smtp-Source: AMsMyM7cQo+Xdc1zu4Ia/015WNtr0fkOMyA0Z7nPSaR5qXioETaX7bCFr8c6/ztbX7UjQ65MKT544Q==
X-Received: by 2002:a05:6870:3451:b0:131:82bb:22e3 with SMTP id i17-20020a056870345100b0013182bb22e3mr28626oah.233.1664570948264;
        Fri, 30 Sep 2022 13:49:08 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b42-20020a056870392a00b0013187edfde2sm971842oap.12.2022.09.30.13.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 13:49:06 -0700 (PDT)
Received: (nullmailer pid 908078 invoked by uid 1000);
	Fri, 30 Sep 2022 20:49:05 -0000
Date: Fri, 30 Sep 2022 15:49:05 -0500
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@linux.starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 09/30] reset: starfive: jh7100: Move necessary
 properties to device tree
Message-ID: <20220930204905.GA903203-robh@kernel.org>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929143225.17907-10-hal.feng@linux.starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220929143225.17907-10-hal.feng@linux.starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_134911_879606_F2DF32A3 
X-CRM114-Status: GOOD (  16.31  )
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

On Thu, Sep 29, 2022 at 10:32:04PM +0800, Hal Feng wrote:
> Store the necessary properties in device tree instead of .c file,
> in order to apply this reset driver to other StarFive SoCs.
> 
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> ---
>  .../bindings/reset/starfive,jh7100-reset.yaml | 20 ++++++++
>  arch/riscv/boot/dts/starfive/jh7100.dtsi      |  3 ++
>  drivers/reset/reset-starfive-jh7100.c         | 50 +++++++++++++------
>  3 files changed, 57 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> index 300359a5e14b..3eff3f72a1ed 100644
> --- a/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> @@ -20,19 +20,39 @@ properties:
>    "#reset-cells":
>      const: 1
>  
> +  starfive,assert-offset:
> +    description: Offset of the first ASSERT register
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  starfive,status-offset:
> +    description: Offset of the first STATUS register
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  starfive,nr-resets:
> +    description: Number of reset signals
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
>  required:
>    - compatible
>    - reg
>    - "#reset-cells"
> +  - starfive,assert-offset
> +  - starfive,status-offset
> +  - starfive,nr-resets

Adding required properties is a red flag. You can't add required 
properties to an existing binding. That breaks the ABI unless the OS 
deals with the properties being absent. If the OS has to do that, then 
why add them in the first place? All this should be implied by the 
compatible string.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

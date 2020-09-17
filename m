Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA085C433E2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 07:15:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FA0520872
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 07:15:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ql3ROKw9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FA0520872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zxe2NfXq1h5G/9n71WbukUE0T0upS8XI84GBJO1NzCY=; b=Ql3ROKw9FGCjnXgSIw++woSBJN
	tyunrOuIsN2Rf84d5Q58zJOn9DJUQC+8wU6qaMyiNZL9uj9M3mSaiab9O4oAhEuk9/F4sYhUzCOI5
	59m5dYiHxk1eyJDXDDvHiCLCYCAvawI+AY4oTjgG8kWkayLmGCaSqAOsGKnaAZmBNKPq5G4sp83ZB
	UY0Mu1oHAlkb2WFkZnEvLFr+b6se9G8DypUbLR/hDYaQJuKShd8qPTXk45U+xQIrdoCmR261eCx2M
	TAEFNuFUTAgioaHu9+/LUQBU5DWyJQawFdqqeeEOybZnI6lGJaGGW1VcpbdaZMYgOu9BrBOCW8nPR
	AOT2aGqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIo8I-0003ZH-RB; Thu, 17 Sep 2020 07:15:06 +0000
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIo8C-0003WL-7y; Thu, 17 Sep 2020 07:15:01 +0000
Received: by mail-wm1-f68.google.com with SMTP id k18so913531wmj.5;
 Thu, 17 Sep 2020 00:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uaz9kepgEXq9uBdXqyYSIYC/gVUhci+I1g61k9mFWnQ=;
 b=cR1ntMlXeTnO+sbDpt19Pp9TfKEMsKgYPzBHCGzw5UbdroSMNTGoY6cNg3UKPJRvFx
 1+widkJIJ9QuHZDW75jecvF3Lee+cvo1bXEGk74FUihCeXWRkvpo4Gv5wfWDshOXx2t2
 iwwTuubZQjZc0B1mHPjMH7jmD5ok9WbDSqGDmko81GwkSebg1+EzvTGMgsT52f7KzzUQ
 BRe14pjIMTOJomdIQAlQ6/HjU7tJdOKSzZvii4UOmXn/BEBGimRfC72nrVNGIzMsh2TC
 0CuwjU4WlEYm1Qw/4x5wts08a+GxMfcJb6ngHq0cNHzTz0GbsTni2FetIW7pVyZ78cTw
 NUng==
X-Gm-Message-State: AOAM5308/aJjfPF7mAapDmqA4+6GgmZtcZSffgtqaqAp0pYrmgaIrKdS
 x94/HETBtfrMyX7Ojwe4twk=
X-Google-Smtp-Source: ABdhPJwJoXbRCDZ7Y0+x+9aKWBixTbcBqY473DlXztmst9+kEcc+7QCYPQ3dhqjJGZomFsfeIuz1bg==
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr8250390wmj.166.1600326896325; 
 Thu, 17 Sep 2020 00:14:56 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
 by smtp.googlemail.com with ESMTPSA id x16sm36483228wrq.62.2020.09.17.00.14.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Sep 2020 00:14:55 -0700 (PDT)
Date: Thu, 17 Sep 2020 09:14:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Anson Huang <Anson.Huang@nxp.com>, Sungbo Eo <mans0n@gorani.run>,
 Stefan Agner <stefan@agner.ch>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Yash Shah <yash.shah@sifive.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-unisoc@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/8] dt-bindings: gpio: include common schema in GPIO
 controllers
Message-ID: <20200917071451.GA30367@kozik-lap>
References: <20200916162250.16098-1-krzk@kernel.org>
 <20200916162250.16098-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916162250.16098-3-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_031500_381937_3AD77966 
X-CRM114-Status: GOOD (  17.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 16, 2020 at 06:22:44PM +0200, Krzysztof Kozlowski wrote:
> Include the common GPIO schema in GPIO controllers to be sure all common
> properties are properly validated.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml          | 3 +++
>  Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml       | 3 +++
>  Documentation/devicetree/bindings/gpio/gpio-mxs.yaml           | 3 +++
>  Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml       | 3 +++
>  Documentation/devicetree/bindings/gpio/gpio-rda.yaml           | 3 +++
>  Documentation/devicetree/bindings/gpio/gpio-vf610.yaml         | 3 +++
>  Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml          | 1 +
>  Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml  | 3 +++
>  Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml     | 3 +++
>  Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml  | 3 +++
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml        | 3 +++
>  .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml      | 3 +++
>  Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml | 3 +++
>  13 files changed, 37 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
> index c213cb9ddb9f..1ac69b9c03f9 100644
> --- a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
> @@ -13,6 +13,9 @@ description: |
>    This controller is the Chip Common A GPIO present on a number of Broadcom
>    switch ASICs with integrated SoCs.
>  
> +allOf:
> +  - $ref: gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: brcm,iproc-gpio-cca
> diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> index de0b9b5f6a70..737756e081fb 100644
> --- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> @@ -9,6 +9,9 @@ title: Freescale i.MX/MXC GPIO controller
>  maintainers:
>    - Anson Huang <Anson.Huang@nxp.com>
>  
> +allOf:
> +  - $ref: gpio-common.yaml#
> +
>  properties:
>    compatible:
>      oneOf:
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
> index dfa1133f8c5e..7fc04ab35044 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
> @@ -17,6 +17,9 @@ description: |
>    GPIO ports share the same IO space with PIN controller, the GPIO node
>    will be represented as sub-nodes of MXS pinctrl node.
>  
> +allOf:
> +  - $ref: gpio-common.yaml#
> +

I found something to fix - this one should go under patternProperties,
not here.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

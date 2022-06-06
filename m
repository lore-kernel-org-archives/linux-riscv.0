Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D875BC43334
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 19:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fAP1ygsM3l5yNDp2FTsv6SZobGwQngR+myhwMMAn0So=; b=FBVPEY2+f7XE30
	OtimHKt8aV6WKyscB3hKxqwqUaHLSCzdVA/g+ZlzvFTaupQecPxloDBM1xKu5EJeb2gLtKulKvEig
	xhj9eeub84DMhq00o6FQgEJq1vuT28ZcCeA0Efx/0/0KWddW7l9fB1UT9Pj5T4shqmlym8YhkYoXg
	Mkff+XmuEuG80+Lmkv3A5DQvmEIZX+ZWU8R2fmdJXjaBSGCMPsZ+PJLImkjNmuzeANArZSWVooW0h
	akqLd5y4qtaTdRxC7j3prD8aTwTMM3F2XANUVi8Z2xfkX45YM2N0+2nzmUujHgiaw7zCGcr6azl8S
	xnaqxrAUhDanKcdjoRsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIR3-002T1d-2V; Mon, 06 Jun 2022 19:30:45 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIQz-002Szg-9N
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 19:30:42 +0000
Received: by mail-io1-f44.google.com with SMTP id p130so8936175iod.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jun 2022 12:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+NnQO5+cskfKn+MffQu/wn5Q8O9B9/0RnxbWNMjwh3s=;
        b=KF+oK8tcXobyfHUUqeor5gLal+N3VD2nkhxPfas9W5OmYvrpgcvh+oXROWuqQzlpb/
         0WJijFsSty8CvV6HQCmxYcfnN8HK/UFwG5kfOSLAT/RHWwLdPPP8p3ScC+eRusOkByTH
         vlcFbJj2NyKyQ1QveKT1KjQO0BtxNACM7V6sKJVUoqyyCZENRzGhxK5MUsqtXQAAWkAN
         kzGOeT6Z6wGbqFTRmkx606vXQKKB3lABizm8GMjwbj4nbkfaZI3Rrj40HCQ/LBNhYVzW
         NoQ85wyX9KGyE1y7X6qam/SYhbROSznkOmLCteia48JCnxxVI737d5/T7Js6OOMLUXDl
         IgFQ==
X-Gm-Message-State: AOAM532ItiFYQ6SpJtYLWehnbFkD+gvLki57qxN/liy34/Ne75sGZ5tp
	CWVnbQOTpGUn2/gQUkivhw==
X-Google-Smtp-Source: ABdhPJzCfMy93UMW/jDkEJ/kOCS4HxRKuVX5fFmoggqvvpWGhoHJDgzPeJqFrjjUAQwqzWwguBH+bw==
X-Received: by 2002:a05:6602:1541:b0:669:2580:c5de with SMTP id h1-20020a056602154100b006692580c5demr8357148iow.3.1654543839160;
        Mon, 06 Jun 2022 12:30:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id n9-20020a027149000000b0032b5e4281d3sm5882945jaf.62.2022.06.06.12.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 12:30:38 -0700 (PDT)
Received: (nullmailer pid 1123877 invoked by uid 1000);
	Mon, 06 Jun 2022 19:30:36 -0000
Date: Mon, 6 Jun 2022 14:30:36 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Support Opensource <support.opensource@diasemi.com>, Lee Jones <lee.jones@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Steve Twiss <stwiss.opensource@diasemi.com>, Conor Dooley <conor.dooley@microchip.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org, Atul Khare <atulkhare@rivosinc.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: mmc: convert mmc-spi-slot to yaml
Message-ID: <20220606193036.GA1119654-robh@kernel.org>
References: <20220606152557.438771-1-mail@conchuod.ie>
 <20220606152557.438771-2-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220606152557.438771-2-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_123041_372408_A212F09B 
X-CRM114-Status: GOOD (  22.14  )
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

On Mon, Jun 06, 2022 at 04:25:55PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the mmc-spi-slot text based binding doc to yaml,
> with the side effect of cleaning up some of the riscv
> dtbs_check warnings.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/mmc/mmc-spi-slot.txt  | 29 -------
>  .../devicetree/bindings/mmc/mmc-spi-slot.yaml | 79 +++++++++++++++++++
>  2 files changed, 79 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt
>  create mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt
> deleted file mode 100644
> index 5e74db69f581..000000000000
> --- a/Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -MMC/SD/SDIO slot directly connected to a SPI bus
> -
> -This file documents differences between the core properties described
> -by mmc.txt and the properties used by the mmc_spi driver.
> -
> -Required properties:
> -- spi-max-frequency : maximum frequency for this device (Hz).
> -
> -Optional properties:
> -- voltage-ranges : two cells are required, first cell specifies minimum
> -  slot voltage (mV), second cell specifies maximum slot voltage (mV).
> -  Several ranges could be specified. If not provided, 3.2v..3.4v is assumed.
> -- gpios : may specify GPIOs in this order: Card-Detect GPIO,
> -  Write-Protect GPIO. Note that this does not follow the
> -  binding from mmc.txt, for historical reasons.
> -
> -Example:
> -
> -	mmc-slot@0 {
> -		compatible = "fsl,mpc8323rdb-mmc-slot",
> -			     "mmc-spi-slot";
> -		reg = <0>;
> -		gpios = <&qe_pio_d 14 1
> -			 &qe_pio_d 15 0>;
> -		voltage-ranges = <3300 3300>;
> -		spi-max-frequency = <50000000>;
> -		interrupts = <42>;
> -		interrupt-parent = <&PIC>;
> -	};
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
> new file mode 100644
> index 000000000000..cf79092de8fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MMC/SD/SDIO slot directly connected to a SPI bus
> +
> +maintainers:
> +  - Ulf Hansson <ulf.hansson@linaro.org>
> +
> +allOf:
> +  - $ref: "mmc-controller.yaml"
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml
> +
> +description: |
> +  The extra properties used by an mmc connected via SPI.
> +
> +properties:
> +  compatible:
> +    const: mmc-spi-slot
> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-max-frequency: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  voltage-ranges:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix

Looks more like an array to me.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +    description: |
> +      Two cells are required, first cell specifies minimum slot voltage (mV),
> +      second cell specifies maximum slot voltage (mV).
> +    items:
> +      items:
> +        - description: |
> +            value for minimum slot voltage
> +          default: 3200
> +        - description: |
> +            value for maximum slot voltage
> +          default: 3400
> +    maxItems: 1
> +
> +  gpios:
> +    description: |
> +      For historical reasons, this does not follow the generic mmc-controller
> +      binding.
> +    minItems: 1
> +    items:
> +      - description: Card-Detect GPIO
> +      - description: Write-Protect GPIO
> +
> +required:
> +  - compatible
> +  - reg
> +  - spi-max-frequency
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    spi {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      mmc@0 {
> +        compatible = "mmc-spi-slot";
> +        reg = <0>;
> +        gpios = <&gpio 14 GPIO_ACTIVE_LOW>, <&gpio 15 GPIO_ACTIVE_HIGH>;
> +        voltage-ranges = <3300 3300>;
> +        spi-max-frequency = <50000000>;
> +        interrupts = <42>;
> +        interrupt-parent = <&PIC>;
> +      };
> +    };
> +
> +...
> -- 
> 2.36.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

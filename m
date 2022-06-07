Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70809CCA47C
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 10:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgupGoB8JIUk1vzhs7Z2hR63Gi2DWHy5+F/4HraFKm4=; b=SQPWoMkrDs+hOG
	O/T2PWo+z1iLbadibzQ/RQYV/9EchPvS/m+BPGh/97rlyXG37dIh+hZsxo0WEgvaTx4N9G/GdgmOP
	stSTP6KNKDaGgBLtu6EK/BhYbEicM46NFF9hEI8YaZrRNtwgzdAxNFXEmmlmTvQ8kXcdOtTFsMQPj
	WTyGKHXTIifbmJQQiC2q8nhxQ0ZnZIAf50zV2qUzjGiiiCKJaFMM2aa9cQ33Zl8g2ON1v1m7KTEv+
	AL8SIz3Eqjzp7YRzDLXavqpbGa4/Cx//+sJtgy1FQKOycD5ndBoMm5mxVV1YPEa6ZzRen7OjeSTd4
	w0K0QzpQGRzfy7tGhYpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWhF-006m1W-H9; Tue, 07 Jun 2022 10:44:25 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWgk-006ll3-Gi
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 10:44:00 +0000
Received: by mail-lf1-x134.google.com with SMTP id y32so27647650lfa.6
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jun 2022 03:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tfeUV1AwNiT/W19hxcj/NliOzzEK95QXMUgUDGQeGVM=;
        b=mklHMeniN+Ch9TA/pHudegQh81MPjZetIIdfVLjDQbypod4GCI5NH296O4xL3oLXX5
         EtSB95qGej4GPTANqSeLL+ml3+OGdRkpbbQd3nd+tb1z5QHIZPdeWwIy9GjH8pZQc50C
         zDzkcvE0nFPpibbibIYz2TxiRK0MjxayLE0RrcacIAZUSgfhpanYLUuZ1lZQ1ef4w2AN
         GiIxg3XVYvrQR5k8hBIPZ4uPZx8rnz0rqd6kA63O1jDWdVd1H7Bm+5fqY5eA5Cc5zfC6
         0g0oy8babwOZ1jqtD/zY3rQIq6OWxFbiaf+s/hVixKGFRHrlCVFvTyQvlxMm1WKzXD6V
         Wjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tfeUV1AwNiT/W19hxcj/NliOzzEK95QXMUgUDGQeGVM=;
        b=33WuJjj5s0NO581Y7si5Eow4qIg3Vo9nyJy86f/UN1Me6qlU/I//rHw4lyETLd/b45
         oE3OVKM084HC34fEwjSjyARlHp9R2nEDPsBZfSUvFZnNgA9JU8dxQQHmZbYfzLAsW0RC
         x+1hjKa0v0ZmNoWMpQZ4PL5GFAN3RRej7Vqatv5ktvaYDXKi+x6DG0Qf79fGw1u1TzvC
         zNz8HQ5o9DDcVDJJb245z7aBzZ+umjEKTZs2PQuLIwrDKBkgwbASAV9FyFvIg54p5V+y
         xSwYzxdDc23WJXI8eEtXJzFVcZixdQn40L3Ap0wTvnnmOTx6aoXqu+vCJxyEsbavrqg3
         G5NQ==
X-Gm-Message-State: AOAM533mMFxyUKhm7k/t3q2Qd0hadxGI6Bp+QT07lJf/qnFwFVww35ov
	6ChTMT0BWCsOKV5jda46/HFXyJKNgKU8qE9dvM5Gew==
X-Google-Smtp-Source: ABdhPJzPGTimBB70OBlGTNcTyqnDOsp8/I8NBiCevRFSY/lrkvKnq2LAYOlDrii5/PhsOwu2dbZ17DoYgnn4hQ42m3A=
X-Received: by 2002:ac2:54b9:0:b0:479:a29:c1ec with SMTP id
 w25-20020ac254b9000000b004790a29c1ecmr17619658lfk.358.1654598632532; Tue, 07
 Jun 2022 03:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220606201343.514391-1-mail@conchuod.ie> <20220606201343.514391-2-mail@conchuod.ie>
In-Reply-To: <20220606201343.514391-2-mail@conchuod.ie>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 7 Jun 2022 12:43:15 +0200
Message-ID: <CAPDyKFqvo3qf+tK2p-Vkk8=7TGAaAKjAsJvsh=rKYBB_vxpB4A@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: mmc: convert mmc-spi-slot to yaml
To: Conor Dooley <mail@conchuod.ie>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	Support Opensource <support.opensource@diasemi.com>, Lee Jones <lee.jones@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Steve Twiss <stwiss.opensource@diasemi.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Atul Khare <atulkhare@rivosinc.com>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_034354_656509_9131970F 
X-CRM114-Status: GOOD (  21.27  )
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

On Mon, 6 Jun 2022 at 22:14, Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Convert the mmc-spi-slot text based binding doc to yaml,
> with the side effect of cleaning up some of the riscv
> dtbs_check warnings.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  .../devicetree/bindings/mmc/mmc-spi-slot.txt  | 29 -------
>  .../devicetree/bindings/mmc/mmc-spi-slot.yaml | 77 +++++++++++++++++++
>  2 files changed, 77 insertions(+), 29 deletions(-)
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
> -       mmc-slot@0 {
> -               compatible = "fsl,mpc8323rdb-mmc-slot",
> -                            "mmc-spi-slot";
> -               reg = <0>;
> -               gpios = <&qe_pio_d 14 1
> -                        &qe_pio_d 15 0>;
> -               voltage-ranges = <3300 3300>;
> -               spi-max-frequency = <50000000>;
> -               interrupts = <42>;
> -               interrupt-parent = <&PIC>;
> -       };
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
> new file mode 100644
> index 000000000000..c45b91099325
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
> @@ -0,0 +1,77 @@
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
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      Two cells are required, first cell specifies minimum slot voltage (mV),
> +      second cell specifies maximum slot voltage (mV).
> +    items:
> +      - description: |
> +          value for minimum slot voltage in mV
> +        default: 3200
> +      - description: |
> +          value for maximum slot voltage in mV
> +        default: 3400
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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

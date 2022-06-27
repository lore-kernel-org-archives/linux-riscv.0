Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AAEC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 23:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKSYuCX4l2jbyNYIuGNTU9DxS/VVps4txilJqhyewjk=; b=mLLQpGjbsWYrSy
	mlVvrb2dVvBSxnJlNwsf4NMg10xas8NECPHBvcUHR/GfCuJY0LvAIcrUaSgXrfKpgzX78rK3yO6W3
	6Vrr3+mE9dykzPDCyW4abfI4koEnDpCbaJwZ908zaPXBZfuNxS3DkyGfCzIwZOEzvr65j0C9EPCL2
	FLNV9DthKkzmAa935rOYNZnnQQaAKXiQqBjMHGYTznuAhGoeMZrziqjWLBU0fZsyumy8mecPDXNaD
	zJ31QiIa8BLSdKnjvWa6LE7LqQ8R2nULphEDmBp+m96LqYZDc++hTzHXQ4rQTlTa6iszJpJIEqv+4
	3RbW7141TVKiUEfOAZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5y49-003FMt-NG; Mon, 27 Jun 2022 23:22:49 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5y46-003FLe-Pt
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 23:22:48 +0000
Received: by mail-il1-f176.google.com with SMTP id a16so7065372ilr.6
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 16:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3lHtHF5zI7QaQustjx+BDaBkfu/L3JJ+u5pFItRPzJ4=;
        b=lUaK7vNNT84ZKu73pdFmFRVK2YRMRWId6fERH548mvEvZLi5CTMeIKvOZT3TIBpovW
         eUggJg73mQJxZPL/KYAynavQ9WDbu4Ydme1kvYOOuDRuutGJjY1eaRaylcp0thfVL0rB
         bwSbLKbFKakfUTxogYw1BJzFSmHZl5Ej9UdEXVbrQRSpJBcDYi3j0badNcGOFcyWmlOv
         lmr1cN1kTE211T7VGlqmJaivHdNkZ8U5jQKdGw8BoDBiaEFNUUfoqD/iZkfded/FGpeF
         E27lmvyI0FaeUQP1H31qO5dFzlkl5h2Lsst3ocKUVtmjJg3awfoAMY811ICwaah3I+fb
         8CJg==
X-Gm-Message-State: AJIora874bPmYNOmVRKTKMo0rK6BOOGzvSlGtDIp837KyCeYGcsd2/aA
	Y8rVDo/ApIw9tV8iPYsMpA==
X-Google-Smtp-Source: AGRyM1uuZgM8JkppOyMZE7iD5zoRFs4rpAokBWSho/964cJTForbd85QtIKVpY1IbCabypfEAIEcAA==
X-Received: by 2002:a05:6e02:154d:b0:2da:9539:3093 with SMTP id j13-20020a056e02154d00b002da95393093mr4871207ilu.131.1656372163678;
        Mon, 27 Jun 2022 16:22:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id m3-20020a92d703000000b002d9344d4d6bsm5094310iln.79.2022.06.27.16.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 16:22:43 -0700 (PDT)
Received: (nullmailer pid 3158136 invoked by uid 1000);
	Mon, 27 Jun 2022 23:22:40 -0000
Date: Mon, 27 Jun 2022 17:22:40 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Niklas Cassel <niklas.cassel@wdc.com>, 
	Dillon Min <dillon.minfei@gmail.com>, Heng Sia <jee.heng.sia@intel.com>, 
	Jose Abreu <joabreu@synopsys.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dmaengine@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 03/14] ASoC: dt-bindings: convert designware-i2s to
 dt-schema
Message-ID: <20220627232240.GA3156149-robh@kernel.org>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-4-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220618123035.563070-4-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_162246_887255_41532CE3 
X-CRM114-Status: GOOD (  25.00  )
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

On Sat, Jun 18, 2022 at 01:30:25PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the Synopsys DesignWare I2S controller binding to dt-schema.
> There was no listed maintainer but Jose Abreu was the last editor of the
> txt binding so add him as maintainer.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/sound/designware-i2s.txt         | 35 -------
>  .../bindings/sound/snps,designware-i2s.yaml   | 93 +++++++++++++++++++
>  2 files changed, 93 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/designware-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/designware-i2s.txt b/Documentation/devicetree/bindings/sound/designware-i2s.txt
> deleted file mode 100644
> index 6a536d570e29..000000000000
> --- a/Documentation/devicetree/bindings/sound/designware-i2s.txt
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -DesignWare I2S controller
> -
> -Required properties:
> - - compatible : Must be "snps,designware-i2s"
> - - reg : Must contain the I2S core's registers location and length
> - - clocks : Pairs of phandle and specifier referencing the controller's
> -   clocks. The controller expects one clock: the clock used as the sampling
> -   rate reference clock sample.
> - - clock-names : "i2sclk" for the sample rate reference clock.
> - - dmas: Pairs of phandle and specifier for the DMA channels that are used by
> -   the core. The core expects one or two dma channels: one for transmit and
> -   one for receive.
> - - dma-names : "tx" for the transmit channel, "rx" for the receive channel.
> -
> -Optional properties:
> - - interrupts: The interrupt line number for the I2S controller. Add this
> -   parameter if the I2S controller that you are using does not support DMA.
> -
> -For more details on the 'dma', 'dma-names', 'clock' and 'clock-names'
> -properties please check:
> -	* resource-names.txt
> -	* clock/clock-bindings.txt
> -	* dma/dma.txt
> -
> -Example:
> -
> -	soc_i2s: i2s@7ff90000 {
> -		compatible = "snps,designware-i2s";
> -		reg = <0x0 0x7ff90000 0x0 0x1000>;
> -		clocks = <&scpi_i2sclk 0>;
> -		clock-names = "i2sclk";
> -		#sound-dai-cells = <0>;
> -		dmas = <&dma0 5>;
> -		dma-names = "tx";
> -	};
> diff --git a/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
> new file mode 100644
> index 000000000000..5ac9c00157bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/snps,designware-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DesignWare I2S controller
> +
> +maintainers:
> +  - Jose Abreu <joabreu@synopsys.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: canaan,k210-i2s
> +          - const: snps,designware-i2s
> +      - enum:
> +          - snps,designware-i2s
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: |
> +      The interrupt line number for the I2S controller. Add this
> +      parameter if the I2S controller that you are using does not
> +      support DMA.
> +    maxItems: 1
> +
> +  clocks:
> +    description: Sampling rate reference clock

How many?

> +
> +  clock-names:
> +    const: i2sclk
> +
> +  resets:
> +    maxItems: 1
> +
> +  dmas:
> +    items:
> +      - description: TX DMA Channel
> +      - description: RX DMA Channel
> +    minItems: 1
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +    minItems: 1
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: canaan,k210-i2s
> +
> +then:
> +  properties:
> +    "#sound-dai-cells":
> +      const: 1
> +
> +else:
> +  properties:
> +    "#sound-dai-cells":
> +      const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +oneOf:
> +  - required:
> +      - dmas
> +      - dma-names
> +  - required:
> +      - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    soc_i2s: i2s@7ff90000 {
> +      compatible = "snps,designware-i2s";
> +      reg = <0x7ff90000 0x1000>;
> +      clocks = <&scpi_i2sclk 0>;
> +      clock-names = "i2sclk";
> +      #sound-dai-cells = <0>;
> +      dmas = <&dma0 5>;
> +      dma-names = "tx";
> +    };
> -- 
> 2.36.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

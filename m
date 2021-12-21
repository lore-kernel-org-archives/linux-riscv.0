Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E6CC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 13:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqdpiYaxPjGqlfB/w4wrtEMnUkXZGmzWc0ZlrZrwCGU=; b=pGdSmkTahrqCnp
	64s06S5iuzWz/6Mmgkj/N+Vk91ieLciwtv591JDoZ/6e5UQKbx4EKANUloOMtejgp2wO9mHSahrcC
	pF+dHMJHpTLfTbxrtvYfCS1vfWpQi8TS2frggS6LehL75QT14e8wCdjeSDMRjqpVMm7C+uIs3g9q4
	+cXsz4mmaNndMWjctPRKaDsnW3T1R20aJZs9AMejpa8na1LSH40mWd4squ5IRR60mNeTytA2WWPGj
	BkWPfiUtttxrh1JlVK8N3dGuC09+p91KfAL0FOQ0YfVHZDYgXeMzRpc6vCKeXu4b+rVY4AZh617I5
	Q8mNg109UJBxxEd1EaUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzfGI-006ym0-Ng; Tue, 21 Dec 2021 13:33:02 +0000
Received: from mail-qt1-f169.google.com ([209.85.160.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzfGG-006ylA-Gh
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 13:33:02 +0000
Received: by mail-qt1-f169.google.com with SMTP id t11so12818693qtw.3
 for <linux-riscv@lists.infradead.org>; Tue, 21 Dec 2021 05:32:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DHbNzpt0iAUYfu5r/W24qY79bvlSWjiGM23ZPveiPVQ=;
 b=iHYKRXy7Ri7QoYOcGqjCoNxrz2+J9n8f4yei4SA5/HcU7EGIgYPmIugDb7p08w+cpV
 sRBUHwAdBQJTJQ0t1mMTf2tlk5XRMUv5kUak8wFNqWG7aW7qNGcC4A0zH2E2mt3BT0k9
 MVysVvbkRpj8VWB540RKkm73dovngzrlkFmxLlioShSXc8JoWbLSYVs1c+bqoqdNHx/6
 z/oRGHeM1yyMx9KUhl3307A4OjNlYxENVzmMHwaCDPEoftpSzWNdbAFJcevP6/DUzf/4
 fmGzMckmrBowIQSoe5ZpKOkhPzwB2Y6ODeolzjCe0c1Z9yMqiSKj9R+HM1WqazMVt2lW
 s7vQ==
X-Gm-Message-State: AOAM5330OfPbIyM7xfpwVNOIWARyJO6nk9CMdtiNYAquqig/UxS079qK
 G1QtGKQfK1dQE4g3YkGgfA==
X-Google-Smtp-Source: ABdhPJy3Z1ImApelVtQQKouP5J7Mv1P6nlUyv+LtrwSb6ZYUeEsizGUI8yk3xIcWpcpRQ2mkxiO6CA==
X-Received: by 2002:ac8:4f07:: with SMTP id b7mr1371584qte.301.1640093579004; 
 Tue, 21 Dec 2021 05:32:59 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id y16sm12642056qkj.69.2021.12.21.05.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 05:32:58 -0800 (PST)
Received: (nullmailer pid 1262982 invoked by uid 1000);
 Tue, 21 Dec 2021 13:32:55 -0000
Date: Tue, 21 Dec 2021 09:32:55 -0400
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: linus.walleij@linaro.org, bgolaszewski@baylibre.com,
 jassisinghbrar@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 broonie@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
 bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com, atish.patra@wdc.com
Subject: Re: [PATCH v2 11/17] dt-bindings: usb: add bindings for microchip
 mpfs musb
Message-ID: <YcHXhyYhFfPty7mA@robh.at.kernel.org>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-12-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217093325.30612-12-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_053300_588095_B043B7F2 
X-CRM114-Status: GOOD (  14.84  )
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

On Fri, Dec 17, 2021 at 09:33:19AM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the usb controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/usb/microchip,mpfs-musb.yaml     | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
> new file mode 100644
> index 000000000000..eec918046c73
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/microchip,mpfs-musb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MPFS USB Controller Device Tree Bindings
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-musb
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 2
> +    maxItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: dma
> +      - const: mc
> +
> +  clocks:
> +    maxItems: 1
> +
> +  dr_mode:
> +    enum:
> +      - host
> +      - otg
> +      - peripheral

Reference usb-drd.yaml and you can drop this.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - dr_mode
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include "dt-bindings/clock/microchip,mpfs-clock.h"
> +    usb: usb@20201000 {

Drop unused labels.

> +        compatible = "microchip,mpfs-musb";
> +        reg = <0x20201000 0x1000>;
> +        clocks = <&clkcfg CLK_USB>;
> +        interrupt-parent = <&plic>;
> +        interrupts = <86>, <87>;
> +        interrupt-names = "dma","mc";

space                              ^

> +        dr_mode = "host";
> +    };
> +
> +...
> -- 
> 2.33.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

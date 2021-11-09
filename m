Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFEEC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 08:43:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CB0061057
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 08:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CB0061057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cMWGCCDoeYvOtsN4i7Bzwueq4/omUtDKhnskB41Q4oY=; b=w9AGSwO4WnQEY1
	yZ+xpzl2/4bPhXW4X1TtwACMTqwUwtHKdzLkIl8HSJAAbuzQB5VVx/xqB0iVfzGUFNeWiybDTGGHx
	J5hOBnak73I/PvGvqhjC+O/n4LlWu/VZVEN9rZKTSCZjI+fQ+Sj4UqZNvSinBKBPuy7XLRkgQa2D1
	9CcacEhwPINw1cCKnoMlSCr81K8X2YCtay2iP1DaCaWiNSlNjlChOVD3km6uO2iiudZ73YhoWYc1E
	ae6m/kq25zTgbWB9h8EI+/1jrI/LassU51eHFW+e2Vb8n2VhwFDSUO+L3QVPObiK5gC/dYBmkdJzV
	Std8jthyAD5Th+R68gSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMj0-0014Fj-Tv; Tue, 09 Nov 2021 08:43:26 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMiv-0014DQ-I9
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 08:43:23 +0000
Received: by mail-vk1-f179.google.com with SMTP id bc10so9617965vkb.1
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 00:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SKaAwaDUF8hgJ7xnatzckTO00J9HAeQbGqYqskKTjGY=;
 b=4JoEEuWu2f2LONFarIH0E+nvLBgPrIVOE7hWXO0R6DtTlreMCUKujKNRfRRGHdMmSf
 7kl9omtcV/nNKxCKaAdwUrUerxhPtW8aZmjmMzwoSqrUMjamstpUxBCqno3NtT3GEzBH
 ouLoUFZIod4cpq/KK91Ctviy2NCLYIg2BVRjKQp/5O8YKVArHAf0NSjxeQl3xBg+M3KZ
 GsVFtQr1J4LoBOpzW1uXo1lRm8lvoTRZdmUqYPLLjw/Joiw4+EIe2YHpO0v99C+gF9Ro
 AYfIiVT7rg2Crp2vfrMcSN7Vp5LzTvYuOjz321liiwYlaGgKsDecQIihefBiuudkd6PG
 66rw==
X-Gm-Message-State: AOAM533WnhESF/jMpYJVwfAxTYVI67+ZyxSQvCQrKdV74JQY0ABzOjZN
 pkw6HWp+2gBsOKVlD8uAEmyILpr+4SafkB0p
X-Google-Smtp-Source: ABdhPJyX60Na1TitSK5VoIxuZP4DNpAWV99AiaakE62XnINM5wu/KRFeX8lv0Ttr7tdju69q0rLnqA==
X-Received: by 2002:ac5:cdfa:: with SMTP id v26mr8571021vkn.12.1636447399812; 
 Tue, 09 Nov 2021 00:43:19 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id r25sm3157361uab.13.2021.11.09.00.43.19
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 00:43:19 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id i6so37004686uae.6
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 00:43:19 -0800 (PST)
X-Received: by 2002:a05:6102:3a07:: with SMTP id
 b7mr84616404vsu.35.1636447398871; 
 Tue, 09 Nov 2021 00:43:18 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-10-conor.dooley@microchip.com>
In-Reply-To: <20211108150554.4457-10-conor.dooley@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Nov 2021 09:43:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUpGjyN-+u+THiNJ-Ouzp8vRTeg6u23P1BoF8Gi4aSnWQ@mail.gmail.com>
Message-ID: <CAMuHMdUpGjyN-+u+THiNJ-Ouzp8vRTeg6u23P1BoF8Gi4aSnWQ@mail.gmail.com>
Subject: Re: [PATCH 09/13] dt-bindings: gpio: add bindings for microchip mpfs
 gpio
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Mark Brown <broonie@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
 Lewis Hanly <lewis.hanly@microchip.com>, daire.mcnamara@microchip.com, 
 Atish Patra <atish.patra@wdc.com>, ivan.griffin@microchip.com, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-rtc@vger.kernel.org, 
 linux-spi <linux-spi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Bin Meng <bin.meng@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_004321_654483_28EC282D 
X-CRM114-Status: GOOD (  27.29  )
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

Hi Conor,

On Mon, Nov 8, 2021 at 4:07 PM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add device tree bindings for the gpio controller on
> the Microchip PolarFire SoC.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MPFS GPIO Controller Device Tree Bindings
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description: |
> +  This GPIO controller is found on the Microchip PolarFire SoC.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - microchip,mpfs-gpio
> +          - microsemi,ms-pf-mss-gpio

What's the difference between these two?
If there is a difference, please add a comment "# <explanation>"
to each entry.
If there is no difference, please drop the second one.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
> +    minItems: 1
> +    maxItems: 32
> +
> +  interrupt-controller: true
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  ngpios:
> +    description:
> +      The number of GPIOs available.
> +    minimum: 1
> +    maximum: 32
> +    default: 32
> +
> +  gpio-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#interrupt-cells"
> +  - "#gpio-cells"
> +  - gpio-controller
> +  - clocks

Any specific reason interrupt-controller is not required?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include "dt-bindings/clock/microchip,mpfs-clock.h"
> +    #include "dt-bindings/interrupt-controller/microchip,mpfs-plic.h"
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;

Just drop these two...

> +      gpio2: gpio@20122000 {
> +        compatible = "microchip,mpfs-gpio";
> +        reg = <0x0 0x20122000 0x0 0x1000>;

... and the zeros here.

> +        clocks = <&clkcfg CLK_GPIO2>;
> +        interrupt-parent = <&plic>;
> +        interrupts = <PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        status = "disabled";

Please drop this.

> +      };
> +    };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

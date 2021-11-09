Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5007AC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 08:48:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FDFA6117A
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 08:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FDFA6117A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6bfWAuseERl0T+uqoaIq5GOh/yshBdYi9XVdfnF4eTk=; b=lt7X3MtYwCWclZ
	e3RwUL4uTeqhHui1bkTzhNswxLTMw1/EO3NyQRIi3vdCgLjJJpRaFf+lbxQ0rnOgmMaTCrAwRFZDX
	eQs3Ue5/PQUP0dGMfRDuQosTahTOXEm8ZR0P+ZaxtPlhpKq1clYYsCYDddykVscGbYmn1s/JedvQz
	SL1eQhxGpPb3IduGiRCjozabm1oJV8+yKt0T7olAqhQohEsVFwb+10DutBZcb1KUGIr6k0uYOxeSG
	Tt3XjW2+x0hwLtE4bu01D/+k+CS8FHqONINdtJB1dnKe38yC4hN2kkxdiiBeSLvSAZKPaAKmueTjm
	ju267nz+pSO/yiSJQ6Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMoA-0015XL-Mk; Tue, 09 Nov 2021 08:48:46 +0000
Received: from mail-ua1-f54.google.com ([209.85.222.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMo6-0015Vy-Pn
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 08:48:44 +0000
Received: by mail-ua1-f54.google.com with SMTP id p37so35934557uae.8
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 00:48:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WBDXAvrVMOF74SvlOY510+Wn6BscpCQ4WL2UuaAH35U=;
 b=0aMn4R8+OVeRwXa2lz3pbb3D5dquLXj3P0i9NAv/Iwz7uimLkTzPZhq7VU8gcqo5aW
 pbbKowFlKlmeuS0eSIwSdt4QoBzlC/mABHm8Dauj+LklW9wrAAU9B56/Mr/WQyvaaxcd
 8r2vw/QK03f13pcQ5wGgAG0Wcx1dXz8PLYaoa7pRBM7/YbUDKeWtmgI+Xz8SF9HDJ/+j
 uEvnKSIRCAUSj6uZh0bP0CPDJkiT2+T0oNHVHNXIUh3nraNbqbnaJUkQK65viRuMclch
 mkF2tmZCsEk2F8TmQG9mH86Gk78ecnp57HFcvBV4s86J1pp7KchTYYQO8i+Qm0PYvanx
 MUeA==
X-Gm-Message-State: AOAM531C/2+x3TeO8yUOcCjHbS4GhESIz3E+3UUVvR4R5/BTiZYo+lPx
 JTXFmWqJNMXd5t5zBFBfodIFi/wlhahnJ5qP
X-Google-Smtp-Source: ABdhPJzoMeC9sqVWR6wbw5kfM4OiIJnObswErWIKf06pJ3qBGpX4S0lbqbJhdWiZC+bovX3mdJKoVQ==
X-Received: by 2002:a67:c90a:: with SMTP id w10mr9787020vsk.56.1636447721751; 
 Tue, 09 Nov 2021 00:48:41 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id bj50sm688734vkb.7.2021.11.09.00.48.40
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 00:48:41 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id b3so37147259uam.1
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 00:48:40 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr9690352vsj.50.1636447720630; 
 Tue, 09 Nov 2021 00:48:40 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-12-conor.dooley@microchip.com>
In-Reply-To: <20211108150554.4457-12-conor.dooley@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Nov 2021 09:48:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtVTEEhjUr7jj4tBoahPTXAYu9uSKVpr54mCeZx_ktqQ@mail.gmail.com>
Message-ID: <CAMuHMdVtVTEEhjUr7jj4tBoahPTXAYu9uSKVpr54mCeZx_ktqQ@mail.gmail.com>
Subject: Re: [PATCH 11/13] dt-bindings: usb: add bindings for microchip mpfs
 musb
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
X-CRM114-CacheID: sfid-20211109_004842_878453_77637352 
X-CRM114-Status: GOOD (  25.49  )
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
> Add device tree bindings for the usb controller on
> the Microchip PolarFire SoC.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/microchip,mpfs-usb-host.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MPFS USB Controller Device Tree Bindings
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description: |
> +  This USB controller is found on the Microchip PolarFire SoC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-usb-host

"microchip-mpfs-usb", given the dr_mode property below indicates this
controller is not limited to host mode?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    minItems: 2
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
> +    #include "dt-bindings/interrupt-controller/microchip,mpfs-plic.h"
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;

Please drop these two...

> +      usb: usb@20201000 {
> +        compatible = "microchip,mpfs-usb-host";
> +        reg = <0x0 0x20201000 0x0 0x1000>;

... and the zeros here.

> +        clocks = <&clkcfg CLK_USB>;
> +        interrupt-parent = <&plic>;
> +        interrupts = <PLIC_INT_USB_DMA PLIC_INT_USB_MC>;

Please group by angular brackets:

<PLIC_INT_USB_DMA>, <PLIC_INT_USB_MC>.

> +        interrupt-names = "dma","mc";
> +        dr_mode = "host";
> +        status = "disabled";

Please drop this.

> +      };
> +    };
> +
> +...

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

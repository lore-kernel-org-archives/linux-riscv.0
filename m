Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFCEC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 08:46:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8418C61057
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 08:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8418C61057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQTbWXk577LGuVbagnTtlx0swDmC9Q7fxs30EoAebl4=; b=XRMHlF05kfIaQ3
	VZWWs03n3OIxyzGfIt+vBsUhqcO/phfH7YH6jlga/ILWOjlJLs2gmn2tCs+zOUPGvIluIjkdS4GQY
	tcwx4sx9Hmx8iUFUGhcnor6xAu4cZqG/KhVtPRKWrUemVThH56l2L0MIFnquAgjdpws71Pr+2L/ZB
	6DsQhcdIFEaIQPokxkBQd8XoZsUC/5Nd8OpGthbiQT6uG/AuttLRWh359iEphrOVDExUU+LlFiDw3
	FK0ZPM5FfXhl3S23DEe4cY72j/p0HPdTPyl9n2T/ZBALpgua7ywBkS5pI7tiRTW//62dqnCOk79Lt
	uZeiP+/RCcOxugsazO8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMlX-0014oi-75; Tue, 09 Nov 2021 08:46:03 +0000
Received: from mail-ua1-f45.google.com ([209.85.222.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMlS-0014nK-LY
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 08:46:00 +0000
Received: by mail-ua1-f45.google.com with SMTP id p37so35921891uae.8
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 00:45:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cBujI6LULAaiAY45bOf/1wEBrbff5jn8VFxrA8Nj2gY=;
 b=Vk8RMnEA6lLq3qszvjkcdjVJXRt4uRjlXwLK8ttxBp7BzBR+UnyURncaTJGWLl9IR0
 OLwOf5GF1xMEvs+xULX3/LDb8IQQQDvmDLs8ZtYJu9PTxISCKd8fdL8Qk75jC3VmQTHB
 s+P6urGxpSMX2MgTo53XdnsyGkmQ9SmPwv3luqKwb9T+Yx9PWY3uikLd28pagfYiQUtl
 GmKYT8CHm0T0ChJyjbo70t3byx9iNI2c6SjII2iVy/+eQcrITcN6ENohXARAdB5VeKiN
 xUYFFNEAqGA7qrmF2e78Pn1XuoKANvDPIX26V2d/FQvY3MFgwCj0voGigrI1g29AV+Bg
 QG/w==
X-Gm-Message-State: AOAM530Lau3ioZUvjxkqUv48pHbYgW38JTGLSB2tB0eW09PDDBqGKIvK
 K40QYUcwmvh0BmEN1IBPQlsMPW+/tTEAsEzI
X-Google-Smtp-Source: ABdhPJx1RL4n0ASyzQwnGbhkCoqIFYm9zvuabgRjTz6WbNXbMwlRHWRjYOO7a2oH/4DXf2ZfKBtuCw==
X-Received: by 2002:ab0:7041:: with SMTP id v1mr7815327ual.95.1636447557533;
 Tue, 09 Nov 2021 00:45:57 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id y28sm1662378vkl.22.2021.11.09.00.45.56
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 00:45:56 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id az37so37074598uab.13
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 00:45:56 -0800 (PST)
X-Received: by 2002:a9f:2c98:: with SMTP id w24mr7784643uaj.89.1636447556112; 
 Tue, 09 Nov 2021 00:45:56 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-11-conor.dooley@microchip.com>
In-Reply-To: <20211108150554.4457-11-conor.dooley@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Nov 2021 09:45:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWQxz5eprDuqJcsXcp+cKPwxoV=+if_qvS9ah5qBO-shA@mail.gmail.com>
Message-ID: <CAMuHMdWQxz5eprDuqJcsXcp+cKPwxoV=+if_qvS9ah5qBO-shA@mail.gmail.com>
Subject: Re: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs
 spi
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
X-CRM114-CacheID: sfid-20211109_004558_759593_5719D831 
X-CRM114-Status: GOOD (  24.47  )
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
> Add device tree bindings for the {q,}spi controller on
> the Microchip PolarFire SoC.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/microchip,mpfs-spi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MPFS {Q,}SPI Controller Device Tree Bindings
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description: |
> +  This {Q,}SPI controller is found on the Microchip PolarFire SoC.
> +
> +allOf:
> +  - $ref: "spi-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-spi
> +      - microsemi,ms-pf-mss-spi
> +      - microchip,mpfs-qspi
> +      - microsemi,ms-pf-mss-qspi

Same comment as before: what are the ms-pf-mss entries?

> +examples:
> +  - |
> +    #include "dt-bindings/clock/microchip,mpfs-clock.h"
> +    #include "dt-bindings/interrupt-controller/microchip,mpfs-plic.h"
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;

Please drop these two...

> +      spi0: spi@20108000 {
> +        compatible = "microchip,mpfs-spi";
> +        reg = <0x0 0x20108000 0x0 0x1000>;

... and the zeros here.

> +        clocks = <&clkcfg CLK_SPI0>;
> +        interrupt-parent = <&plic>;
> +        interrupts = <PLIC_INT_SPI0>;
> +        spi-max-frequency = <25000000>;
> +        num-cs = <8>;
> +        status = "disabled";

Please drop this.

> +      };
> +    };
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

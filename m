Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB3AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 08:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+5/xBk3ryfLqoJsTg8FKmw+wYbBcClflbuQYV0g5bw=; b=uL1Wrnj3WJ3zlp
	qm/4YDmHgMFZuIpAxtpDeAGN0JEqD6B/UyQsL9dpDk10Qq9CdiU3ueQu9yb4/2R9w+yVHRM5c6K7k
	2k6c/KT0dq83pYYMbFh99hjSwIdJkmx/Y3gs1bPapl3K74dOsq+yVwrrXTnzbpd7z+IWeu/QRsxTF
	lSSzmvfoUxXJXoamkfotFK6uAxHB3GgW55DJ5auUYCLGEZKRiU+3B5ipxSFvLGU1hX5Up2XlNQHVo
	yfP1DYZ1kmdB5rYM9htK7ABPDMnz/QUvnyjmluCVNiP/mxZ7iClN9X0M4b+vqf2XmZc/ZkHQCysnK
	RLrRz8WZmZa1/cImuOkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nASpt-009lmx-Gb; Thu, 20 Jan 2022 08:30:25 +0000
Received: from mail-ua1-f45.google.com ([209.85.222.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nASpp-009llo-UL
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 08:30:23 +0000
Received: by mail-ua1-f45.google.com with SMTP id y4so9492624uad.1
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 00:30:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rjpWEc8ofW9Ln+ZzVM/iDZ8qr5vzNcJvKqxioEzCZGY=;
 b=e0ZwZ+4OCElPWEgCL3oYpRN6Pc/XnFD0DwnQnmsZYA57UxsAG2NFTncj3/SMqxznLO
 oh8egGztO84Re1p+0UPawUa3Qt+h/Roc5zsYOZUSKpdbrZK3cd6WE4ZXlqDFbQIbak7P
 ObwDlODqAR1kok8ymDl6+dLR4st8xmfHufQxqB9mfcXxkKSO3dlT8KqBiG3bDy3TNIy9
 8ZGIuvIVUQZECKleBX3QnVFmzIzpaj+0ZEnEqoryEfn+a2wIZtsFty+YliDQv13FOsVC
 ktsLQPzkwiO2Pgj6dofPo3iXvGc+77Tg/5Aya2nh1QSJGzwyHk/xX2Sm10h1M2VRn3sp
 QrXw==
X-Gm-Message-State: AOAM530jHYZvZ/2C5mBMAinCtG/ULVoJRL+qymiriv9h/YrMHSrax2Ut
 u4wf+YbDFqs+JXXwQBja+LnrdpqfQpBH7g==
X-Google-Smtp-Source: ABdhPJygmrrQC9pZXX5P8sT4nx03h9F3VM17mbe4IYFzwzNgY7ocX7iqvTnVgAZDs+JHJ9SQZbXA8A==
X-Received: by 2002:a05:6102:30a9:: with SMTP id
 y9mr12930051vsd.68.1642667420164; 
 Thu, 20 Jan 2022 00:30:20 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com.
 [209.85.221.171])
 by smtp.gmail.com with ESMTPSA id g199sm422184vkf.30.2022.01.20.00.30.18
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 00:30:19 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id b77so3117761vka.11
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 00:30:18 -0800 (PST)
X-Received: by 2002:a1f:a2d3:: with SMTP id l202mr4847687vke.7.1642667418540; 
 Thu, 20 Jan 2022 00:30:18 -0800 (PST)
MIME-Version: 1.0
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-4-conor.dooley@microchip.com>
In-Reply-To: <20220117110755.3433142-4-conor.dooley@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Jan 2022 09:30:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwe3_F8NeePnoFrLwyzKUwnHtmETC=ambgsC2N3w_h8A@mail.gmail.com>
Message-ID: <CAMuHMdXwe3_F8NeePnoFrLwyzKUwnHtmETC=ambgsC2N3w_h8A@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Mark Brown <broonie@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Lee Jones <lee.jones@linaro.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 Linux PWM List <linux-pwm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-rtc@vger.kernel.org, 
 linux-spi <linux-spi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Heiko Stuebner <heiko@sntech.de>, Lewis Hanly <lewis.hanly@microchip.com>, 
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com, 
 Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_003022_006115_1D5271DD 
X-CRM114-Status: GOOD (  24.44  )
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

On Mon, Jan 17, 2022 at 12:06 PM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add device tree bindings for the i2c controller on
> the Microchip PolarFire SoC.
>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/microchip,mpfs-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MPFS I2C Controller Device Tree Bindings
> +
> +maintainers:
> +  - Daire McNamara <daire.mcnamara@microchip.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
> +      - microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core

Wouldn't it be more logical to have:

    items:
      - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
      - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core

?

If the IP core is reused, it can become:

    items:
      - enum:
          - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
          - microchip,<foo>-i2c # ...
      - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core

That way the driver can just match on the second (fallback) value,
and no further driver changes will be needed (until v8 or later).

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

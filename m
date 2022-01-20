Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34308C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 15:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ss0/HrTsZTpjbDFMCX3hH3HI/e0yNqvuL4xkNNHvBx8=; b=fuImeHNw6eMXE7
	9W/ZUZ/nA0GX3X22Wva6mgjzH9eLQlein/J472Ab/sph6N/hMm5e8WDUHmrXcxHnQpI5DLs3DpevI
	72IMaaQLDuOtnb+NWmZjzvwI82ulEZtK4QyR/kb8WZS79rp0OlDY9evh/KyRD+eJztkQUjPAhJhcT
	9vV8OKod1BaLR3k9b/1NHqOzm/cqlB0FWcaB8WfBI7zWaxw4a64fwLtItQPqBBiWndqYZh8R07TtR
	3kUTzLXu224dNs5dh3LAL0m/eomkHzrKq+uNcMh+m03MxQgRu+vfWSmIYwjeyIQlZsaNUI9aOXv2k
	7nkVcUhsLXwtLuSWTS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAZ04-00C2Zq-Ei; Thu, 20 Jan 2022 15:05:20 +0000
Received: from mail-pj1-f49.google.com ([209.85.216.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAZ00-00C2YA-Qz
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 15:05:18 +0000
Received: by mail-pj1-f49.google.com with SMTP id
 w12-20020a17090a528c00b001b276aa3aabso10412559pjh.0
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 07:05:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1L35cmAx7uCLqrcryWAZKBNOGx+ekbrBkpQCXHRgWJQ=;
 b=Nw+xSqbuQLlwuiujcjgCLAb/XPDJV/It91H5rkUlbj3/N/7soW9ruj7dtXJcRo12w6
 G7y+u6vuIFOcoHCK1uH2tgPBlxuX0TG4wHx2XUIu/44Q27WIgiTUco/H6PKc6Guqgvcj
 MYtMbXQPJkemY8wzB5T5bZrdpq1xLB0ZD8dRedhRjxcX+LKXmMZL7EwMRhLc3fapSgx+
 JG7givUr6u3jdMV/uWcjr15Ynfh8zFiY6bbPMy6PqQTeWu2xwsjC/qHeW/3He1rg8+Fl
 Br0+kNLbeGvS5I9wOi6sCDmqytKMeNcu3OLZFVrkCHfYfdcTQvLmvsCnipiLER9fVD+J
 k9tg==
X-Gm-Message-State: AOAM531mtuBHimkLfDnPtR3vcwwmqTSJvFtbFfgMrII/uG/CB3nLeXvo
 wtv/yaPgpC4qfOKE9f7+zcDO/yRXDZ6UtA==
X-Google-Smtp-Source: ABdhPJwvAfu1h6Yl+mB7bSR6gd5WimXbgzefTFGQRkr23R6cYTY0J6pVeA5dl7YXDyoTKkYNrwn8EA==
X-Received: by 2002:a17:90b:4b0a:: with SMTP id
 lx10mr11231146pjb.176.1642691114427; 
 Thu, 20 Jan 2022 07:05:14 -0800 (PST)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com.
 [209.85.216.45])
 by smtp.gmail.com with ESMTPSA id ne23sm2799729pjb.57.2022.01.20.07.05.14
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 07:05:14 -0800 (PST)
Received: by mail-pj1-f45.google.com with SMTP id
 d15-20020a17090a110f00b001b4e7d27474so6026912pja.2
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 07:05:14 -0800 (PST)
X-Received: by 2002:a05:6102:3581:: with SMTP id
 h1mr14235247vsu.5.1642690617601; 
 Thu, 20 Jan 2022 06:56:57 -0800 (PST)
MIME-Version: 1.0
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-4-conor.dooley@microchip.com>
 <CAMuHMdXwe3_F8NeePnoFrLwyzKUwnHtmETC=ambgsC2N3w_h8A@mail.gmail.com>
 <889dab52-95eb-f36d-0af9-beea958a97e7@microchip.com>
In-Reply-To: <889dab52-95eb-f36d-0af9-beea958a97e7@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Jan 2022 15:56:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXU_M89W7w064YsjuFfqE2m_PeM9HVps0nmaC1+aUHAQw@mail.gmail.com>
Message-ID: <CAMuHMdXU_M89W7w064YsjuFfqE2m_PeM9HVps0nmaC1+aUHAQw@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
To: Conor Dooley <Conor.Dooley@microchip.com>
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
 Heiko Stuebner <heiko@sntech.de>, Lewis Hanly <Lewis.Hanly@microchip.com>, 
 Daire.McNamara@microchip.com, Ivan.Griffin@microchip.com, 
 Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_070516_914173_B52A0D5A 
X-CRM114-Status: GOOD (  36.50  )
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

On Thu, Jan 20, 2022 at 2:42 PM <Conor.Dooley@microchip.com> wrote:
> On 20/01/2022 08:30, Geert Uytterhoeven wrote:
> > On Mon, Jan 17, 2022 at 12:06 PM <conor.dooley@microchip.com> wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> Add device tree bindings for the i2c controller on
> >> the Microchip PolarFire SoC.
> >>
> >> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Thanks for your patch!
> >
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
> >> @@ -0,0 +1,55 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/i2c/microchip,mpfs-i2c.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Microchip MPFS I2C Controller Device Tree Bindings
> >> +
> >> +maintainers:
> >> +  - Daire McNamara <daire.mcnamara@microchip.com>
> >> +
> >> +allOf:
> >> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
> >> +      - microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
> >
> > Wouldn't it be more logical to have:
> >
> >      items:
> >        - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
> >        - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
> >
> > ?
> This would be fine for mpfs-i2c since corei2c is a "superset" - but how
> would that look for the fabric core? I don't think falling back from the
> fabric core onto the "hard" one makes sense. This would mean the
> following two entries:
>
> i2c2: i2c@44000000 { //fabric
>         compatible = "microchip,corei2c-rtl-v7";
> };
> i2c1: i2c@2010b000 { //"hard" mpfs peripheral
>         compatible = "microchip,mpfs-i2c", "microchip,corei2c-rtl-v7";
> };

Oops, I missed that you have both forms.
But in se, they're the same IP core, just hard vs. soft? Then the
below makes sense.

> But this generates errors in dt_binding_check w/ your suggestion - so
> how about the following (similar to ti,omap4-i2c.yaml):
>
>    compatible:
>      oneOf:
>        - items:
>          - const: microchip,mpfs-i2c #  Microchip PolarFire...
>          - const: microchip,corei2c-rtl-v7 # Microchip Fabric...
>        - const: microchip,corei2c-rtl-v7 # Microchip Fabric...
>
> Is there a prettier way than this duplication?

I'm afraid not, and the above scheme is used a lot.

> > If the IP core is reused, it can become:
> >
> >      items:
> >        - enum:
> >            - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
> >            - microchip,<foo>-i2c # ...
> >        - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
> >
> > That way the driver can just match on the second (fallback) value,
> > and no further driver changes will be needed (until v8 or later).

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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06ECC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 13:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjN+80PYiMwvW+WPWohq59aaF2b+j4jSWLVpAXn3Kfw=; b=kJHFiGptZ8DXQR
	NdbVj3fBSDviwCgbh6YJX2YVRYMEEY6v4fHsVB98rO8YLt3IQnNSz6oADbG7omJmGftom8dGKRQ7s
	/yXKywIoT1NCN78Q1yR62TMqqT/1JTlgsiRXvafFdIXY/bb1hzYdQsW23mW0ATadzPur1y2RF2YHu
	zwiflWV3XGA/UpghyIuev/KCS+dACBFS3bV1NYz6s0mr6pw9rMTzdD21O6LzxE0w7ZVGJtkCxDcln
	UPVonb5Jx148TjZJ/KS0N01dhrgjXWHYHxsfOpfAbAI19XaB5KgO5P1GSlifGZPPC5xBbilhtQ+kB
	mfLlL5WMv72RkoQvrbTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myDdo-00AT7w-Em; Fri, 17 Dec 2021 13:51:20 +0000
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myDdl-00AT6W-J9
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 13:51:18 +0000
Received: by mail-pf1-f172.google.com with SMTP id z6so2329601pfe.7
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 05:51:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IzymPMQBtSGyl0KMkX7mRJW21YY8HhWUvGCPuNIAzLc=;
 b=XGLQE1ufw0Va8BNWsdISvlDlR9nAEmim/oij4hF/KKwDrrjmzabIM3sorQcFlW5BFV
 J29smy0aftsN9tq7A2mSFPCr2oTpaypXg1yS6qk7VIL+g4pmOxJ1wjIlXYf8l0ybk4IZ
 HjO7/4uYiVxD3UP+7gxHGh8c0USA5rCp4OyQ0TWamLzYvvu2/Pxtir+Q6PII65AzPYhN
 5ISlaIYRx6pCbXK0Vce0jzpRQjotXA1ff5+Mh1pmrgkKHU411wQj/tqjZLfp9imhqIR2
 jST2pU2A2XlUQaa39bMFnVBEt7iF+f1+Np+x2zTfAPurCi/uJ1fgJjX/hEFi23TXl0L4
 M+Kw==
X-Gm-Message-State: AOAM533yhf4/jipzWBR77HhINlP6MYq6fl1+boJ49XpoQu8LQ05Heg3g
 i5iPB1nIeVyjH12DOXF5pw/cSLMLyfXJWA==
X-Google-Smtp-Source: ABdhPJw1v7dndCARAePOMFh9VWQ0LU/cfsjQ0WSO4oO4yQBQ1c/JubnID+bGZebkDbcVkZ9ICOECdQ==
X-Received: by 2002:a05:6a00:248f:b0:4a0:1e25:3155 with SMTP id
 c15-20020a056a00248f00b004a01e253155mr3226625pfv.21.1639749074030; 
 Fri, 17 Dec 2021 05:51:14 -0800 (PST)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com.
 [209.85.216.47])
 by smtp.gmail.com with ESMTPSA id e11sm8474746pjl.20.2021.12.17.05.51.13
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 05:51:13 -0800 (PST)
Received: by mail-pj1-f47.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so2821443pjb.5
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 05:51:13 -0800 (PST)
X-Received: by 2002:a1f:4641:: with SMTP id t62mr1041561vka.0.1639748601739;
 Fri, 17 Dec 2021 05:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-15-conor.dooley@microchip.com>
In-Reply-To: <20211217093325.30612-15-conor.dooley@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Dec 2021 14:43:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV0N-15kNZ1fnzaj_psNVCRUQP506Noc-tHawmgxqCVeA@mail.gmail.com>
Message-ID: <CAMuHMdV0N-15kNZ1fnzaj_psNVCRUQP506Noc-tHawmgxqCVeA@mail.gmail.com>
Subject: Re: [PATCH v2 14/17] riscv: dts: microchip: add fpga fabric section
 to icicle kit
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
 Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_055117_676237_FFE47704 
X-CRM114-Status: GOOD (  23.80  )
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

On Fri, Dec 17, 2021 at 10:33 AM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Split the device tree for the Microchip MPFS into two sections by adding
> microchip-mpfs-fabric.dtsi, which contains peripherals contained in the
> FPGA fabric.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
> +
> +/ {
> +       corePWM0: pwm@41000000 {
> +               compatible = "microchip,corepwm";
> +               reg = <0x0 0x41000000 0x0 0xF0>;
> +               microchip,sync-update = /bits/ 8 <0>;
> +               #pwm-cells = <2>;
> +               clocks = <&clkcfg CLK_FIC3>;
> +               status = "disabled";
> +       };

I'm wondering if these should be grouped under a "fabric" subnode,
like we have an "soc" subnode for on-SoC devices? Rob?

BTW, do you already have a naming plan for different revisions of
FPGA fabric cores?

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

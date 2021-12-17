Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB59CC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 13:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czkDqt9EKmDvIT1UG/uCc0Kavbjr3RqxGUaYPNfBuAo=; b=gzR0Czyzn2PmCr
	PzBa2UVe3DuEj8yUH4eO9Xl4esCPi1ikMUb6XrlpPPw/518atoStZ01Cy4GR2pmISVl39UMJN6EZx
	x7kfmIJRL4HEGaJIjiSdljMb/rrVDHKFA+uV17b+NuE005ulSuqRi92jnLiC6FWj0IcVuUrTJGyIN
	2AqEn1WwyNTLGdyuTCp0BunreUziNoDXUwSZAuwBfY+S0exOdx4c6qdS5FjzCzkCG/kllg7443MJO
	+A1l3Jy7zfqobHG0HwrqR1DVafccjckax/WRbmrKcgi3fvOYzul5ytn3N4G4ljhr9PcpsjjcqB4tF
	XXCZN0O62GIajgBkXJDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myDJk-00AOeD-8U; Fri, 17 Dec 2021 13:30:36 +0000
Received: from mail-qk1-f173.google.com ([209.85.222.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myDJh-00AOdC-OD
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 13:30:35 +0000
Received: by mail-qk1-f173.google.com with SMTP id m186so2057061qkb.4
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 05:30:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UfQoARdnbkZAiC3vtgUpOeQLmZLNRjjpwLc9s5ZyHps=;
 b=C71/KNUlPKIfwYRpxCMDO8UOS0sEhGlaEoqnxdY6wVEwyTrLQ3VGS/nqXGBJ3gkvMm
 qnGRsEJmHpTQT/6qNWVcQ921wJB2vzRCrTPQBT+9qdHUgqGjzPU4Wgm6BU/q1DleVZX3
 9dXKJpxx6NKW9LLHVXXh4hTXSdpjDp7RXhjKv7QESq+owIA1c2sYi00GBDRDb3+nvXVx
 YYQhaqE2gaHOBJx+M/s+7LJ8kpOjlnmKNZEnWKBQf18q1CrhitN3WbG9r0n1VMQtZeHg
 kwy/r8oQrEanFGK5okWkYoa8/pC+mvVbAc47fSgkhiLFfutXBi5aDgV8O1cQgTnVyZe4
 zC9w==
X-Gm-Message-State: AOAM530AK6qZbtGCIJlqb4ycmQ9IC7tIGwm4K50/z6opNXo/yPJH7lGx
 BNikhXJpCZKhUzpr+yARNKcyBkq/+vNvpA==
X-Google-Smtp-Source: ABdhPJzq/NK8Rjz3AMEZMvJeLQay2f1Oe9Bio7cAvAvwd/lvkzgEYkqlLGWBv9b9hYj7kk9GL6aH8w==
X-Received: by 2002:a05:620a:410e:: with SMTP id
 j14mr1534168qko.47.1639747832506; 
 Fri, 17 Dec 2021 05:30:32 -0800 (PST)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com.
 [209.85.219.50])
 by smtp.gmail.com with ESMTPSA id o21sm7236003qta.89.2021.12.17.05.30.32
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 05:30:32 -0800 (PST)
Received: by mail-qv1-f50.google.com with SMTP id ke6so2345534qvb.1
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 05:30:32 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr960485vsj.77.1639747458226;
 Fri, 17 Dec 2021 05:24:18 -0800 (PST)
MIME-Version: 1.0
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-3-conor.dooley@microchip.com>
In-Reply-To: <20211217093325.30612-3-conor.dooley@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Dec 2021 14:24:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXBm6PMnBTQDZY=3XkGBXsr4wXy8m+WbgHjA8SpctbVCA@mail.gmail.com>
Message-ID: <CAMuHMdXBm6PMnBTQDZY=3XkGBXsr4wXy8m+WbgHjA8SpctbVCA@mail.gmail.com>
Subject: Re: [PATCH v2 02/17] dt-bindings: soc/microchip: update syscontroller
 compatibles
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
X-CRM114-CacheID: sfid-20211217_053033_799008_1F6D3DED 
X-CRM114-Status: GOOD (  21.06  )
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

On Fri, Dec 17, 2021 at 10:32 AM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The Polarfire SoC is currently using two different compatible string
> prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
> its system controller in order to match the compatible string used in
> the soc binding and device tree.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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

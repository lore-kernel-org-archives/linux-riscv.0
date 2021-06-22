Return-Path: <SRS0=VH9+=LQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A458C2B9F4
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 08:18:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46EBC61289
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 08:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46EBC61289
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+RkNM3zvfMPnfYoeSSmjaz8JM5FJ5P+fQgelRgOX7hQ=; b=bLw01mniIpgrUq
	9UyOh2S+mzYOwAOZ72WOeeSeNafTtkfcB6eisnsrWy7yoAw09oxEIF2fqKTj9Dy6ebDcklDsW2Atx
	H9Kj5GFw5ROXiD3IvUWmmiaxZfeaX6idWgIpwBd8Q6Qap8OimKPcXocCr5U2B/D5PC/Po1+41WiRQ
	Mti3p/CNhk1UasvYr/X/tY8kCBYKnYe6rTwTsCAZyj++jJLrwpuimloVJEwnT4qlIHltCbSzkoDlV
	UGXun11u1Wm9FHV69XLyxqXN5jIAnmpku1jlXs7qvciYfhIzSoPyZN50DsEN+bX0IZY18ZLTXWN6a
	hELo7wlGv4v1g0BKSKbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvbbO-006CrT-ET; Tue, 22 Jun 2021 08:17:46 +0000
Received: from mail-vs1-f43.google.com ([209.85.217.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvbbK-006CpX-74; Tue, 22 Jun 2021 08:17:43 +0000
Received: by mail-vs1-f43.google.com with SMTP id u10so263594vsu.12;
 Tue, 22 Jun 2021 01:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s0hVMlLFV5eIwzuXXBEJWEV7FxMfuDBGtQwv1PuAfDc=;
 b=Eu3AxSUt+8oEv/deqQc08PxJ351ScChPMZ7a3vPHLkcyoeS2LfHEY9J3PbrA5CPQL4
 0l8C4kJWCRZwVktFcEpDLV6L2eer1Ggksdx2GvJy+ySUgKcpA/y/0ECMn/MBQlTWHS7i
 XCAGTegKiqLNRyFhFgfzwKGAm3gAWjS1MiIfoES7riSZLldAZ6mD5I+a6w0bYvrHwesg
 Zv/D3U/tT/2bbtpMdMr3LwTnbxRNUvRpng7t9Vn8sA06/wI43XV0OE7b2aMGxmrw6rUQ
 mIzu2/uVap+VOcmBiTO3FLRTNhsxBj9t2LdU4uhgMizwJHA5hQkfi9+Mvouo/EVCcpiI
 Gi4A==
X-Gm-Message-State: AOAM531qXyHzNpmpR6m2yO8E1bzTCoeSC8ThHyeWxG6szpV0vx6zOah+
 eDrGE87EaNullTPn3LMtVk67Cf747ZsE/sXCyC8=
X-Google-Smtp-Source: ABdhPJz3clw2O8tsVFk5F4OGcaBfo9Z8eHqvoF8LwYXAPGollSTCOREHx1S0f08A9nsiznMjaM5G5srL4UVXlJSotsU=
X-Received: by 2002:a05:6102:2011:: with SMTP id
 p17mr21421376vsr.40.1624349860512; 
 Tue, 22 Jun 2021 01:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210615191543.1043414-1-robh@kernel.org>
In-Reply-To: <20210615191543.1043414-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Jun 2021 10:17:28 +0200
Message-ID: <CAMuHMdUGXu8yj3JWKwM8mt7axkrzGMiowC1t0PHrbpxRCBME3w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop redundant minItems/maxItems
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-ide@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>,
 dmaengine <dmaengine@vger.kernel.org>, 
 Linux I2C <linux-i2c@vger.kernel.org>, linux-iio@vger.kernel.org, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
 Linux IOMMU <iommu@lists.linux-foundation.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux MMC List <linux-mmc@vger.kernel.org>, 
 netdev <netdev@vger.kernel.org>, linux-can@vger.kernel.org, 
 linux-pci <linux-pci@vger.kernel.org>, linux-phy@lists.infradead.org, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux PWM List <linux-pwm@vger.kernel.org>, 
 "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-rtc@vger.kernel.org, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, 
 Linux PM list <linux-pm@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
 Jens Axboe <axboe@kernel.dk>, 
 Stephen Boyd <sboyd@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Jakub Kicinski <kuba@kernel.org>, Wolfgang Grandegger <wg@grandegger.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, 
 Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Kishon Vijay Abraham I <kishon@ti.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Lee Jones <lee.jones@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_011742_300003_AC469596 
X-CRM114-Status: GOOD (  30.76  )
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

Hi Rob,

On Tue, Jun 15, 2021 at 9:16 PM Rob Herring <robh@kernel.org> wrote:
> If a property has an 'items' list, then a 'minItems' or 'maxItems' with the
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooling
> will fixup the final schema adding any unspecified minItems/maxItems.
>
> This condition is partially checked with the meta-schema already, but
> only if both 'minItems' and 'maxItems' are equal to the 'items' length.
> An improved meta-schema is pending.

> Signed-off-by: Rob Herring <robh@kernel.org>

> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> @@ -46,7 +46,6 @@ properties:
>
>    clocks:
>      minItems: 3
> -    maxItems: 5
>      items:
>        - description: GMAC main clock
>        - description: MAC TX clock

While resolving the conflict with commit fea99822914039c6
("dt-bindings: net: document ptp_ref clk in dwmac") in soc/for-next,
I noticed the following construct for clock-names:

  clock-names:
    minItems: 3
    maxItems: 6
    contains:
      enum:
        - stmmaceth
        - mac-clk-tx
        - mac-clk-rx
        - ethstp
        - eth-ck
        - ptp_ref

Should this use items instead of enum, and drop maxItems, or is this
a valid construct to support specifying the clocks in random order?
If the latter, it does mean that the order of clock-names may not
match the order of the clock descriptions.

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

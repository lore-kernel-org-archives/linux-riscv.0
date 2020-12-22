Return-Path: <SRS0=WnC5=F2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F14C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 04:38:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24D2922B2D
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 04:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24D2922B2D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=m+tPeek8mQNhAzq9kjKnoOsAAu/GtqP8Pag6plTh6/Q=; b=JaICJ0g7EbKtjU0lt8tgK0NUc
	7OIFIRoQPkbYKu9AxHK/FsM1YubQqP0mGbXHFSSo7zxbbOV55DCJXbgy6zVlenoUoOYi9ylHbH7hq
	ucIO/glIrNmcdQrr+7W/IlwwWx9CR1hnveZFof2Xdchuu9hl9yYpxsGk1zlWebI0WUZYG57QNtxVj
	377n2GsfEameofJ9Un8eittmD0YDbjTpnQnbuLYP0BaHQlqxXlOT5sagZ9v9ApfgqHNiScbf5tQl/
	pA5a3hXdmGmCF3ftHVhoUNxkfYIR4DpUIKKtKTA9YvAj/ncrGYEgZwyf0dTjmBfNiWFQeNhQDkyox
	+Uqe5wNdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krZRA-0007Nr-3G; Tue, 22 Dec 2020 04:38:16 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krZR6-0007N3-Bs
 for linux-riscv@lists.infradead.org; Tue, 22 Dec 2020 04:38:13 +0000
Received: by mail-pl1-x631.google.com with SMTP id x12so6772147plr.10
 for <linux-riscv@lists.infradead.org>; Mon, 21 Dec 2020 20:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=KMIz8Txzy6wjyHZ1wwNssQ3NrdVzopyLXnUTumDPEu4=;
 b=f37eFkln4a/htDAWss+ZS1U+E4a3XjADVDLugAkDTqYfhz6h+hiYbGevReGFf4n1TK
 3LcyVU0v8oEj/ldV2LwRorapAZA9fM+aEsLElWnlYinloCFhkUxXIG6IPajD8tgiJJea
 DpV7MWDOXHzOuzTO/m9jSt14tPoJrM5KP18DX8I2/m7k1RJGMbdgBM9opD9aW4R0APi2
 qwsxK5iRF4PUxhEWWnJeQbqIQ1L1pe/0UYpfefLQ75Em26FoNTFGgZaoz7DKALCRXLEX
 ZOBQkG9jMif+c5JtWfTVjvIK0ay59QORO0oyT5r2YmuHYQtzadQyZ5I+40srrzB7gnDd
 Pygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=KMIz8Txzy6wjyHZ1wwNssQ3NrdVzopyLXnUTumDPEu4=;
 b=jAuOmTDj3aiYRtWX1ZlExFBGLBvc323n5BJAmfq+c3u0eC9Kj1f4s48oVlhCpWPPmC
 kbTkQd/fDctVaOfq/BcgT9/ris72fGGsLFoTFllcL3wD7XYjY8TFx5zWlCRBvI7JCsge
 dgeTnrGIpRIKUnQbrG4SaJBu/l5C3QaxQ8Q6ENgyM7mVKRTpiB0x+4otqXjlqA0yvTqm
 a2CAsdOxmmV5vJCzvIkRvPywx5jeFotk++jkxYyJU4+oE1eJ1Mrw8Q5fmy+yXzstgkRq
 fj8Kk7emeBiQTdOD9ysC6aPVHAaw0FAFM7GBoZKkoRPru5a0EwlaR7U2UfAVHFQIAOS9
 Vi0A==
X-Gm-Message-State: AOAM531BTNrXoJI0xOSAu52NAfzmKQ4gc67pHiW7h/KYSWPT+sx8yjwa
 GTtA8Z8/s7AUVg+wWK0qZ0EXtQ==
X-Google-Smtp-Source: ABdhPJxtuQf6v3NOjOt18j+2XE9PyJZOYNWFlG1D0U0wBxlkHbcyvIu7qM9Ho0qf5ZhZV4ECTna2pA==
X-Received: by 2002:a17:902:694c:b029:da:afba:beab with SMTP id
 k12-20020a170902694cb02900daafbabeabmr19519669plt.32.1608611889761; 
 Mon, 21 Dec 2020 20:38:09 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a136sm19619380pfd.149.2020.12.21.20.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 20:38:09 -0800 (PST)
Date: Mon, 21 Dec 2020 20:38:09 -0800 (PST)
X-Google-Original-Date: Mon, 21 Dec 2020 20:38:02 PST (-0800)
Subject: Re: [PATCH v2 0/9] arch: riscv: add board and SoC DT file support
In-Reply-To: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: yash.shah@sifive.com, robh+dt@kernel.org
Message-ID: <mhng-711b1a2e-46bd-4169-841d-f18fe4bba6bb@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_233812_575155_4566A789 
X-CRM114-Status: GOOD (  23.38  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, peter@korsgaard.com, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 linus.walleij@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, andrew@lunn.ch,
 linux-gpio@vger.kernel.org, yash.shah@sifive.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 bgolaszewski@baylibre.com, linux-riscv@lists.infradead.org,
 lee.jones@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 07 Dec 2020 20:55:32 PST (-0800), yash.shah@sifive.com wrote:
> Start board support by adding initial support for the SiFive FU740 SoC
> and the first development board that uses it, the SiFive HiFive
> Unmatched A00.
>
> Boot-tested on Linux 5.10-rc4 on a HiFive Unmatched A00 board using the
> U-boot and OpenSBI.
>
> This patch series is dependent on Zong's Patchset[0]. The patchset also
> adds two new nodes in dtsi file. The binding documentation patch
> for these nodes are already posted on the mailing list[1][2].
>
> [0]: https://lore.kernel.org/linux-riscv/20201130082330.77268-4-zong.li@sifive.com/T/#u
> [1]: https://lore.kernel.org/linux-riscv/1606714984-16593-1-git-send-email-yash.shah@sifive.com/T/#t
> [2]: https://lore.kernel.org/linux-riscv/20201126030043.67390-1-zong.li@sifive.com/T/#u
>
> Changes in v2:
> - The dt bindings patch is split into several individual patches.
> - Expand the full list for compatible strings in i2c-ocores.txt
>
> Yash Shah (9):
>   dt-bindings: riscv: Update DT binding docs to support SiFive FU740 SoC
>   dt-bindings: spi: Update DT binding docs to support SiFive FU740 SoC
>   dt-bindings: pwm: Update DT binding docs to support SiFive FU740 SoC
>   dt-bindings: serial: Update DT binding docs to support SiFive FU740
>     SoC
>   dt-bindings: gpio: Update DT binding docs to support SiFive FU740 SoC
>   dt-bindings: i2c: Update DT binding docs to support SiFive FU740 SoC
>   riscv: dts: add initial support for the SiFive FU740-C000 SoC
>   dt-bindings: riscv: Update YAML doc to support SiFive HiFive Unmatched
>     board
>   riscv: dts: add initial board data for the SiFive HiFive Unmatched
>
>  .../devicetree/bindings/gpio/sifive,gpio.yaml      |   4 +-
>  .../devicetree/bindings/i2c/i2c-ocores.txt         |   8 +-
>  .../devicetree/bindings/pwm/pwm-sifive.yaml        |   9 +-
>  Documentation/devicetree/bindings/riscv/cpus.yaml  |   6 +
>  .../devicetree/bindings/riscv/sifive.yaml          |  17 +-
>  .../devicetree/bindings/serial/sifive-serial.yaml  |   4 +-
>  .../devicetree/bindings/spi/spi-sifive.yaml        |  10 +-
>  arch/riscv/boot/dts/sifive/Makefile                |   3 +-
>  arch/riscv/boot/dts/sifive/fu740-c000.dtsi         | 293 +++++++++++++++++++++
>  .../riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 253 ++++++++++++++++++
>  10 files changed, 590 insertions(+), 17 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/sifive/fu740-c000.dtsi
>  create mode 100644 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts

Aside from that question about the i2c bug these look good to me.  I don't see
any Ack/Review on the DT side of things, though.  If you want to take them
through a DT tree that's fine for me, I'll leave them in my inbox for now and
if nobody says anything I'll look a bit more and take them for 5.12.

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

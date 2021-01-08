Return-Path: <SRS0=xmGS=GL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89759C433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jan 2021 03:12:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42710208B3
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jan 2021 03:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42710208B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=WaZwybrEn+CeVyeDaFVE5hVRJeu1BqNTSEMdDWy8fVA=; b=MNzBDERBMIU9PrggA6SSyZkJK
	z1wHtWdIIfYODRX6DYR0b382rkpcnI3YY1QSq38gnuYfO17cZJCUY37K+HAduYIegFWn9BjUvV2Q+
	yiW/wm8BCyQvP8suU/mhF6PJew8Co/IivOiBgSQHhry5D3Fcwcyk/uGiqdQyw6cdSUvsUSdbls2DC
	wRtRhl/DlQ+dHGTgW0fqYxElkTns711wml3zBoL++ieSsQeQFa9FNEtXau4ZgoLnwMS/6v6DMYHT8
	UC/ptcYleOod5SUNZH71Z31huN8Uuqhe8uKx9u0BXjt98Wz7s+SpusgBU6PpcAxaIm9Vhdbi36Peg
	UBi1Zw6HA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxiCX-0003Le-7p; Fri, 08 Jan 2021 03:12:33 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxiCT-0003Kt-UX
 for linux-riscv@lists.infradead.org; Fri, 08 Jan 2021 03:12:31 +0000
Received: by mail-pf1-x42a.google.com with SMTP id h186so5373362pfe.0
 for <linux-riscv@lists.infradead.org>; Thu, 07 Jan 2021 19:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=SjIxw593j/BG7x2X3ksVVnxB2uu71tEZmxrMsCj4BiM=;
 b=h2ktI7s4n8xCoqkoSVH4EHqwEk9bp/enKaHzfXG4daTjSVem3smhzGjWZOERytTBt1
 uct1LT+TzDwe1P+tWsKICLXw/a9f1Y5NGttqGWBIlq7W0terFsRHlavDYV15Cf8egItt
 ssfplpyFYDBmZLa4Bss7IeleNkqZcrj7JtyEEWkZPzvoHbtHiUCt9ectPN4fr1muZPpM
 ywgRFdcUijDEgD1cnBXSpdui63N7Pur/ocDaLM3e7YxpSFI76doqdNO0TUcSv7NbVbUQ
 egGDX7XIhDuYYpHZ5nnBoNW06xDqi3t8gF0kGVKM7WpiLVNcmrFR1T8datur+4zctrQd
 fHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=SjIxw593j/BG7x2X3ksVVnxB2uu71tEZmxrMsCj4BiM=;
 b=p36PGAbRogqWaWP9nUcLYvueQyo40GTdUSeKBJi+w59EdV0jc4Mkj+0P+3dYu8+vtV
 FgwGulM3Cayuhe98PWsKJSv2BDk7gD50bWe2pXvP6+6se2E9dUGnhbY3jDLd4WqexgI1
 lVpmf2UYWYfrku6TFZs+ZfXW8o49btI+JBrZbs8Z4WfBFn8EZ/heXd21WuN/hZTi4ze9
 c4MTw5GqFxkYGR7H21xJke1He9SytBeGpPf6yA5WyPXkpXkwsg5vHZnf9H9HH3BtaKWp
 TMwAS8fVTJ0KjSfWPLWg4v8rWK2Z3noR2lti4h0mvkDhf0ugvbQvg+DCxOXYPL5udaDa
 D0zg==
X-Gm-Message-State: AOAM533Iz770ovzqK1Pk3zRMbhRlKqFlb6h+u2oitFtDEMWSnuCyEUki
 qTjeM3HVdFhI+iC+2aF/1ECKTg==
X-Google-Smtp-Source: ABdhPJxeTiUgNKGaw5qtkvFU0vf1c4xAKljKlMnfqJb88DCjQRxBowLvlBQ4gqSHPM+ucT8Xlx08sQ==
X-Received: by 2002:a63:1f47:: with SMTP id q7mr4962672pgm.10.1610075547296;
 Thu, 07 Jan 2021 19:12:27 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id r185sm6938981pfc.53.2021.01.07.19.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 19:12:26 -0800 (PST)
Date: Thu, 07 Jan 2021 19:12:26 -0800 (PST)
X-Google-Original-Date: Thu, 07 Jan 2021 17:52:56 PST (-0800)
Subject: Re: [PATCH v2 0/9] arch: riscv: add board and SoC DT file support
In-Reply-To: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: yash.shah@sifive.com
Message-ID: <mhng-abbd57b3-7d81-4c66-9883-67bc11f1f3a3@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_221230_097312_8701F692 
X-CRM114-Status: GOOD (  27.64  )
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
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-spi@vger.kernel.org,
 andrew@lunn.ch, linux-gpio@vger.kernel.org, yash.shah@sifive.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-i2c@vger.kernel.org,
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

Thanks, these are on for-next.  There was one checkpatch warning about the
missing ISSI device tree entry, but we already had that in the FU540 so I'm OK
letting it slide.

I'm also not really sure this is the right way to do this sort of thing: most
of the patches here really aren't RISC-V things, they're SiFive SOC things.
Some of these patches have been picked up by other trees, but I just took the
rest.  I'm not all that happy about taking DT bindings for things like GPIO or
PWM bindings, but as they're pretty small I'm OK doing it in this instance.

In the future it would really be better to split these up and land them via
their respectitve trees, rather than trying to do all the SOC stuff over here.
I know that can be a headache, but we have that SOC group for this purpose to
try and keep things a bit more together -- I know it was a while ago and there
really hasn't been much SOC activity on the RISC-V side of things so maybe it
hasn't been that widley discussed, but that was really designed to solve these
sorts of problems.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

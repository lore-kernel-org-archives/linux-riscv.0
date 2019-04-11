Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCF4C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 13:03:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 805272133D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 13:03:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l3Pkn8+l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cofgem3n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 805272133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWHZPfef1Fs8PNqpmtYqqaaoSm9bxMtgDyNq8tAaYfc=; b=l3Pkn8+l5NTrun
	P4B52s8XzWn3D2ZbNbZ2TYsLI0Thp40YevqwyPxgQjIgNrPeOdYAOM9JGK8ra3KBnpshegbqhG2J2
	XF37Q/7MLbeEccBqp+vRqV7bAyu8+oruC/7sDkstphzBwamPVIC2P5QZvw07iExoWycPS3689VAIA
	OdASpJHTmk9KlOOku5YxASST3+Rvaw9f8UlEEV+S2ZknedePUu9CbnLLPqqVTruSsYBreDjlGMdPg
	Ks4GFSar0Js6PUUbmDoppzSmQtaMjGmjWGkV9/AeEoKEEb5/FiQzNlRBJ0OAblhfnOg9KR+Fl5cCY
	Hq7WVXqzRlSimBbs4Sig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEZMa-0002UR-Kq; Thu, 11 Apr 2019 13:03:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEZMX-0002U0-7n
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 13:03:31 +0000
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD5BD2184E
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 13:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554987808;
 bh=9XTYCCyJm+fbwpelfocSJVzlq8fNSgae63WzueN6KF0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cofgem3ndsI06Xs8x9qplIdwBEHqQGWHYEGTrm4Pb1L+0DKpYnn5YRtBA4z/o0IX0
 DYb44pquD02iUawKhlqwAVd5Iy5UhSkRcMC0d5tEZIfBJJFg7wkXzgoYJQz7Y1FUXb
 1aV3HYbm+AS+4rkS45nVbCIx7x72o62GdzY5abzU=
Received: by mail-qt1-f170.google.com with SMTP id s15so6939317qtn.3
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 06:03:28 -0700 (PDT)
X-Gm-Message-State: APjAAAWUMvTA2u3z+gkEs3zMYAON/w3R/1kctG32JSNUQh4lcCAWI22b
 sjiBU9S9HLycN6vPrABEOpm7rgo9Ber1aNxhLQ==
X-Google-Smtp-Source: APXvYqyKqshKFZvGidjWRZTIr5iIb0RBzNZgkIQWM4X1rEDTWqFLfA3D0CJ7vYpeef7un8R0LKvwiPuXkBMKWGZ1LW4=
X-Received: by 2002:ac8:3f6f:: with SMTP id w44mr39624776qtk.59.1554987807959; 
 Thu, 11 Apr 2019 06:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
 <20190411084304.5072-6-paul.walmsley@sifive.com>
In-Reply-To: <20190411084304.5072-6-paul.walmsley@sifive.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 11 Apr 2019 08:03:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ-tF081FoK3_O6vR-MUjefvEqTGWKRpW7K33nzav8eXA@mail.gmail.com>
Message-ID: <CAL_JsqJ-tF081FoK3_O6vR-MUjefvEqTGWKRpW7K33nzav8eXA@mail.gmail.com>
Subject: Re: [PATCH 5/6] riscv: dts: add initial board data for the SiFive
 HiFive Unleashed
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_060329_312813_2AF0088C 
X-CRM114-Status: GOOD (  17.16  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 11, 2019 at 3:43 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> Add initial board data for the SiFive HiFive Unleashed A00.
>
> Currently the data populated in this DT file describes the board
> DRAM configuration and the external clock sources that supply the
> PRCI.
>
> This second version adds onboard SPI device data, fixes the board's
> memory size, and adds changes based on comments from Rob Herring
> <robh+dt@kernel.org>.
>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/boot/dts/sifive/Makefile           |  2 +
>  .../dts/sifive/hifive-unleashed-a00-fu540.dts | 69 +++++++++++++++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sifive/Makefile
>  create mode 100644 arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts
>
> diff --git a/arch/riscv/boot/dts/sifive/Makefile b/arch/riscv/boot/dts/sifive/Makefile
> new file mode 100644
> index 000000000000..fb825db888df
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sifive/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_SIFIVE) += hifive-unleashed-a00-fu540.dtb
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts
> new file mode 100644
> index 000000000000..9d35e811a3aa
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: (Apache-2.0 OR GPL-2.0+)
> +/* Copyright (c) 2018-2019 SiFive, Inc */
> +
> +/dts-v1/;
> +
> +#include "fu540-c000.dtsi"
> +
> +/* Clock frequency (in Hz) of the PCB crystal for rtcclk */
> +#define RTCCLK_FREQ            1000000
> +
> +/ {
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +       model = "SiFive HiFive Unleashed A00 (FU540-C000)";
> +       compatible = "sifive,hifive-unleashed-a00-fu540",
> +               "sifive,hifive-unleashed-fu540",
> +               "sifive,fu540-c000", "sifive-fu540";

This doesn't match your schema which has 3 entries. Really, 4 entries
is kind of pointless typically. Usually, just a board and SoC
compatible are enough.

> +
> +       chosen {
> +       };
> +
> +       cpus {
> +               timebase-frequency = <RTCCLK_FREQ>;
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x0 0x80000000 0x2 0x00000000>;
> +       };
> +
> +       soc {
> +       };
> +
> +       hfclk: hfclk {
> +               #clock-cells = <0>;
> +               compatible = "fixed-clock";
> +               clock-frequency = <33333333>;
> +               clock-output-names = "hfclk";
> +       };
> +
> +       rtcclk: rtcclk {
> +               #clock-cells = <0>;
> +               compatible = "fixed-clock";
> +               clock-frequency = <RTCCLK_FREQ>;
> +               clock-output-names = "rtcclk";
> +       };
> +};
> +
> +&qspi0 {
> +       flash@0 {
> +               compatible = "issi,is25wp256d", "jedec,spi-nor";
> +               reg = <0>;
> +               spi-max-frequency = <50000000>;
> +               m25p,fast-read;
> +               spi-tx-bus-width = <4>;
> +               spi-rx-bus-width = <4>;
> +       };
> +};
> +
> +&qspi2 {
> +       status = "okay";
> +       mmc@0 {
> +               compatible = "mmc-spi-slot";
> +               reg = <0>;
> +               spi-max-frequency = <20000000>;
> +               voltage-ranges = <3300 3300>;
> +               disable-wp;
> +       };
> +};
> --
> 2.20.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

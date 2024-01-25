Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A0AC47422
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 18:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+nSUXqLCT/D+ZC/wp8MTBmbmmzaf5W6YqoPe8LD1iWk=; b=kNbZFXPLxMLkzVY9KbTRkK8CCo
	RyMc8yQlTIwEcwTibBb4S/zDC6knGl5sgk4kK2GSZOh8iK+4dkSlvdE5PaX+Kq+g4PLism7o3yD6E
	A1/uZrel+7p0RkksSDFdrBktcDhJSaCMzoe3KdD2Vj2d/Q1tSlvONu/2lWTGjdUyG8+aOmYBuf1xL
	0VOeoHg4GnXZjBuYQQK0g55dQ4bf9Oq45RVvPNdhu5zwryyyS6UEkhkUy0RB9i47829qptYZkRE9p
	RZ2smVTNjEIyy21XLz52XW8dwlrY47oGSuqQh8O1vvfuYcwTHd8qAZQocFeW/a0aD4M166MLMloUh
	9Sh9fmvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT45Q-00000001FmG-2egO;
	Thu, 25 Jan 2024 18:04:24 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT45M-00000001Fkq-0uVJ
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 18:04:22 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 40534404A5
	for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 18:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1706205856;
	bh=ayub+31DU82NBlOvVCPDnf32wdKHrULJJXVRXXuuL9c=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=PYoziZdM51JoXq0hr52HJCcRvUJmo6e5IOCNgetRKw8xU/bOlLtuz5JK+RbYJHF8P
	 Gbn8XOlDNnkhjbLQNUe4FROrj/gCP+lv+3ZKLfv6qhN1Oslg83UkfLkft6yNwvXCX6
	 QF4/n7jZ0z6hp1iNY5tE4DBq84BPSmVcFzEhe3pqvvtqYH7AM+vA91v8PZPnY6dtF5
	 Vt90NZO6jvSin4y5d1v15akjIYijRiHhS68LWEXmkzQJb9rnUz55/SbfRE2AlueIDV
	 8VqrvUUXL/ajQtOFjIg7RkGvRl57Ffk7fbGdJHPG3ns5hbo13Gj1MZCWMruWK6TDuK
	 O4S/TmmGmihqQ==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-42a32dff21bso90751661cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 10:04:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706205855; x=1706810655;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ayub+31DU82NBlOvVCPDnf32wdKHrULJJXVRXXuuL9c=;
        b=aol68txsOUvs40XLOE3IRMc6pd+FA5m+MPedna6BA6H9FJ9wNQRQneR9sYFEH7CjAu
         TdUUMR9SU+VWZwnVYlODCic8VhtOjhEO26aqilsmPhnISv+c8AFMhEjdLWTF9tVZcwTV
         XC21dauz0sgZTTLWZlG5E+m3ghTCwn1Pj7IlP5TNHLs57yp1irz9wotLV7kXqhjBUGGs
         hejzw62oAumc3DE3TmOxplRcgtn0ErIv9G39jWMO7bE4inldXr//ojdT8l7zsqDxr6N+
         jUgo0xZZsSX5cuvz8WADY9fkhziwCsue40n9Lg+qGYCeF09jGC2CXLSRVXRL/YBkYYJ0
         1x3g==
X-Gm-Message-State: AOJu0Yxb1jnUpUo3bCurP3hx3cCC9x+fUjkB8wsGbfhhehozJx5NuTJ+
	Iom+LuceU5+DCdzjuYZsw7gG7SwfHPpsf5VBeof2ZoHbWbwBU1UbTi4KrfM7mhisTnGLpIYbzHY
	RwNzK9Tmine/t8tX3Vazj2IoakchvWl4Pjr/ImpQoM7xVzXdgDJKXih3zZz5CnWKKynhF6rcJDP
	oVe+lUJ0eeUu9Zl4adFD9G0lHFy/9ySVpY01sMVg+2CTiN2+QIeVYJb3ga
X-Received: by 2002:a05:622a:1a9a:b0:42a:39ef:e699 with SMTP id s26-20020a05622a1a9a00b0042a39efe699mr40091qtc.96.1706205855066;
        Thu, 25 Jan 2024 10:04:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGg5qDGICDhkaPcE9L5WU3IS+FgRzGS9fLfcnH+CV2bsry9F4JkTFoWocsmx3aGbnJrWIYBpfdW4XfPKSyrFSA=
X-Received: by 2002:a05:622a:1a9a:b0:42a:39ef:e699 with SMTP id
 s26-20020a05622a1a9a00b0042a39efe699mr40078qtc.96.1706205854721; Thu, 25 Jan
 2024 10:04:14 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 25 Jan 2024 10:04:14 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
References: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
Mime-Version: 1.0
Date: Thu, 25 Jan 2024 10:04:14 -0800
Message-ID: <CAJM55Z8aeQs+KOHo-5dxHE+kDSp5DMaNcw3MukzS_K0HGj92Og@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: sophgo: add watchdog dt node for CV1800
To: AnnanLiu <annan.liu.xdu@outlook.com>, chao.wei@sophgo.com, 
	unicorn_wang@outlook.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_100420_568917_35A09361 
X-CRM114-Status: GOOD (  17.38  )
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

AnnanLiu wrote:
> Add the watchdog device tree node to cv1800 SoC.
>
> Signed-off-by: AnnanLiu <annan.liu.xdu@outlook.com>
> ---
> This patch depends on the clk driver and reset driver.
> Clk driver link:
> https://lore.kernel.org/all/IA1PR20MB49539CDAD9A268CBF6CA184BBB9FA@IA1PR20MB4953.namprd20.prod.outlook.com/
> Reset driver link:
> https://lore.kernel.org/all/20231113005503.2423-1-jszhang@kernel.org/
>
> Changes since v1:
> - Change the name of the watchdog from watchdog0 to watchdog.
> - Change the status of watchdog.
> v1 link:
> https://lore.kernel.org/all/DM6PR20MB23160B8499CC2BFDAE6FCACDAB9EA@DM6PR20MB2316.namprd20.prod.outlook.com/
>
>
>  arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts |  4 ++++
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi          | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
> index 3af9e34b3bc7..75469161bfff 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
> @@ -36,3 +36,7 @@ &osc {
>  &uart0 {
>  	status = "okay";
>  };
> +
> +&watchdog {
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> index aec6401a467b..03ca32cd37b6 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>  /*
>   * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + * Copyright (C) 2024 Annan Liu <annan.liu.xdu@outlook.com>
>   */
>
>  #include <dt-bindings/interrupt-controller/irq.h>
> @@ -103,6 +104,21 @@ uart4: serial@41c0000 {
>  			status = "disabled";
>  		};
>
> +		watchdog: watchdog@3010000{
> +			compatible = "snps,dw-wdt";
> +			reg = <0x3010000 0x100>;
> +			interrupts = <58 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pclk>;
> +			resets = <&rst RST_WDT>;
> +			status = "disabled";
> +		};

Before this patch the nodes seems to be ordered by their address. This
patch breaks that.

> +
> +		pclk: pclk {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <25000000>;
> +		};
> +
>  		plic: interrupt-controller@70000000 {
>  			compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
>  			reg = <0x70000000 0x4000000>;
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

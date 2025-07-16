Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FBDC83F22
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 09:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=whcgQm0fsGXffXnsmaoHGH71PF5VyWxXXUOWA85qMoM=; b=CsAZLZqYaKZRrqsg0+p1enxYMh
	5DwASmoZkljmhH4BwNyc1fpIaVQ00/B/BU6HXt8tK+QzBEsw5DYi3NAkrhRUh4LDUvGy/uR8M9wEF
	ZP2MHU4HGz7I7V86bN41D/02yDFsyEoDT/FNI6VhogrukK2P75eHVuUttRRJtn4rfTn0YnqCH9H4O
	UpE2VSY4HUUwdwmO2XXmv58gJiTOhlcP3CZavtZzwhIXVx/z1Nmzol3WxYE08e1Vhn2PTFKKnZNxx
	OiLwkHHas1wWtsGzsOzOQogCCgdwSJ0EooBtiCiIAUbm54gDSnBI4HnavTe1QvGo/gcJR3b4uQchU
	jtqm+DBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubyJg-00000007Gni-3xzx;
	Wed, 16 Jul 2025 09:20:44 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubyGk-00000007GMb-13l8
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 09:17:43 +0000
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 61AD93F489
	for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1752657457;
	bh=lKJkCknNqquqLUrS/r00x/I5WEOOcl1UCaCBMQgpdJU=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=j1EHC8d+rmobtLe1vN5cpjrTShQXI85i0/G7nz4p7KGFxtDDWrddB6jCf2DoWzIjR
	 bPjAYEwswTs6mGY5IoxzOTfQntHk3VANOYljzXLMlXArmL0qoDrJyjFOXfvZjjR0uy
	 SWvF4y37WjG+KdBbL1PF5le7T/A1LCPtOQptsRCHLW2j6qbiNWzZs5xUquX3HrJsYm
	 rSiRR4YNReyAg5JsHt7MGiGcDfXmIl4U5vNMW5t7Ay9/fIqOx8qoh8pJm1tcPIhWw5
	 0qTgUdbsZ8ezBcwAaqfUS0TQYhhJxJFeOKs1xPsIoNhZlChPcRebAUKhsqczcyDOgy
	 Z+y+yRAyeB8dg==
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-884f2097b16so725805241.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 02:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752657455; x=1753262255;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lKJkCknNqquqLUrS/r00x/I5WEOOcl1UCaCBMQgpdJU=;
        b=ItwmXDVS3wAlr3tH23AByMA8vCUojE+AcGY+cfXgMuOjAwY9HvxpV3yZJe8wrM25P1
         JsbtIJVWyG3jL1na1zS3ykRKZ/0pL5asmCUG4ZJJoxku1oWUja06mowwL7LsN7hBByGw
         QJ4NmQqIxi438lYVo9RsW2oZDKalF6LlpiRfuoMia9I40rCqGgpFDx0a5ZcxHGu4gxcm
         HUAkVmwSNUqHF/EJL3m0J1wbnX6qbjcH8DYJ6yXbgU0IBDFg6KTXP1sQICySYml7ejpA
         bvDwJc5rmdebU/mo9QupBgaMtNE9OGGQ/gA9nIoJ0jPlDIJdX2ZXK0JcLEjMln5FDeyL
         snrg==
X-Gm-Message-State: AOJu0YxZDfn7wj3I/27UnMKlVXLURnqc0mgO7/m5ygbMRx13AC2fxu0F
	6lotYXZj5iigxLlxOUqVIcq9SW052qtAZJCFXWEZO0mtp9FyZM1hwGwZZB7SF/ZnDiF+amJo8x7
	L0jpARcuScIljd3juPItCuhVTH4w+Q0B5GUClil9YaYQswTDmLQzMmYZ8F9KQBo13PrTO393CzN
	aCJ6mc3oiqdgACogPGsIV9B8lFcUWz3IcAXhL4rFcOQs0VV7mb0KitNhUsAy1r
X-Gm-Gg: ASbGncskVCHtf2R8JJNdwSUQ2ZIZKysXE+BP/5yKiTC7WaJh8AP6nb6ocDztG+BFyuu
	F6UVeDhU4QHsBIwky/zyoncTwSOiQqAOsMR/okYy9lS3CgI3v89PyM3xbpg22x/HPjBihMLJnXw
	T5VaUAHNpCRZ7LQ76E6/Uig+pS/Y+UtcKGOb0kSJkrkYmsugZn05n9bw==
X-Received: by 2002:a05:6102:3909:b0:4ee:5244:6607 with SMTP id ada2fe7eead31-4f7ecce6f6amr3650960137.11.1752657455270;
        Wed, 16 Jul 2025 02:17:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiavZVdxpFEKHgbgCF35PoW7jjegI2SWdWpd8C3ymcjoql3WT3rxALLt4r4tuR4OhbDAZbKkza9zz3i73RUPE=
X-Received: by 2002:a05:6102:3909:b0:4ee:5244:6607 with SMTP id
 ada2fe7eead31-4f7ecce6f6amr3650944137.11.1752657454900; Wed, 16 Jul 2025
 02:17:34 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Jul 2025 02:17:34 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Jul 2025 02:17:34 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250716061940.180231-1-e@freeshell.de>
References: <20250716061940.180231-1-e@freeshell.de>
Mime-Version: 1.0
Date: Wed, 16 Jul 2025 02:17:34 -0700
X-Gm-Features: Ac12FXxB4Yd_B-giOtO9phydLKQkpjDC5FpqIWq0GIfPuitk-kXsg_LMxgUuYUs
Message-ID: <CAJM55Z_77aygReSPJyZMtfZWk_UPYTzYLH5E5uEw6K=GSu0LNQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-milkv-mars sort properties
To: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_021742_550343_5E296EA6 
X-CRM114-Status: GOOD (  11.39  )
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

E Shattow wrote:
> Improve style with node property order sort of common properties before
> vendor prefixes
>
> Signed-off-by: E Shattow <e@freeshell.de>

Thanks!

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> index 3bd62ab78523..fdaf6b4557da 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> @@ -12,9 +12,9 @@ / {
>  };
>
>  &gmac0 {
> -	starfive,tx-use-rgmii-clk;
>  	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
>  	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
> +	starfive,tx-use-rgmii-clk;
>  	status = "okay";
>  };
>
> @@ -31,14 +31,14 @@ &pcie1 {
>  };
>
>  &phy0 {
> -	motorcomm,tx-clk-adj-enabled;
> +	rx-internal-delay-ps = <1500>;
> +	tx-internal-delay-ps = <1500>;
> +	motorcomm,rx-clk-drv-microamp = <3970>;
> +	motorcomm,rx-data-drv-microamp = <2910>;
>  	motorcomm,tx-clk-10-inverted;
>  	motorcomm,tx-clk-100-inverted;
>  	motorcomm,tx-clk-1000-inverted;
> -	motorcomm,rx-clk-drv-microamp = <3970>;
> -	motorcomm,rx-data-drv-microamp = <2910>;
> -	rx-internal-delay-ps = <1500>;
> -	tx-internal-delay-ps = <1500>;
> +	motorcomm,tx-clk-adj-enabled;
>  };
>
>  &pwm {
>
> base-commit: 155a3c003e555a7300d156a5252c004c392ec6b0
> --
> 2.50.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1718CA0EC3
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 13:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2X/tPaCRCjZCBvNgpPpn1RfLE7mSznpb4ztMj/m/0Xg=; b=nT0tCi7PEvokOaZZqdEf4g+xE3
	p/LDzCcZmF/fYtNWmM3RjlpPwkwlZXN8ifG1THrzY75aRt9ZyYZUv6QljKZAc0mrQPjSq+4x+plA/
	c1rYV8KFEM/P3tEomMADq4ELxow1iAw28iGvey7swRrq/XihIXbPSOuAhn8CJKFdwl3HlYSYmSNl9
	spcQ5wB6KufcnXhshF2J/3OlsqvMs5DQdsKEP4738qV3F2wkZYRh2ntANraKinXqdfq08Gtse0oqB
	LMbdZzb+ZTE1KJkNRby5sNfHJ15RkQzf8JS1ItgOic03B51N2K0ev4azWXvTNHzKkBGfmg753/IUl
	jqy+rJJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg3Mn-003PqH-2p;
	Tue, 12 Sep 2023 13:23:45 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg3Ml-003Ppb-1o
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 13:23:45 +0000
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 50EC23F639
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 13:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1694525022;
	bh=5Lxiti3504/sLyp6T4S9ryQpCZcLlVdHH9n53WPzN64=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=JR2/VTNmKqgZr3X+J+U7tyaP2bK4NiL8N9otbebnPBmVTvb+pB4BN8jgdsx2EG58S
	 ozBerDRenqkMxJbJxlBE7QsfSFr6Yv3iwaN+E6rmDY94F0NylGyl5OJzDb+YJKWEw+
	 7qPWuPUIM7KYij4XTnpjrTgMkH1O64+XuATZmsfLEtBd7xhoEHC//d/wR7EPHNh3pc
	 5UAj1t28oYs1pEV4YUfeT+CArRMdobOBRTH3nqYlA4xO0LmhHoZMMZse4cMDnWt5CP
	 Yp/PmmEFoxCB8m0rWw2XqXceoFGRfesmXDBPIwYkITZnsOCUyYwSZi9PFDdDhqG+jd
	 dZ6oT2urTPIjg==
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3aa17bcf306so6170278b6e.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 06:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694525021; x=1695129821;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Lxiti3504/sLyp6T4S9ryQpCZcLlVdHH9n53WPzN64=;
        b=NU9B91ib3ab4Biln98uiVsf1QnQc9VzVsD9+f/GJO4NRZOay0wcChwPlkWWO+uEERl
         CiCRLpeUYfACusWpnmIuL2jXuBTt4nJ3t8bOaXD023VaeZMGn1haJzImfPguQMe7DZnS
         eiyXGJLxDJ1Ht4WzTFZ1osBT+fnj9jjOlVPeJOr7JMisN3gbdIZPbuLP0sGhRWV29gZ6
         8os02mnX2F5fK7DRYNwtezucYXn81TsCrViJWjRk/6sBdOx2coKbVqxM5DY1GglROZxN
         jVnUs2QOFjiSPlHtDSku+OY8V6FxLMiUiEOEbYrRppLT1Sicgcy91elJ/0cRmyxoWiM2
         rfhw==
X-Gm-Message-State: AOJu0YzDjpHVrk4/oVBRl8p4/+GzJs2dn0Dns23mb5bYScIO+Cq9ggd+
	lsBifS5Oe6VfmygQjR8U4tooVQTU1dEFLNeCSoO8PpQHt9TlEMOgiwKTwsqK7owvRJlq1ujShqu
	M3eEsINNzw0WkfRMvpiZ880kJ2jnR8KMlYsMMm3Jk/ueWdZOI+BptDRhaOOolrw==
X-Received: by 2002:a05:6808:2394:b0:3a7:72e8:2728 with SMTP id bp20-20020a056808239400b003a772e82728mr16500918oib.36.1694525021074;
        Tue, 12 Sep 2023 06:23:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaUEsbuPdJZYyDwnlg26xZulU68nzVT5NwGrT5q6SFOIuKio1J4UMpbDyFSeywa38u/Cm3m/nJRvaJkVWQaSY=
X-Received: by 2002:a05:6808:2394:b0:3a7:72e8:2728 with SMTP id
 bp20-20020a056808239400b003a772e82728mr16500907oib.36.1694525020862; Tue, 12
 Sep 2023 06:23:40 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Sep 2023 06:23:40 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20230912081402.51477-7-william.qiu@starfivetech.com>
References: <20230912081402.51477-1-william.qiu@starfivetech.com> <20230912081402.51477-7-william.qiu@starfivetech.com>
Mime-Version: 1.0
Date: Tue, 12 Sep 2023 06:23:40 -0700
Message-ID: <CAJM55Z-_V6Ty61u1bF=BziBRwn7bzTygE02g_4B3UW9tG4yikw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: starfive: Drop unused properties and
 limit frquency
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-mmc@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_062343_738004_BE96330C 
X-CRM114-Status: GOOD (  15.99  )
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

William Qiu wrote:
> Drop unused properties and limit cclk_in to 50M, thus cancelling the
> internal frequency and adopting the by-pass mode.

That's two unrelated changes which should really be in different patches. But
again the hardware still has the relevant field in the syscon registers even if
the driver doesn't use it, so maybe just leave them and just keep this patch
adding the assigned-clock* properties.

/Emil

>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 4 ++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi                      | 2 --
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index d79f94432b27..d1f2ec308bca 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -205,6 +205,8 @@ &i2c6 {
>
>  &mmc0 {
>  	max-frequency = <100000000>;
> +	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
> +	assigned-clock-rates = <50000000>;
>  	bus-width = <8>;
>  	cap-mmc-highspeed;
>  	mmc-ddr-1_8v;
> @@ -221,6 +223,8 @@ &mmc0 {
>
>  &mmc1 {
>  	max-frequency = <100000000>;
> +	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO1_SDCARD>;
> +	assigned-clock-rates = <50000000>;
>  	bus-width = <4>;
>  	no-sdio;
>  	no-mmc;
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index e85464c328d0..7b8e841aeef8 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -870,7 +870,6 @@ mmc0: mmc@16010000 {
>  			fifo-depth = <32>;
>  			fifo-watermark-aligned;
>  			data-addr = <0>;
> -			starfive,sysreg = <&sys_syscon 0x14 0x1a 0x7c000000>;
>  			status = "disabled";
>  		};
>
> @@ -886,7 +885,6 @@ mmc1: mmc@16020000 {
>  			fifo-depth = <32>;
>  			fifo-watermark-aligned;
>  			data-addr = <0>;
> -			starfive,sysreg = <&sys_syscon 0x9c 0x1 0x3e>;
>  			status = "disabled";
>  		};
>
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

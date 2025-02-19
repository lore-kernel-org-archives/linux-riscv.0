Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82180C021AA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 13:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KNCTaJ5dpES/SxjwIRYWlzgHU8o5a/GI33fAFW3BTxM=; b=E9tLu3HzB51U92FpZZJickWUSo
	ce/Icl7f2lWynJbLLNw20EaaEZqU2PUCXexguyOnt1XT9l88E2Fd2UgAN6GM2QSWk4JoKFFjCZfPb
	8ikuC3TZ5WnvhFPSeVoYvJqX1/s2BQDwRiTsHRmxh5mxjTbzH8KXOTJaKddkhPkmBvaJzdNM27tDQ
	K1WnBAjbVw+eM2uYiyAiGyRWprVziQcNjrGd32zE+0uMbUwN/ziw4zdYwFXiNp8OTUBaGCTAJtID9
	Exs5j+wDA/H84XAhRP3r1oEBvj742aPYlDanqEMko/WcyUF6ZCZ+ltf7S0mYkLYi1kb7bTOHnJRRA
	ml1+P6zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkGv-0000000D02e-3XR5;
	Wed, 19 Feb 2025 13:37:53 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkFy-0000000CzjW-1Zhz
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 13:36:56 +0000
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E17853F2C2
	for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 13:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739972210;
	bh=oxEPsf6BXD6TadgvNAnbgKVAmCgtOTjj+4mMTP9U1dQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=I4znsC4k9jemo5zvo5E8Xgu9kjstO3YqvdC9bXhboLtiubU1tC+th/bncec2Onqg+
	 Bxht7qbFe0F32lSl3/TwLNcVOuloIyvfhpInZFusfJpHkr/SsxL2ACng+4hBnMCMGb
	 r+jQDi+F1K02rBdKK0nWCVRryj0Nwj2PyRDRhP4FJfZHJIaPDxM+AUGC3Z1BUyKe6a
	 eRk6TVNiGbiC3oQ5kCfmR74P1WI5QzoTENbrEQr6zDd+cjthpewySyMCiL/zCRPC1b
	 APKEJgRxRhxamNM505JCnTSyXmRZ4znqXe7c8cZ8qQ+UbQ5tw1G9gp02EUQVUguGhP
	 KbFSZ9NitsC7w==
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3f3f74a35dbso1158115b6e.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 05:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739972209; x=1740577009;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oxEPsf6BXD6TadgvNAnbgKVAmCgtOTjj+4mMTP9U1dQ=;
        b=Q07gnzhDAmh7ds82Il6qIPUVJItVXRdYHx5p5lNBLt8gOtiSCIlQ080MyigKm6/h0w
         X4Pd0x7Rpe8k2cXoFvEuRcDhHUff9H8I4/yTgBBTq1VDr7+FnaN8uxCHFni13du5WpYr
         sw0qLZod9jpIrEEIYYFTT2BJmMAK7vY/QspoJyaEOQE0mEIb3M7MJVK7KFmPLQbENAsc
         3dK5BFa+bewLKrHq6Te7dwi94DbqXPCFtXDscpxZAsytUCJdw/yBhSg7kI7cXTePJOMb
         r5tErUsZsslyreNYPyROFH+2K/JumKzv8UVnc0RzXxjUSiEMwxP6ff6zk/bEV4g9IC1Y
         09Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVHLXCuJn19GyqoLEFpMcw5fc53b/1mSVZmr15HPU8umU6+MWEYSf7etcP0KIFLo86hsCha11dF035dCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzN5AqOtMy4MX6fR/YeBjk4sMOV3R4DfsnsapyGtgjbq6EVLGBg
	E/nO3hMlLwqU2B+pX/Bp5vtFL61LmSe8X2ceDq9z1qygzsJq0vJF8/T/Xi9L8RvYxisAmFCVxsW
	afVjjYFOdAM+934CSsdc4EJdqxmz9vfMfg+TVoeoKszlM1gxux/e48p/KYvQPsurgS/8j+6/vcm
	EHYvKVb/ZVVWq+uUci2e065gExAWoVRscmBjXBN5LcKrPzGEy6u9DsGIvH
X-Gm-Gg: ASbGncuL9lhrjQbtJCnLd1M4qMXIAdfi1Zlr53rvuM5DA1Iwp3HjMlC+F/PcXfT88hs
	HoYpm7aTGMAQOrOIowukU4uzpLMOdhNIGjxk2RyEZqbGyp9+yaGm0CYYdtbj99on8bkRvo8m0th
	TRmRrD1KTdt9KmIYI=
X-Received: by 2002:a05:6808:13d3:b0:3f4:b14:8d8e with SMTP id 5614622812f47-3f40b148f5emr4687274b6e.39.1739972209580;
        Wed, 19 Feb 2025 05:36:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9hEEslwxSC5v+wHCnRCJJyBAh2kUK73RjgIFEWwcww6qhYK/ZqyM+mXPwcQZQKmE7ZuGDceV0yV4YigAzOhA=
X-Received: by 2002:a05:6808:13d3:b0:3f4:b14:8d8e with SMTP id
 5614622812f47-3f40b148f5emr4687243b6e.39.1739972209253; Wed, 19 Feb 2025
 05:36:49 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Feb 2025 05:36:47 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Feb 2025 05:36:47 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250213-tidy-dollop-cbfc8fc7dc91@spud>
References: <20250213-tidy-dollop-cbfc8fc7dc91@spud>
Mime-Version: 1.0
Date: Wed, 19 Feb 2025 05:36:47 -0800
X-Gm-Features: AWEUYZnRpiBceaWxcRC-Lan6TxlbntvEwYvjC2A02PkLG-UmOt5pf0O2VECu_Eg
Message-ID: <CAJM55Z9VDCymHezg8WGuJUnySzNFKBJO8g5ARJegb2zAmxeuOA@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: dts: starfive: remove non-existent dac from jh7110
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_053654_799972_D6549560 
X-CRM114-Status: GOOD (  15.54  )
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

Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The jh7110 boards do not have a Rohm DAC on them as far as I
> can tell, and they certainly do not have a dh2228fv, as this device does
> not actually exist! Remove the dac nodes from the devicetrees as it is
> not acceptable to pretend to have a device on a board in order to bind
> the spidev driver in Linux.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Hmm.. I thought we already did this, but it must have been another board.
In any case

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Thanks!
/Emil

> ---
> CC: Emil Renner Berthing <kernel@esmil.dk>
> CC: Conor Dooley <conor@kernel.org>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index dd2eefc295e5..c2f70f5e2918 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -350,12 +350,6 @@ &pwm {
>  &spi0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&spi0_pins>;
> -
> -	spi_dev0: spi@0 {
> -		compatible = "rohm,dh2228fv";
> -		reg = <0>;
> -		spi-max-frequency = <10000000>;
> -	};
>  };
>
>  &syscrg {
> --
> 2.45.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

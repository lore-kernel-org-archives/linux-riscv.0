Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3548BCDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 19:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:Mime-Version
	:References:In-Reply-To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7KXRxa00tQtu+9fJRb7Ai3bfLGktTwxMVZD1ROAipxo=; b=HcB3hxslreWUkN
	ur9AGYDgH3TvbARK5yQp/X0B1UEWxV64L/1bED0EcJmjzwQ2QD/4am6xwMBHlzy3U4yOI/eW31wdC
	JD/IeWtwyd/uNly6FAW+O5BaFtXz7gKoznRTsRkkFgC2cDPPjx8WdpSPAseMc5Ree3le2heQ7BtPK
	VlrLukioUVvn7Mob9Tks0yUNYmcWRnHdhie05Af4JfLZ0+C7lCb2QFLq6RuDzA2CDp6ZBU0Vys/Y/
	lItLv/Ujqe2paubOm8Vzp9reJ3eblWmnuCONCtPjtO/CmUwnA4T6x8QlQDlhsYpOzC9kDzPmywW7+
	ciUXu7VCOS7kC+dU1Hug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqeu4-00GY5U-1m;
	Wed, 11 Oct 2023 19:29:56 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqeu0-00GY4y-28
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 19:29:54 +0000
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8B006404AA
	for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 19:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1697052586;
	bh=c9L/gsOrW6x7KgEWB0KPDKoh+ZY2YJ1yGC5weBaF9Kg=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Content-Type;
	b=b92dQYTSZp0at8d5TL38lQtCwPoPE1EDOWTH5QGlnwfxq8MUgfZjqgnHBKfWm7Knf
	 baXpK+lXWCf9HuYE2ohF1iak42WTUY/0Ar21MTMzMZcLs3SdSm1HoO69xxFAaNuQmN
	 uJeGisidho2moWq9j6Ash3HyrrFQGY0lJ2+mCX6LL43Pxez8vVRDBquggFIbtGVA2W
	 e1R4xX9mflSPLszN+85FWG0RiZzkMcWZGnY7VqYckRxZHpAalMZVfK7nrzV7mEGwH9
	 dogLDEJwwxVM0CDf+Sp1R+nHPfztByxOv2CeGjYlKfkkFm7T+RTNOhZwIT8C/btRgM
	 mtjqF8Klc7lvg==
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6c664c09497so261109a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 12:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697052585; x=1697657385;
        h=to:subject:message-id:date:mime-version:references:in-reply-to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9L/gsOrW6x7KgEWB0KPDKoh+ZY2YJ1yGC5weBaF9Kg=;
        b=Hm3kneFrX11ChuEtMCZKT/vgugacuOPNNN2d4U6bYy77S8/lJwxWuJJurDP172mF2g
         bgfNEEp5ObNS0EsbZWO2WV+WyjF2rE9D5oC63S3PgEj5NTtltMeifvlQqb5tEgetKIbb
         a1o2D1OGMNvRbpbx26KvgL+ssxJimT9e/NSm0+jYSvZc+cBiYQHHiwjUJfascbU/RXyR
         6kMESMICfDbrC/4C6C7apXMdUqkD0e7HLOMYVBj4l1HDL07Cn/JO2aIyJT1lCcxE4dsc
         dflOWrE13RrED+Dv2St6GqCdMg8vT8N6q4BmIohB8DxzbixHYjWi2knPOUTUHR88qrXG
         1qlQ==
X-Gm-Message-State: AOJu0YwABL7BxcEsCYxLrWLHhh0qd6d2Hq4ClYeIye0Tg3loMl4cWkuj
	s6qqRpBbGC37YD23btOUakW8faqmeN3L3ISfvx1Jigs6YPA4mLGrObnDS6CPeowRRvpx3Hdjons
	fWwLSYxtAP/E/dGLznRHHyAj/dYYyvAMl8lblALqC66GzVnEy1QOo3XOKXZ5I2Q==
X-Received: by 2002:a05:6830:12d0:b0:6b9:8357:6150 with SMTP id a16-20020a05683012d000b006b983576150mr22651242otq.35.1697052585234;
        Wed, 11 Oct 2023 12:29:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCniG85JTchLTim5ooetQCv6XtCN2Hfw918Yim3tDO0dhAQSPYJeSPxd+7rlU/R7/wacdjyqykDfsDX6EHHOA=
X-Received: by 2002:a05:6830:12d0:b0:6b9:8357:6150 with SMTP id
 a16-20020a05683012d000b006b983576150mr22651223otq.35.1697052585025; Wed, 11
 Oct 2023 12:29:45 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Oct 2023 12:29:44 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231011161414.L6wXZVDb@linutronix.de>
References: <20231011161414.L6wXZVDb@linutronix.de>
Mime-Version: 1.0
Date: Wed, 11 Oct 2023 12:29:44 -0700
Message-ID: <CAJM55Z-YoJnZi4CrwD66v1TaJoYz1jbX+QOFXUDjhm5C9tST0w@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: visionfive 2: correct spi's ss pin
To: Nam Cao <namcao@linuxtronix.de>, kernel@esmil.dk, conor@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	william.qiu@starfivetech.com, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_122953_118224_C4EC394B 
X-CRM114-Status: GOOD (  12.91  )
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

Nam Cao wrote:
> The ss pin of spi0 is the same as sck pin. According to the
> visionfive 2 documentation, it should be pin 49 instead of 48.

Thanks! As far as I can tell this should make the 40pin header match the
Raspberry Pi layout, so

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

>
> Fixes: 74fb20c8f05d ("riscv: dts: starfive: Add spi node and pins configuration")
> Signed-off-by: Nam Cao <namcao@linuxtronix.de>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 12ebe9792356..2c02358abd71 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -431,7 +431,7 @@ GPOEN_ENABLE,
>  		};
>
>  		ss-pins {
> -			pinmux = <GPIOMUX(48, GPOUT_SYS_SPI0_FSS,
> +			pinmux = <GPIOMUX(49, GPOUT_SYS_SPI0_FSS,
>  					      GPOEN_ENABLE,
>  					      GPI_SYS_SPI0_FSS)>;
>  			bias-disable;
> --
> 2.39.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

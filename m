Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E01C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 10:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=G4Nw4MrKT8ljdxhr6nhDGHRmWxw/SnWR6WU+qQMn3go=; b=bjE5b2ZV2Z0XFp+YkJWF5OqtKt
	itUVs/GGY9a4xhdMtLJUyjG+ST+mwPsWcdw11f37neFRABMNAiaeQ9kyF5br0Cro9PqohY2/fj9vb
	snGtFtdDDY26O7ce6BO1c2B3YB8C2xSQGF1NGGjmvevR6DzvHLOtRk0QUXcmM6DBe3XbcgFLyGSeX
	YPq3KSMlO5p2o17JlVnfuEHSPeq/wovnpBaSpbPHw1rkCnipM6jhZYqHWVf5bWuAV82zzWHDE+z4C
	DHFPpQANmvYXe0ub6bsuypSH90Oyc5D7ufhkV/1MTVS077jzuf6H8C7ZQ4xRyLWR994WJb7YMOZ+v
	O9Ql6hng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcmI-00000002uAf-36ZR;
	Wed, 05 Feb 2025 10:37:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcl5-00000002u3t-16xm
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Feb 2025 10:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:Mime-Version:References:In-Reply-To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YsKw1TEBNMtqD2nTeVDQmEu2xielTkirvVyE9cb9euk=; b=YjzWJ4KMM0YTMYIE9YYRpNnsnU
	pTnsa2jAHGNJsarOMSEJaJTMtTscpV2w1RH2hOrBig85V5MSvF6OlmQx4pRYV8548D+qyiGGKHKCS
	fslls4iS/SQmPHPRI0Jz6d5A79W+pG/FfKbjEJuNpzXz/uCphrigGHksPqy35ZeJrWMB6d0X//l0I
	yT2FPlxVxjtIoxB4pJhi8xPz5Pj1nre5EbI6fQpXDUAGGiDdkNv4BCvVcohhTpWfnrVLoebxsmXcq
	zLBtw1Gevu5l5iUtMv8d71Z6QiSQ+oShsYUEqNX/GbLiNIA8IaQfUOKc4ejH1n5xMH2Xy8nkNnMYZ
	YAT2WlrA==;
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcl1-0000000Gbui-3YRy
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 10:35:49 +0000
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5573C3F671
	for <linux-riscv@lists.infradead.org>; Wed,  5 Feb 2025 10:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738751744;
	bh=YsKw1TEBNMtqD2nTeVDQmEu2xielTkirvVyE9cb9euk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=o8r6l/ghcgz9+NI3TRgYcf14BLF2B/8gXXTKn68tarU0+8bT351hieK4LY2LlWb4I
	 PHjBvghISp+o5WqYGOMeMWKlb6qASow/rxcvAIbt/L3b339WFO2e9zoM3w2vXCk9WX
	 Hhnl2Mmr4J+Q++v+EbTOISXrQasmbGWeRJUV8JgaYp5XxagSuXnTpM58G9FtoZ0+e/
	 5GrGBdAUEn96eSLV3jjzDkxoGtr97JVEKPGVCgTy12NeOVfFlX09vwoBVOokRg+GrD
	 XRgxGr1ox9pEkdkXHV0D6RZhq6xOr7uPAfACI7qzcRmiMy4n1/a5ZKNLIiUO6ckStv
	 5srgSmR1fqo9Q==
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-29e5d1e537eso2349862fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 02:35:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738751743; x=1739356543;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YsKw1TEBNMtqD2nTeVDQmEu2xielTkirvVyE9cb9euk=;
        b=vui59aQDdzEQDQ6VPa6De0K29feX8Yo0jamy+Mik9Edqgu3NQ0WFkE5aUoUWxBwjjs
         i5takth6Rr1x3HagopoIumC38BbVtl2g7mpqrpeUqdDIjSUmNoZN6RGCs/6/edVNWuhj
         jdsHTVXkbeZuPE4S9XWiGGiRX+kOouzTEzPLxyAni/x7lemI1D+u3979YEV90IuQdHbo
         vDavV6dp94EDUw+Rgk/16pMGlDfUk+a0trzaeDknuZEWoZGQISk4rGZSYHlnhn43eDru
         FSS7Fx9e7hRr0iFAdGhOjuLPqpcLcIAoV5yxPCumU5tLkU514JKk+DyThtDkuj8iR69R
         54lg==
X-Forwarded-Encrypted: i=1; AJvYcCW4SygkNaT5pmNlR8QyZexc0qPlfGgdyxz1ibb8BYg0Ad1YGCLbRMnEpUcavUaO82GYxhLLQFfyv8j91g==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk0a0Ua7p6sgidG58jnOvw5JwF8xpc82M8ejBcDSihxygUju6q
	gDt6Ol4dsHNfgB6BgN7XaXHQy0skyh4sf+b/GzBTFnPNKN6uoVAhcjs9FCif5JpgiuSRTNLVz2o
	LG5v62Hvp9oj/5ioEuLcBQV8LvPz5AvTWpMY0JqTt2EPk2dzYyF/mvdUUGOoQs0SUQHGk00hQt3
	duzTqqPPOWYgUZfgBV10mCX8MPbqPwHyYnU/giQycsnIEXp85KaYq9nBi8
X-Gm-Gg: ASbGnctqPrXWZk7LEOHEcbV2UIo0XKtueLOibw2OM0ckHLoauSBiiMpAZASsjb9EILr
	DbrHb9Tu2KQjko8VtgALJPGzTyFJONl/sTgRNyUCD97IUiFe9owdV/d3J0bG2kmZ+bfWvyuNtar
	iy7AxTVjS2E06z2yw=
X-Received: by 2002:a05:6871:4607:b0:2b7:f2dc:a4c2 with SMTP id 586e51a60fabf-2b804fa3926mr1450876fac.18.1738751743194;
        Wed, 05 Feb 2025 02:35:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgHRkYQfxZijOHZSWLsYQXFYonztRK0/8FyzsAHEDsc0C9B0GJ+PU4ngVF93zt76VSrCDa1Lbmf3cJU/GplFU=
X-Received: by 2002:a05:6871:4607:b0:2b7:f2dc:a4c2 with SMTP id
 586e51a60fabf-2b804fa3926mr1450870fac.18.1738751742931; Wed, 05 Feb 2025
 02:35:42 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 02:35:42 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 02:35:42 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250203013730.269558-6-e@freeshell.de>
References: <20250203013730.269558-1-e@freeshell.de> <20250203013730.269558-6-e@freeshell.de>
Mime-Version: 1.0
Date: Wed, 5 Feb 2025 02:35:42 -0800
X-Gm-Features: AWEUYZlC49Ns_mcDAKYs7EnS5g_lujF3CtHenhbVzwWucgE36pERYwwD4QIAsgw
Message-ID: <CAJM55Z8oWonQBbUHPbMrVmN2HG9Dwjyr6o7L7spJQFhQfj+7Pw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
To: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_103548_130760_3866DC2F 
X-CRM114-Status: GOOD (  13.49  )
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
> Add bootph-pre-ram hinting to jh7110-common.dtsi:
>   - i2c5_pins and i2c-pins subnode for connection to eeprom
>   - eeprom node
>   - qspi flash configuration subnode
>   - memory node
>   - uart0 for serial console
>
>   With this the U-Boot SPL secondary program loader may drop such
>   overrides when using dt-rebasing with JH7110 OF_UPSTREAM board targets.
>
> Signed-off-by: E Shattow <e@freeshell.de>

I can't find the booph-pre-ram property in any of the schemas in
Documentation/devicetree/bindings. Does make ARCH=riscv <..> dtbs_check not
complain about this?

/Emil

> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 30c5f3487c8b..c9e7ae59ee7c 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -28,6 +28,7 @@ chosen {
>  	memory@40000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x40000000 0x1 0x0>;
> +		bootph-pre-ram;
>  	};
>
>  	gpio-restart {
> @@ -247,6 +248,7 @@ emmc_vdd: aldo4 {
>  	};
>
>  	eeprom@50 {
> +		bootph-pre-ram;
>  		compatible = "atmel,24c04";
>  		reg = <0x50>;
>  		pagesize = <16>;
> @@ -323,6 +325,7 @@ &qspi {
>  	nor_flash: flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
> +		bootph-pre-ram;
>  		cdns,read-delay = <2>;
>  		spi-max-frequency = <100000000>;
>  		cdns,tshsl-ns = <1>;
> @@ -405,6 +408,7 @@ GPOEN_SYS_I2C2_DATA,
>  	};
>
>  	i2c5_pins: i2c5-0 {
> +		bootph-pre-ram;
>  		i2c-pins {
>  			pinmux = <GPIOMUX(19, GPOUT_LOW,
>  					      GPOEN_SYS_I2C5_CLK,
> @@ -413,6 +417,7 @@ GPI_SYS_I2C5_CLK)>,
>  					      GPOEN_SYS_I2C5_DATA,
>  					      GPI_SYS_I2C5_DATA)>;
>  			bias-disable; /* external pull-up */
> +			bootph-pre-ram;
>  			input-enable;
>  			input-schmitt-enable;
>  		};
> @@ -641,6 +646,7 @@ GPOEN_DISABLE,
>  };
>
>  &uart0 {
> +	bootph-pre-ram;
>  	clock-frequency = <24000000>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_pins>;
> --
> 2.47.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

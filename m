Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39636C3ABC9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 17:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KCS+L7yg9SJcXbofdf462obu7IIiRAbbrG/iZplXIsI=; b=WMazN2DK1BbvWOnaapIxUk/tOL
	oawWmwu225IT45yD7ekERP7ioTcxcvjH+R0jAci8yNPtg4fnbu6oxZ2JATIQxHQ1guqQxbMduv5o4
	zA3ugGQ5BpZJ/oNHfULH4HbFGzVNshOxwXxlpZC3TgEDadg4DIC4iTvCBgWg/vUVC9SrSLVSHi5gk
	yZQ0aj8wrP9RMACVfLyJ7Gt9ZXVQRrOvsU8LCeVrxF8VFOeKrO3fs0bckw85LOuaDqMAie98CP/gS
	sb6zPYsbMxzvBRh9A6dGAmBiIYkQ0z9rLErpqMRoBtPDpmxNTCy6WSGRI0oJ1FIYDYAMfG27a9NtA
	pIRFWAQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFc5V-00000001N59-02z4;
	Thu, 15 May 2025 17:09:41 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFc5S-00000001N3q-0fUT
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 17:09:39 +0000
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5C2153F285
	for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 17:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1747328976;
	bh=UaIbzEI3BxG1QqMP2g2eV2vg414lhcb+S7oh2OMWjZQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=PrSxcuOVKB2xfAwg5FSRejVJbyQpm2AdAo1DU3Kpt82ki+ZHz9aX7d5BGZPIib/rb
	 pP9Csyc0YdzViQp4sYM/DTLWPKR0hcYXlOuIyT3GTyb9YkAQlw3iYj3QHAFnc816jL
	 f3gWgFHsRlADBE26o7yzWJcv8j7C/XfrBgoWTDUsLCutNPX4bxggWXbT9op0Mbqlzq
	 E0iGtn0d8KBXjwBMX/LwAWz66Dd+7XLUafAjSjw4kXWhvEP4C6HSMPTHiV5KjrYuMf
	 rfiVZH84ffMCjhWBBrqtm2VDsYFz5he2V4pJOO2ENcDG9tn4x4FrQV/V7WQpOAm/KG
	 nyYjZqM9gt3OQ==
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6021ab9731dso1338487eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 10:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747328975; x=1747933775;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UaIbzEI3BxG1QqMP2g2eV2vg414lhcb+S7oh2OMWjZQ=;
        b=eyB4hdIHuhNbTOchOSOZRbOe4qMMCaRrFwjoiQzjncweUTVcrvBDMquZ5mFNu1FSHH
         hUSBeXQa2UBEyiDhE8trM6F3sRqH5WjC6wew3Vgf0qyAil0IyOPufJVFkZOG5FxL3cXC
         WiXKBmgBrGgOyuokt20HTi5OBQ+Ashk7UVghgmUK72wU0887Sk4A01tRApx2cXZWD0vm
         IqdgOrRaly443hPPZfi7MBIBBAIhTNm/wtSSLHtZe4yr39ZRi9OAOgwb61KCDgOVBrx+
         8U0eFeJrFh82Hqb43izQ3eTV9mEkGHd2hQwK4NIu45mNqRZwbPviUwj7dBjGVFvIlCkQ
         veVA==
X-Forwarded-Encrypted: i=1; AJvYcCUwOhFysySX9xa6PxMYdcgLvs1/fAZDBa/zBvWWLKyZUETTrk4wmMBWe4+rVLieKQbVEva71cX+U0g7qg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxN8KIPnhmYFP0/+kmpwEn/sJkeO1d0CSF9WcCsCO3cz19i7q4+
	ukpoLg2nz7Ktkq2f/f3uJlxYNkmfI2wskIwDR5u3hChGtC2yf2c9FCbEjFkWO4CxGi19el/MltI
	u1MOsEAeXy9fgIZ+rUdhGk8Wl/EThkV4OErCwy2bHisdN/XJE9E7gPHotzfQWxzmvGYNAeQu1K0
	PhtdXecYg/v7geSRXlz545lw18NbmBUoaiQQ/I8JQnCE8SITmZP/liHlHwapgK
X-Gm-Gg: ASbGnctVegDJywUkd1QWTyMIO+9n26Z5qasEhike27zot7h6xhKKkDK94WpLKsuXU5B
	Cw/8t/zxxL1GWfIBdIBTEiPuNrH1nx99OCdf8MPt9y9fzm0mZDTrcdY1WamThLQknJQHL0g==
X-Received: by 2002:a05:6820:988:b0:600:5673:69ef with SMTP id 006d021491bc7-609f37cd90cmr76669eaf.1.1747328975214;
        Thu, 15 May 2025 10:09:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLutELQZn16DHflkUI5wwt/XutX3gwxVSCFyJcK6PHHXgJubotxdGaczJ6DOqIwaSUHGtaxo4SC0sf9J0GSBY=
X-Received: by 2002:a05:6820:988:b0:600:5673:69ef with SMTP id
 006d021491bc7-609f37cd90cmr76650eaf.1.1747328974888; Thu, 15 May 2025
 10:09:34 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:09:34 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:09:34 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250502103101.957016-3-e@freeshell.de>
References: <20250502103101.957016-1-e@freeshell.de> <20250502103101.957016-3-e@freeshell.de>
Mime-Version: 1.0
Date: Thu, 15 May 2025 10:09:34 -0700
X-Gm-Features: AX0GCFtbB_vNvAHLPwksxwineqOYhEEn3iOraJm-aHuirOkyFfVbsN4SakWjbrc
Message-ID: <CAJM55Z-TMEn2oukQ_5XvyoQ4U-BVjt5dekVv2T3=vsQWL4CCuA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] riscv: dts: starfive: jh7110-common: qspi flash
 setting read-delay 2 cycles max 100MHz
To: E Shattow <e@freeshell.de>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_100938_320833_3673EE7A 
X-CRM114-Status: GOOD (  13.96  )
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
> Use qspi flash read-delay and spi-max-frequency settings compatible with
> U-Boot bootloader.
>
> Observations from testing on Pine64 Star64 hardware within U-Boot bootloader
> and read-delay=2 are spi-max-frequency less than 49.8MHz fails to write,
> corrupt data writes at 25MHz to 49.799999MHz, and valid data writes at
> 49.8MHz to 100MHz (not tested above 100MHz). No valid spi-max-frequency
> was found for 1<read-delay<=3 and corrupt data with read-delay=3.
>
> Looking around the Linux codebase it is common to see read-delay 2 cycles
> with spi-max-frequency 100MHz and testing confirms this to work in both
> U-Boot and Linux.
>
> Signed-off-by: E Shattow <e@freeshell.de>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Thanks!

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index f1489e9bb83e..5c525686c043 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -317,8 +317,8 @@ &qspi {
>  	nor_flash: flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
> -		cdns,read-delay = <5>;
> -		spi-max-frequency = <12000000>;
> +		cdns,read-delay = <2>;
> +		spi-max-frequency = <100000000>;
>  		cdns,tshsl-ns = <1>;
>  		cdns,tsd2d-ns = <1>;
>  		cdns,tchsh-ns = <1>;
> --
> 2.49.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

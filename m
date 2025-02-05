Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A750C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 10:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=U6unLh3NvgkaevJj8Lr+HzZ/ppOOJpLF9OE40XPyZkE=; b=pit219QdghPRCKcdOyvLR/axyd
	16eqXHCGNna2WjQYouCi2kaZE3df3qYY22kJmnTOGKrK15gmh2U8XBLQ4UbEqQTlxyKKS/G67L9+e
	MnPPgVRI+Q1mzbjKwOOah3cdBWyL+DgzZDooyPVn7VaaySFhzbol+SdEBFy7NK2Aa201m3N8XoUsA
	9mwyDUzVn4I1BvdxRLdxNkEqBsZ6tb52irixpMfLPlI3tZ/U2pxwUrXeyjgPwl6qcmtWY1+1SnxZp
	4YYPbPO3ptInYTm7ztbqUnP9sPtFhntmHWdKXocI6sIpuxU7UdTlB1WSrX0gh0fagsozzaB5yXqcA
	BjPd7tbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcZq-00000002rdb-0P6B;
	Wed, 05 Feb 2025 10:24:14 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcUp-00000002quv-058Z
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 10:19:04 +0000
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B38883F682
	for <linux-riscv@lists.infradead.org>; Wed,  5 Feb 2025 10:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738750740;
	bh=qdkmBfYX7XaFvkbF82y8TuYeK5Pl9Wtpk+6BoGjJ8iE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=X61hQVYlgfKRtJgUjlzeEVwbK+XctK6GPmSAuEGq4vjm6d92rvhyDXVDO2JvhpayM
	 Nly3v1jO/ugUJ4XokffH2MNGlse3qC7vJPY5LnX0LpSzUKWzWo9Mbbbyt+fN8gTNlz
	 5uIq2U+vML2P35Kwr2edFmRoiOas74VazQZXmRRpPdOEwn+uf2fse8r44E0Okkvhnr
	 WqIIYos9U7g/NQxqF6fsepdbX9rtPwgI7Z4biUc8yQ8sebgzz/w5bD45FC4vbMspZu
	 fFENW1lBF57fk/uOgWM2F/kc6kFujrrD8y/L697hw/CLkXyGxTTk4LlODA4CkrAHR4
	 xNRkFJ8tvM45Q==
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-2b7c8cb27a2so1206129fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 02:19:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738750738; x=1739355538;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdkmBfYX7XaFvkbF82y8TuYeK5Pl9Wtpk+6BoGjJ8iE=;
        b=oeKM1rjZdEzMGjjXc2KsBKXTFGvzdf5IYg4Zf7Oee49TOyudrwEL8QG4XYEmHoE2z+
         +Z5Pv/ZiEhEBkX4EJ2cfSAXRXH/uKSKcPyF0pbup/aOm3n+w2+40vpzZ2oqWQTUhTaqT
         Ti3KN260bjpULZeqUTHvBrsedmsh/eBxud3Gxc9a7AxozwHUM1PhgBn4tNtgGhHbSlWf
         h2kpCPJXzWP1Ehhs/55/YFfq5uUH0zGVvWWFwNhSM76pNfvLjrXpUOG2UL6beNa6ikry
         xcOJr5BoAONnYi+o3gEZzjVvI9cT/gBhrDlz33aB1WlwZA7sHsXSGGmVWtbnMNRt11IU
         dB5w==
X-Forwarded-Encrypted: i=1; AJvYcCXtTkyYIwmxH1SrixXMbcono+e4AFXbocOcQ4O1q5p6NQhidFWQL2904S8Rp2lr7BFtmuOgw0CIZSPu7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLcygX6vQJXmYIQbWiP+qA+zhQ8ihNrC66fC1RuFMcQQudNSn6
	FbSX0gsuBL7dG00Uek/E9DAYOr36boVwzbRNfVoMwOYIIVfmcbElMNI5L9E79ANa6BjiS0uuNEc
	OUvoH+K1WSNTtaBU6oPrd5kw165/ZXuogMcsX1eFWsJ8fphjDJSbapjkPHAbRQIYXe/hDrcxcyl
	swGQKhnfypXreoWjcdOkcTfy7BiUDpj15VAjvlCmV6YY5Ghyf0F7piKCnn
X-Gm-Gg: ASbGncsgHhVDwRuWSde/I3lgPsyKWl+NQYvTirejmNZVl8iCG6Z8R4FaLtmYgFSAUd8
	zV8nRdET1AxC5tuxfaCYguUdvbUZqZWGv5Hg5h58+C7XSSgzY2WAZ45sWKqO4H14soMcVdcNoqo
	dljobR0i1W1PLAYA0=
X-Received: by 2002:a05:6871:e084:b0:297:285e:f9f4 with SMTP id 586e51a60fabf-2b8051adca4mr1499627fac.34.1738750738562;
        Wed, 05 Feb 2025 02:18:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8qpmyypodVkKYUm5sF+zKulTYncfI/CugaO758DUSia69BHhLRf7V5DXO6RaNISNiLy1Da5yWB2DzQ0HOlGA=
X-Received: by 2002:a05:6871:e084:b0:297:285e:f9f4 with SMTP id
 586e51a60fabf-2b8051adca4mr1499615fac.34.1738750738324; Wed, 05 Feb 2025
 02:18:58 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 02:18:57 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 02:18:57 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250203013730.269558-3-e@freeshell.de>
References: <20250203013730.269558-1-e@freeshell.de> <20250203013730.269558-3-e@freeshell.de>
Mime-Version: 1.0
Date: Wed, 5 Feb 2025 02:18:57 -0800
X-Gm-Features: AWEUYZlXlKzbHypA-jASfEJOP33KWqL31P4KBU9ridEeOOm8C_Po6yFU92yHqVE
Message-ID: <CAJM55Z9s4FMCmGaGPGBdcJWxoTNO1gupMLAq2a1fExiho5W1jw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] riscv: dts: starfive: jh7110-common: qspi flash
 setting read-delay 2 cycles max 100MHz
To: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_021903_183282_1F43AD4E 
X-CRM114-Status: GOOD (  11.20  )
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
> Sync qspi flash setting to read-delay=2 and spi-max-frequency 100MHz for
> better compatibility with operating system and downstream boot loader SPL
> secondary program loader.

Here you should be explaining why these values better describe the hardware. To
me this just reads as "u-boot does this, so let's do the same" whith doesn't
really explain anything.

/Emil

>
> Signed-off-by: E Shattow <e@freeshell.de>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index a5661b677687..8a59c3001339 100644
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
> 2.47.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

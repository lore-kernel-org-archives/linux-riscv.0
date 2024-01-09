Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2245DC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 12:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uyQ6+bpfQSluYbD350rpOyzbI5QmQ8lJMxKSf4k8VrA=; b=aoEcIq0rQbYaWlJ2O5IXaw9Sel
	yvk5zx0dJaaPkRODsBWwqZuDnfrgIBBwgao7NT6kNxUlVEYjaLFEA0dRYLBFG6DCtriZlzFYj7Uv3
	PsVIrOy1scAmPCo5eRZyvbuBVQtAWBGCRarLMo9vc3HdJthh383SNsS6KcpJK7OoyO3kr3K6KRgPF
	5acbiwMlYvQwi/drStu7bMKT7SGXiEF6XJnPaBjJaO9RYypARTmt9C/TKIsLSg6vx1rR5lnpG094V
	Vs52wdBHEIoDKAZSMC+e2ZDFBr1Hw+e+esrX5iegn4j4zXi2Y44ScGmrLO+w5HAX2f/y2IJv0uZkL
	iKGKngDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNAoA-008BAg-22;
	Tue, 09 Jan 2024 12:02:14 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNAo7-008B93-1j
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 12:02:13 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 74C493F5B0
	for <linux-riscv@lists.infradead.org>; Tue,  9 Jan 2024 12:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704801723;
	bh=L1elb+jQDH8Ds4j0H9TwFb8qhYJOMk8842XOLWCtnwk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=bd+ciOEX3IPwfxFJXjKV2I/Wv0gx06Q0MgSrKjmYirIHn77p623UrjLpSVLPXRE1I
	 rANAJOicubM2wq/Qq2+rrQ0uiCxQHE0eDP56OECPD45MJb5s+i2kH66rCt5Ec4sSqV
	 ehvzHdqPp2eVtdTuTYk/k1QO5RDH87k75qnI69VXIEplLzxMDQs9Zr0TNhWfsdzLNt
	 mawJEVix2+AfIJsnEK4Kkm0K76nBCZaYK3SWFrR4oreI1EbPgIHS4CIADuQqDYGjdV
	 5uIz15/gX6M4Ez7DTP00UO2XN8hV9VK21vEn+0D+82QFu2itT3qkI6/sr9BQ4kOiU5
	 6/LiI2KwYqA5A==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-429a05fd0b7so9796431cf.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jan 2024 04:02:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704801722; x=1705406522;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L1elb+jQDH8Ds4j0H9TwFb8qhYJOMk8842XOLWCtnwk=;
        b=G1ZmPSDtc4zD6a0aUy3HWhv8WIBujbSEZzncOkevLZ1Gu7aqIWM9B9uiu74rp+IemC
         V1aYBbc2Gi9b9D/EmOYNBYJEqpLsciv/Xq6ramvOTgREJUvOdyOGaSSFenofQL2wAuFB
         vGnF/LQVDW96VU0E/SZoJW+7l4VnVrrmGbG3+uOdW2GMvHMjmapdiPOL2tpzU3Osq9EO
         5p7m9juCuI1CdYJ2vtnpAvj72PMTJh//F6/v9ua5fQgSfkH9hZzsd8ICl/7HG4n24Rr2
         2/6Zv70rD1dAnUmQwR4Kt+W+sz02eVRHOe3ma03YkkvpQe2hn8wi5IntZVGCVwoiRBH6
         3kxQ==
X-Gm-Message-State: AOJu0Yy+8fIUIrE7OWBxzhgbZtN3TXaC599Var3h3A1TvlsF2Z+bD/0s
	DjhIzRIESd728GVkN28T8QvyHRGaLA8vm8OTIt1mgQ5+RYW0phCIRQNsnIAAzAACRZcWo2ZMUZd
	1Arx0UT4lqc2Az9fRugj0No7N5+ZYVr+CXVzMPXcsnc8ycbLNo0dyu+pH4deHTsaDLBzrfElFMG
	n/
X-Received: by 2002:a05:622a:296:b0:429:8c55:4a47 with SMTP id z22-20020a05622a029600b004298c554a47mr3134583qtw.49.1704801722311;
        Tue, 09 Jan 2024 04:02:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMPXlm4YerbG4iFFrjePx491jhh9/Le2ba+OtVW+O9m5xRSQ0+oOgEThByi2GFboNj49o1lT5y0Tt5RnHjosQ=
X-Received: by 2002:a05:622a:296:b0:429:8c55:4a47 with SMTP id
 z22-20020a05622a029600b004298c554a47mr3134568qtw.49.1704801722008; Tue, 09
 Jan 2024 04:02:02 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Jan 2024 04:02:01 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240108-majorette-overtly-4ec65d0a15e9@spud>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
 <20240103132852.298964-4-emil.renner.berthing@canonical.com> <20240108-majorette-overtly-4ec65d0a15e9@spud>
Mime-Version: 1.0
Date: Tue, 9 Jan 2024 04:02:01 -0800
Message-ID: <CAJM55Z_2zhELW3E7p94J05We17xTC2Rejs5AigNJOHCGHVr_zg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] riscv: dts: thead: Add TH1520 pin control nodes
To: Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Drew Fustini <dfustini@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_040211_710916_0E71EA02 
X-CRM114-Status: GOOD (  16.50  )
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
> On Wed, Jan 03, 2024 at 02:28:40PM +0100, Emil Renner Berthing wrote:
> > Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC.
> >
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > ---
> >  .../boot/dts/thead/th1520-beaglev-ahead.dts   |  4 ++++
> >  .../dts/thead/th1520-lichee-module-4a.dtsi    |  4 ++++
> >  arch/riscv/boot/dts/thead/th1520.dtsi         | 24 +++++++++++++++++++
> >  3 files changed, 32 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > index 70e8042c8304..6c56318a8705 100644
> > --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > @@ -44,6 +44,10 @@ &osc_32k {
> >  	clock-frequency = <32768>;
> >  };
> >
> > +&aonsys_clk {
> > +	clock-frequency = <73728000>;
> > +};
> > +
> >  &apb_clk {
> >  	clock-frequency = <62500000>;
> >  };
> > diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > index a802ab110429..9865925be372 100644
> > --- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > @@ -25,6 +25,10 @@ &osc_32k {
> >  	clock-frequency = <32768>;
> >  };
> >
> > +&aonsys_clk {
> > +	clock-frequency = <73728000>;
> > +};
> > +
> >  &apb_clk {
> >  	clock-frequency = <62500000>;
> >  };
> > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > index ba4d2c673ac8..e65a306ff575 100644
> > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > @@ -134,6 +134,12 @@ osc_32k: 32k-oscillator {
> >  		#clock-cells = <0>;
> >  	};
> >
> > +	aonsys_clk: aonsys-clk {
> > +		compatible = "fixed-clock";
> > +		clock-output-names = "aonsys_clk";
> > +		#clock-cells = <0>;
> > +	};
>
> Did this stuff sneak into this commit accidentally?

Not really by accident no. It turns out the clock tree has gates for the bus
clock of each pinctrl block and I think it's better to add this clock
dependency to the bindings and driver up front.

Since there is not yet any clock driver the initial device tree for the TH1520
included the dummy apb_clk that two of the pinctrl blocks derive their clock
from, but not the "aonsys" clock needed by the "always-on" pinctrl. I thought
it was better to add this dummy clock with the only (so far) user of it, but if
you have a better idea, let me know.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

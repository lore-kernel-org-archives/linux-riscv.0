Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97FCC10F04
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 14:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=toQEiERJm+H0x98J+1yjS+ijNiqZXv0gkNHszkXnzQY=; b=nj/cHF164qYLLu5agSeznaOCaH
	ZeIaj3Ww4YY1PaMpsaLnmUGqNTriRGIeFr4FL1Xf08h1FOSaIL5gzGXi7Bh/89H6tfps9A+qAyU8d
	NgmRqJWKg4gW2HAURTIsYjQUASp/mFoUB1oN131B4aEeESOQNZ9Xwm/UCYb+99G01rUSiGF51Cmr0
	1vRN7PwPykK6ujtlMAoxAH0LE64DmBlMGKNc38+DHP4sqF+e3ghgmbJWdLbF3wGn2V0zEGKpLWFPG
	0fOxV96fGdIVutbtc/gu/Q0Tx3MHovpHSt24nHiO8SuOyY5d9Mu+vd/3dh2nBbQZ2xpcPTDSMIjll
	pNZQsOYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAWio-007dgm-32;
	Tue, 05 Dec 2023 14:48:26 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAWil-007dfg-0c
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 14:48:25 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 190E43F044
	for <linux-riscv@lists.infradead.org>; Tue,  5 Dec 2023 14:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701787698;
	bh=qEnhI07ZwfWB+LTPcQ8NmAlx9Ikuvbn1P7U+F8t2Qu8=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=haILexKMUaiNMQEFYfJ0gKo21K+5iThFY+GRe+JqhXD05aOORkVqfnkHq5iQOWn/v
	 BjljVTWQBhsfUG+08P7sebKP7crSdnFIKYyYNckZcs7gR9pOeO1v8Q3lvBCg+l0IQP
	 4ZFCpoY1Gxwlnbqvnck1BHO9N9nQUPi8JTnJoYJ59IX6/YhiYfJnYZ/5Eb0kvanb4z
	 11uhD+um6+3YDoH/EipdSAeqAaaAgC+dnnUYalfYU5i3W2UtQpNKEs+nWQZy0JmzSD
	 6FmZqId5EiF+gJxjNaDwf4D4d0SjVwYAM3VLUdd1yCtHLulaBMvqfzc7XjDm6a8AVl
	 hE3NZeOg0hyQw==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4254409870fso46002971cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 06:48:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701787697; x=1702392497;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEnhI07ZwfWB+LTPcQ8NmAlx9Ikuvbn1P7U+F8t2Qu8=;
        b=syqPCC9/PoLo7HD5LHQ51OXXInDexdX9tUH/ZbADwcRxMjIh1fvAS1SakW5/+kezZ3
         fv9hMdE5krSFJBl171m2X1Clh19YQBQAclc5Tuwu38vTjXHk1wzJzj8pjDwJqOhAJpHL
         JCmU5yBxNM/Y1qypl2EuKTdqVrbrc/0axzJ9vON3VyTSPeJtWoEsenN+HBebSm4GSbwA
         wgPoA+MPWOxfr8XsyDH78R/H7JZ1ESB/yfhea2yBx2Xi5V0nVzEAy5fg8lXWwe1GQALD
         HkzNEavHehQLNOaniezz/AKFDwAS+u3nf+gKsXcnzg+no67YR9xs8JYMJ2vibo8km40z
         XE+w==
X-Gm-Message-State: AOJu0YynZFxun/HosRLfydHwc13JuJ5JqGDA0I6WW/n2Ccrs6aWYNYRB
	TR4wXqMauFVOtI6hxYy8m+XGCOS6V/qaD2h9p4zkqIGa5oEbdTNFdC1/iDjOqoW7hztY+5y+Trw
	DJdMoDOT/PCOAn2LWU82GX7OP/8OBzlkkdgnKAHxvd4gBz28svYFarfxu4A139g==
X-Received: by 2002:a05:622a:1710:b0:425:4043:50dd with SMTP id h16-20020a05622a171000b00425404350ddmr1598967qtk.108.1701787697072;
        Tue, 05 Dec 2023 06:48:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG71k7SKMvRXL2M2tH5A/loLjfSKdVaIPyTunW1cRPFE3sVg34XcteHWngtpsKmAJPNbO86Hgqy82wP/ARNZmE=
X-Received: by 2002:a05:622a:1710:b0:425:4043:50dd with SMTP id
 h16-20020a05622a171000b00425404350ddmr1598950qtk.108.1701787696839; Tue, 05
 Dec 2023 06:48:16 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Dec 2023 06:48:16 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <ZW8zHoVWf94FDTx7@xhacker>
References: <20231129-th1520_mmc_dts-v7-0-c77fc19caa6f@baylibre.com>
 <20231129-th1520_mmc_dts-v7-2-c77fc19caa6f@baylibre.com> <CAJM55Z-qc7gc0fO-K8byqvpOBjDxFD4dP57mFHuijvpOzBWObQ@mail.gmail.com>
 <ZW8zHoVWf94FDTx7@xhacker>
Mime-Version: 1.0
Date: Tue, 5 Dec 2023 06:48:16 -0800
Message-ID: <CAJM55Z9tPTu4N4UVCBs1AJYWrWxMUDL+8FpVZtGx4yQgKenWSQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] riscv: dts: thead: Add TH1520 mmc controllers and
 sdhci clock
To: Jisheng Zhang <jszhang@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Drew Fustini <dfustini@baylibre.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Jason Kridner <jkridner@beagleboard.org>, Robert Nelson <robertcnelson@beagleboard.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_064823_555996_FF990A55 
X-CRM114-Status: GOOD (  19.93  )
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

Jisheng Zhang wrote:
> On Mon, Dec 04, 2023 at 01:47:45AM -0800, Emil Renner Berthing wrote:
> > Drew Fustini wrote:
> > > Add node for the SDHCI fixed clock. Add mmc0 node for the first mmc
> > > controller instance which is typically connected to the eMMC device.
> > > Add mmc1 node for the second mmc controller instance which is typically
> > > connected to microSD slot.
> > >
> > > Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> > > ---
> > >  arch/riscv/boot/dts/thead/th1520.dtsi | 25 +++++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > >
> > > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > index ba4d2c673ac8..af4fdcd82e0b 100644
> > > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > @@ -146,6 +146,13 @@ uart_sclk: uart-sclk-clock {
> > >  		#clock-cells = <0>;
> > >  	};
> > >
> > > +	sdhci_clk: sdhci-clock {
> > > +		compatible = "fixed-clock";
> > > +		clock-frequency = <198000000>;
> > > +		clock-output-names = "sdhci_clk";
> > > +		#clock-cells = <0>;
> > > +	};
> > > +
> > >  	soc {
> > >  		compatible = "simple-bus";
> > >  		interrupt-parent = <&plic>;
> > > @@ -304,6 +311,24 @@ dmac0: dma-controller@ffefc00000 {
> > >  			status = "disabled";
> > >  		};
> > >
> > > +		mmc0: mmc@ffe7080000 {
> > > +			compatible = "thead,th1520-dwcmshc";
> > > +			reg = <0xff 0xe7080000 0x0 0x10000>;
> > > +			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks = <&sdhci_clk>;
> > > +			clock-names = "core";
> > > +			status = "disabled";
> > > +		};
> > > +
> > > +		mmc1: mmc@ffe7090000 {
> > > +			compatible = "thead,th1520-dwcmshc";
> > > +			reg = <0xff 0xe7090000 0x0 0x10000>;
> > > +			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks = <&sdhci_clk>;
> > > +			clock-names = "core";
> > > +			status = "disabled";
> > > +		};
> > > +
> >
> > Hi Drew,
> >
> > This doesn't seem to match the documentation shared here:
> > https://lore.kernel.org/linux-riscv/5f437109d2be2b8843f549a661054a2e3ec0d66e.camel@xry111.site/
> > From the TH1520 System User Manual.pdf in there, I'd expect something like
>
> >
> > 	emmc: mmc@ffe7080000 {
> > 		compatible = "thead,th1520-dwcmshc";
> > 		reg = <0xff 0xe7080000 0x0 0x10000>;
> > 		...
> > 	};
>
> Hi Emil,
>
> I think this isn't necessary. From other soc dts files, I see such
> naming, but lots socs just use mmc0, mmc1, and so on.

No it certainly isn't necessary. Those labels are purely for us humans to read
and are not present in the dtb. But that's exactly why I think it'd be a good
idea match the labels with the documentation, so it will easier for us humans
to match up the device tree source to documentation.

> And IIRC, the host for sd and sdio can support both, IOW, below
> sdio0/sdio1 may be used for sdcard.

Yes, all of the EMMC, SDIO0 and SDIO1 seem to be instances of the same IP.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

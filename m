Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D16C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 15:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xe5RQVpubOaUcD6uVVOgWWgCFH++xUJg9lpxOdPj1OQ=; b=ieXMBhc0SZxSNV
	5Be4PA2OhfMGOyVF2bK8m2Ebe0O40OynxIlGf/A3GwlUF7e13Z+yploE+kD2h938eDLLadoq+NP9h
	UZWib4q7/PEHGED/QaqlITKfMgR5t/8+OWFMITIKgjtm73kfGsleiarzU+RkMi0rLTO9UD034+hRZ
	/dK9WsKiolTpvPU/Luqthrc9EfKHM3uTVyX3VqfpR6u0ZyGeRIEFT4jnM8Omiew4v8fgm7JmZqyGu
	REpLRa43CDfh3b5M0pLLXHG3KT/90nAOVB6hqM1r3psYKhKBIIgBo+zzuI6uTSTWZx+QFUqhNwKZA
	6rGISIFwc4lIUwq725nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAXib-007oAE-2K;
	Tue, 05 Dec 2023 15:52:18 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAXiY-007o9W-0x
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 15:52:16 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3332ad5b3e3so4178658f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 07:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscv-rocks.de; s=google; t=1701791529; x=1702396329; darn=lists.infradead.org;
        h=organization:user-agent:in-reply-to:content-disposition
         :mime-version:references:mail-followup-to:reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lVTdq6t/OSB6FE4R91UbvG7HbrsvSrimG/gzvVG23BM=;
        b=AsvGWysewN/xL1Qs5gxE+tOyLR8Hlld+WfSlEuxI0TP0XCrY+kZEnoYRPTWYenqP6j
         msLl0x7rhag+zV5k4rHRdSIYo1f/kHGwiG+6sNtQZf2t3DBb20jt03aVWwpRh1KY2Haa
         l+hovIls5nraqYs12gbhBdHYTv98188PbKt/vzvoimi514bONV88hNrWuf/E5/SvPZvK
         10IGItqKMKMb2GryBI/X+Pefko99RU1/BqWyv438Eq+vO5TLo1/YU7+fW236SX5y6NU/
         Ay7e+ammRyNPIFOq2bx2zw7o91jcjMJbkLD2HVG4RgDHdx4CegBBRAy7lzBMxqQGJfR5
         ms3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701791529; x=1702396329;
        h=organization:user-agent:in-reply-to:content-disposition
         :mime-version:references:mail-followup-to:reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVTdq6t/OSB6FE4R91UbvG7HbrsvSrimG/gzvVG23BM=;
        b=OGR98vRDvmblv9K0ZNY9yF2opdnacoMTsOIDHtSOYiwEcMaAol5U7p6D7XqH8O5xyh
         82r/tcGhB5R/kgQpa98RVhyRhaMzYS2eAqPcQKXAOO8CMmYSyIkizyoQyhcqMrjlREk5
         DU1COVmBMAsZ9FgaEbNRGk/izk6Ll7oCYLVshdTwAWlKXYmhSb9u6GJY3y9pEXcvs8oU
         BedGXPauHTlojCCj1b+JTUx5RJP3ZQZEGnfiq7Vp5D+5yP+VSrBNG60sasZf2E8/g8Rh
         8kq7d5w8x26w6d0ixL7axpfU/N+9cf1DojZSQSfhFEGqto7iE5GsOAeTlu3f5ECY4lFF
         rTuA==
X-Gm-Message-State: AOJu0Yw1ilcFs/xs38kbSvsB+FHJBtsEagUtgFQxmG/CDPN7hDTix6k/
	rf/CmJSNZLraoyD1epuCsrWgrg==
X-Google-Smtp-Source: AGHT+IElMdXrz89RurD2RJoKi2kjRNtKZuLwgqSlkGPsYKj4csSCF4Fnczw3b5nc0Y11T0hPeWp81Q==
X-Received: by 2002:adf:f74c:0:b0:333:2fd2:51fc with SMTP id z12-20020adff74c000000b003332fd251fcmr4361255wrp.117.1701791528135;
        Tue, 05 Dec 2023 07:52:08 -0800 (PST)
Received: from fedora (p549451d5.dip0.t-ipconnect.de. [84.148.81.213])
        by smtp.gmail.com with ESMTPSA id f20-20020a1709067f9400b009fd7bcd9054sm6963138ejr.147.2023.12.05.07.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 07:52:07 -0800 (PST)
Date: Tue, 5 Dec 2023 16:52:05 +0100
From: Damian Tometzki <damian@riscv-rocks.de>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Drew Fustini <dfustini@baylibre.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	Robert Nelson <robertcnelson@beagleboard.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/4] riscv: dts: thead: Add TH1520 mmc controllers and
 sdhci clock
Message-ID: <ZW9HJdIk-8r918Ma@fedora>
Mail-Followup-To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Drew Fustini <dfustini@baylibre.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	Robert Nelson <robertcnelson@beagleboard.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
References: <20231129-th1520_mmc_dts-v7-0-c77fc19caa6f@baylibre.com>
 <20231129-th1520_mmc_dts-v7-2-c77fc19caa6f@baylibre.com>
 <CAJM55Z-qc7gc0fO-K8byqvpOBjDxFD4dP57mFHuijvpOzBWObQ@mail.gmail.com>
 <ZW8zHoVWf94FDTx7@xhacker>
 <CAJM55Z9tPTu4N4UVCBs1AJYWrWxMUDL+8FpVZtGx4yQgKenWSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z9tPTu4N4UVCBs1AJYWrWxMUDL+8FpVZtGx4yQgKenWSQ@mail.gmail.com>
User-Agent: Mutt
X-Operating-System: Linux Fedora release 39 (Thirty Nine) (Kernel 6.7.0-rc4)
Organization: Linux hacker
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_075214_353231_568A04F3 
X-CRM114-Status: GOOD (  26.83  )
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
Reply-To: Damian Tometzki <damian@riscv-rocks.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 05. Dec 06:48, Emil Renner Berthing wrote:
> Jisheng Zhang wrote:
> > On Mon, Dec 04, 2023 at 01:47:45AM -0800, Emil Renner Berthing wrote:
> > > Drew Fustini wrote:
> > > > Add node for the SDHCI fixed clock. Add mmc0 node for the first mmc
> > > > controller instance which is typically connected to the eMMC device.
> > > > Add mmc1 node for the second mmc controller instance which is typically
> > > > connected to microSD slot.
> > > >
> > > > Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> > > > ---
> > > >  arch/riscv/boot/dts/thead/th1520.dtsi | 25 +++++++++++++++++++++++++
> > > >  1 file changed, 25 insertions(+)
> > > >
> > > > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > index ba4d2c673ac8..af4fdcd82e0b 100644
> > > > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > @@ -146,6 +146,13 @@ uart_sclk: uart-sclk-clock {
> > > >  		#clock-cells = <0>;
> > > >  	};
> > > >
> > > > +	sdhci_clk: sdhci-clock {
> > > > +		compatible = "fixed-clock";
> > > > +		clock-frequency = <198000000>;
> > > > +		clock-output-names = "sdhci_clk";
> > > > +		#clock-cells = <0>;
> > > > +	};
> > > > +
> > > >  	soc {
> > > >  		compatible = "simple-bus";
> > > >  		interrupt-parent = <&plic>;
> > > > @@ -304,6 +311,24 @@ dmac0: dma-controller@ffefc00000 {
> > > >  			status = "disabled";
> > > >  		};
> > > >
> > > > +		mmc0: mmc@ffe7080000 {
> > > > +			compatible = "thead,th1520-dwcmshc";
> > > > +			reg = <0xff 0xe7080000 0x0 0x10000>;
> > > > +			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
> > > > +			clocks = <&sdhci_clk>;
> > > > +			clock-names = "core";
> > > > +			status = "disabled";
> > > > +		};
> > > > +
> > > > +		mmc1: mmc@ffe7090000 {
> > > > +			compatible = "thead,th1520-dwcmshc";
> > > > +			reg = <0xff 0xe7090000 0x0 0x10000>;
> > > > +			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
> > > > +			clocks = <&sdhci_clk>;
> > > > +			clock-names = "core";
> > > > +			status = "disabled";
> > > > +		};
> > > > +
> > >
> > > Hi Drew,
> > >
> > > This doesn't seem to match the documentation shared here:
> > > https://lore.kernel.org/linux-riscv/5f437109d2be2b8843f549a661054a2e3ec0d66e.camel@xry111.site/
> > > From the TH1520 System User Manual.pdf in there, I'd expect something like
> >
> > >
> > > 	emmc: mmc@ffe7080000 {
> > > 		compatible = "thead,th1520-dwcmshc";
> > > 		reg = <0xff 0xe7080000 0x0 0x10000>;
> > > 		...
> > > 	};
> >
> > Hi Emil,
> >
> > I think this isn't necessary. From other soc dts files, I see such
> > naming, but lots socs just use mmc0, mmc1, and so on.
> 
> No it certainly isn't necessary. Those labels are purely for us humans to read
> and are not present in the dtb. But that's exactly why I think it'd be a good
> idea match the labels with the documentation, so it will easier for us humans
> to match up the device tree source to documentation.
Hello together,

yes i agree to this too. It is easier for troubleshooting etc. 

Damian

> 
> > And IIRC, the host for sd and sdio can support both, IOW, below
> > sdio0/sdio1 may be used for sdcard.
> 
> Yes, all of the EMMC, SDIO0 and SDIO1 seem to be instances of the same IP.
> 
> /Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

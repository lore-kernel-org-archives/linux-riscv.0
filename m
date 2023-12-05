Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D83DC07E97
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 14:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lwT7zx4pyY2ercJZ2UhX3iyNyccx2CiPUjNZ0U8FwsU=; b=db9d11JUPTl3W1
	BM1FJDAk+Bp0JS9dqie2ij2hJiOQqNxUNrwWaivYbF6eqnPTQweayMW2Fun2oSkhG951EFJgxtttz
	PdgIHirebGWdXEBDlMWW+jr4AAxKbrZTnrfCdlrJ/QT/P87JM0VXFyDjdaOSaX4A2uFnJgX7O0l1M
	8/klJEQMuutSeQ7GWwkzZxyxox0wFY8dj+nA7mk2WNQHMtO6xjzMYjPO4RIAktUIQeQiqkQ+UKpgD
	m2i59lh05jrfuryvFxf8/v6Rq1eWMeorDSK4URN4/JBwcItSsr7bffgZ1p9UhcW3EN99gu4TkKOE3
	hl4HCJbMakPv1IYvwd3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAWZw-007cJx-2Q;
	Tue, 05 Dec 2023 14:39:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAWZs-007cHg-3A
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 14:39:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73D9A617AC;
	Tue,  5 Dec 2023 14:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555E2C433C9;
	Tue,  5 Dec 2023 14:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701787150;
	bh=1+TU9RElFwgbEqSXLhGK9BZkBQKzExzi8AfeA+6CsRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TJJZZkoHJrfrsoY2cWZVCyleDrJkdf2yphi6zHuaA9YOSG7ScuAb7NG0hEn2ebngi
	 vV9yPmAlHn8qDGq4tUWn7qa8l6zp4msIaVwGZPkjc+PrAOHpxNyAxMQCafqUaO9hw+
	 tMtZw/HpTwPjetJFULgPN2H+GeryOs1KnZabuFSOz9wc5H37SqQ327FIhqKvGhz1P9
	 rSz7lS0ZfmDSb93O7URQSa4LZoZyMggJZ57MauFMuk6tLlI5EiUvcdU9Sa3hN/YXep
	 KDQXnBwlnmY2CKsQCcez9IWq53iFM+2g8zL4za7OCC5SYtP1+o7uuNnveHx81ekHNI
	 VHIDfRjsq4cFg==
Date: Tue, 5 Dec 2023 22:26:38 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Drew Fustini <dfustini@baylibre.com>,
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
Message-ID: <ZW8zHoVWf94FDTx7@xhacker>
References: <20231129-th1520_mmc_dts-v7-0-c77fc19caa6f@baylibre.com>
 <20231129-th1520_mmc_dts-v7-2-c77fc19caa6f@baylibre.com>
 <CAJM55Z-qc7gc0fO-K8byqvpOBjDxFD4dP57mFHuijvpOzBWObQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z-qc7gc0fO-K8byqvpOBjDxFD4dP57mFHuijvpOzBWObQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_063913_102028_DB5F251F 
X-CRM114-Status: GOOD (  16.47  )
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

On Mon, Dec 04, 2023 at 01:47:45AM -0800, Emil Renner Berthing wrote:
> Drew Fustini wrote:
> > Add node for the SDHCI fixed clock. Add mmc0 node for the first mmc
> > controller instance which is typically connected to the eMMC device.
> > Add mmc1 node for the second mmc controller instance which is typically
> > connected to microSD slot.
> >
> > Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> > ---
> >  arch/riscv/boot/dts/thead/th1520.dtsi | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > index ba4d2c673ac8..af4fdcd82e0b 100644
> > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > @@ -146,6 +146,13 @@ uart_sclk: uart-sclk-clock {
> >  		#clock-cells = <0>;
> >  	};
> >
> > +	sdhci_clk: sdhci-clock {
> > +		compatible = "fixed-clock";
> > +		clock-frequency = <198000000>;
> > +		clock-output-names = "sdhci_clk";
> > +		#clock-cells = <0>;
> > +	};
> > +
> >  	soc {
> >  		compatible = "simple-bus";
> >  		interrupt-parent = <&plic>;
> > @@ -304,6 +311,24 @@ dmac0: dma-controller@ffefc00000 {
> >  			status = "disabled";
> >  		};
> >
> > +		mmc0: mmc@ffe7080000 {
> > +			compatible = "thead,th1520-dwcmshc";
> > +			reg = <0xff 0xe7080000 0x0 0x10000>;
> > +			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&sdhci_clk>;
> > +			clock-names = "core";
> > +			status = "disabled";
> > +		};
> > +
> > +		mmc1: mmc@ffe7090000 {
> > +			compatible = "thead,th1520-dwcmshc";
> > +			reg = <0xff 0xe7090000 0x0 0x10000>;
> > +			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&sdhci_clk>;
> > +			clock-names = "core";
> > +			status = "disabled";
> > +		};
> > +
> 
> Hi Drew,
> 
> This doesn't seem to match the documentation shared here:
> https://lore.kernel.org/linux-riscv/5f437109d2be2b8843f549a661054a2e3ec0d66e.camel@xry111.site/
> From the TH1520 System User Manual.pdf in there, I'd expect something like

> 
> 	emmc: mmc@ffe7080000 {
> 		compatible = "thead,th1520-dwcmshc";
> 		reg = <0xff 0xe7080000 0x0 0x10000>;
> 		...
> 	};

Hi Emil,

I think this isn't necessary. From other soc dts files, I see such
naming, but lots socs just use mmc0, mmc1, and so on.

And IIRC, the host for sd and sdio can support both, IOW, below
sdio0/sdio1 may be used for sdcard.

Thanks
> 
> 	sdio0: mmc@ffe7090000 {
> 		compatible = "thead,th1520-dwcmshc";
> 		reg = <0xff 0xe7090000 0x0 0x10000>;
> 		...
> 	};
> 
> 	sdio1: mmc@ffe70a0000 {
> 		compatible = "thead,th1520-dwcmshc";
> 		reg = <0xff 0xe70a0000 0x0 0x10000>;
> 		...
> 	};
> 
> /Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

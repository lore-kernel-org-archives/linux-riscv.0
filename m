Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFA7C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Oct 2022 09:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNVHzgvIYmLib6Drv+yoVg6AbNfimOLFco0E1/uwlEo=; b=UYclAUsVB7mst7
	VSC8ze0fUrzzr+x2Rbp/aol36HdK+p6kTW6/bnxVzHWkDOZJZvHRUACeu0eaItAbKzULkCP/BjGXt
	UgxtJEwL7TKyPRHN+O0QH7CjbI/YEqU3A99F8cnbMC+mPxaXmgbb1CLn+qkjMwoV6PZoeiHuCiuah
	BHtW8obB590bkVLPcc+vCv28IF0XBlpCXSxyoLfoi12z8AHDk6+1qhRFJryOKb2CLDIOSt+nhd+Uo
	TDU0BmszmBjy8NQNcCdFsUSTXDjKt+OVLbjSjHjwl3WRy7dk5v+ZeTWy0lKHKwc6CopK432p/x3ir
	p4Qh6IY/8/LjN4FJFQ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojHCf-00EIAC-Ow; Fri, 14 Oct 2022 09:42:05 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojHCc-00EI8l-Qw
	for linux-riscv@lists.infradead.org; Fri, 14 Oct 2022 09:42:05 +0000
X-QQ-mid: bizesmtp84t1665740487ti9mbcvl
Received: from [192.168.125.106] ( [113.72.147.11])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Oct 2022 17:41:25 +0800 (CST)
X-QQ-SSF: 01000000000000B09000000A0000000
X-QQ-FEAT: DRnj/z+Sqafxf60URcKpJmk3M9Gtaudnpmqzg0zvN20ZC3tpAxv/lIwk8P1wS
	m3l8EGZwu41bnQWypYQttWJDjQollXss8UsSl7cBIrVzT4b2g1DLEzT6ShKt5LbH7wTJvbB
	wnV6vB9ISg9d+1i8dVp6ZSVyhLHjBIyNy8pikp+orY7/fvzwbsVz3jlVEv7YYJ3sYOrJu9b
	OeueYAFz3GEopWBDXvo3vXn/pUGS0z1q4/GBW46Glh3/Ka/a0zrm/TwoUJF1+BkhrmkyOXX
	ZxIFM8Exh+BnZy0bIKFTeqaKBBRV2zEKbkCjXUnJ/l6ayU0xgCDWxzIE1cDq93qjBGZt774
	2QRI7gNwsyj49o/sZ1rlblUSoWEsKmVvt3n57IDmpRlBdY4uZ7o1KnqNdTr0Ze5A/Zzruj6
X-QQ-GoodBg: 0
Message-ID: <B1817962D78CFE67+41b72968-e452-3fa9-c1ba-054cb1642de4@linux.starfivetech.com>
Date: Fri, 14 Oct 2022 17:41:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 27/30] RISC-V: Add initial StarFive JH7110 device tree
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220930074914.6757-1-hal.feng@linux.starfivetech.com>
 <Yzgb0GzpLsV3RJyk@spud>
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <Yzgb0GzpLsV3RJyk@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_024203_200515_0D252743 
X-CRM114-Status: GOOD (  16.81  )
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

On Sat, 1 Oct 2022 11:52:00 +0100, Conor Dooley wrote:
> On Fri, Sep 30, 2022 at 03:49:14PM +0800, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> > 
> > Add initial device tree for the JH7110 RISC-V SoC by
> > StarFive Technology Ltd.
> > 
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> 
> There's little point reviewing this dt since there's a load of issues
> that you can trivially find by running dtbs_check/dt_binding_check, but
> this SoB change is wrong - if Emil wrote the patch, then Jianlong's SoB
> is either redundant or should be accompanied by a Co-developed-by tag.
> 
> Ditto for patch 28/30 "RISC-V: Add StarFive JH7110 VisionFive2 board
> device tree".

Will add Co-developed-by tag for Jianlong. Thanks.

> 
> > ---
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi | 449 +++++++++++++++++++++++
> >  1 file changed, 449 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/starfive/jh7110.dtsi
> > 
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > new file mode 100644
> > index 000000000000..46f418d4198a
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> 
> > +
> > +	osc: osc {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +	};
> > +
> > +	clk_rtc: clk_rtc {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +	};
> > +
> > +	gmac0_rmii_refin: gmac0_rmii_refin {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <50000000>;
> 
> I assume, given osc has it's frequency set in the board dts, that these
> are all oscillators on the SoC?

These are all on the board. Should move all "clock-frequency" to the board dts.
I will recheck and modify this patch.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

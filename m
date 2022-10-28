Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAB0ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 02:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iwbXof3SOZOtcjpkgu8UEM2zRMt335xUsxkVJ6AP8zs=; b=wlJsBQOt6zIXgw
	+XPYk8IbWcDXG+zpPiRe+0V3XBW/lBK0LwOR0c/VtHvAzfsg++ccWiAF1sSbBX5qRvIAJUHkcM66/
	xwwdFDXszk7FTR6DFWUUodnIXSpGdDKxbamkt2/iKCdDdtH2SkqrLu/i6KeECqj4z8kmIj/+kmk5z
	18rMnm2C/IPnRPcXHlqg1UJChBfR64yeo2SzqZEVhJHPQzOhfM0z/XkA7/CXx03melrvcw9brCexD
	9TTaWWo1OZVRlh+p5oK05VR+bMf/3C/NPLM5Wv4b8YTFkmm7/edHGqwnJEx9YfXtaYPJ7cdMyXKWA
	uwXb6NDDeks4S+3onqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooFP3-00FZls-5j; Fri, 28 Oct 2022 02:47:25 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooFP0-00FZlG-3M
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 02:47:24 +0000
X-QQ-mid: bizesmtp77t1666925205trdp212h
Received: from [192.168.125.106] ( [113.72.144.82])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Oct 2022 10:46:44 +0800 (CST)
X-QQ-SSF: 01000000000000B0B000000A0000000
X-QQ-FEAT: vqhsT3OOnzRLiM/g5o2j2J4W/+or9KnaRTkPOvebYDLsCzhWkN0QrHZbnLoVo
	M/MhoZK0UtjJIzkdUkWy4KmfRps7PNjYdykPWjVgdeMBJDreHNWrZMezfqTdsGEQquL+rFb
	bmLVfCjfEiL/+WJfDfk3jvnIf+Mtl4nNT2g+DLQWcFIuhFdJIyG9shL42UPYIg2EYp8oML4
	j1tm8oPF9yK8KRRh1/eEQ/iVfNvLwQa5yq1FdOiprbOuuaq5NwJ5mrXE0UKN3NpH62Yiu76
	oFMMYkeOM98R+3htFcuNmJl2IKijsoe/pbTbXo1LF2dk00BGpQzOL4MnonpcpXB7qW+C8e4
	q1v0Idjt3wIZ5is6IV5KeliQKK7/6UH3LpI8VYY
X-QQ-GoodBg: 0
Message-ID: <44B201EE232142D8+724bfbd1-f1aa-a13d-fd38-655df7d7036e@linux.starfivetech.com>
Date: Fri, 28 Oct 2022 10:46:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 15/30] clk: starfive: Use regmap APIs to operate
 registers
To: Stephen Boyd <sboyd@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929175602.19946-1-hal.feng@linux.starfivetech.com>
 <20220930214824.A14ACC433D6@smtp.kernel.org>
 <CAJM55Z8xxrKqaN64KAP9miTis4wFbL2S9uhV5h-SOiYjbYng+g@mail.gmail.com>
 <20221012230525.C6E58C433D7@smtp.kernel.org>
 <07B628ED6CABEF1D+932737cc-7d4b-4071-531e-82f88d89a872@linux.starfivetech.com>
 <20221027012605.B6769C433C1@smtp.kernel.org>
Content-Language: en-US
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <20221027012605.B6769C433C1@smtp.kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_194722_496287_BD60A21A 
X-CRM114-Status: GOOD (  23.74  )
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

On Wed, 26 Oct 2022 18:26:03 -0700, Stephen Boyd wrote:
> Quoting Hal Feng (2022-10-22 21:11:41)
> > On Wed, 12 Oct 2022 16:05:23 -0700, Stephen Boyd wrote:
> > > I think we should use auxiliary bus and split the driver logically into
> > > a reset driver in drivers/reset and a clk driver in drivers/clk. That
> > > way the appropriate maintainers can review the code. There is only one
> > > platform device with a single reg property and node in DT, but there are
> > > two drivers. 
> > 
> > Yes, I agree that the reset driver and the clock driver should be split.
> > However, I think using auxiliary bus is a little bit complicated in this
> > case, because the reset is not a part of functionality of the clock in 
> > JH7110. They just share a common register base address.
> 
> That is why auxiliary bus exists.
> 
> > I think it is 
> > better to use ioremap for the same address, and the dt will be like
> > 
> > syscrg_clk: clock-controller@13020000 {
> >         compatible = "starfive,jh7110-clkgen-sys";
> >         reg = <0x0 0x13020000 0x0 0x10000>;
> >         ...
> > };
> > syscrg_rst: reset-controller@13020000 {
> >         compatible = "starfive,jh7110-reset-sys";
> >         reg = <0x0 0x13020000 0x0 0x10000>;
> >         ...
> > };
> > 
> > What do you think of this approach? I would appreciate your suggestions.
> > 
> 
> We shouldn't have two different nodes with the same reg property. Please
> ioremap in whatever driver probes and creates the auxiliary device(s)
> and then pass the void __iomem * to it.

Okay, I will use auxiliary bus for clock and reset driver on the next version.

Best regards,
Hal


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

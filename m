Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4D5C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Oct 2022 03:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/WO4WmMIHNGXhLeNSiVawCLPQT2vk0Cudru091Y2eCc=; b=nJZA2oFm2jT0Bm
	kiWwZy9aKHQseUCnNIi4LvCT5luNYzB1l9OyKdXk3AT+tWsCsbL31Aby+EmjW8cBJ4xwfNThcD2Ee
	E/IPMit1TLA44IPXCIzCrl9672ji3jynLmNF3317ou6bbyszd8gR/a1btoBQopkrT4o9A9IyKnUjD
	oS+iIi26jZewApehj7HcGNigXzTEybPGm3dPwj0ETyVg9KczPPOEkK2Jl827usgrk9M96qEeCInbR
	ljCOXsasKLw4hz7SnKH57mPLfcDcQmr4tFiskHZ28d0qamvNRRAxCKmIqPXg38vWeaG6cR5OjvuNO
	LJ9pH78B82HTztGilq4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojBKa-00DWwC-GE; Fri, 14 Oct 2022 03:25:52 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojBKW-00DWvS-Ua
	for linux-riscv@lists.infradead.org; Fri, 14 Oct 2022 03:25:50 +0000
X-QQ-mid: bizesmtp70t1665717897tggdurz9
Received: from [192.168.50.235] ( [113.72.147.11])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Oct 2022 11:24:55 +0800 (CST)
X-QQ-SSF: 01000000000000B09000000A0000000
X-QQ-FEAT: Sm8l2YSuDykwx9zlf9aLJ0pyGRo8hfvyvKRxpLKx+MBlrJvD5pae//UyWDAHW
	na+5Zc7KD3nH6kxeXh6Yqpsg0LCAFrZLbmfKzGrO0BDwerR9xpCu/dFNr2efEUDZBpPls6y
	0LDmtH/jgCC728s/PbjIVFaNySz6J0mJm1iSKu6MrWK0k1EGan9i1YWZUUWi3EDBHYOAgW7
	2LECSrZ7SDNEbTiafYaBMYy8np1WuK2EYswgPqtX9OxtcVauKnhg8LPOPxBNgvYoa5exsQ9
	wQooaViwTDRQvilIPnMdhtemhJTHDS6oTPIW3h1NeNCTDhUYflKHmS7yqFkhvESXqWXhT27
	dc07HIQ4XYHjmjFWxc2ve/5cGaJHF6vbiVpGk7z6+CQyfKG3JElOgvjk2WIIg==
X-QQ-GoodBg: 0
Message-ID: <7CB1B79E00E38D81+9631ccf1-48b5-9ffa-e5cd-b0c9a7c50a56@linux.starfivetech.com>
Date: Fri, 14 Oct 2022 11:24:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 29/30] RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
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
 <20220930090653.7449-1-hal.feng@linux.starfivetech.com>
 <01c658ad-7f73-20fc-03c0-c82dcd820aa4@codethink.co.uk>
 <Yzdig6GepDx34u1j@spud>
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <Yzdig6GepDx34u1j@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_202549_311291_CB293A76 
X-CRM114-Status: GOOD (  12.80  )
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

On Fri, 30 Sep 2022 22:41:23 +0100, Conor Dooley wrote:
> On Fri, Sep 30, 2022 at 09:54:14PM +0100, Ben Dooks wrote:
> > On 30/09/2022 10:06, Hal Feng wrote:
> > > Add CONFIG_SERIAL_8250_DW=y, which is a necessary option for
> > > StarFive JH7110 and JH7100 SoCs to boot with serial ports.
> > > 
> > > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> > 
> > That might be useful for other users at some point an I don't
> > think it adds much code.
> 
> Honestly I think this should be applied for 6.1, for parity with the
> other SoCs that have their serial console enabled by default.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Could this patch be pulled out and applied for v6.1? So the JH7100
and the coming JH7110 can enable serial console by default when
booting. Thanks.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

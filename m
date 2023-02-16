Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19950C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 14:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jDK81jRj+lNCB6lk0y+O7eJjQ/tdHJdvWun6linR7Yo=; b=2YfehGT+AU3NSI
	/v/9H4imHcRlLxKhQVoT/6J0tujsQSHxtxdapZa7W452FXqX/E5EGLFhtgQv9HYJiHqWpb93MqO7t
	wtq2tj987S04L24POiqVBmURmIEcYA6g1LHY1yGt3vNJpbdwAxBXgvqefBSgBUCzpZByadccIT4hY
	twJeAt53A71jZGbVK0X+HQN98twB/YNUfk3lma3TAHBwx6gu9OD5V9HG7XYkViYmGkG4IJDWjf8DL
	m/7CLwD5IGwSZJCbUXBj1rptgC23ysRD7PeiS9Rn6lrUCdXDpSzXJMJpttSOYGZt0Xh6oYZObJdJG
	phLf5hkYd4sfiOkP8pcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSfTN-00AiM0-93; Thu, 16 Feb 2023 14:42:57 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSfTG-00AiHR-8B
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 14:42:55 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 243D524DB8C;
	Thu, 16 Feb 2023 22:42:22 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Feb
 2023 22:42:22 +0800
Received: from [192.168.125.82] (183.27.97.168) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Feb
 2023 22:42:21 +0800
Message-ID: <5cf0fe71-fd17-fb28-c01e-28356081ba76@starfivetech.com>
Date: Thu, 16 Feb 2023 22:42:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
References: <20221220005054.34518-1-hal.feng@starfivetech.com>
 <20221220005054.34518-8-hal.feng@starfivetech.com> <Y6JB37Pd5TZoGMy4@spud>
 <7a7bccb1-4d47-3d32-36e6-4aab7b5b8dad@starfivetech.com>
 <Y6tSWB2+98a8k9Qw@spud>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <Y6tSWB2+98a8k9Qw@spud>
X-Originating-IP: [183.27.97.168]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_064251_399673_FE555BAB 
X-CRM114-Status: GOOD (  31.53  )
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

On Tue, 27 Dec 2022 20:15:20 +0000, Conor Dooley wrote:
> On Mon, Dec 26, 2022 at 12:26:32AM +0800, Hal Feng wrote:
>> On Tue, 20 Dec 2022 23:14:39 +0000, Conor Dooley wrote:
>> > On Tue, Dec 20, 2022 at 08:50:50AM +0800, Hal Feng wrote:
>> > > From: Emil Renner Berthing <kernel@esmil.dk>
>> > > 
>> > > Add bindings for the system clock and reset generator (SYSCRG) on the
>> > > JH7110 RISC-V SoC by StarFive Ltd.
>> > > 
>> > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> > > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> 
>> > > +  clocks:
>> > > +    items:
>> > > +      - description: Main Oscillator (24 MHz)
>> > > +      - description: GMAC1 RMII reference
>> > > +      - description: GMAC1 RGMII RX
>> > > +      - description: External I2S TX bit clock
>> > > +      - description: External I2S TX left/right channel clock
>> > > +      - description: External I2S RX bit clock
>> > > +      - description: External I2S RX left/right channel clock
>> > > +      - description: External TDM clock
>> > > +      - description: External audio master clock
>> > 
>> > So, from peeking at the clock driver & the dt - it looks like a bunch of
>> > these are not actually required?
>> 
>> These clocks are used as root clocks or optional parent clocks in clock tree.
>> Some of them are optional, but they are required if we want to describe the
>> complete clock tree of JH7110 SoC.
> 
> Perhaps I have a misunderstand of what required means. To me, required
> means "you must provide this clock for the SoC to operate in all
> configurations".
> Optional therefore would be for things that are needed only for some
> configurations and may be omitted if not required.
> 
> From your comment below, boards with a JH7110 may choose not to populate
> both external clock inputs to a mux. In that case, "dummy" clocks should
> not have to be provided in the DT of such boards to satisfy this binding
> which seems wrong to me..

Please see the picture of these external clocks in clock tree.

# mount -t debugfs none /mnt
# cat /mnt/clk/clk_summary
                                 enable  prepare  protect                                duty  hardware
   clock                          count    count    count        rate   accuracy phase  cycle    enable
-------------------------------------------------------------------------------------------------------
 *mclk_ext*                             0        0        0    12288000          0     0  50000         Y
 *tdm_ext*                              0        0        0    49152000          0     0  50000         Y
 *i2srx_lrck_ext*                       0        0        0      192000          0     0  50000         Y
 *i2srx_bclk_ext*                       0        0        0    12288000          0     0  50000         Y
 *i2stx_lrck_ext*                       0        0        0      192000          0     0  50000         Y
 *i2stx_bclk_ext*                       0        0        0    12288000          0     0  50000         Y
 *gmac1_rgmii_rxin*                     0        0        0   125000000          0     0  50000         Y
    gmac1_rx                          0        0        0   125000000          0     0  50000         Y
       gmac1_rx_inv                   0        0        0   125000000          0   180  50000         Y
 *gmac1_rmii_refin*                     0        0        0    50000000          0     0  50000         Y
    gmac1_rmii_rtx                    0        0        0    50000000          0     0  50000         Y
       gmac1_tx                       0        0        0    50000000          0     0  50000         N
          gmac1_tx_inv                0        0        0    50000000          0   180  50000         Y
 *osc*                                  4        4        0    24000000          0     0  50000         Y
    apb_func                          0        0        0    24000000          0     0  50000         Y
 ...

The clock "gmac1_rgmii_rxin" and the clock "gmac1_rmii_refin" are
actually used as the parent of other clocks. The "dummy" clocks
you said are all internal clocks.

For the audio related clocks (mclk_ext/tdm_ext/i2srx_lrck_ext/
i2srx_bclk_ext/i2stx_lrck_ext/i2stx_bclk_ext), they will be used
as the parent clocks in audio related drivers. Note that some
clocks need to select different clocks as parent according to
requirement.
So all these external clocks are required.

> 
> It would seem to me that you need to set minItems < maxItems here to
> account for that & you do in fact need clock-names.
> 
>> 
>> > I'd have ploughed through this, but having read Krzysztof's comments on
>> > the DTS I'm not sure that this binding is correct.
>> > https://lore.kernel.org/linux-riscv/20221220011247.35560-1-hal.feng@starfivetech.com/T/#mdf67621a2344dce801aa8015d4963593a2c28bcc
>> > 
>> > I *think* the DT is correct - the fixed clocks are all inputs from clock
>> > sources on the board and as such they are empty in soc.dtsi and are
>> > populated in board.dts?
>> 
>> Yes, the fixed clocks are all clock sources on the board and input to the SoC.
>> 
>> > 
>> > However, are they all actually required? In the driver I see:
>> > 	JH71X0__MUX(JH7110_SYSCLK_GMAC1_RX, "gmac1_rx", 2,
>> > 		    JH7110_SYSCLK_GMAC1_RGMII_RXIN,
>> > 		    JH7110_SYSCLK_GMAC1_RMII_RTX),
>> > That macro is:
>> > #define JH71X0__MUX(_idx, _name, _nparents, ...) [_idx] = {			\
>> > 	.name = _name,								\
>> > 	.flags = 0,								\
>> > 	.max = ((_nparents) - 1) << JH71X0_CLK_MUX_SHIFT,			\
>> > 	.parents = { __VA_ARGS__ },						\
>> > }
>> > 
>> > AFAICT, RMII reference feeds RMII_RTX & RGMII RX *is* RGMII_RXIN?
>> > Does that mean you need to populate only one of GMAC1 RMII reference
>> > and GMAC1 RMGII RX and the other is optional?
>> 
>> Yes, actually only one of them is chosen as the root clock
>> source of the clock "gmac1_rx".
>> 
>> > 
>> > What have I missed?
>> > 
>> > > +
>> > > +  clock-names:
>> > > +    items:
>> > > +      - const: osc
>> > > +      - const: gmac1_rmii_refin
>> > > +      - const: gmac1_rgmii_rxin
>> > > +      - const: i2stx_bclk_ext
>> > > +      - const: i2stx_lrck_ext
>> > > +      - const: i2srx_bclk_ext
>> > > +      - const: i2srx_lrck_ext
>> > > +      - const: tdm_ext
>> > > +      - const: mclk_ext
>> > 
>> > If all clocks are in fact required though, isn't this kinda pointless to
>> > have since we already know that the order is fixed from the "clocks"
>> > property?
>> > Krzk/Rob?
>> 
>> The clock-names are used to easily identify these clocks in the clock driver.
> 
> *IF* all clocks were in fact required, which they aren't, you could rely
> on the order alone in the driver as it is enforced by the binding.

OK, I'll remove "clock-names" property in the bindings and device tree.
Instead, will use index to get these clocks in drivers.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

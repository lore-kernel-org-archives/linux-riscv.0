Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42236C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Mar 2023 14:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7H3tRZLji9pj+X55nkzhpX08pjrT13GKrCWn9EiD6/4=; b=4jxsxIEoSUHK0J
	TwKioR/IJWYZg3pkL3L3B/BG/9haOhPDhL/ScOd4nwbu80k2c0NKE9siXyMtdDDPWPEB0/ldXC4Kd
	2AxuO307D75amtt94MLbYRgUATUyl8RvhzbQN0yPYURPV8QRO70HMLpGcFe7RD5m94waHJGx6rlyW
	XJAA7erP6xCTVKN03vYRArMHMRJriS6UMyZRLMOcBgrncKuQIbhEdiC1AqTIsc7bRj3l9lZbDQDZH
	zFuPfGIoGviy46ZOCoFHQ+gUswTO9W8eiz2LGJXA8hXYy0c+5a81QFPrDHdnIRsvVU1gcVw+YkH7C
	LMkCoGhsuTVSBX/gsi6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pg4rW-006pfg-1q;
	Sat, 25 Mar 2023 14:27:18 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pg4rO-006paQ-1s
	for linux-riscv@lists.infradead.org;
	Sat, 25 Mar 2023 14:27:16 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D5F3C24DC09;
	Sat, 25 Mar 2023 22:26:22 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 25 Mar
 2023 22:26:22 +0800
Received: from [172.16.16.231] (113.72.145.48) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 25 Mar
 2023 22:26:21 +0800
Message-ID: <cfcbbe7f-9d9a-dcd8-5757-1c4e8b06104b@starfivetech.com>
Date: Sat, 25 Mar 2023 22:26:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 11/21] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor.dooley@microchip.com>
CC: Conor Dooley <conor@kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "Marc
 Zyngier" <maz@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230320103750.60295-1-hal.feng@starfivetech.com>
 <20230320103750.60295-12-hal.feng@starfivetech.com>
 <b4beb457-8581-4b2f-8655-2e3f82a94f75@spud>
 <5b75161e-3d0d-50e5-fd4e-af92edf62317@starfivetech.com>
 <828e8cb9-a4c6-4c2d-8a23-2cfdc4395fe1@spud>
 <CAJM55Z-dKKpBJAof1cuAombBFckEhvZ00o6MZHT_KN+baKRc0g@mail.gmail.com>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <CAJM55Z-dKKpBJAof1cuAombBFckEhvZ00o6MZHT_KN+baKRc0g@mail.gmail.com>
X-Originating-IP: [113.72.145.48]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_072711_030127_61F85855 
X-CRM114-Status: GOOD (  46.78  )
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

On Fri, 24 Mar 2023 10:39:36 +0100, Emil Renner Berthing wrote:
> On Thu, 23 Mar 2023 at 10:02, Conor Dooley <conor.dooley@microchip.com> wrote:
>>
>> Hal, Emil,
>>
>> On Thu, Mar 23, 2023 at 03:44:41PM +0800, Hal Feng wrote:
>> > On Wed, 22 Mar 2023 21:53:37 +0000, Conor Dooley wrote:
>> > > On Mon, Mar 20, 2023 at 06:37:40PM +0800, Hal Feng wrote:
>> > >> From: Emil Renner Berthing <kernel@esmil.dk>
>> > >>
>> > >> Add bindings for the system clock and reset generator (SYSCRG) on the
>> > >> JH7110 RISC-V SoC by StarFive Ltd.
>> > >>
>> > >> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> > >> Reviewed-by: Rob Herring <robh@kernel.org>
>> > >> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> > >> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> > >> ---
>> > >>  .../clock/starfive,jh7110-syscrg.yaml         | 104 +++++++++
>> > >>  MAINTAINERS                                   |   8 +-
>> > >>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 203 ++++++++++++++++++
>> > >>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 142 ++++++++++++
>> > >>  4 files changed, 454 insertions(+), 3 deletions(-)
>> > >>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>> > >>  create mode 100644 include/dt-bindings/clock/starfive,jh7110-crg.h
>> > >>  create mode 100644 include/dt-bindings/reset/starfive,jh7110-crg.h
>> > >>
>> > >> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>> > >> new file mode 100644
>> > >> index 000000000000..84373ae31644
>> > >> --- /dev/null
>> > >> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>> > >> @@ -0,0 +1,104 @@
>> > >> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> > >> +%YAML 1.2
>> > >> +---
>> > >> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-syscrg.yaml#
>> > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> > >> +
>> > >> +title: StarFive JH7110 System Clock and Reset Generator
>> > >> +
>> > >> +maintainers:
>> > >> +  - Emil Renner Berthing <kernel@esmil.dk>
>> > >> +
>> > >> +properties:
>> > >> +  compatible:
>> > >> +    const: starfive,jh7110-syscrg
>> > >> +
>> > >> +  reg:
>> > >> +    maxItems: 1
>> > >> +
>> > >> +  clocks:
>> > >> +    oneOf:
>> > >> +      - items:
>> > >> +          - description: Main Oscillator (24 MHz)
>> > >> +          - description: GMAC1 RMII reference or GMAC1 RGMII RX
>> > >> +          - description: External I2S TX bit clock
>> > >> +          - description: External I2S TX left/right channel clock
>> > >> +          - description: External I2S RX bit clock
>> > >> +          - description: External I2S RX left/right channel clock
>> > >> +          - description: External TDM clock
>> > >> +          - description: External audio master clock
>> > >> +
>> > >> +      - items:
>> > >> +          - description: Main Oscillator (24 MHz)
>> > >> +          - description: GMAC1 RMII reference
>> > >> +          - description: GMAC1 RGMII RX
>> > >> +          - description: External I2S TX bit clock
>> > >> +          - description: External I2S TX left/right channel clock
>> > >> +          - description: External I2S RX bit clock
>> > >> +          - description: External I2S RX left/right channel clock
>> > >> +          - description: External TDM clock
>> > >> +          - description: External audio master clock
>> > >> +
>> > >> +  clock-names:
>> > >> +    oneOf:
>> > >> +      - items:
>> > >> +          - const: osc
>> > >> +          - enum:
>> > >> +              - gmac1_rmii_refin
>> > >> +              - gmac1_rgmii_rxin
>> > >> +          - const: i2stx_bclk_ext
>> > >> +          - const: i2stx_lrck_ext
>> > >> +          - const: i2srx_bclk_ext
>> > >> +          - const: i2srx_lrck_ext
>> > >> +          - const: tdm_ext
>> > >> +          - const: mclk_ext
>> > >> +
>> > >> +      - items:
>> > >> +          - const: osc
>> > >> +          - const: gmac1_rmii_refin
>> > >> +          - const: gmac1_rgmii_rxin
>> > >> +          - const: i2stx_bclk_ext
>> > >> +          - const: i2stx_lrck_ext
>> > >> +          - const: i2srx_bclk_ext
>> > >> +          - const: i2srx_lrck_ext
>> > >> +          - const: tdm_ext
>> > >> +          - const: mclk_ext
>> > >
>> > > I'm sorry to be a bit of a bore about these bindings, but Emil mentioned
>> > > to me today that he had some doubts about whether any of these audio
>> > > clocks are actually required.
>> > > I've had a bit of a look at the driver, cos the TRM that I have doesn't
>> > > describe the clock tree (from what recall at least) and I think he is
>> > > right.
>> > > For example, the TDM clock:
>> > > +   JH71X0_GATE(JH7110_SYSCLK_TDM_AHB, "tdm_ahb", 0, JH7110_SYSCLK_AHB0),
>> > > +   JH71X0_GATE(JH7110_SYSCLK_TDM_APB, "tdm_apb", 0, JH7110_SYSCLK_APB0),
>> > > +   JH71X0_GDIV(JH7110_SYSCLK_TDM_INTERNAL, "tdm_internal", 0, 64, JH7110_SYSCLK_MCLK),
>> > > +   JH71X0__MUX(JH7110_SYSCLK_TDM_TDM, "tdm_tdm", 2,
>> > > +               JH7110_SYSCLK_TDM_INTERNAL,
>> > > +               JH7110_SYSCLK_TDM_EXT),
>> > >
>> > > Hopefully, I'm not making a balls of something here, but it looks like I
>> > > can choose an internal TDM clock, that is based on JH7110_SYSCLK_MCLK,
>> > > which in turn comes from either an internal or external source.
>> > > If I am following correctly, that'd be:
>> > > +   JH71X0__DIV(JH7110_SYSCLK_MCLK_INNER, "mclk_inner", 64, JH7110_SYSCLK_AUDIO_ROOT),
>> > >
>> > > Which in turn comes from:
>> > > +   JH71X0__DIV(JH7110_SYSCLK_AUDIO_ROOT, "audio_root", 8, JH7110_SYSCLK_PLL2_OUT),
>> > >
>> > > This leaves me wondering which clocks are *actually* required for a
>> > > functioning system - is it actually just osc and one of gmac1_rmii_refin
>> > > or gmac1_rgmii_rxin.
>> >
>> > As I had mentioned somewhere before, some audio clocks need to change their
>> > parents at different stages of work. I should explain in detail here.
>> >
>> > For the i2s*_ext clocks, we should use these external clocks as parents when
>> > the I2S module is working in the slave mode, while we should use the internal
>> > clocks as parents when the I2S module is working in the master mode.
> 
> Right, so what Hal is saying here is that the i2s*_ext clocks are only
> needed if the board is designed to have i2s modules in slave mode.

I don't think we want to describe the dt-bindings of clock controllers according
to the board design.
As I said in v5, IMO, the "optional" here means whether the clock is optional
in the sense that we are able to run all designed functions on the SoC.

> 
>> > For the tdm_ext clock, we use it as the clock source for an accurate playback
>> > rate. If we use the internal clock as clock source, the TDM can't work
>> > normally, because it can't get a required rate from the internal divider.
>> > By the way, note that we need to use the internal clock as clock source when
>> > we try to reset the tdm clock, otherwise, the reset will fail.
>> >
>> > For the mclk_ext clock, which is 12.288MHz, it's used as the clock source
>> > through all the running time, otherwise, the daughter clocks can't get the
>> > required rate from the internal PLL2 clock (1188MHz) through dividers.
> 
> Right, so PLL2 is 1188MHz on the VisionFive 2.
> 
> Hal: But is it not possible to program the PLL2 to run at a multiple
> of 12.288MHz in some other configuration?

Yeah, we can definitely set the PLL2 at a multiple of 12.288MHz as what we did in
the v1. We changed it to 1188MHz for supporting dual-screen display.

Best regards,
Hal

> 
>> > So all these audio external clocks (i2s*_ext / tdm_ext / mclk_ext) are
>> > actually required.
>>
>> Okay. I think I am okay with leaving the binding as-is then, and if
>> someone needs to omit the entire audio subsystem on the SoC, they can
>> follow Stephen's suggestion.
>>
>> @Emil, is that okay with you?
> 
> Conor: I'm fine with the bindings like this. I just want to make sure
> that we all have the same idea of what is "optional" and should be
> marked as such in the bindings.
> 
> /Emil


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

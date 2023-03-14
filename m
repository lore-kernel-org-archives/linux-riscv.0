Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CFAC7618B
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4OnEdLfzKdQvBQP/ICRhNeijQsJe/j08cyozsz9JGIY=; b=J3a+RZFEDOobN/
	QWp9PptnA4afE/s97gkbxINMCn/2pAvRh4QH1ctExGI4WM46reiRVzihhdLfIKRd0sTjyMhzLvGz/
	tmZFVsQ8Nq6YmO/r0wmcZSSRGZO1y4VzMF0YvF4UdUp2Lyty3Dh4ZWCSJ6Xl76MSvhpX/ekyD8eRY
	WLrHE0BW9WBkUsTez3/sflZIQDnqTkohcfp1a06I1btYBk7jRChxufvXTUs9ctS3vDhVtmJTqWWvd
	+d72XXkUkeFYYjfxsSwt1y7In4sp0QXzG3h6Yk1ahwM2TBvgYxiJPYeYgCntfJmYObAVL2hRP/o8q
	4HNe6qBpKT4xlHkYW2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc5ME-00APi1-0q;
	Tue, 14 Mar 2023 14:10:30 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc5M9-00APZ9-2a
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 14:10:29 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id DD9D824E289;
	Tue, 14 Mar 2023 22:09:29 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 22:09:29 +0800
Received: from [192.168.125.74] (113.72.145.194) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 22:09:28 +0800
Message-ID: <8e2f923a-34d6-e188-c845-471d4ef5acc1@starfivetech.com>
Date: Tue, 14 Mar 2023 22:09:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 11/21] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: Conor Dooley <conor@kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "Marc
 Zyngier" <maz@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-12-hal.feng@starfivetech.com>
 <34b0473a-91bd-453b-91dd-01defde92d68@spud>
 <92306b73-d7d2-0d60-de15-87bcd71714ed@starfivetech.com>
 <CAJM55Z-zps4gEohCGyia0nESWYWqQmoChnJZXkw2Zmi5TPV2Wg@mail.gmail.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <CAJM55Z-zps4gEohCGyia0nESWYWqQmoChnJZXkw2Zmi5TPV2Wg@mail.gmail.com>
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_071026_437526_C5F077B5 
X-CRM114-Status: GOOD (  14.94  )
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

On Mon, 13 Mar 2023 09:53:01 +0100, Emil Renner Berthing wrote:
> On Mon, 13 Mar 2023 at 04:22, Hal Feng <hal.feng@starfivetech.com> wrote:
>> On Sat, 11 Mar 2023 13:11:38 +0000, Conor Dooley wrote:
>> > On Sat, Mar 11, 2023 at 05:07:23PM +0800, Hal Feng wrote:
>> >> From: Emil Renner Berthing <kernel@esmil.dk>
>> >>
>> >> Add bindings for the system clock and reset generator (SYSCRG) on the
>> >> JH7110 RISC-V SoC by StarFive Ltd.
>> >>
>> >> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> >> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> >> ---
>> >>  .../clock/starfive,jh7110-syscrg.yaml         | 104 +++++++++
>> >>  MAINTAINERS                                   |   8 +-
>> >>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 203 ++++++++++++++++++
>> >>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 142 ++++++++++++
>> >>  4 files changed, 454 insertions(+), 3 deletions(-)
>> >>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>> >>  create mode 100644 include/dt-bindings/clock/starfive,jh7110-crg.h
>> >>  create mode 100644 include/dt-bindings/reset/starfive,jh7110-crg.h
>> >>
>> >> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>> >> new file mode 100644
>> >> index 000000000000..84373ae31644
>> >> --- /dev/null
>> >> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>> >
>> >> +  clock-names:
>> >> +    oneOf:
>> >> +      - items:
>> >> +          - const: osc
>> >> +          - enum:
>> >> +              - gmac1_rmii_refin
>> >> +              - gmac1_rgmii_rxin
>> >> +          - const: i2stx_bclk_ext
>> >> +          - const: i2stx_lrck_ext
>> >> +          - const: i2srx_bclk_ext
>> >> +          - const: i2srx_lrck_ext
>> >> +          - const: tdm_ext
>> >> +          - const: mclk_ext
>> >> +
>> >> +      - items:
>> >> +          - const: osc
>> >> +          - const: gmac1_rmii_refin
>> >> +          - const: gmac1_rgmii_rxin
>> >> +          - const: i2stx_bclk_ext
>> >> +          - const: i2stx_lrck_ext
>> >> +          - const: i2srx_bclk_ext
>> >> +          - const: i2srx_lrck_ext
>> >> +          - const: tdm_ext
>> >> +          - const: mclk_ext
>> >
>> > Assuming nothing else here is optional,
>> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> Yeah, nothing else here is optional. Thanks for your review.
> 
> Wait, what kind of optional are we talking about here? Surely all the
> i2s and tdm external clocks are optional in the sense that you don't
> need them on a board that never does any audio processing.

I think the "optional" means whether the clock is optional in the sense
that we run all functions on the SoC.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

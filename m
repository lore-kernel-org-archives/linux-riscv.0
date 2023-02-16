Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51527C636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 17:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qy9SqYtOHsEpEqaHKdhm3bTiFs5qZTUWzT9arpDpJiU=; b=PkC3E2dLcORHn1
	ZB9kENftb787HzBhqzVK0Og/zVKN2Uted8pmfZKPDSGf42puZI/sfkd4f0R6ieDa15kwaXhH4N1pH
	8H/j7je6vXhmtEkBZGn00CHeAXvtMp/7Vcd6wGIvgcD7AYoxjBIpCeRXhTwPcwjr27SHBIXjs0EJ8
	uVf3iY+CyJFN3otAcNxPVIhrvVX1lD7nCo8yDesYqvcURUvrRT1E/wY3pwTT6l+ODw/uYpVfILXta
	2/fPG9k6qwR1/Wm5kOzkDKCLM1rAClpMY1THC7lpCl6qzCBF9rE5Oje2feTpF8pPZAQj0zg9Xyd7v
	+DyAxZs57K2NI9p2ERdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pShvI-00BK6T-If; Thu, 16 Feb 2023 17:19:56 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pShvD-00BK2K-DY
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 17:19:54 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id B771E24E154;
	Fri, 17 Feb 2023 01:19:24 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 17 Feb
 2023 01:19:24 +0800
Received: from [172.16.16.234] (113.72.147.207) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 17 Feb
 2023 01:19:23 +0800
Message-ID: <10c2bcb2-e8ca-572f-9e35-84bc8dbf699e@starfivetech.com>
Date: Fri, 17 Feb 2023 01:19:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3 08/11] dt-bindings: clock: Add StarFive JH7110
 always-on clock and reset generator
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
References: <20221220005054.34518-1-hal.feng@starfivetech.com>
 <20221220005054.34518-9-hal.feng@starfivetech.com> <Y6JC6PZaRMYxZG5Z@spud>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <Y6JC6PZaRMYxZG5Z@spud>
X-Originating-IP: [113.72.147.207]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_091951_793293_069C5DE8 
X-CRM114-Status: GOOD (  17.09  )
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

On Tue, 20 Dec 2022 23:19:04 +0000, Conor Dooley wrote:
> On Tue, Dec 20, 2022 at 08:50:51AM +0800, Hal Feng wrote:
>> From: Emil Renner Berthing <kernel@esmil.dk>
>> 
>> Add bindings for the always-on clock and reset generator (AONCRG) on the
>> JH7110 RISC-V SoC by StarFive Ltd.
>> 
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../clock/starfive,jh7110-aoncrg.yaml         | 76 +++++++++++++++++++
>>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 18 +++++
>>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 12 +++
>>  3 files changed, 106 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
>> new file mode 100644
>> index 000000000000..a3cf0570d950
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
>> @@ -0,0 +1,76 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-aoncrg.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH7110 Always-On Clock and Reset Generator
>> +
>> +maintainers:
>> +  - Emil Renner Berthing <kernel@esmil.dk>
>> +
>> +properties:
>> +  compatible:
>> +    const: starfive,jh7110-aoncrg
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Main Oscillator (24 MHz)
>> +      - description: RTC Oscillator (32.768 kHz)
>> +      - description: GMAC0 RMII reference
>> +      - description: GMAC0 RGMII RX
> 
> Gotta ask the same question here about the muxing - are all of these
> clocks truly required?

Please see the following clock tree.

                                 enable  prepare  protect                                duty  hardware
   clock                          count    count    count        rate   accuracy phase  cycle    enable
-------------------------------------------------------------------------------------------------------
 *rtc_osc*                              0        0        0       32768          0     0  50000         Y
    rtc_32k                           0        0        0       32768          0     0  50000         Y
 *gmac0_rgmii_rxin*                     0        0        0   125000000          0     0  50000         Y
    gmac0_rx                          0        0        0   125000000          0     0  50000         Y
       gmac0_rx_inv                   0        0        0   125000000          0   180  50000         Y
 *gmac0_rmii_refin*                     0        0        0    50000000          0     0  50000         Y
    gmac0_rmii_rtx                    0        0        0    25000000          0     0  50000         Y
       gmac0_tx                       0        0        0    25000000          0     0  50000         N
          gmac0_tx_inv                0        0        0    25000000          0   180  50000         Y
 *osc*                                  3        3        0    24000000          0     0  50000         Y
    rtc_cal                           0        0        0    24000000          0     0  50000         N
    rtc_internal                      0        0        0       32000          0     0  50000         Y
    apb_func                          0        0        0    24000000          0     0  50000         Y
    osc_div4                          0        0        0     6000000          0     0  50000         Y
    pll2_out                          2        2        0  1188000000          0     0  50000         Y
       bus_root                       1        1        0  1188000000          0     0  50000         Y
          axi_cfg0                    2        2        0   396000000          0     0  50000         Y
             *stg_axiahb*               3        3        0   198000000          0     0  50000         Y
                gmac0_axi             0        0        0   198000000          0     0  50000         N
                gmac0_ahb             0        0        0   198000000          0     0  50000         N
                *apb_bus*               2        2        0    49500000          0     0  50000         Y
                   rtc_apb            0        0        0    49500000          0     0  50000         Y
                   otpc_apb           0        0        0    49500000          0     0  50000         Y
    pll0_out                          1        1        0  1250000000          0     0  50000         Y
       *gmac0_gtxclk*                   0        0        0   156250000          0     0  50000         N
          gmac0_gtxc                  0        0        0   156250000          0     0  50000         N

Most input clocks are used as parent of the clocks registered
in aon clock driver (patch 10) except the clock "gmac0_gtxclk".
But I still think there is no harm in building a complete
clock tree, so we can adjust the parent clocks easily.

> 
>> +      - description: STG AXI/AHB
>> +      - description: APB Bus
>> +      - description: GMAC0 GTX
>> +
>> +  clock-names:
>> +    items:
>> +      - const: osc
>> +      - const: rtc_osc
>> +      - const: gmac0_rmii_refin
>> +      - const: gmac0_rgmii_rxin
>> +      - const: stg_axiahb
>> +      - const: apb_bus
>> +      - const: gmac0_gtxclk
> 
> And if they are, is this actually needed since the order must be as
> above?

Will remove "clock-names" in the binding and device tree. Thanks.

Best regards,
Hal

> 
> As I said in the previous patch, I've probably missed something...
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

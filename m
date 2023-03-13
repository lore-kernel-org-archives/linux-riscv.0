Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC4FC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Mar 2023 03:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8YxndEhPvlcMWVCi4+7DW3TIAM2nBNAhhFu/uac4O0=; b=gPyDy/Hx7rBdQs
	BcuO85QZHTLxT5bqo9RMBqcCJxOpmXF6CLFA+aN9QAqxBVf5JA3b/cCIZZpnj3wtBQARBxKjfKNEg
	L46JE3pSNKfOxBMEQFHPdcb5kg+8KbGYHvaiMYDEDehJPaEdm8IqUG2ymxvAX5AuUbeEj66axY5dg
	J+0EoS9YE8CulrV17etemqATk+QpQKa6xlCGRDPftWsiZz48fFCqG309rIE72SiFqwbexKvJHWNGX
	txnstg+sVCwNnzGmeOaHeyOYUhQWiG11h/U42b+fXD13KNascvsasQyAxS9CK1I6eMyTi8NdnOfjS
	tMjesAmUwZ8pwgUOW+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbYlt-0048OO-T4; Mon, 13 Mar 2023 03:22:49 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbYlq-0048NP-Fj
	for linux-riscv@lists.infradead.org; Mon, 13 Mar 2023 03:22:48 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id B9B5724E1D2;
	Mon, 13 Mar 2023 11:22:33 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Mar
 2023 11:22:33 +0800
Received: from [192.168.125.74] (183.27.96.115) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Mar
 2023 11:22:32 +0800
Message-ID: <92306b73-d7d2-0d60-de15-87bcd71714ed@starfivetech.com>
Date: Mon, 13 Mar 2023 11:22:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 11/21] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>,
	<linux-kernel@vger.kernel.org>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-12-hal.feng@starfivetech.com>
 <34b0473a-91bd-453b-91dd-01defde92d68@spud>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <34b0473a-91bd-453b-91dd-01defde92d68@spud>
X-Originating-IP: [183.27.96.115]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_202246_852522_F21521EA 
X-CRM114-Status: GOOD (  11.92  )
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

On Sat, 11 Mar 2023 13:11:38 +0000, Conor Dooley wrote:
> On Sat, Mar 11, 2023 at 05:07:23PM +0800, Hal Feng wrote:
>> From: Emil Renner Berthing <kernel@esmil.dk>
>> 
>> Add bindings for the system clock and reset generator (SYSCRG) on the
>> JH7110 RISC-V SoC by StarFive Ltd.
>> 
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../clock/starfive,jh7110-syscrg.yaml         | 104 +++++++++
>>  MAINTAINERS                                   |   8 +-
>>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 203 ++++++++++++++++++
>>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 142 ++++++++++++
>>  4 files changed, 454 insertions(+), 3 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>>  create mode 100644 include/dt-bindings/clock/starfive,jh7110-crg.h
>>  create mode 100644 include/dt-bindings/reset/starfive,jh7110-crg.h
>> 
>> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>> new file mode 100644
>> index 000000000000..84373ae31644
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> 
>> +  clock-names:
>> +    oneOf:
>> +      - items:
>> +          - const: osc
>> +          - enum:
>> +              - gmac1_rmii_refin
>> +              - gmac1_rgmii_rxin
>> +          - const: i2stx_bclk_ext
>> +          - const: i2stx_lrck_ext
>> +          - const: i2srx_bclk_ext
>> +          - const: i2srx_lrck_ext
>> +          - const: tdm_ext
>> +          - const: mclk_ext
>> +
>> +      - items:
>> +          - const: osc
>> +          - const: gmac1_rmii_refin
>> +          - const: gmac1_rgmii_rxin
>> +          - const: i2stx_bclk_ext
>> +          - const: i2stx_lrck_ext
>> +          - const: i2srx_bclk_ext
>> +          - const: i2srx_lrck_ext
>> +          - const: tdm_ext
>> +          - const: mclk_ext
> 
> Assuming nothing else here is optional,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Yeah, nothing else here is optional. Thanks for your review.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

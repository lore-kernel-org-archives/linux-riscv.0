Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6487AC636D7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 08:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8TWdVb5SVeZzeNmfNWKj9XmvesRJd9GbWIGA7z0j8k=; b=rmoPStPHMy4WY1
	+/mGbDEnHo/tutEklRQdn+kJyxH1HrlHy5dGyYpy5m0cxVNQ1LCEnPVD/wfbU7zoiQ3E3cLTT6cR8
	Pl4Pnkyx6J8wUdlirHg5xrsTubyIsj7ivC/Joc/fvWeDAcvJG/EMWdr/uYjtmjYLtMtbvTcYEhR7O
	8uYZr18ki+OfPahUWdoKxlmNAVNwSGf3GRnTfN0Jr7+YZgj7YKOg832AGXeZ7U3i4QJxKGk+dptrp
	zCjI1U1pihp5lJq/SyWBb/5TLkOFNn5bsHx2Q9nluxds7X9yND3P5RROz6fkljdpXQMqu5am1AEjR
	+SP9hTTTtUOHSm21i1tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7Fm-00Fa1A-2u; Thu, 23 Feb 2023 08:47:02 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7Fi-00Fa0G-3C
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 08:47:00 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A482D24E282;
	Thu, 23 Feb 2023 16:46:44 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 16:46:44 +0800
Received: from [192.168.125.128] (113.72.147.165) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 16:46:43 +0800
Message-ID: <842e5825-07ad-1806-d969-f54d9a9eed5a@starfivetech.com>
Date: Thu, 23 Feb 2023 16:47:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: jh7110: Add PLL clock node
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230221141147.303642-1-xingyu.wu@starfivetech.com>
 <20230221141147.303642-4-xingyu.wu@starfivetech.com>
 <a799e064-b0ac-7300-b706-0c33e2d3610a@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <a799e064-b0ac-7300-b706-0c33e2d3610a@linaro.org>
X-Originating-IP: [113.72.147.165]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_004658_435068_C34AD016 
X-CRM114-Status: GOOD (  13.63  )
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

On 2023/2/22 17:09, Krzysztof Kozlowski wrote:
> On 21/02/2023 15:11, Xingyu Wu wrote:
>> Add the PLL clock node for the Starfive JH7110 SoC and
>> modify the SYSCRG node to add PLL clocks.
>> 
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index b6612c53d0d2..0cb8d86ebce5 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -461,12 +461,16 @@ syscrg: clock-controller@13020000 {
>>  				 <&gmac1_rgmii_rxin>,
>>  				 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
>>  				 <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
>> -				 <&tdm_ext>, <&mclk_ext>;
>> +				 <&tdm_ext>, <&mclk_ext>,
>> +				 <&pllclk JH7110_CLK_PLL0_OUT>,
>> +				 <&pllclk JH7110_CLK_PLL1_OUT>,
>> +				 <&pllclk JH7110_CLK_PLL2_OUT>;
>>  			clock-names = "osc", "gmac1_rmii_refin",
>>  				      "gmac1_rgmii_rxin",
>>  				      "i2stx_bclk_ext", "i2stx_lrck_ext",
>>  				      "i2srx_bclk_ext", "i2srx_lrck_ext",
>> -				      "tdm_ext", "mclk_ext";
>> +				      "tdm_ext", "mclk_ext",
>> +				      "pll0_out", "pll1_out", "pll2_out";
>>  			#clock-cells = <1>;
>>  			#reset-cells = <1>;
>>  		};
>> @@ -476,6 +480,13 @@ sys_syscon: syscon@13030000 {
>>  			reg = <0x0 0x13030000 0x0 0x1000>;
>>  		};
>>  
>> +		pllclk: pll-clock-controller {
> 
> Does not look like you tested the DTS against bindings. Please run `make
> dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
> for instructions). You should see here warnings of mixing non-MMIO nodes
> in MMIO-bus.
> 

Oh I cherry-pick the commit of syscon node and it also include the MMC node.
I will remove the MMC node. 
I used dtbs_check and get the error 'should not be valid under {'type': 'object'}',
If I move this node out of the 'soc' node, the dtbs_check will be pass.
Is it OK to move the PLL node out of the 'soc' node? Thanks.

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

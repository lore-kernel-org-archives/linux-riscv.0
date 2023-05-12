Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883EFC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 08:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=988G05mPRTWY1NNbr3ZZLjKc/VN2TiRSTUt4pLEo/BI=; b=ABqETk1fiACQLc
	llPjHdsSAxyTe77F66XE787o4bB5zHS6YJ9YkaPV/ckwu8AqvOAK36RAQe3sGvmsTlJB10mL9XeQa
	oeNsQWptIxlvfuRvjrD/PzCn2CpGF9LbAIm7Gecji3c6hF8jeCeA59rjuHvZwtHLtLAv0ypOYswx9
	vo+9laVXaZpf4P5ZXtsDnPjbC2HlM4DD5t+MbTtIR5K5hVDWdTCROD5b7k9KlwfCJd8a39xH0o8aj
	zoJIEDBELgG8qZlI+S/JjhzJlfNRGV4dkV1sW3uzKwU78VHlaY5C45hUgS+cdeoy3jGWDVR3k44RT
	E7AOo+JNLYII6H6krcxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxNqZ-00BIDe-10;
	Fri, 12 May 2023 08:09:51 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxNqW-00BIBB-0T
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 08:09:50 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id CD9B624DFDC;
	Fri, 12 May 2023 16:09:24 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 12 May
 2023 16:09:24 +0800
Received: from [192.168.125.131] (113.72.146.187) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 12 May
 2023 16:09:23 +0800
Message-ID: <91e4fd3c-20cb-724b-c9a8-e038600aabb7@starfivetech.com>
Date: Fri, 12 May 2023 16:07:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 3/7] dt-bindings: clock: jh7110-syscrg: Add PLL clock
 inputs
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, William Qiu
	<william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-4-xingyu.wu@starfivetech.com>
 <20230512-uproar-external-49a9e793fbc4@wendy>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <20230512-uproar-external-49a9e793fbc4@wendy>
X-Originating-IP: [113.72.146.187]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_010948_467427_2C7D2B1E 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

On 2023/5/12 14:47, Conor Dooley wrote:
> On Fri, May 12, 2023 at 10:20:32AM +0800, Xingyu Wu wrote:
>> Add PLL clock inputs from PLL clock generator.
>> 
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
>>  .../clock/starfive,jh7110-syscrg.yaml         | 20 +++++++++++++++++--
>>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> /tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: clock-controller@13020000: clocks: 'oneOf' conditional failed, one must be fixed:
> 	[[19], [20], [21], [22], [23], [24], [25], [26], [27]] is too short
> 	From schema: /Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> /tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: clock-controller@13020000: clock-names: 'oneOf' conditional failed, one must be fixed:
> 	['osc', 'gmac1_rmii_refin', 'gmac1_rgmii_rxin', 'i2stx_bclk_ext', 'i2stx_lrck_ext', 'i2srx_bclk_ext', 'i2srx_lrck_ext', 'tdm_ext', 'mclk_ext'] is too short
> 	'i2stx_bclk_ext' was expected
> 	'i2stx_lrck_ext' was expected
> 	'i2srx_bclk_ext' was expected
> 	'i2srx_lrck_ext' was expected
> 	'tdm_ext' was expected
> 	'mclk_ext' was expected
> 	'pll0_out' was expected
> 	From schema: /Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> /tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: clock-controller@13020000: clocks: 'oneOf' conditional failed, one must be fixed:
> 	[[19], [20], [21], [22], [23], [24], [25], [26], [27]] is too short
> 	From schema: Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> /tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: clock-controller@13020000: clock-names: 'oneOf' conditional failed, one must be fixed:
> 	['osc', 'gmac1_rmii_refin', 'gmac1_rgmii_rxin', 'i2stx_bclk_ext', 'i2stx_lrck_ext', 'i2srx_bclk_ext', 'i2srx_lrck_ext', 'tdm_ext', 'mclk_ext'] is too short
> 	'i2stx_bclk_ext' was expected
> 	'i2stx_lrck_ext' was expected
> 	'i2srx_bclk_ext' was expected
> 	'i2srx_lrck_ext' was expected
> 	'tdm_ext' was expected
> 	'mclk_ext' was expected
> 	'pll0_out' was expected
> 	Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> 
> This binding change is incompatible with the existing devicetrees for
> the visionfive 2.

This looks like less clocks about PLL in SYSCRG node. And I add this in patch 7.

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

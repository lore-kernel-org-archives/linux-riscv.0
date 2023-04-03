Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1619EC7619A
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 01:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ve8vkP5FBRrXovgXkt2I7tyOM+SgZtUe+bRz2fF9RLg=; b=i8n9Q43yQ3c7kv
	/Ebfat/XF/eCE6go/sYSLvAYR/dFR+NlzjHv6uxat+o4+IRdjg+HXbknrlyXCzApdo8P7YEhns/5O
	NOYBtYpZ5/vOqzdkR1i55JXgWpHppePU5e7lCgwvIwgy7Cz6bmpBbeG8yBqL8sEV4QTeWWYMmUIVV
	iPL6AwTtcxoQnia7Uqc6T+C4y5DifjoA0xBcXctb4JKcRvvFCoGoE5coH3+fgioFjwkKfAraYc4dg
	i8SHB6e8tTLASwwKpxVdoVvnhvnO0CXw9ld7ZrkgdPloJs6zSjQARcqxgkZH7k5oZablPYuEtBDUE
	XWwcehH3A028fR/mi4Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pj9AZ-00Dowd-1k;
	Mon, 03 Apr 2023 01:39:39 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pj9AU-00DoqU-19;
	Mon, 03 Apr 2023 01:39:37 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id F1D2E24E39B;
	Mon,  3 Apr 2023 09:39:02 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 09:39:02 +0800
Received: from [192.168.125.82] (183.27.97.179) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 09:39:02 +0800
Message-ID: <d48ab612-213a-8d20-4b36-3f64f3d24721@starfivetech.com>
Date: Mon, 3 Apr 2023 09:39:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/3] phy: starfive: Add mipi dphy rx support
To: Vinod Koul <vkoul@kernel.org>
CC: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jack Zhu <jack.zhu@starfivetech.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230223015952.201841-1-changhuang.liang@starfivetech.com>
 <20230223015952.201841-3-changhuang.liang@starfivetech.com>
 <ZBhTmTEcrV59oaw3@matsya>
 <2aa1bdbd-e37e-941a-9422-0908545c14f7@starfivetech.com>
 <ZCbloBdeffocT3Os@matsya>
Content-Language: en-US
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <ZCbloBdeffocT3Os@matsya>
X-Originating-IP: [183.27.97.179]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_183934_727533_31039E3D 
X-CRM114-Status: UNSURE (   9.09  )
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



On 2023/3/31 21:52, Vinod Koul wrote:
> On 21-03-23, 14:08, Changhuang Liang wrote:
>>
>>
>> On 2023/3/20 20:37, Vinod Koul wrote:
>>> On 22-02-23, 17:59, Changhuang Liang wrote:
>>>> [...]
>>>> +static const struct regval_t stf_dphy_init_list[] = {
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(4), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(8), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(12), 0x0000fff0 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(16), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(20), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(24), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(28), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(32), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(36), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(40), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(40), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(48), 0x24000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(52), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(56), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(60), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(64), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(68), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(72), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(76), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(80), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(84), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(88), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(92), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(96), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(100), 0x02000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(104), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(108), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(112), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(116), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(120), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(124), 0x0000000c },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(128), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(132), 0xcc500000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(136), 0x000000cc },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(140), 0x00000000 },
>>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(144), 0x00000000 },
>>>> +};
>>>> +
>>>> +static int stf_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
>>>> +{
>>>> +	struct stf_dphy *dphy = phy_get_drvdata(phy);
>>>> +	int map[6] = {4, 0, 1, 2, 3, 5};
>>>
>>> what does this mean?
>>
>> This is the physical lane and logical lane mapping table, should I add a note for it?
> 
> Yes please. Also will the mapping be always static or ever change?
>  

The mapping is always static on the visionfive2 single board computer.
Thanks for your comments.

>>
>>>> +	int i;
>>>> +
>>>> +	for (i = 0; i < ARRAY_SIZE(stf_dphy_init_list); i++)
>>>> +		writel(stf_dphy_init_list[i].val,
>>>> +		       dphy->regs + stf_dphy_init_list[i].addr);
>>>> +
>>>> +	writel(FIELD_PREP(STF_DPHY_DA_CDPHY_R100_CTRL0_2D1C_EFUSE_EN, 1) |
>>>> +	       FIELD_PREP(STF_DPHY_DA_CDPHY_R100_CTRL0_2D1C_EFUSE_IN, 0x1b) |
>>>> +	       FIELD_PREP(STF_DPHY_DA_CDPHY_R100_CTRL1_2D1C_EFUSE_EN, 1) |
>>>> +	       FIELD_PREP(STF_DPHY_DA_CDPHY_R100_CTRL1_2D1C_EFUSE_IN, 0x1b),
>>>> +	       dphy->regs + STF_DPHY_APBCFGSAIF__SYSCFG(0));
>>>> +
>>>> +	writel(FIELD_PREP(STF_DPHY_DATA_BUS16_8, 0) |
>>>> +	       FIELD_PREP(STF_DPHY_DEBUG_MODE_SEL, 0x5a),
>>>> +	       dphy->regs + STF_DPHY_APBCFGSAIF__SYSCFG(184));
>>>> [...]
>>>> +module_platform_driver(stf_dphy_driver);
>>>> +
>>>> +MODULE_AUTHOR("Jack Zhu <jack.zhu@starfivetech.com>");
>>>> +MODULE_AUTHOR("Changhuang Liang <changhuang.liang@starfivetech.com>");
>>>> +MODULE_DESCRIPTION("Starfive DPHY RX driver");
>>>> +MODULE_LICENSE("GPL");
>>>> -- 
>>>> 2.25.1
>>>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

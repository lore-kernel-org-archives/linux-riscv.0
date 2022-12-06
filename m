Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32D6C3A5A7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 07:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SX6koQOLCwULbvnP/uQfLdzOcjO1TGiIr/8k02UEF+A=; b=NuxJsorfjDtnp7
	E1ZTpMsFZbWTGoE13zeoBqC20BCi+eQ/ujxzPxsI1CrKO3Lt3+m8SmikKHiIiXqDupeuOEJd6gGrW
	kKIrzA0fV/4h7YprwEECnsC9EKFDDrs4bkiUS+Ta8yZ9BHsbXZUykU6GKrCaVatsO0TEDi5g5/3hU
	0uXE7bg28ugVfS089MY4fpW6f7X3dQd/GvBlD5MD5W+OY/8GfRqzpUDkpMmtGgjErEcWtIpZdx//t
	NwzqtsrzUNjxSkbmixxRkSHqpvwghvq2ipmOcBX9gzqN5eWSqwNZc3Wrc6cpU0LrqsYBPnFxi4pZx
	ECdDRBSsX3JrceKzAtNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2SZG-003pYl-ES; Tue, 06 Dec 2022 07:40:42 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2SZC-003oqg-A6
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 07:40:41 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7515224E1D3;
	Tue,  6 Dec 2022 15:39:47 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 6 Dec
 2022 15:39:47 +0800
Received: from [192.168.120.49] (171.223.208.138) by EXMBX173.cuchost.com
 (172.16.6.93) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 6 Dec
 2022 15:39:45 +0800
Message-ID: <97418c57-ba31-aa16-ed8f-208dad4ac0d2@starfivetech.com>
Date: Tue, 6 Dec 2022 15:39:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 4/7] net: phy: motorcomm: Add YT8531 phy support
To: Andrew Lunn <andrew@lunn.ch>
CC: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-5-yanhong.wang@starfivetech.com>
 <Y4jK5VBVuAnl55Xz@lunn.ch>
Content-Language: en-US
From: yanhong wang <yanhong.wang@starfivetech.com>
In-Reply-To: <Y4jK5VBVuAnl55Xz@lunn.ch>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_234038_709970_C4E16BE6 
X-CRM114-Status: UNSURE (   9.51  )
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



On 2022/12/1 23:40, Andrew Lunn wrote:
>> +static const struct ytphy_reg_field ytphy_rxtxd_grp[] = {
>> +	{ "rx_delay_sel", GENMASK(13, 10), 0x0 },
>> +	{ "tx_delay_sel_fe", GENMASK(7, 4), 0xf },
>> +	{ "tx_delay_sel", GENMASK(3, 0), 0x1 }
>> +};
>> +
>> +static const struct ytphy_reg_field ytphy_txinver_grp[] = {
>> +	{ "tx_inverted_1000", BIT(14), 0x0 },
>> +	{ "tx_inverted_100", BIT(14), 0x0 },
>> +	{ "tx_inverted_10", BIT(14), 0x0 }
>> +};
>> +
>> +static const struct ytphy_reg_field ytphy_rxden_grp[] = {
>> +	{ "rxc_dly_en", BIT(8), 0x1 }
>> +};
>> +
>> +static int ytphy_config_init(struct phy_device *phydev)
>> +{
>> +	struct device_node *of_node;
>> +	u32 val;
>> +	u32 mask;
>> +	u32 cfg;
>> +	int ret;
>> +	int i = 0;
>> +
>> +	of_node = phydev->mdio.dev.of_node;
>> +	if (of_node) {
>> +		ret = of_property_read_u32(of_node, ytphy_rxden_grp[0].name, &cfg);
> 
> You need to document the device tree binding.
> 
> Frank Sae always gets the locking wrong in this driver. Have you
> tested your patch with lockdep enabled?
> 

I will add document to describe details in the next version, such as "rx_delay_sel","tx_inverted_10" etc.

>     Andrew



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

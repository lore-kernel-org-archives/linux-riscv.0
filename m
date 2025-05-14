Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AF5C3ABDE
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 14:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZgWWCj8olQxA/5s+y8QEICETAu1EnXAiy+5H6wdxo4=; b=RPsRlcABdi3a4V
	zM/HkzhPXK+7/CldLSI4f62slhrdnFw7J6Vy5eC4UECOl4JcHzH9vc2ZoLY0InYVOdzQdRHXehVff
	+4dNiAoNRIATo1hfIjsGQV+fhl+vY0jcqeyuahSTET0JjNvgiBg3uUXNfu4EsLri1RCv/mfHhvaIn
	PYdapoH5pwe+7dc1W8XIoO+ETbYolIYmot9aVOVW++ujrsWoP3HnUmQbleQ2l5e+EtO47EfGdMDnA
	HOGAWghAtjec6V9c/JXU7SHJHmj+Y4ZwN7mmyiRiNWd5wNcoU54MvNEv+8VLIfeDwtcNO0WcdlmhE
	VtdyrWzJkJRA+8dmrhQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCiV-0000000FMGt-1t99;
	Wed, 14 May 2025 14:04:15 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFAmp-0000000ExrK-49HT;
	Wed, 14 May 2025 12:00:37 +0000
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [27.18.99.44])
	by smtp.qiye.163.com (Hmail) with ESMTP id 150636c0b;
	Wed, 14 May 2025 20:00:28 +0800 (GMT+08:00)
Message-ID: <95e8f8fd-d7ea-4d78-a794-72f73a3e19f3@whut.edu.cn>
Date: Wed, 14 May 2025 20:00:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] phy: spacemit: add USB3 support for K1 PCIe/USB3
 combo PHY
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250418-b4-k1-usb3-phy-v2-v2-0-b69e02da84eb@whut.edu.cn>
 <20250418-b4-k1-usb3-phy-v2-v2-4-b69e02da84eb@whut.edu.cn>
 <aCRaAEJSphC7uWY0@vaman>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <aCRaAEJSphC7uWY0@vaman>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCH0tJVkhDGUIaSEIaSh0ZGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVPT1lXWRYaDxIVHRRZQVlPS0hVSktISUxCS1VKS0tVSkJLS1
	kG
X-HM-Tid: 0a96ceaae7d903a1kunm150636c0b
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NCo6Thw5CTEzPj4YTikiSTAq
	LywKCS1VSlVKTE9MSUlPS0hITUNDVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVPT1lXWQgBWUFIQ01JNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_050036_197929_ED45805B 
X-CRM114-Status: GOOD (  13.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 5/14/25 4:53 PM, Vinod Koul wrote:
> On 18-04-25, 21:19, Ze Huang wrote:
>> Add support for USB 3.0 mode on the K1 PCIe/USB3 combo PHY. Currently,
>> only USB mode is supported; PCIe support is not included in this change.
>>
>> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
>> ---
...
>> +#define COMBPHY_USB_LFPS_REG		0x58
>> +#define  COMBPHY_USB_LFPS_MASK		0x700
>> +#define  COMBPHY_USB_LFPS_THRES_DEFAULT	0x03
> Same comment as other patch

>> +
>> +#define COMBPHY_MODE_SEL	BIT(3)
>> +#define COMBPHY_WAIT_TIMEOUT	1000
>> +
>> +struct spacemit_combphy_priv {
>> +	struct device *dev;
>> +	struct phy *phy;
>> +	struct reset_control *phy_rst;
>> +	void __iomem *phy_ctrl;
>> +	void __iomem *phy_sel;
>> +	bool rx_always_on;
>> +	u8 lfps_threshold;
>> +	u8 type;
>> +};
>> +
>> +static void spacemit_reg_update(void __iomem *reg, u32 offset, u32 mask, u32 val)
>> +{
>> +	u32 tmp;
>> +
>> +	tmp = readl(reg + offset);
>> +	tmp = (tmp & ~(mask)) | val;
>> +	writel(tmp, reg + offset);
>> +}
>> +
>> +static int spacemit_combphy_wait_ready(struct spacemit_combphy_priv *priv,
>> +				       u32 offset, u32 mask, u32 val)
>> +{
>> +	u32 reg_val;
>> +	int ret = 0;
> Superfluous init, drop it pls

OK

>
>> +
>> +	ret = read_poll_timeout(readl, reg_val, (reg_val & mask) == val,
>> +				1000, COMBPHY_WAIT_TIMEOUT * 1000, false,
>> +				priv->phy_ctrl + offset);
>> +
>> +	return ret;
> why use local variable?

Will drop it.

>
>> +}
>> +
>> +static int spacemit_combphy_set_mode(struct spacemit_combphy_priv *priv)
>> +{
>> +	int ret = 0;
>> +
>> +	switch (priv->type) {
>> +	case PHY_TYPE_USB3:
>> +		spacemit_reg_update(priv->phy_sel, 0, 0, COMBPHY_MODE_SEL);
>> +		break;
>> +	default:
>> +		dev_err(priv->dev, "PHY type %x not supported\n", priv->type);
>> +		ret = -EINVAL;
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
...
>> +static const struct of_device_id spacemit_combphy_of_match[] = {
>> +	{ .compatible = "spacemit,k1-combphy", },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, spacemit_combphy_of_match);
>> +
>> +static struct platform_driver spacemit_combphy_driver = {
>> +	.probe	= spacemit_combphy_probe,
>> +	.driver = {
>> +		.name = "spacemit-k1-combphy",
>> +		.of_match_table = spacemit_combphy_of_match,
>> +	},
>> +};
>> +module_platform_driver(spacemit_combphy_driver);
>> +
>> +MODULE_DESCRIPTION("Spacemit PCIE/USB3.0 COMBO PHY driver");
>> +MODULE_LICENSE("GPL");
> Could this be single driver with different init register sequences?

Yes, on K1 SoC, the USB3 and PCIe Port A share the same COMBO PHY hardware.

PHY can be initialized for PCIe as well via a different init sequence.
In the future, we can extend the driver to support both modes based on 
the DT property.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

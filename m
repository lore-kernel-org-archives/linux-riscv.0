Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA9AC77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 11:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kvWw53Qt4lyw2+2jageBpmx4oEDA4vB7jAqKqAThhEw=; b=PCb8SQuNdeB68r
	zRdO4qaThao2tigVpIOd1rwn0XEEXDNrPqlVwJEt+PGZQu8mC1DB1jDtEDaNsZoyxwK96kh+GicP7
	eZRh1vFSjKmZjJMdevAZ1Cx/gefYFnJE3jKCNPj+A1QWZGm23ytU3aKhymSHlgWa39qQa4xLNlieS
	MdMyRuFXCnKL5GS5Qdq8uVhz4ZWrQOxqi3MBsXr9z/cmXKXeJ7pDjcWUt/fMCRkQMS/ho+GIfMGp/
	DRNyZnOirskIWnp+ejPF56hZGw+4RIvXO7E5yZ6yr30kCuFM2m3UWT4sOYAKhkcLclyhR2eTfDSqm
	gsWtC5JDiyLbiNPwQoSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgkeh-00AhwL-2G;
	Mon, 27 Mar 2023 11:04:51 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgked-00Ahu0-2X;
	Mon, 27 Mar 2023 11:04:50 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 606B524E114;
	Mon, 27 Mar 2023 19:04:04 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Mar
 2023 19:04:04 +0800
Received: from [192.168.125.108] (113.72.145.117) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Mar
 2023 19:04:03 +0800
Message-ID: <20774e11-b7d4-e895-13f1-ea6dad130e4e@starfivetech.com>
Date: Mon, 27 Mar 2023 19:04:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 4/5] usb: cdns3: add StarFive JH7110 USB driver.
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, "Vinod
 Koul" <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
	<peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230315104411.73614-1-minda.chen@starfivetech.com>
 <20230315104411.73614-5-minda.chen@starfivetech.com>
 <2c99725a0bf259203a5b00f4c752eeb1b6596f59.camel@pengutronix.de>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <2c99725a0bf259203a5b00f4c752eeb1b6596f59.camel@pengutronix.de>
X-Originating-IP: [113.72.145.117]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_040448_133381_C17C7A8B 
X-CRM114-Status: GOOD (  15.40  )
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



On 2023/3/23 17:29, Philipp Zabel wrote:
> On Mi, 2023-03-15 at 18:44 +0800, Minda Chen wrote:
>> There is a Cadence USB3 core for JH7110 SoCs, the cdns
>> core is the child of this USB wrapper module device.
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> ---
> [...]
>> diff --git a/drivers/usb/cdns3/cdns3-starfive.c b/drivers/usb/cdns3/cdns3-starfive.c
>> new file mode 100644
>> index 000000000000..a99f98f85235
>> --- /dev/null
>> +++ b/drivers/usb/cdns3/cdns3-starfive.c
>> @@ -0,0 +1,305 @@
> [...]
>> +static int cdns_clk_rst_init(struct cdns_starfive *data)
>> +{
>> +	int ret;
>> +
>> +	data->num_clks = devm_clk_bulk_get_all(data->dev, &data->clks);
>> +	if (data->num_clks < 0)
>> +		return dev_err_probe(data->dev, -ENODEV,
>> +			"Failed to get clocks\n");
>> +
>> +	ret = clk_bulk_prepare_enable(data->num_clks, data->clks);
>> +	if (ret)
>> +		return dev_err_probe(data->dev, ret,
>> +			"failed to enable clocks\n");
> 
> In general, it's better to acquire all resources first and only then
> start interacting with them, and to order all devm_ calls before non-
> devm calls to make sure cleanup is done in reverse order.
> 
> In this case you can switch clk_bulk_prepare_enable() with
> devm_reset_control_array_get_exclusive() and simplify the error path.
> 
OK, thanks
>> +	data->resets = devm_reset_control_array_get_exclusive(data->dev);
>> +	if (IS_ERR(data->resets)) {
>> +		ret = dev_err_probe(data->dev, PTR_ERR(data->resets),
>> +			"Failed to get resets");
>> +		goto err_clk_init;
>> +	}
>> +
>> +	ret = reset_control_deassert(data->resets);
>> +	if (ret) {
>> +		ret = dev_err_probe(data->dev, ret,
>> +			"failed to reset clocks\n");
>> +		goto err_clk_init;
>> +	}
>> +
>> +	return ret;
>> +
>> +err_clk_init:
>> +	clk_bulk_disable_unprepare(data->num_clks, data->clks);
>> +	return ret;
>> +}
> 
> regards
> Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

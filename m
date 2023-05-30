Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A340CC7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 02:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JYmDao+QWlk+DPbV27yRlGZUebUC4ciQFi1NSVhIn4=; b=0OGx5Ht8tCXFN+
	70m0AFx2XjcXHNwJnqTxsveiqaDTpJZNN4CGrDlH/NXDfVbzH7ZfIzR59fRRAUB/tMHxFg0opuNzO
	0UxihDVIVv9pL1PaFHbUe+VbfPzDpm5E0o9UtQlt3eKCADjTOsKzmEDfA/gqJaBZxc7VX2WNi9r6N
	uDXLdoncBimKIqdEE0MssLmMEZCd6bnPvTfTHHP4s1/MTHan/1OxI6vcN2GKPd+no+gG2nk7v3sJG
	4t44xpRLEGkT97rrW1L/NCM4GIUmOROV+mrcLvpr8QuURGiE+grKgze/002E/z4eKfsC33ol9SdSQ
	dfbMcJAW/E4e+iMSTaRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3okU-00C9mq-0l;
	Tue, 30 May 2023 02:06:10 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3okP-00C9mR-00
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 02:06:08 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id B3D2424E271;
	Tue, 30 May 2023 10:05:39 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 30 May
 2023 10:05:39 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 30 May
 2023 10:05:39 +0800
Message-ID: <86555925-b8dd-29a8-60cd-5c2ff2c1432a@starfivetech.com>
Date: Tue, 30 May 2023 10:05:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 2/3] spi: cadence-quadspi: Add clock configuration for
 StarFive JH7110 QSPI
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
To: Mark Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Emil Renner Berthing" <kernel@esmil.dk>, Ziv Xu <ziv.xu@starfivetech.com>
References: <20230526062529.46747-1-william.qiu@starfivetech.com>
 <20230526062529.46747-3-william.qiu@starfivetech.com>
 <fecc9d6a-022e-49d9-a452-8a63c409ebf3@sirena.org.uk>
 <042c560d-1f36-8e97-3796-7423245592f4@starfivetech.com>
In-Reply-To: <042c560d-1f36-8e97-3796-7423245592f4@starfivetech.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_190605_210561_BF484C2D 
X-CRM114-Status: GOOD (  13.39  )
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



On 2023/5/29 14:44, William Qiu wrote:
> 
> 
> On 2023/5/26 23:36, Mark Brown wrote:
>> On Fri, May 26, 2023 at 02:25:28PM +0800, William Qiu wrote:
>> 
>>>  	if (of_device_is_compatible(pdev->dev.of_node, "starfive,jh7110-qspi")) {
>>> +		qspi_ahb = devm_clk_get(dev, "qspi-ahb");
>>> +		if (IS_ERR(qspi_ahb)) {
>>> +			dev_err(dev, "Cannot claim QSPI_AHB clock.\n");
>>> +			ret = PTR_ERR(qspi_ahb);
>>> +			return ret;
>>> +		}
>>> +
>>> +		ret = clk_prepare_enable(qspi_ahb);
>>> +		if (ret) {
>>> +			dev_err(dev, "Cannot enable QSPI AHB clock.\n");
>>> +			goto probe_clk_failed;
>>> +		}
>> 
>> Nothing ever disables or unprepares this clock as far as I can tell?
>> Perhaps also consider using the clk_bulk_ APIs.
> 
> I will add in next version.
> 
> Thanks for taking time to review this patch series and give useful
> suggestions.
> 
> Best regards,
> William

Hi Mark,

	Now I want to replace the original devm_clk_get API in the
driver with devm_clk_bulk_get_all API, which can achieve compatibility,
but it seems that it is not good for other ip with only one clock, so I
want to ask about that can I replace it? Or define that inside jh7110?

Best regards,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

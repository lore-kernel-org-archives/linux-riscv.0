Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AC0C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 06:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kRvw0OuokBEvNXJ4F1ef0b3lphCYOWQgyMOb/lIGIGo=; b=EYgEWC1JE78vOd
	uvZXbkJZdheJb2PEtkuwQEKuxIwRSs4g8Af0OPHN+HCImE3KpckPCdSpRbH8rZJSfPmfDV2C410Fm
	ajBu2/F5Z9jCOlB2ijX1noSFKekfUc8M6BlMQyW0wmnU+Cfc5C2WWet8RNyfSlFAdr0ndKg0v93hf
	QVekZfYsbwaTs+9id7Oon7dpENc78k5G/kEvG8calzieZyWSyo9s9jEGRL7yUbyDdCvlYKrEPD0U/
	xMiXi3ws/2A0qjfUVyVf+DhcJ/92hEds2KRiN5ms41lVItGxAkh5z6WOZfzfUtUBMlGzwv5NQW2dY
	eeDCLMCOpNTEHl9rGaWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4FBe-00GGpy-0v;
	Wed, 31 May 2023 06:19:58 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4FBa-00GGnd-0h
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 06:19:56 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id DEEC224DDBE;
	Wed, 31 May 2023 14:19:17 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 31 May
 2023 14:19:17 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 31 May
 2023 14:19:16 +0800
Message-ID: <93ba0b97-45aa-e59d-1454-80c4f245acc0@starfivetech.com>
Date: Wed, 31 May 2023 14:19:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 2/3] spi: cadence-quadspi: Add clock configuration for
 StarFive JH7110 QSPI
Content-Language: en-US
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
 <86555925-b8dd-29a8-60cd-5c2ff2c1432a@starfivetech.com>
 <eb68722b-bcab-4aa1-aa4e-54bfe95ef414@sirena.org.uk>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <eb68722b-bcab-4aa1-aa4e-54bfe95ef414@sirena.org.uk>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_231954_566034_77A116FC 
X-CRM114-Status: GOOD (  14.83  )
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



On 2023/5/30 18:33, Mark Brown wrote:
> On Tue, May 30, 2023 at 10:05:38AM +0800, William Qiu wrote:
>> On 2023/5/29 14:44, William Qiu wrote:
>> > On 2023/5/26 23:36, Mark Brown wrote:
> 
>> >> Nothing ever disables or unprepares this clock as far as I can tell?
>> >> Perhaps also consider using the clk_bulk_ APIs.
> 
>> > I will add in next version.
> 
>> 	Now I want to replace the original devm_clk_get API in the
>> driver with devm_clk_bulk_get_all API, which can achieve compatibility,
>> but it seems that it is not good for other ip with only one clock, so I
>> want to ask about that can I replace it? Or define that inside jh7110?
> 
> You could always specify a different array of clocks depending on which
> compatible the driver sees, just like you'd conditionally request clocks
> individually.
Hi Mark,

	If specify a different array of clocks depending on which compatible
the driver sees, since there will also be clock operations in the suspend
and resume interfaces, this can make the code look complicated.
	My thoughts are as follows:
	Modify the following code

1658	/* Obtain QSPI clock. */
1659	cqspi->clk = devm_clk_get(dev, NULL);
1660	if (IS_ERR(cqspi->clk)) {
1661		dev_err(dev, "Cannot claim QSPI clock.\n");
1662		ret = PTR_ERR(cqspi->clk);
1663		return ret;
1664	}

	as following:

	/* Obtain QSPI clock. */
	cqspi->num_clks = devm_clk_bulk_get_all(dev, &cqspi->clks);
	if (cqspi->num_clks < 0) {
		dev_err(dev, "Cannot claim QSPI clock: %u\n", cqspi->num_clks);
		return -EINVAL;
	}

	This way, the code will look simpler and clearer. How do you think
about it.

Best Regards,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

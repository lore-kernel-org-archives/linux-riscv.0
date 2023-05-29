Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C03FC77B7A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 06:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwVPA59Zu/vzp8wvBLRaiaW9/EdhikwNT7+i4GPbUi4=; b=vd2RIZnA+vUcAv
	XVqaR0PKWl0NP0csp4t2yz94oT66KngJ69Q5dLyVjs/j9m7XcIGwLbOaj5/MfPu05JdEzDVtfPfQS
	J3DvARu6L2N2MXp2Y5PiMMrikwMRE3cBwcKufKAINclejqF1tIoxEGvagF64BN+bk2NLLwgnoGnWf
	amfdTUmnUvSm7LqzhnUmY20YOTyZea5H4ocD2WFNm4fYhFCjQXg4NKKIKmTeFRO0EZ+IWUxlMJnzJ
	lwu8rvGnPxGN//FjIUwrSHRkw9Md2txD6u0CR3rdXYXkcV9gARJ+s8v7SMZeXKN30cQbQZb8tlhcu
	6L74lG/9AoCj/ul5h+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3WdI-009Qik-2K;
	Mon, 29 May 2023 06:45:32 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3WdG-009QgX-09
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 06:45:31 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A62D380C4;
	Mon, 29 May 2023 14:45:01 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 29 May
 2023 14:45:01 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 29 May
 2023 14:45:01 +0800
Message-ID: <042c560d-1f36-8e97-3796-7423245592f4@starfivetech.com>
Date: Mon, 29 May 2023 14:44:59 +0800
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
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <fecc9d6a-022e-49d9-a452-8a63c409ebf3@sirena.org.uk>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_234530_234300_061119B2 
X-CRM114-Status: UNSURE (   9.49  )
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



On 2023/5/26 23:36, Mark Brown wrote:
> On Fri, May 26, 2023 at 02:25:28PM +0800, William Qiu wrote:
> 
>>  	if (of_device_is_compatible(pdev->dev.of_node, "starfive,jh7110-qspi")) {
>> +		qspi_ahb = devm_clk_get(dev, "qspi-ahb");
>> +		if (IS_ERR(qspi_ahb)) {
>> +			dev_err(dev, "Cannot claim QSPI_AHB clock.\n");
>> +			ret = PTR_ERR(qspi_ahb);
>> +			return ret;
>> +		}
>> +
>> +		ret = clk_prepare_enable(qspi_ahb);
>> +		if (ret) {
>> +			dev_err(dev, "Cannot enable QSPI AHB clock.\n");
>> +			goto probe_clk_failed;
>> +		}
> 
> Nothing ever disables or unprepares this clock as far as I can tell?
> Perhaps also consider using the clk_bulk_ APIs.

I will add in next version.

Thanks for taking time to review this patch series and give useful
suggestions.

Best regards,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318E1EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 07:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnxLwfTdsH6tCWGxti8+75xXZbYP60hf1qSfLi3TMYo=; b=p5mNARO1jDGNxy
	12ud9t4CSQ6l0nxLCpco+dXLUKbe6ovmY6XJwLIvb6x1HCoF3OrDES9Ih0AdRBfCFblRfheXUvAdq
	pkWmloaJ21qmHBcK9JYDVqh48+1KZ2FDw8Oa4m2uzT9WYGMhgRQmxbolQ2QJS03BmeVSVbXVipu32
	OuddTu52CSiW7Xl5FWtWdffHB5N/lnt7ydCQv9E9R2JKkw8lg7wqr+elu5bhrteUpPlCJY1bJ/wvU
	++/4aAIWUaaYGB43D/QPvY0Hhy3AMqwH420RbPDRyHt8hf5GhgBAD6TEhspp5WCNCHmqhjU9GR/CU
	zPEVaeKdLsBKsJhSWT6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPI7p-002Abx-2z;
	Fri, 28 Jul 2023 07:43:01 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPI7m-002AZk-1N
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 07:43:00 +0000
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RC02W3h6cz1GDFp;
	Fri, 28 Jul 2023 15:41:55 +0800 (CST)
Received: from [10.67.108.26] (10.67.108.26) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 28 Jul
 2023 15:42:50 +0800
Message-ID: <7ae37f46-2a4a-afe8-846c-df95a0d12be8@huawei.com>
Date: Fri, 28 Jul 2023 15:42:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH -next] spi: microchip-core: Clean up redundant
 dev_err_probe()
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<broonie@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-spi@vger.kernel.org>
References: <20230727130049.2810959-1-chenjiahao16@huawei.com>
 <20230727-curvature-register-6eb0a2c60a8b@spud>
From: "chenjiahao (C)" <chenjiahao16@huawei.com>
In-Reply-To: <20230727-curvature-register-6eb0a2c60a8b@spud>
X-Originating-IP: [10.67.108.26]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_004258_657331_877E32B8 
X-CRM114-Status: GOOD (  10.70  )
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


On 2023/7/27 21:34, Conor Dooley wrote:
> On Thu, Jul 27, 2023 at 09:00:49PM +0800, Chen Jiahao wrote:
>> Refering to platform_get_irq()'s definition, the return value has
>> already been checked if ret < 0, and printed via dev_err_probe().
>> Calling dev_err_probe() one more time outside platform_get_irq()
>> is obviously redundant.
>>
>> Furthermore, platform_get_irq() will never return irq equals 0,
>> removing spi->irq == 0 checking to clean it up.
>>
>> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
>> ---
>>   drivers/spi/spi-microchip-core.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
>> index b59e8a0c5b97..ac3b7b163db4 100644
>> --- a/drivers/spi/spi-microchip-core.c
>> +++ b/drivers/spi/spi-microchip-core.c
>> @@ -530,10 +530,8 @@ static int mchp_corespi_probe(struct platform_device *pdev)
>>   		return PTR_ERR(spi->regs);
>>   
>>   	spi->irq = platform_get_irq(pdev, 0);
>> -	if (spi->irq <= 0)
>> -		return dev_err_probe(&pdev->dev, -ENXIO,
>> -				     "invalid IRQ %d for SPI controller\n",
>> -				     spi->irq);
>> +	if (spi->irq < 0)
>> +		return -ENXIO;
> platform_get_irq() returns an ERRNO that can now be propagated since
> the special case for 0 no longer requires handling, no?

Sure, you are right. Here we should directly return the ERRNO passed
from platform_get_irq(), since platform_get_irq() has performed all
error checking inside.

Thanks for reminding.

Jiahao

>
>>   
>>   	ret = devm_request_irq(&pdev->dev, spi->irq, mchp_corespi_interrupt,
>>   			       IRQF_SHARED, dev_name(&pdev->dev), master);
>> -- 
>> 2.34.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

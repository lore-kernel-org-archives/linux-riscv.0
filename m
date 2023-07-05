Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B053EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 07:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzwbaq2/AjVjRCeJbYQIC7xR16m4FkLLcH+Z/gtG4s8=; b=z7nOYUNJvH4wCE
	sUBO/lP4TS3PL6Jq1qq1Lz/A2RgzV1lcfsmg4CTY1jKlCfvz0xWHL3XfSMep8jzDLtj6cFLowf928
	OIeHVED99JQQxGq09as3b02z6Jy/o41JtSnLBFOCVHnxcg0gYDSqbR/fiKJg1AzWXrPTJXdZup6Um
	OLS090cYOGFm79lP93T6+7J2wmTNLNKXfMKazQiK8fvJ0G3dmTlYzEyWwBKbfI2fKlXk2YRb/aAil
	ypJdqrvJHXgJsUttkj5dAmOP+fDxNtXKm2Hn44JDCKsZcwnfpwEu6K13hUTNw1S0mANBKKZejurQR
	cyExlQuHyW4sylLnm8mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwZz-00EzY4-1V;
	Wed, 05 Jul 2023 07:05:35 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwZv-00EzW9-1n
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 07:05:33 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 0E8CA7FFD;
	Wed,  5 Jul 2023 15:04:57 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 5 Jul
 2023 15:04:57 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 5 Jul
 2023 15:04:56 +0800
Message-ID: <90b55926-1d0c-b9c0-3020-5837e2028809@starfivetech.com>
Date: Wed, 5 Jul 2023 15:04:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/3] spi: cadence-quadspi: Add clock configuration for
 StarFive JH7110 QSPI
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Ziv Xu
	<ziv.xu@starfivetech.com>
References: <20230704090453.83980-1-william.qiu@starfivetech.com>
 <20230704090453.83980-3-william.qiu@starfivetech.com>
 <808dac44-a72c-4675-1e4a-0ed96190efb4@linaro.org>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <808dac44-a72c-4675-1e4a-0ed96190efb4@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_000531_791011_A7FDEB84 
X-CRM114-Status: GOOD (  11.18  )
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



On 2023/7/5 14:21, Krzysztof Kozlowski wrote:
> On 04/07/2023 11:04, William Qiu wrote:
>> Add QSPI clock operation in device probe.
>> 
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202306022017.UbwjjWRN-lkp@intel.com/
>> Reported-by: Julia Lawall <julia.lawall@inria.fr>
>> Closes: https://lore.kernel.org/r/202306040644.6ZHs55x4-lkp@intel.com/
> 
> 
>>  
>> @@ -1840,6 +1858,8 @@ static int cqspi_resume(struct device *dev)
>>  	struct spi_master *master = dev_get_drvdata(dev);
>>  
>>  	clk_prepare_enable(cqspi->clk);
>> +	if (of_device_is_compatible(dev->of_node, "starfive,jh7110-qspi"))
> 
> Don't add compatible checks inside the code. It does not scale. We
> expect compatibles to be listed only in one place - of_device_id - and
> customize driver with match data / quirks / flags.
> 
> Comment applies to all your diff hunks.
> 
I'll use "of_device_get_match_data" to replace it. But the way I added
reset before is also by compatible checks. Should I change this place to 
"of_device_get_match_data" as well?
>> +		clk_bulk_prepare_enable(cqspi->num_clks, cqspi->clks);
>>  	cqspi_wait_idle(cqspi);
>>  	cqspi_controller_init(cqspi);
>>  
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

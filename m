Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A898CC77B75
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 01:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xFTt1bBrVgxZ/jZZ9YKFWTLirs+zz963Ep0wa+wPieQ=; b=JW2AQi5AI/wyG7
	FK9EmNzz2lbNpj+qI7qaF/aP6rhOtoAo7NJ1NPcHYZQ0iEsGkyx8FpHo90wHGDqyPcEI+Rhghu9cS
	RRyKIQtIxdCYFQ59yhDNagywOA+wpwuveynDkeX0UEokAqCldY1H3qa8mgbrf3zQHO7ZZGTCqaTZD
	/jrJu07I3dfCiO2pA0kk0DoyAY7JvpoMHDKUEHqEt4nYjQWO4/owHRaqjqxACIXdDLwwT4BVKAZUu
	pU6tA1WHm7Pod4g5ePLWSzRh6r2PO4Y4U00rBkt9xuFSgtu2neWHvjoCmRm21MmsTNoLRebH8TFfR
	asRSnneHWP2c5FEEYlYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzSOl-00BacY-0n;
	Thu, 18 May 2023 01:25:43 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzSOg-00BaXI-1m
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 01:25:41 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D8C0F806C;
	Thu, 18 May 2023 09:24:42 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 18 May
 2023 09:24:42 +0800
Received: from [192.168.125.131] (113.72.146.100) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 18 May
 2023 09:24:42 +0800
Message-ID: <901dd93d-bd79-a62f-1ada-0328a5f04737@starfivetech.com>
Date: Thu, 18 May 2023 09:22:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 08/10] reset: starfive: jh7110: Add StarFive
 STG/ISP/VOUT resets support
Content-Language: en-US
To: Andreas Schwab <schwab@suse.de>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230424135409.6648-1-xingyu.wu@starfivetech.com>
 <20230424135409.6648-9-xingyu.wu@starfivetech.com> <mvmsfbvgkom.fsf@suse.de>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <mvmsfbvgkom.fsf@suse.de>
X-Originating-IP: [113.72.146.100]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_182538_879327_4D5C3468 
X-CRM114-Status: UNSURE (   7.89  )
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

On 2023/5/17 21:19, Andreas Schwab wrote:
> On Apr 24 2023, Xingyu Wu wrote:
> 
>> @@ -58,6 +76,18 @@ static const struct auxiliary_device_id jh7110_reset_ids[] = {
>>  		.name = "clk_starfive_jh7110_sys.rst-aon",
>>  		.driver_data = (kernel_ulong_t)&jh7110_aon_info,
>>  	},
>> +	{
>> +		.name = "clk_starfive_jh7110_sys.rst-stg",
>> +		.driver_data = (kernel_ulong_t)&jh7110_stg_info,
>> +	},
>> +	{
>> +		.name = "clk_starfive_jh7110_sys.rst-isp",
>> +		.driver_data = (kernel_ulong_t)&jh7110_isp_info,
>> +	},
>> +	{
>> +		.name = "clk_starfive_jh7110_sys.rst-vout",
> 
> "clk_starfive_jh7110_sys.rst-vout" is exactly AUXILIARY_NAME_SIZE long,
> thus lacks a null termination.
> 

Yeah, it should be modified to "clk_starfive_jh7110_sys.rst-vo" in this and
use "rst-vo" instead of "rst-vout" in the probe of vout clock driver.
Then it will work.

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

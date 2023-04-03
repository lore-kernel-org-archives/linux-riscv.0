Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5A0C76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 12:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+UjnnT5FTn1PSDvE4HFnPwtav8rQJlBV4c2TpibyAI=; b=NdsP6c8V9yWjIA
	1lqZyDd1kPmTZpiqiy6lYY/h22HnmpeeZamJE/gPhUSRJqnyiVRoP2QSbiL/2yPJD40lSdyQ5abEm
	a5TwVgTY5b/YKKrkGkYvW4pSYwC9lg3XfeIeayYNQcQqiorYYpxhzQnZ0pbGMHkmtClpBM6OTLIBk
	u92pUzZc71NPgdISWkHjgq+G3xiYDibz+Je1FjPwjuBvVWKlWj4YRyeteWE4LjcyidWT1mjwoBtpp
	vZaL6QodeVXHSt5DdIdHgDlyEpyUW2Q6x9OhzEleXKmL/opxp/Au7eUBkrqjqK7hZAlUNhcpTp9UG
	ii0cTFQXefEN8j1HVv5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjIyz-00FEBL-0n;
	Mon, 03 Apr 2023 12:08:21 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjIyu-00FE55-1x
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 12:08:19 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 1625724E38D;
	Mon,  3 Apr 2023 20:07:22 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 20:07:22 +0800
Received: from [192.168.125.145] (183.27.97.179) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 20:07:21 +0800
Message-ID: <8128d57b-17cd-8307-ed8c-2611a5658e18@starfivetech.com>
Date: Mon, 3 Apr 2023 20:07:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v6 2/4] dmaengine: dw-axi-dmac: Add support for StarFive
 JH7110 DMA
To: Vinod Koul <vkoul@kernel.org>
CC: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230322094820.24738-1-walker.chen@starfivetech.com>
 <20230322094820.24738-3-walker.chen@starfivetech.com>
 <ZCbMRdSCf5vKUk/c@matsya>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <ZCbMRdSCf5vKUk/c@matsya>
X-Originating-IP: [183.27.97.179]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_050816_993502_EDB35F22 
X-CRM114-Status: GOOD (  15.04  )
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



On 2023/3/31 20:04, Vinod Koul wrote:
> On 22-03-23, 17:48, Walker Chen wrote:
>> Add DMA reset operation in device probe and use different configuration
>> on CH_CFG registers according to match data. Update all uses of
>> of_device_is_compatible with of_device_get_match_data.
>> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 38 ++++++++++++++++---
>>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
>>  2 files changed, 34 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
>> index 4169e1d7d5ca..6cfcb541d8c3 100644
>> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
>> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
>> @@ -21,10 +21,12 @@
>>  #include <linux/kernel.h>
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>> +#include <linux/of_device.h>
>>  #include <linux/of_dma.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_runtime.h>
>>  #include <linux/property.h>
>> +#include <linux/reset.h>
>>  #include <linux/slab.h>
>>  #include <linux/types.h>
>>  
>> @@ -46,6 +48,10 @@
>>  	DMA_SLAVE_BUSWIDTH_32_BYTES	| \
>>  	DMA_SLAVE_BUSWIDTH_64_BYTES)
>>  
>> +#define AXI_DMA_FLAG_HAS_APB_REGS	BIT(0)
>> +#define AXI_DMA_FLAG_HAS_RESETS		BIT(1)
>> +#define AXI_DMA_FLAG_USE_CFG2		BIT(2)
>> +
>>  static inline void
>>  axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
>>  {
>> @@ -86,7 +92,8 @@ static inline void axi_chan_config_write(struct axi_dma_chan *chan,
>>  
>>  	cfg_lo = (config->dst_multblk_type << CH_CFG_L_DST_MULTBLK_TYPE_POS |
>>  		  config->src_multblk_type << CH_CFG_L_SRC_MULTBLK_TYPE_POS);
>> -	if (chan->chip->dw->hdata->reg_map_8_channels) {
>> +	if (chan->chip->dw->hdata->reg_map_8_channels &&
>> +	    !chan->chip->dw->hdata->use_cfg2) {
> 
> I think this will break existing users.. 
> 
> This is set for reg_map_8_channels && use_cfg2, latter being set only
> for new controller, so what about existing users of these bits?

Firstly thank you for your comments!
There is a statement 'use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);' to be added in dw_probe function.
Assuming older/existing platform run this code block, e.g. when compatible is "snps,axi-dma-1.01a", 
the value of variable 'use_cfg2' is still false, the original logic will not be broken. So other existing
users are not affected by this.
Looking forward to your more comments. Thanks!

Best regards,
Walker


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

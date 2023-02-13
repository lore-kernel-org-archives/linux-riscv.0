Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742E7C636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 13:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLvydJUw4re0DuBosYOdDOTSfniV8bnKRRr3QSabvOk=; b=X3TV09buUuYNue
	AVsp8zvqXb1WKesAy1EFCHdZ3EcHvuEzmPSyFm5097ZJdG755KmM634KBCYCm45WaK7IiBdt/W3ph
	9xtOaZ4yW9ft8ZU52HhRNyaf4FZYX9FRfkMKnyHdstV/zP2j+3cqH92vV2MWyYT+37bDyJP5MSsj9
	ZqoxOrKNWdwvb2l9HolCC+4HBICptw1X0rERa/FSVe5ynTHpcthrDcQIqnBh72mK6gwIV6L/nPfx/
	zE6rvwrURD/VrjMqHvl5dPobVr7Y4YKtRdLyCRP72AUOzwvUZizLDuwwnR+Kgsl83HgS75gWkyEit
	KbcCJmNciu/cWO7c0i5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRYaC-00El0I-NV; Mon, 13 Feb 2023 13:09:25 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRYa6-00Ekwa-6V
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 13:09:22 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id BCBCB24E154;
	Mon, 13 Feb 2023 21:08:47 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Feb
 2023 21:08:47 +0800
Received: from [192.168.125.74] (183.27.97.168) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Feb
 2023 21:08:46 +0800
Message-ID: <7152f39a-5220-63a0-3e13-ef165b0ab0c1@starfivetech.com>
Date: Mon, 13 Feb 2023 21:08:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 2/3] dma: dw-axi-dmac: Add support for StarFive DMA
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>,
	<linux-kernel@vger.kernel.org>
References: <20230206113811.23133-1-walker.chen@starfivetech.com>
 <20230206113811.23133-3-walker.chen@starfivetech.com>
 <Y+YHa7jVpTs9Qg73@matsya>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <Y+YHa7jVpTs9Qg73@matsya>
X-Originating-IP: [183.27.97.168]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_050918_561202_DD7254E5 
X-CRM114-Status: GOOD (  12.85  )
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

On 2023/2/10 16:59, Vinod Koul wrote:
> On 06-02-23, 19:38, Walker Chen wrote:
>> Adding DMA reset operation in device probe, and using different
>> registers according to the hardware handshake number.
> 
> subsystem tag is dmaengine: xxx

OK, the tag will be changed to dmaengine.

> 
>> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 25 ++++++++++++++++---
>>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  3 +++
>>  2 files changed, 24 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
>> index a183d93bd7e2..3581810033d2 100644
>> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
>> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
>> @@ -25,6 +25,7 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_runtime.h>
>>  #include <linux/property.h>
>> +#include <linux/reset.h>
>>  #include <linux/slab.h>
>>  #include <linux/types.h>
>>  
>> @@ -86,7 +87,8 @@ static inline void axi_chan_config_write(struct axi_dma_chan *chan,
>>  
>>  	cfg_lo = (config->dst_multblk_type << CH_CFG_L_DST_MULTBLK_TYPE_POS |
>>  		  config->src_multblk_type << CH_CFG_L_SRC_MULTBLK_TYPE_POS);
>> -	if (chan->chip->dw->hdata->reg_map_8_channels) {
>> +	if (chan->chip->dw->hdata->reg_map_8_channels &&
>> +	    !chan->chip->dw->hdata->use_cfg2) {
> 
> what about older/other platforms that dont have use_cfg2?

The use_cfg2 variable's default value is false, the original logic will not be affected.
Rob herring gave a suggestion that it is assigned according to compatible string, like that:
if (of_device_is_compatible(node, "starfive,jh7110-axi-dma")) {
	...
	chip->dw->hdata->use_cfg2 = true;
}

> 
>>  		cfg_hi = config->tt_fc << CH_CFG_H_TT_FC_POS |
>>  			 config->hs_sel_src << CH_CFG_H_HS_SEL_SRC_POS |
>>  			 config->hs_sel_dst << CH_CFG_H_HS_SEL_DST_POS |
>> @@ -541,8 +543,6 @@ static void dw_axi_dma_set_hw_channel(struct axi_dma_chan *chan, bool set)
>>  			(chan->id * DMA_APB_HS_SEL_BIT_SIZE));
>>  	reg_value |= (val << (chan->id * DMA_APB_HS_SEL_BIT_SIZE));
>>  	lo_hi_writeq(reg_value, chip->apb_regs + DMAC_APB_HW_HS_SEL_0);
>> -
>> -	return;
>>  }
>>  

Thanks

Best regards,
Walker


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

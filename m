Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6196C64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 09:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CL9Abb19nGnmx2nPOOwHlSKw3h5P4yJPZGk4Miy43Uc=; b=wFL1BQ7QEig6Zb
	Jey4Y6bvRYuF6jRs4XQuA3YDVHqKvjtS0tg9EX0ubqsSjzGXDSFzXQPl2AJBwayu1hIpvIWwBqu8M
	UN+PswMWX6mzo3IcZbBwDURVHYSftRVuKFwLq9RIgWSGi1Om8LfBykKbEZ0FcKLzn0d8MMB3dXqPz
	KzjA1rkR5PoZq3PxpYPia9LWH6YcxYPkS1FIVK1wvnLUMj8HrFND8iZsXjLDOb6v0qpyYYvS8YDGl
	XXCfGj6fdj7NUjSkavdHxS4sulOojNnPCwebddgp6LQQI34ym0V+fMgshAcOWl7KvAylOaKhEgy/J
	QXmt8sz99l0k6HJhvErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZnZ-0091tS-Qh; Mon, 27 Feb 2023 09:27:58 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZnT-0091rG-9M
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 09:27:55 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 4440B24E320;
	Mon, 27 Feb 2023 17:27:19 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Feb
 2023 17:27:19 +0800
Received: from [192.168.125.93] (113.72.145.171) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Feb
 2023 17:27:18 +0800
Message-ID: <68f322ce-437a-1bd6-cf49-e6d485d4edfd@starfivetech.com>
Date: Mon, 27 Feb 2023 17:27:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 2/3] dmaengine: dw-axi-dmac: Add support for StarFive
 JH7110 DMA
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230221140424.719-1-walker.chen@starfivetech.com>
 <20230221140424.719-3-walker.chen@starfivetech.com>
 <CAJM55Z_buj_CBKtJw=n_K-Ma4ZGP9pmy_uM20nLpJhTMNh=bJQ@mail.gmail.com>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <CAJM55Z_buj_CBKtJw=n_K-Ma4ZGP9pmy_uM20nLpJhTMNh=bJQ@mail.gmail.com>
X-Originating-IP: [113.72.145.171]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_012751_661284_062F8912 
X-CRM114-Status: GOOD (  20.97  )
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



On 2023/2/26 22:25, Emil Renner Berthing wrote:
> On Tue, 21 Feb 2023 at 15:04, Walker Chen <walker.chen@starfivetech.com> wrote:
>>
>> Add DMA reset operation in device probe and use different configuration
>> on CH_CFG registers according to compatible string.
>>
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 19 +++++++++++++++++--
>>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  3 +++
>>  2 files changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
>> index bf85aa0979ec..858c4337650f 100644
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
>>         cfg_lo = (config->dst_multblk_type << CH_CFG_L_DST_MULTBLK_TYPE_POS |
>>                   config->src_multblk_type << CH_CFG_L_SRC_MULTBLK_TYPE_POS);
>> -       if (chan->chip->dw->hdata->reg_map_8_channels) {
>> +       if (chan->chip->dw->hdata->reg_map_8_channels &&
>> +           !chan->chip->dw->hdata->use_cfg2) {
>>                 cfg_hi = config->tt_fc << CH_CFG_H_TT_FC_POS |
>>                          config->hs_sel_src << CH_CFG_H_HS_SEL_SRC_POS |
>>                          config->hs_sel_dst << CH_CFG_H_HS_SEL_DST_POS |
>> @@ -1142,7 +1144,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
>>         axi_chan_disable(chan);
>>
>>         ret = readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, val,
>> -                                       !(val & chan_active), 1000, 10000);
>> +                                       !(val & chan_active), 1000, DMAC_TIMEOUT_US);
>>         if (ret == -ETIMEDOUT)
>>                 dev_warn(dchan2dev(dchan),
>>                          "%s failed to stop\n", axi_chan_name(chan));
>> @@ -1416,6 +1418,18 @@ static int dw_probe(struct platform_device *pdev)
>>         if (IS_ERR(chip->cfgr_clk))
>>                 return PTR_ERR(chip->cfgr_clk);
>>
>> +       if (of_device_is_compatible(node, "starfive,jh7110-axi-dma")) {
>> +               chip->resets = devm_reset_control_array_get_exclusive(&pdev->dev);
>> +               if (IS_ERR(chip->resets))
>> +                       return PTR_ERR(chip->resets);
>> +
>> +               ret = reset_control_deassert(chip->resets);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               chip->dw->hdata->use_cfg2 = true;
>> +       }
>> +
> 
> In the future it would be great to use match data rather than all the
> calls to of_device_is_compatible.

Thanks, about this point, I will follow your advice.

> 
>>         ret = parse_device_properties(chip);
>>         if (ret)
>>                 return ret;
>> @@ -1560,6 +1574,7 @@ static const struct dev_pm_ops dw_axi_dma_pm_ops = {
>>  static const struct of_device_id dw_dma_of_id_table[] = {
>>         { .compatible = "snps,axi-dma-1.01a" },
>>         { .compatible = "intel,kmb-axi-dma" },
>> +       { .compatible = "starfive,jh7110-axi-dma" },
>>         {}
>>  };
>>  MODULE_DEVICE_TABLE(of, dw_dma_of_id_table);
>> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
>> index e9d5eb0fd594..761d95691c02 100644
>> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
>> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
>> @@ -21,6 +21,7 @@
>>  #define DMAC_MAX_CHANNELS      16
>>  #define DMAC_MAX_MASTERS       2
>>  #define DMAC_MAX_BLK_SIZE      0x200000
>> +#define DMAC_TIMEOUT_US                200000
>>
>>  struct dw_axi_dma_hcfg {
>>         u32     nr_channels;
>> @@ -33,6 +34,7 @@ struct dw_axi_dma_hcfg {
>>         /* Register map for DMAX_NUM_CHANNELS <= 8 */
>>         bool    reg_map_8_channels;
>>         bool    restrict_axi_burst_len;
>> +       bool    use_cfg2;
>>  };
>>
>>  struct axi_dma_chan {
>> @@ -70,6 +72,7 @@ struct axi_dma_chip {
>>         struct clk              *core_clk;
>>         struct clk              *cfgr_clk;
>>         struct dw_axi_dma       *dw;
>> +       struct reset_control    *resets;
> 
> This added field only seems to be written, but not read from anywhere.

Reset initialization will be encapsulated in match data.

> With that fixed:
> 
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Thanks for your review and comment very much!

Best regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CEAC6379F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 11:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzeZGJYh0lanO2Kgmc//1wGLDJRDNpiLfKJ9iohbngs=; b=KBzIFYpUeQ1+kf
	bXd3g781/WW+kotYc65zdUoV0fYb0TfgJIW6AdFP1HA1SGjR8ZL8GoQCAIS9n4qYiKVSaXieR2kLd
	K9TgwWmjSCpweCUbE3lCKnOqPf7NdbkTUC9hXm1jj3o6jzpgBCXri8ubregSCv1d4JXGg05pD63TT
	9iE8ezE8X4wbRtut0sDxY5KwqyzCu1kFMFVLS/t4oJyFac67n0UNsBb+CTmh+dbKtd1zrwSj+N/N9
	1S8x8MQblD1OlyLaxYgXRdu19nLfcYI0DfY7WT9/wuiEmJVCCL5Sg12fwPV1bmtaLSkpUaVDIlOz2
	7v6wlNGHlCh3Ng5KCuXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXU9-00FY6e-JN; Thu, 02 Feb 2023 11:10:33 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXU2-00FXyI-KI
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 11:10:31 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id C7E7124E255;
	Thu,  2 Feb 2023 19:09:54 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 2 Feb
 2023 19:09:54 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 2 Feb
 2023 19:09:53 +0800
Message-ID: <4529a646-1faf-c858-cfbe-1560ebeb1fba@starfivetech.com>
Date: Thu, 2 Feb 2023 19:09:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 2/3] mmc: starfive: Add sdio/emmc driver support
To: Linus Walleij <linus.walleij@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung
	<jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	<linux-kernel@vger.kernel.org>
References: <20221207131731.1291517-1-william.qiu@starfivetech.com>
 <20221207131731.1291517-3-william.qiu@starfivetech.com>
 <CACRpkdYP7MokLdRtxX9w7p80c=wHDHsoTYWrU53CnpsZ7o6aGg@mail.gmail.com>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <CACRpkdYP7MokLdRtxX9w7p80c=wHDHsoTYWrU53CnpsZ7o6aGg@mail.gmail.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_031027_056226_83C52CF8 
X-CRM114-Status: GOOD (  29.91  )
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



On 2022/12/9 5:09, Linus Walleij wrote:
> Hi William,
> 
> thanks for your patch!
> 
> On Wed, Dec 7, 2022 at 2:17 PM William Qiu <william.qiu@starfivetech.com> wrote:
> 
>> Add sdio/emmc driver support for StarFive JH7110 soc.
>>
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> 
> (...)
>> +#include <linux/gpio.h>
> 
> Never include this legacy header in new code. Also: you don't use it.
> 
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/mmc/host.h>
>> +#include <linux/module.h>
>> +#include <linux/of_address.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
> 
> You're not using this include either.
> 
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
> 
> Or this.
> 
>> +#define ALL_INT_CLR            0x1ffff
>> +#define MAX_DELAY_CHAIN                32
>> +
>> +struct starfive_priv {
>> +       struct device *dev;
>> +       struct regmap *reg_syscon;
>> +       u32 syscon_offset;
>> +       u32 syscon_shift;
>> +       u32 syscon_mask;
>> +};
>> +
>> +static unsigned long dw_mci_starfive_caps[] = {
>> +       MMC_CAP_CMD23,
>> +       MMC_CAP_CMD23,
>> +       MMC_CAP_CMD23
>> +};
>> +
>> +static void dw_mci_starfive_set_ios(struct dw_mci *host, struct mmc_ios *ios)
>> +{
>> +       int ret;
>> +       unsigned int clock;
>> +
>> +       if (ios->timing == MMC_TIMING_MMC_DDR52 || ios->timing == MMC_TIMING_UHS_DDR50) {
>> +               clock = (ios->clock > 50000000 && ios->clock <= 52000000) ? 100000000 : ios->clock;
>> +               ret = clk_set_rate(host->ciu_clk, clock);
>> +               if (ret)
>> +                       dev_dbg(host->dev, "Use an external frequency divider %uHz\n", ios->clock);
>> +               host->bus_hz = clk_get_rate(host->ciu_clk);
>> +       } else {
>> +               dev_dbg(host->dev, "Using the internal divider\n");
>> +       }
>> +}
>> +
>> +static int dw_mci_starfive_execute_tuning(struct dw_mci_slot *slot,
>> +                                            u32 opcode)
>> +{
>> +       static const int grade  = MAX_DELAY_CHAIN;
>> +       struct dw_mci *host = slot->host;
>> +       struct starfive_priv *priv = host->priv;
>> +       int raise_point = -1, fall_point = -1;
>> +       int err, prev_err = -1;
> 
> I don't like these default-init to -1. Can you just skip it and assign it
> where it makes most sense instead?
> 
>> +       int found = 0;
> 
> This looks like a bool.
> 
>> +       int i;
>> +       u32 regval;
>> +
>> +       for (i = 0; i < grade; i++) {
>> +               regval = i << priv->syscon_shift;
>> +               err = regmap_update_bits(priv->reg_syscon, priv->syscon_offset,
>> +                                               priv->syscon_mask, regval);
>> +               if (err)
>> +                       return err;
>> +               mci_writel(host, RINTSTS, ALL_INT_CLR);
>> +
>> +               err = mmc_send_tuning(slot->mmc, opcode, NULL);
>> +               if (!err)
>> +                       found = 1;
>> +
>> +               if (i > 0) {
>> +                       if (err && !prev_err)
>> +                               fall_point = i - 1;
>> +                       if (!err && prev_err)
>> +                               raise_point = i;
>> +               }
>> +
>> +               if (raise_point != -1 && fall_point != -1)
>> +                       goto tuning_out;
> 
> There are just these raise point (shouldn't this be "rise_point" in proper
> english?) and fall point, this misses some comments explaining what is
> going on, the code is not intuitively eviden. Rise and fall of *what* for
> example.
> 
>> +
>> +               prev_err = err;
>> +               err = 0;
>> +       }
>> +
>> +tuning_out:
>> +       if (found) {
>> +               if (raise_point == -1)
>> +                       raise_point = 0;
>> +               if (fall_point == -1)
>> +                       fall_point = grade - 1;
>> +               if (fall_point < raise_point) {
>> +                       if ((raise_point + fall_point) >
>> +                           (grade - 1))
>> +                               i = fall_point / 2;
>> +                       else
>> +                               i = (raise_point + grade - 1) / 2;
>> +               } else {
>> +                       i = (raise_point + fall_point) / 2;
>> +               }
> 
> Likewise here, explain what grade is, refer to the eMMC spec if necessary.
> 
> (...)
>> +       ret = of_parse_phandle_with_fixed_args(host->dev->of_node,
>> +                                               "starfive,sys-syscon", 3, 0, &args);
>> +       if (ret) {
>> +               dev_err(host->dev, "Failed to parse starfive,sys-syscon\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       priv->reg_syscon = syscon_node_to_regmap(args.np);
>> +       of_node_put(args.np);
>> +       if (IS_ERR(priv->reg_syscon))
>> +               return PTR_ERR(priv->reg_syscon);
>> +
>> +       priv->syscon_offset = args.args[0];
>> +       priv->syscon_shift  = args.args[1];
>> +       priv->syscon_mask   = args.args[2];
> 
> Why should these three things be in the device tree instead of being derived
> from the compatible-string or just plain hard-coded as #defines?
> I don't get it.
> 
Hi Linus,

I'm sorry to bother you, but as for the definition of syscon, after discussing with 
my colleagues, we think it is easier to distinguish SDIO0 and SDIO1 by defining it in
the device tree, and the code compatibility is better.

Best Regards
William Qiu
>> +static int dw_mci_starfive_probe(struct platform_device *pdev)
>> +{
>> +       return dw_mci_pltfm_register(pdev, &starfive_data);
>> +}
>> +
>> +static int dw_mci_starfive_remove(struct platform_device *pdev)
>> +{
>> +       return dw_mci_pltfm_remove(pdev);
>> +}
> 
> Can't you just assign dw_mci_pltfm_remove() to .remove?
> 
> Other than these things, the driver looks good!
> 
> Yours,
> Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

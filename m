Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE64C38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 06:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WsAYpLpu/wUxVKFVaCc6Via7wEv3uMYw2FIbeK5LI08=; b=azOMbJUc3q6f1u
	k9tRHsRPbNN1f7tuIcsrDdGxh/B0iOe4sgHCTL8uJ2xyCVuKx/Kp5Nsfvm7dCpN7/nH2Mzox+HNQx
	xCLRC4cGvnXPJ+8MCxMN1DK8VFPM02oIvCqzd3LvmkKjdHanujcelVd1Lk0sDRV3xMH6k0jGqh07Z
	oa+cfnIJIWdiS6MAu4/2HUKbjf8RpkuclDAyIAFesVW2SPnOUmKmKareLGH5JDnmFJDfZ8BwHTyjt
	OzJ7RoKPCO8PlHotE+7aVIng+h4iitmys1CmsqHKj3bL87NdT7sIfBAMd1/G2xXtzlj2wR98mFCli
	zpmnKpamVDDHA473LHtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMkZn-006Vns-EZ; Tue, 31 Jan 2023 06:57:07 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMkZk-006VkN-TN
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 06:57:06 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 78A7424E1EB;
	Tue, 31 Jan 2023 14:56:28 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 31 Jan
 2023 14:56:28 +0800
Received: from [192.168.125.128] (183.27.97.127) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 31 Jan
 2023 14:56:27 +0800
Message-ID: <93f9e7b9-90a7-0c9f-91c2-301a1431b12d@starfivetech.com>
Date: Tue, 31 Jan 2023 14:52:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 06/11] clk: starfive: Add StarFive JH7110
 Image-Signal-Process clock driver
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230120024445.244345-1-xingyu.wu@starfivetech.com>
 <20230120024445.244345-7-xingyu.wu@starfivetech.com>
 <26437c6f0bda4dd18e16fa1f58013911.sboyd@kernel.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <26437c6f0bda4dd18e16fa1f58013911.sboyd@kernel.org>
X-Originating-IP: [183.27.97.127]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_225705_263392_9FA2AF10 
X-CRM114-Status: UNSURE (   7.94  )
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

On 2023/1/31 8:38, Stephen Boyd wrote:
> Quoting Xingyu Wu (2023-01-19 18:44:40)
>> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-isp.c b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
>> new file mode 100644
>> index 000000000000..f9fc94b4c6f8
>> --- /dev/null
>> +++ b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
>> @@ -0,0 +1,218 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * StarFive JH7110 Image-Signal-Process Clock Driver
> [...]
>> +
>> +static int jh7110_isp_top_crg_enable(struct isp_top_crg *top)
>> +{
>> +       int ret;
>> +
>> +       ret = clk_bulk_prepare_enable(top->top_clks_num, top->top_clks);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return reset_control_deassert(top->top_rsts);
>> +}
> 
> This needs to be undone on driver remove.

Will add in next patch.

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

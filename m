Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20486C64EC4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 09:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=793KKz4mRbFtJQ1LZrFYU/N300V+0weaUJvFuXibT8g=; b=WKOhbaAU1/hLhx
	a0SdhHphFEbbSBemJjXtFUNV2CSG7gSqcDG+v/39Vjhx5IygBsKirs8P7DFhZSnLl2fQGTXlkaxow
	H2RZytMDwoK3GgT2fAblPekTPpjojCi/n6Oerdwl8p0ee2Ha78FXkVLF8ROrcyMzb5HwsemKrJYTk
	rQ8hx5EWULpr2niZ7e1xOLrI5r+/mBxxNnyYCUsgoxWklltJfzcUF6IS5phwtgH4+QoSxZWtNJ/n5
	Ar3UItnqrS5d6iz4ktr4x7nfpsZ1EMuvWf69p09CnWA9wBWeMtKGDJ+ke1Mpu1kfmzyih5mXslKH9
	sFHR8QW5u/ESitCTStAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCos-008sdz-Ub; Thu, 09 Mar 2023 09:44:18 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCon-008sVl-5f
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 09:44:17 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 20B8824E231;
	Thu,  9 Mar 2023 17:43:44 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 9 Mar
 2023 17:43:44 +0800
Received: from [192.168.125.124] (183.27.96.115) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 9 Mar
 2023 17:43:43 +0800
Message-ID: <49ab1072-98ba-f364-9b66-68658566e732@starfivetech.com>
Date: Thu, 9 Mar 2023 17:43:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v4 12/19] clk: starfive: Add StarFive JH7110 always-on
 clock driver
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-13-hal.feng@starfivetech.com>
 <CAJM55Z8H4qmy_BiD0SHW-w5ifzhzokdO-QxpUUz9aeUd+htrZg@mail.gmail.com>
 <8c30220a-abef-7518-cb44-abcea91408e2@starfivetech.com>
In-Reply-To: <8c30220a-abef-7518-cb44-abcea91408e2@starfivetech.com>
X-Originating-IP: [183.27.96.115]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_014413_568714_F3F6EBC4 
X-CRM114-Status: GOOD (  12.90  )
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

On Tue, 28 Feb 2023 10:42:35 +0800, Hal Feng wrote:
> On Sun, 26 Feb 2023 18:34:52 +0100, Emil Renner Berthing wrote:
>> On Tue, 21 Feb 2023 at 03:47, Hal Feng <hal.feng@starfivetech.com> wrote:
>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>>
>>> Add driver for the StarFive JH7110 always-on clock controller
>>> and register an auxiliary device for always-on reset controller
>>> which is named as "reset-aon".
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>> ---
>>>  drivers/clk/starfive/Kconfig                  |  11 ++
>>>  drivers/clk/starfive/Makefile                 |   1 +
>>>  .../clk/starfive/clk-starfive-jh7110-aon.c    | 156 ++++++++++++++++++
>>>  3 files changed, 168 insertions(+)
>>>  create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-aon.c
>>>
>>> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
>>> index 4640d0665d1c..2aa664f2cdee 100644
>>> --- a/drivers/clk/starfive/Kconfig
>>> +++ b/drivers/clk/starfive/Kconfig
>>> @@ -31,3 +31,14 @@ config CLK_STARFIVE_JH7110_SYS
>>>         help
>>>           Say yes here to support the system clock controller on the
>>>           StarFive JH7110 SoC.
>>> +
>>> +config CLK_STARFIVE_JH7110_AON
>>> +       tristate "StarFive JH7110 always-on clock support"
>>> +       depends on CLK_STARFIVE_JH7110_SYS
>>> +       select AUXILIARY_BUS
>>> +       select CLK_STARFIVE_JH71X0
>>> +       select RESET_STARFIVE_JH7110
>>> +       default CLK_STARFIVE_JH7110_SYS
>> 
>> As far as I can tell the JH7110 boots fine without this driver and it
>> already depends on the _SYS driver above, so please do
>> 
>> default m if SOC_STARFIVE
> 
> OK. Will fix it.

Hi, Emil,

The AON clock driver provides clocks for gmac0 which is used frequently.
So I think it would be more convenient if we set "default y" here.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

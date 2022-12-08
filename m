Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33687C4708E
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 01:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bihNAS8JRfV017DoESiKRxb9LP8P0OogHn2XXHzM52o=; b=r0yalYjcLv9jw7
	93uuh6BJCZ3jxN4rBDX0Vo0hSPsdcsuu+vLS15A+6LNJz6Fp/P7nktcsHbPc/SP2+d1A0iUZ8KEdU
	j8KdYsCWFDMiUQ9vkH+d0ZYlyVQt7pREomSsxS6lv2wvJcm+T2thupK6nzznqLcRhZ58qVrI+xBMe
	y81+uW4wJTqTfqqATdwan0GUFKKMbIzINqgfEFULZSuO1JtHTuChqDCObO4BI9H060pROz4OQCVPd
	A2+n9uk+mUMPRjfT114pMS3vfM5R9z4irWcXKId9O3Va8Rq6cP9CMnsYpH3pdIIZiRkxprk+CuCGr
	uMSYBbpGs62zV1gPwnQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p35vu-00HUjp-Ma; Thu, 08 Dec 2022 01:42:42 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p35vr-00HUhf-MC
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 01:42:41 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 6194224E25A;
	Thu,  8 Dec 2022 09:42:27 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Dec
 2022 09:42:27 +0800
Received: from [192.168.120.49] (171.223.208.138) by EXMBX173.cuchost.com
 (172.16.6.93) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Dec
 2022 09:42:25 +0800
Message-ID: <bead78fb-dcc1-58b6-77a0-1440f9584163@starfivetech.com>
Date: Thu, 8 Dec 2022 09:42:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 2/7] net: stmmac: platform: Add snps,dwmac-5.20 IP
 compatible string
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-3-yanhong.wang@starfivetech.com>
 <CAJM55Z8ZDKWEkdWuRZfcMQDrySMh4vdB1UvkAC+q1GRKMbGuEw@mail.gmail.com>
From: yanhong wang <yanhong.wang@starfivetech.com>
In-Reply-To: <CAJM55Z8ZDKWEkdWuRZfcMQDrySMh4vdB1UvkAC+q1GRKMbGuEw@mail.gmail.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_174239_891716_1E51C77E 
X-CRM114-Status: GOOD (  13.91  )
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



On 2022/12/7 21:58, Emil Renner Berthing wrote:
> On Thu, 1 Dec 2022 at 10:05, Yanhong Wang <yanhong.wang@starfivetech.com> wrote:
>>
>> Add "snps,dwmac-5.20" compatible string for 5.20 version that can avoid
>> to define some platform data in the glue layer.
>>
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> 
> Hi Yanhong.
> 
> Thanks for submitting this.
> But just as a reminder. Please don't change the author of the commits
> you cherry-picked from my tree.
> 

I will recover the author is you in the next version.

> /Emil
> 
>> ---
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> index 50f6b4a14be4..cc3b701af802 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> @@ -519,7 +519,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>>         if (of_device_is_compatible(np, "snps,dwmac-4.00") ||
>>             of_device_is_compatible(np, "snps,dwmac-4.10a") ||
>>             of_device_is_compatible(np, "snps,dwmac-4.20a") ||
>> -           of_device_is_compatible(np, "snps,dwmac-5.10a")) {
>> +           of_device_is_compatible(np, "snps,dwmac-5.10a") ||
>> +           of_device_is_compatible(np, "snps,dwmac-5.20")) {
>>                 plat->has_gmac4 = 1;
>>                 plat->has_gmac = 0;
>>                 plat->pmt = 1;
>> --
>> 2.17.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

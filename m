Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF56C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 01:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BgMhktKMOBCgsS5zBZTtDcW1TNEbe6nKPoYBai73rto=; b=uE8c5nknZL4xN5
	28oW0llNUbhMPGkKwylhFsfiFTAI7ikux/hjjqxdlQjCxRoGW7XxeSHHdtivxjjNonKBgqW2t0kRl
	btIUgb9fApEley/3auX/4kz4mW2YqLav6djKVdeu6I/21v1cbvu8dsB3eDo8R39/XTFXvkbMUTXJc
	XmYoOrVHHz2O1/pgfSU1hM8QGwkUldGCiLQGcI6pvPVAX3nay/6dk8KKLbyP3uoGchsYtFUhIFHH9
	ej/Aci0QBStjE73hHUgoc9QbRtgcoMnt4YGbpvcJ5l3zvyweC1mnZSY10ops1xJEcu4ePjaz3oTBw
	z4hpTKTAxn/tLTa/UaUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWpG5-00Bmcg-7J; Tue, 28 Feb 2023 01:58:25 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWpG1-00Bmam-Jv
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 01:58:23 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 4649624E36E;
	Tue, 28 Feb 2023 09:57:57 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Feb
 2023 09:57:57 +0800
Received: from [192.168.125.82] (113.72.145.171) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Feb
 2023 09:57:56 +0800
Message-ID: <db0036f5-e904-36b2-b3f5-3b0c520ca6aa@starfivetech.com>
Date: Tue, 28 Feb 2023 09:57:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 2/2] hwmon: (sfctemp) Add StarFive JH71x0 temperature
 sensor
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Jean Delvare
	<jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
References: <20230227134125.120638-1-hal.feng@starfivetech.com>
 <20230227134125.120638-3-hal.feng@starfivetech.com> <Y/y4LunvriV2RYwu@wendy>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <Y/y4LunvriV2RYwu@wendy>
X-Originating-IP: [113.72.145.171]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_175821_964028_9B3FC91F 
X-CRM114-Status: GOOD (  14.48  )
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

On Mon, 27 Feb 2023 14:03:26 +0000, Conor Dooley wrote:
> On Mon, Feb 27, 2023 at 09:41:25PM +0800, Hal Feng wrote:
>> From: Emil Renner Berthing <kernel@esmil.dk>
>> 
>> Add driver for the StarFive JH71x0 temperature sensor. You
>> can enable/disable it and read temperature in milli Celcius
>> through sysfs.
>> 
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Co-developed-by: Samin Guo <samin.guo@starfivetech.com>
>> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> 
>> +config SENSORS_SFCTEMP
>> +	tristate "Starfive JH71x0 temperature sensor"
>> +	depends on SOC_STARFIVE || COMPILE_TEST
> 
> We (or I?) am trying to homogenise RISC-V with the rest of the kernel by
> using ARCH_FOO rather than SOC_FOO. We've currently got a mix of both,
> due to companies that started out with RISC-V having SOC_ symbols &
> those with history in other archs having ARCH_ ones.
> The ARCH_ definitions landed in mainline this week, so if you end up
> resubmitting this driver, it'd save me a conversion if you were to use
> the ARCH_ variant.

Got it. I will use the ARCH_ symbol instead in the next version. Thanks.

Best regards,
Hal

> 
>> +	help
>> +	  If you say yes here you get support for temperature sensor
>> +	  on the Starfive JH71x0 SoCs.
>> +
>> +	  This driver can also be built as a module.  If so, the module
>> +	  will be called sfctemp.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

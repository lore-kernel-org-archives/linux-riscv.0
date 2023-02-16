Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3408C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 07:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9mMZACjLKsWkIo9mTG980IwhcBeUDwKxqtQO9AvOrLo=; b=pDKCdtCAXUE3Ms
	BI911GxvVctB9tBNOdX1LXgQp0SzgZhlmk3iDgtquc4dxnpdJvxNtDjRfHrouXcGenJTsj4XuqD9A
	FXozAnWrSLn/iy0+G2XXi2kd4ljK50zdMGpAJ2gSx9R/0C4dY/MxvbwSJi61hbK/rAaWGBMzQ5SYY
	pTO4gV1tcJPNegrzseHjWdgV4VJgN0C82xW3LF/nalaw5ERKHzxUIXrZcJ4ARkrKhuxWMF4f48JO4
	U8oTsFugsFOXClZTt9evBwIJ0mRjPBLKM+uEgvZ5R2ZbRF6sSxE3mVRH8H5Z7UAd6hrlEKjZLiN68
	sgxxaEjq+vvCuz/gZswQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSYQj-008lzs-Cx; Thu, 16 Feb 2023 07:11:45 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSYQf-008lxu-39
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 07:11:44 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 3AF6F24E35B;
	Thu, 16 Feb 2023 15:11:08 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Feb
 2023 15:11:08 +0800
Received: from [192.168.125.128] (183.27.97.168) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Feb
 2023 15:11:07 +0800
Message-ID: <1f18bfdc-7a04-4914-d970-7ef1d4f99653@starfivetech.com>
Date: Thu, 16 Feb 2023 15:11:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 2/3] drivers: watchdog: Add StarFive Watchdog driver
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
References: <20221219094233.179153-1-xingyu.wu@starfivetech.com>
 <20221219094233.179153-3-xingyu.wu@starfivetech.com>
 <20230201224619.GA3194283@roeck-us.net>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <20230201224619.GA3194283@roeck-us.net>
X-Originating-IP: [183.27.97.168]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_231141_327709_F069F6DC 
X-CRM114-Status: GOOD (  10.16  )
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

On 2023/2/2 6:46, Guenter Roeck wrote:
> On Mon, Dec 19, 2022 at 05:42:32PM +0800, Xingyu Wu wrote:
>> Add watchdog driver for the StarFive JH7110 SoC.
>> 
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> +
>>[...]
>> +
>> +static const struct watchdog_info starfive_wdt_ident = {
>> +	.options = OPTIONS,
>> +	.firmware_version = 0,
> 
> It is not necessary to initilize a static variable with 0.
> 
>> +	.identity = "StarFive Watchdog",
>> +};

Hi Guenter,

It would be a compilation error if drop the '0'. I found that other files
initialize this static variable as well.


Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

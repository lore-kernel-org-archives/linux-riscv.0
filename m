Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B65E7717F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 04:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFpHCLmyT7+dOA1xZQo/QB641Jqp7Cp3sOs1V0Oi0rg=; b=oqSZQg2kbNDadT
	urySdVciTe47P9S1Z+VEzE5t3iXHDDHizlf73W0QLi38qI4DT6GYyJ6pIxAwbgb1UABjtWumJ9wix
	FDuR5536W+qnzD5ZbLaonGutLHNbtTkhrT1IHyCIOOA0JRl9BkcMKdZ0So6/vFzhdc8mHqqyB4jSZ
	5dBocb9Z1oF4wyVnGRIgOPjnKgAOlTI/0v3JYymAYdhk6c69YyuOzkOcrYf/jsHpHIdAQbGZ8v6p0
	ZNijd4hdAXgelRYBU8x/1Y1fwmBTtxCk+gAkAuvR5lUJoBFo24VnrOUj1uLP3R1jxuXrTs1+F6Ote
	4MMwcKs8IwosRS6GK+Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKrYy-0000000AAF8-1Yo0;
	Tue, 10 Dec 2024 04:09:32 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKrYv-0000000AADy-463r
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 04:09:31 +0000
Received: from [IPV6:2605:59c8:31de:bf00:37c2:fe62:c21b:ab46] (unknown [IPv6:2605:59c8:31de:bf00:37c2:fe62:c21b:ab46])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id C9312B2C16CD;
	Tue, 10 Dec 2024 05:09:25 +0100 (CET)
Message-ID: <0f707918-49ce-4f04-b8d4-e74462caff5d@freeshell.de>
Date: Mon, 9 Dec 2024 20:09:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-pinfunc.h
To: Hal Feng <hal.feng@starfivetech.com>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jianlong Huang <jianlong.huang@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20241210014903.154551-1-e@freeshell.de>
 <ZQ2PR01MB1307099548C99CD6650BD57CE63DA@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <ZQ2PR01MB1307099548C99CD6650BD57CE63DA@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_200930_159768_68F51F27 
X-CRM114-Status: GOOD (  10.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 12/9/24 18:14, Hal Feng wrote:
>> On 10.12.24 09:49, E Shattow wrote:
>> [PATCH] riscv: dts: starfive: jh7110-pinfunc.h
> 
> Describe something in the commit title?
> 
>>
>> Fix a typo in StarFive JH7110 pin function definitions
>>
>> Fixes: e22f09e598d12 ("riscv: dts: starfive: Add StarFive JH7110 pin function
>> definitions")
>> Signed-off-by: E Shattow <e@freeshell.de>
> 
> Acked-by: Hal Feng <hal.feng@starfivetech.com>
> 
> Best regards,
> Hal
> 
>> ---
>>   arch/riscv/boot/dts/starfive/jh7110-pinfunc.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
>> b/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
>> index 256de17f5261..ae49c908e7fb 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
>> @@ -89,7 +89,7 @@
>>   #define GPOUT_SYS_SDIO1_DATA1			59
>>   #define GPOUT_SYS_SDIO1_DATA2			60
>>   #define GPOUT_SYS_SDIO1_DATA3			61
>> -#define GPOUT_SYS_SDIO1_DATA4			63
>> +#define GPOUT_SYS_SDIO1_DATA4			62
>>   #define GPOUT_SYS_SDIO1_DATA5			63
>>   #define GPOUT_SYS_SDIO1_DATA6			64
>>   #define GPOUT_SYS_SDIO1_DATA7			65
>>
>> base-commit: 708d55db3edbe2ccf88d94b5f2e2b404bc0ba37c
>> --
>> 2.45.2
> 

Ah... yes I forgot the commit title. Will re-send. Thanks! -E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

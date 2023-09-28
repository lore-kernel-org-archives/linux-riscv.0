Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480E1E732C7
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 12:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NB31HF3NbTaHtp2by0JbPFVNsNaS1EJsKHPqfXpA1Ts=; b=DxFTX59z4fggTo
	N4Jthuo0nSLx8IMyzSFn/lNj725sXl8Seh0pCEDohgVc2AwvSieTo1/EWKKmkz2pB5OuFbUEbjLlb
	9a72qXGsVAFD2JNS+AmIJkvD9Upn5DrkiYVOCUQ/lndM6iuH/W3tNNqr1MQyjBoxU/HW/KSzwsc01
	gfnhbR+PSmx1eXwDf2SjgUHsIyYpSTz8yHuhHw7ERKZgarC0xDLT0q3RESz2JkzjX44C5QowLLAjK
	0n33IjCGqX0SECnne8vwC/zDiKQKknYNAAcWl5hzeOMBite2IJqTwNAoX00QdsYiqYsIm/Kd7vKxg
	hLdxgZ4Gb+rxxl6Pp7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlqDC-003oLt-27;
	Thu, 28 Sep 2023 12:33:46 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlqD8-003oBO-0e
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 12:33:45 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id E73527FFD;
	Thu, 28 Sep 2023 20:33:06 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 28 Sep
 2023 20:33:06 +0800
Received: from [192.168.125.95] (113.72.144.128) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 28 Sep
 2023 20:33:05 +0800
Message-ID: <2c7913e1-79a0-87cc-4a2d-b8a5b6e94c09@starfivetech.com>
Date: Thu, 28 Sep 2023 20:33:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2] MAINTAINERS: Add Hal as one of the maintainers of
 SFCTEMP HWMON DRIVER
To: Guenter Roeck <linux@roeck-us.net>
CC: Conor Dooley <conor@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-hwmon@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230928075249.109459-1-hal.feng@starfivetech.com>
 <dc5e9253-5d82-4def-b6ff-038b29bf99ab@roeck-us.net>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <dc5e9253-5d82-4def-b6ff-038b29bf99ab@roeck-us.net>
X-Originating-IP: [113.72.144.128]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_053342_431513_4FF2B6A9 
X-CRM114-Status: GOOD (  11.99  )
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

On Thu, 28 Sep 2023 04:43:33 -0700, Guenter Roeck wrote:
> On Thu, Sep 28, 2023 at 03:52:49PM +0800, Hal Feng wrote:
>> As he is the submitter of this driver, add his mail so he can
>> maintain the driver and easily reply in the mailing list.
>> 
>> Acked-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>> 
>> History:
>> v1: https://lore.kernel.org/all/20230718034937.92999-4-hal.feng@starfivetech.com/
> 
> The change log should describe your changes, not just point to earlier
> versions of your patch. Please do not expect maintainers to fetch old
> versions of your patches and compare them manually.
> 
> Did anything change besides the Acked-by: ?

The commit title was reworded in v2.
There are no other changes besides this. Thanks.

Best regards,
Hal

> 
>> 
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index b19995690904..2376272bbe20 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19402,6 +19402,7 @@ F:	drivers/net/ethernet/sfc/
>>  
>>  SFCTEMP HWMON DRIVER
>>  M:	Emil Renner Berthing <kernel@esmil.dk>
>> +M:	Hal Feng <hal.feng@starfivetech.com>
>>  L:	linux-hwmon@vger.kernel.org
>>  S:	Maintained
>>  F:	Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
>> 
>> base-commit: 6465e260f48790807eef06b583b38ca9789b6072
>> -- 
>> 2.38.1
>> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

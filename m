Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C88BC001DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 03:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgvoaANC3HOjqqASsE8/y0o26o6NNb5vCcDmEJ6z56w=; b=y6nxE79dL1L1hv
	+hgjkmQTJwOc9XduHXOE0TohRGpB8W5Ob1rgJR2iqVYa0S/JRpdir/3omWZP79NuXVLe3YV4FjYsZ
	RiOZRulDD/pu7Y9gDdbUvW6+Ht5HyBTZJBZHpmlluMExsNONscgsmJxu8dRTOTdBflRQuxdzNxqmH
	BOnMGixGXSNv0PCtoU0kHCgR+WGIHr1Xw2dMTYr6fRGEWk50J7NrHfX0INSjBwGnUeszzA/GWw0Xk
	OL/x/fatbrdPJ7pq/aoHsrpg2vMJ6IYIfzjz6MsfknmEDme06uruNRcSMrvG9HfE6HOAl7KMqZU7G
	KElrfhTcYHAZCehgFvQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMglW-00Cj2Y-3A;
	Fri, 21 Jul 2023 03:25:14 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMglS-00CizH-2l
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 03:25:13 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 226E28071;
	Fri, 21 Jul 2023 11:24:16 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 11:24:16 +0800
Received: from [192.168.125.94] (113.72.147.86) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 11:24:15 +0800
Message-ID: <e63baeee-134c-db4f-f350-b3526a0ae571@starfivetech.com>
Date: Fri, 21 Jul 2023 11:24:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 3/3] MAINTAINERS: Add Hal as a maintainer of SFCTEMP
 HWMON DRIVER
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230718034937.92999-1-hal.feng@starfivetech.com>
 <20230718034937.92999-4-hal.feng@starfivetech.com>
 <20230718-progeny-edge-70b1a395f2aa@spud>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20230718-progeny-edge-70b1a395f2aa@spud>
X-Originating-IP: [113.72.147.86]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_202511_257462_709974F9 
X-CRM114-Status: GOOD (  10.63  )
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

On Tue, 18 Jul 2023 15:20:15 +0100, Conor Dooley wrote:
> On Tue, Jul 18, 2023 at 11:49:37AM +0800, Hal Feng wrote:
>> As he is the submitter of this driver, add his mail so he can
>> maintain the driver and easily reply in the mailing list.
>> 
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index aee340630eca..5056079ade77 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19256,6 +19256,7 @@ F:	drivers/net/ethernet/sfc/
>>  
>>  SFCTEMP HWMON DRIVER
>>  M:	Emil Renner Berthing <kernel@esmil.dk>
>> +M:	Hal Feng <hal.feng@starfivetech.com>
>>  L:	linux-hwmon@vger.kernel.org
>>  S:	Maintained
>>  F:	Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
> 
> Whatever about the other patches in this series, this one certainly
> needs an Ack from Emil.

Hi @Emil,

Would you mind adding me as one of the maintainers of this driver?
Within StarFive, I was appointed to maintain this driver.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

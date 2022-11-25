Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18333C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 02:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2jSiyvfBj0XhJBokB+RiajAXbygjhaf7KbdIasO/sg=; b=qD25sefwIyrLId
	zSC8Dx2j4R4mynK8ye2shhTotqiFCkkSHQacvWL4mqWiRVV63GklcGc454HCOfrO3zku3+wPKhMrd
	RYmhy+C3NJt0tIt/E3eUD01CSNGQtzkAarn4c9qc8Aup9QvKIkaGYKQdm9Rlz7VyvbjDrMHKgwiyi
	S3ObBGhW6k31hMi7G/INJTK3OB9zGdd8vaiWN9dqcsrQDpRx7LYGurjm2GutuKD7plBmxXX92LmeK
	wiKqeTyTLFYW5b7SsWKy4t/i67PB6WlPfeTevuuBOy16vLRZRwBxIU9lZVs+Qzowx+Q1ZzjHrtUyv
	sthN0FlOODrXbnPdoC9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyOeW-00CGNn-SG; Fri, 25 Nov 2022 02:41:20 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyOeU-00CGJj-5X
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 02:41:19 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A878924DBCB;
	Fri, 25 Nov 2022 10:40:52 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 25 Nov
 2022 10:40:52 +0800
Received: from [192.168.125.96] (183.27.97.81) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 25 Nov
 2022 10:40:51 +0800
Message-ID: <dfd4d062-f5f3-826d-b314-73302fc6c86c@starfivetech.com>
Date: Fri, 25 Nov 2022 10:40:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 3/4] soc: starfive: Add StarFive JH71XX pmu driver
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>
CC: <linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	<linux-kernel@vger.kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
 <20221118133216.17037-4-walker.chen@starfivetech.com> <Y3fe0LbZlOX1Dcw5@spud>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <Y3fe0LbZlOX1Dcw5@spud>
X-Originating-IP: [183.27.97.81]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_184118_508870_F39AD305 
X-CRM114-Status: GOOD (  19.79  )
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

On 2022/11/19 3:36, Conor Dooley wrote:
> Hey Walker,
> 
> On Fri, Nov 18, 2022 at 09:32:15PM +0800, Walker Chen wrote:
>> Add generic power domain driver for the StarFive JH71XX SoC.
>> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  MAINTAINERS                       |   8 +
> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index a70c1d0f303e..112f1e698723 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19623,6 +19623,14 @@ F:	Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
>>  F:	drivers/reset/starfive/
>>  F:	include/dt-bindings/reset/starfive*
>>  
>> +STARFIVE JH71XX PMU CONTROLLER DRIVER
>> +M:	Walker Chen <walker.chen@starfivetech.com>
>> +S:	Maintained
> 
> Should this be supported? (ditto the other series that you guys have
> sent out in the last few days)

Ok, will be changed to Supported.

> 
>> +F:	Documentation/devicetree/bindings/power/starfive*
>> +F:	drivers/soc/starfive/jh71xx_pmu.c
>> +F:	include/soc/starfive/pm_domains.h
>> +F:	include/dt-bindings/power/jh7110-power.h
> 
> I noticed that you have not CCed Arnd on these patches, which makes me
> wonder how do you intend getting these patches applied?
> Until now, Palmer has mostly merged RISC-V drivers/soc patches, but in
> the last few days I've taken over for drivers/soc/{sifive,microchip}.
> 
> Are you going to send PRs for this stuff to Arnd, or would you like me
> to apply patches for drivers/soc/startech? I happy to do that for you if
> you like.
> 
> If you're going to send pull requests, I am not sure if Arnd requires
> GPG signed tags for them. Arnd?
> 
> Otherwise, if you want me to take them, please add something like the
> following, in addition to the entry your series already adds for the
> specific driver:
> STARFIVE SOC DRIVERS
> M:	Conor Dooley <conor@kernel.org>
> S:	Maintained
> T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> F:	drivers/soc/starfive/
> F:	include/soc/starfive/

Thank you for taking the time to review and comment. I hope you apply these patches 
for drivers/soc/starfive. If you do that, I am very grateful to you!
The above description will be added to MAINTAINERS in the next version of patch.

Best Regards,
Walker Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

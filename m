Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A4AC74A5B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 01:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTsFXPh+7TU5+jHfVhbIXJIHvhAsLLjH5wqupARuoTQ=; b=TC8c3dLmHwGMgK
	gDBPfm7Oy3hj/K2LEdxGII4Re8yStRE22+L2KTTjOgrbfPW9HNXYmWvompxpSAoczHMXf/5FO7Njk
	WpQpcvWqD7e5Xnnau/Qm5z27BxE8MUpWgarJbQQH4osmGdOQ5zMfHp08Ixydds0rmUbLHHaRs8Nrh
	iCjVwEypqIuWmwUXWsoGS6kscQTFeSv603Ll/9zXY1wSG/Cqd3VnrpiD9DSZDW2++22Dd5nh0g0V4
	VzdmuPJLUfIllpdW7DHlmGaSL8BrNYZ9sR0BWaToNUz0beC8A/hvySV5ymDYcuFm6iXGHisKGO75/
	SSOs1HXpOBjSuJ5zgkJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgc3W-009Uvr-2L;
	Mon, 27 Mar 2023 01:53:54 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgc3T-009Usk-0Q
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 01:53:53 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id F3D4224E292;
	Mon, 27 Mar 2023 09:53:25 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Mar
 2023 09:53:26 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Mar
 2023 09:53:24 +0800
Message-ID: <b20de6ba-3087-2214-eea2-bdd111d9dcbc@starfivetech.com>
Date: Mon, 27 Mar 2023 09:53:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 4/6] dt-bindings: net: Add support StarFive dwmac
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Jose Abreu <joabreu@synopsys.com>, Richard Cochran
	<richardcochran@gmail.com>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
	<yanhong.wang@starfivetech.com>, Tommaso Merciai <tomm.merciai@gmail.com>
References: <20230324022819.2324-1-samin.guo@starfivetech.com>
 <20230324022819.2324-5-samin.guo@starfivetech.com>
 <20230324192419.758388e4@kernel.org>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <20230324192419.758388e4@kernel.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_185351_350422_268DA221 
X-CRM114-Status: UNSURE (   8.20  )
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


Re: [PATCH v8 4/6] dt-bindings: net: Add support StarFive dwmac
From: Jakub Kicinski <kuba@kernel.org>
to: Samin Guo <samin.guo@starfivetech.com>
data: 2023/3/25

> On Fri, 24 Mar 2023 10:28:17 +0800 Samin Guo wrote:
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ebc97c6c922f..5c6d53a9f62a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19905,6 +19905,12 @@ M:	Emil Renner Berthing <kernel@esmil.dk>
>>  S:	Maintained
>>  F:	arch/riscv/boot/dts/starfive/
>>  
>> +STARFIVE DWMAC GLUE LAYER
>> +M:	Emil Renner Berthing <kernel@esmil.dk>
>> +M:	Samin Guo <samin.guo@starfivetech.com>
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>> +
>>  STARFIVE JH7110 MMC/SD/SDIO DRIVER
>>  M:	William Qiu <william.qiu@starfivetech.com>
>>  S:	Supported
> 
> The context is wrong here, could you regen the series on top of
> net-next (and resend with [PATCH net-next v9] in the subject while
> at it)?



Hi Jakub,

Thanks,  I will resent with [PATCH net-next v9].
My series of patches will depend on Hal's minimal system[1] and william's syscon patch[2], and this context comes from their patch.

[1]: https://patchwork.kernel.org/project/linux-riscv/cover/20230320103750.60295-1-hal.feng@starfivetech.com
[2]: https://patchwork.kernel.org/project/linux-riscv/cover/20230315055813.94740-1-william.qiu@starfivetech.com

Do I need to remove their context?


Best regards,
Samin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

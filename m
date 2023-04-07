Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1539C76196
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 11:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fNWwb1/pljlal/OOBs29AYVXyByTgRj8Hf23RQKcaCU=; b=ToEPgMgPqW4997
	TUEUX3eHMCXRp/1LUO8bqfb09a9UlbFy1R3KI7y80Q7ZGBJcuhZXvblxzowMQhYvZFmbhX+OdsGor
	tsRmWc8ZAE95Eb8H66QZEKTC/CIm5TuCW8NVswGkelWOU+I5dTQCaUBCo26Rf9pHeA1yRQ52fRX0W
	YApe/PyuV6j9gXCvzE4AB65QZ3ltSRNWwR4/kDmaO4pSgHCfuVb6qZNEpmkhvs9qaquy7ZYboVM8f
	XRCFutKZcIpP7vE9gCj8/POWHSD1s089q4dXvNbw7PwnXhS0G8Jcg+l3SvcB+loQAeNCjQEIC2vIJ
	0narMDtLy7rqZAmaWxLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkk6H-00A4oo-3C;
	Fri, 07 Apr 2023 11:17:50 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkk6E-00A4nW-1I
	for linux-riscv@lists.infradead.org;
	Fri, 07 Apr 2023 11:17:48 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id F085124E36E;
	Fri,  7 Apr 2023 19:17:22 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 7 Apr
 2023 19:17:22 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 7 Apr
 2023 19:17:22 +0800
Message-ID: <f56fc309-0397-96ad-7df4-8bc3d9a914cb@starfivetech.com>
Date: Fri, 7 Apr 2023 19:17:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v7 1/2] dt-bindings: soc: starfive: Add StarFive syscon
 doc
To: Conor Dooley <conor.dooley@microchip.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
References: <20230406103308.1280860-1-william.qiu@starfivetech.com>
 <20230406103308.1280860-2-william.qiu@starfivetech.com>
 <833b68a5-263d-d293-4910-2ca50b43e60d@linaro.org>
 <2ce35d68-ae6c-129f-588e-9b292de3a654@starfivetech.com>
 <20230407-stand-reversion-1db211c03ff4@wendy>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <20230407-stand-reversion-1db211c03ff4@wendy>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_041746_622687_25A7258B 
X-CRM114-Status: GOOD (  15.93  )
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



On 2023/4/7 18:11, Conor Dooley wrote:
> On Fri, Apr 07, 2023 at 05:30:31PM +0800, William Qiu wrote:
>> 
>> This would be $ref: /schemas/clock/starfive,jh7110-pll.yaml#, but this file is not
>> available at present,  so I would like to ask if I should submit the documents
>> instead of Xingyu
> 
> Or just send the whole lot as one series, and I'll ack the soc bits for
> Stephen to take the whole lot via clk? I think Xingyu owes a respin
> anyway cos of the changes to this binding file that Krzysztof requested
> there.
> 
> Plus, the base clock support is now in clk-next, so their stuff is now
> applicable to the clk tree.
> 

So it is the best choice to give the whole series to Xingyu?

>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4c0b39c44957..0b2170e1e4ff 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19911,6 +19911,11 @@ S:	Supported
>>  F:	Documentation/devicetree/bindings/mmc/starfive*
>>  F:	drivers/mmc/host/dw_mmc-starfive.c
>>  
>> +STARFIVE JH7110 SYSCON
>> +M:	William Qiu <william.qiu@starfivetech.com>
>> +S:	Supported
>> +F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> 
> Can you squash this in please (whitespace damaged):
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90abe83c02f3..6fbb486f59ab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19943,6 +19943,7 @@ STARFIVE SOC DRIVERS
>  M:     Conor Dooley <conor@kernel.org>
>  S:     Maintained
>  T:     git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:     Documentation/devicetree/bindings/soc/starfive/
>  F:     drivers/soc/starfive/
> 

I would tell Xingyu to do so.

Best regards,
William
> Cheers,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

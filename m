Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9D2C3A5A7
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 08:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7wVW9HT0KZUwIrbph5f4VSE4a3qg+NrlNRzMJBqPP8=; b=XJIC524bGq2vyy
	ExkYhVpLVqTgz5a48aV+HXd5tGmi2Cj/BzUkqAC1HgTSpPCbFgFoFe7xYlwYuh3muNQc/ONrk3+RK
	k1SV22O3bL/PC/F0BS2de7L6iinF9yb32fK8zWlqHr5aGwsdHxiwD1jU58RF+Gu5YH0scBW9bmHpH
	F59rweNAcahEnGSXY5I468sAgk3NrFzxj8CUIuckisql1cWgzYLXOeZJhgVQn6zHPr2+cKHsdopx9
	FizIKv01w07QbjYAD7NODh7kolX6C0vzSGB6iZ9YrweT9dZsBkEklbRM13Q3jDvoYKiYDw+WkZMeE
	pdHRoXR8wwDQRLCf4r9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3CQM-00A60G-7R; Thu, 08 Dec 2022 08:38:34 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3CQI-00A5VQ-HN
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 08:38:32 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id ED42C24DEBC;
	Thu,  8 Dec 2022 16:38:06 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Dec
 2022 16:38:07 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Dec
 2022 16:38:05 +0800
Message-ID: <39916671-8ab1-4f39-1d9b-a66ebedfc772@starfivetech.com>
Date: Thu, 8 Dec 2022 16:38:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Add bindings for StarFive
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <linux-mmc@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, <linux-riscv@lists.infradead.org>, Jaehoon Chung
	<jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	<devicetree@vger.kernel.org>
References: <20221207131731.1291517-1-william.qiu@starfivetech.com>
 <20221207131731.1291517-2-william.qiu@starfivetech.com>
 <167042222472.2111911.2050446708831690640.robh@kernel.org>
 <Y5CnQlYTZJrJNjCf@spud>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <Y5CnQlYTZJrJNjCf@spud>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_003830_888897_487F185A 
X-CRM114-Status: GOOD (  21.08  )
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



On 2022/12/7 22:46, Conor Dooley wrote:
> On Wed, Dec 07, 2022 at 08:19:49AM -0600, Rob Herring wrote:
>> 
>> On Wed, 07 Dec 2022 21:17:29 +0800, William Qiu wrote:
>> > Add documentation to describe StarFive
>> > designware mobile storage host controller driver.
>> > 
>> > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> > ---
>> >  .../bindings/mmc/starfive,jh7110-sdio.yaml    | 71 +++++++++++++++++++
>> >  1 file changed, 71 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-sdio.yaml
>> > 
>> 
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>> 
>> yamllint warnings/errors:
>> 
>> dtschema/dtc warnings/errors:
>> Documentation/devicetree/bindings/mmc/starfive,jh7110-sdio.example.dts:21:18: fatal error: dt-bindings/clock/starfive-jh7110.h: No such file or directory
>>    21 |         #include <dt-bindings/clock/starfive-jh7110.h>
>>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Hello William,
> As with the other bindings that StarFive has sent out recently,
> including this header in the example creates a dependency on the
> clock/reset stuff being merged prior to the drivers for unrelated
> subsytems.
> To avoid that, you can drop the headers & definitions from these
> *examples* & use the numbers themselves instead.
> 
> That way, the only thing that depends on the clock binding headers is
> the DeviceTree patch & the driver can be merged once it is ready.
> 
> Thanks,
> Conor.
> 
Hi Conor,

Thank you for your suggestion. I will take it and fix it.

Best regards,
William Qiu

>> compilation terminated.
>> make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/mmc/starfive,jh7110-sdio.example.dtb] Error 1
>> make[1]: *** Waiting for unfinished jobs....
>> make: *** [Makefile:1492: dt_binding_check] Error 2
>> 
>> doc reference errors (make refcheckdocs):
>> 
>> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221207131731.1291517-2-william.qiu@starfivetech.com
>> 
>> The base for the series is generally the latest rc1. A different dependency
>> should be noted in *this* patch.
>> 
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>> 
>> pip3 install dtschema --upgrade
>> 
>> Please check and re-submit after running the above command yourself. Note
>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>> your schema. However, it must be unset to test all examples with your schema.
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

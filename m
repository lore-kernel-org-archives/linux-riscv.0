Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9637BEB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 07:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ZDOA70cL19dA4X0irc1uVzpoDouMmyXOrg5U1UVN2s=; b=cqbT4RFcMYCyty
	XsIQ52+DFABxBNJ5a2o+mHQYlWoKpuBft5gYW/k09sERT8/4gMp+psFnwMNgbEB13LYxMX6FOtFxh
	POeqR7BzwETAPmpdSbE78sfvASuGBvZ0ZnpHqCC4Ji01LNhRUVFiu3APOmkvZ7aYeRaX8NN7m0yxF
	CZY6LBF9yjMdqguierXMEr9bqpVlGw5p3DdaFiDIXx85bBKIMNPzFqPeK6LgbojhYY0P+yhr69U5T
	jufsSGmM7Mek39MOF9bRZ1NXZ0YWfDW2EMjQuLuWlgWHnZ141b+q62KAbmtJhiyaG0jb0GBe/sxBR
	yWhr4o6giaBqvP0vcGsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qB9JV-007hFc-0o;
	Mon, 19 Jun 2023 07:28:37 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qB9JR-007hAL-2b
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 07:28:35 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 0400624E28B;
	Mon, 19 Jun 2023 15:27:46 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 19 Jun
 2023 15:27:45 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 19 Jun
 2023 15:27:45 +0800
Message-ID: <8dba5075-3e30-3edd-e66b-199cffefe708@starfivetech.com>
Date: Mon, 19 Jun 2023 15:27:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/3] dt-bindings: qspi: cdns,qspi-nor: Add clocks for
 StarFive JH7110 SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Ziv Xu
	<ziv.xu@starfivetech.com>
References: <20230602084925.215411-1-william.qiu@starfivetech.com>
 <20230602084925.215411-2-william.qiu@starfivetech.com>
 <e148c599-8521-3264-f994-529ffc18f836@linaro.org>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <e148c599-8521-3264-f994-529ffc18f836@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_002834_012337_3206C1AC 
X-CRM114-Status: GOOD (  10.46  )
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



On 2023/6/6 20:43, Krzysztof Kozlowski wrote:
> On 02/06/2023 10:49, William Qiu wrote:
>> The QSPI controller needs three clock items to work properly on StarFive
>> JH7110 SoC, so there is need to change the maxItems's value to 3. Other
>> platforms do not have this constraint.
>> 
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> 
> 
> 
>>  
>> @@ -69,9 +81,6 @@ properties:
>>    interrupts:
>>      maxItems: 1
>>  
>> -  clocks:
>> -    maxItems: 1
> 
> Properties should be defined in top-level properties. Don't remove them
> from here.
> 
> Best regards,
> Krzysztof
> 
Hi Krzysztof,

Sorry for the late reply. I'll fix it in next version.

Best regards,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

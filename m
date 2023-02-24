Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C36CC61DA3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 10:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2ggAxOLcGWC4Cr39pvqO9i+xNp8V1KLuiDhbsMtNuc=; b=gYkb1aeU6CVArz
	ZyQfjtflXnIziYHswEJfXEPB7EM03peAUBCg37d1fbmvQXnBn8za0ubED+jz22pplat1HRtzXvd+M
	Z5jMg/1VwIWJsPVkGKYm3CnlA9v/TwsDpAcuG/qy2yYHJ1m6Re2Vvbjj9TSqtvwUHwEDasIuwLAH4
	p5Lrcwjdfon+rvURP7mv96weJ9whQ/i+dMnfeGvHAtm0lVf/C6pVSVLV75Ap5US0SDzZ09eoOGbMd
	1+8/aoUmShNvEsgKe93X6fVJdG2fmtDUMDemOBKDriXcmg7pL8Q2GzGRc2Zsjxd5tWTacAfJDt5ak
	9mZdXWgdH17Snaf/QEJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVV6s-001wZt-MF; Fri, 24 Feb 2023 10:15:26 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVV6o-001wLj-VE
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 10:15:24 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id C429224DB8C;
	Fri, 24 Feb 2023 18:14:39 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Feb
 2023 18:14:39 +0800
Received: from [192.168.125.93] (113.72.147.165) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Feb
 2023 18:14:38 +0800
Message-ID: <d0984638-3f7f-7e4e-fe3e-5e1f88375dca@starfivetech.com>
Date: Fri, 24 Feb 2023 18:14:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add reset
 items
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Eugeniy Paltsev
	<Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230221140424.719-1-walker.chen@starfivetech.com>
 <20230221140424.719-2-walker.chen@starfivetech.com>
 <1467f7c5-07eb-97db-c6f2-573a4208cc28@linaro.org>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <1467f7c5-07eb-97db-c6f2-573a4208cc28@linaro.org>
X-Originating-IP: [113.72.147.165]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_021523_212042_A8E01FCF 
X-CRM114-Status: GOOD (  13.29  )
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



On 2023/2/22 17:17, Krzysztof Kozlowski wrote:
> On 21/02/2023 15:04, Walker Chen wrote:
>> This DMA controller needs to be reset before being used on JH7110 SoC,
>> so add reset items to support this chip.
> 
> There is reset already. The DMA controller is reset already. Your commit
> msg and commit subject do not match commit at all.

OK, the commit message will be changed to match the actual modification.

> 
>> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  .../devicetree/bindings/dma/snps,dw-axi-dmac.yaml         | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> index ad107a4d3b33..c2247c65a22f 100644
>> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> @@ -20,6 +20,7 @@ properties:
>>      enum:
>>        - snps,axi-dma-1.01a
>>        - intel,kmb-axi-dma
>> +      - starfive,jh7110-axi-dma
>>  
>>    reg:
>>      minItems: 1
>> @@ -58,7 +59,12 @@ properties:
>>      maximum: 8
>>  
>>    resets:
>> -    maxItems: 1
>> +    maxItems: 2
> 
> This breaks ABI and all other users. Test your changes before sending.

I think 'minItems' should be added here. So like this:
resets:
  minItems: 1
  maxItems: 2

Other platform/users will not be affected by this.

Thanks.

Best regards,
Walker





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

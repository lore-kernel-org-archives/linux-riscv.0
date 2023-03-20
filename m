Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A085C6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 05:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0h5IX/b5xmlSuqywzAt/GHBu9m1uJP4XobZBdSNliU=; b=PHKuQfy8TuRZlH
	ObQy5zG7V/4PyCeNmSdxc+KQ2AchuM8rUrXCmrFSDHoGdZ3nHm3jfVpfKStAgrnRTHchw3G+dkafj
	baR8n9WduupeAQMrcLU3GjzOc7Dm9GyABX3lKKuVr4pL3Fgirg8O7XhSEZBjE+DWhRy9dLQF4Xygm
	vYwsWAZhx3OuhJkh570xPOZ9bDCvyagNWUon6rCRPmxqWOGcUJvGg70tvqe2u42P0tdERKECITXVE
	Qyoc0CHJqJeLCOtA7xTJ5GVCpdA7viwngZoYa7Wdni+EyY6SNBNHECqMK0AcLbhRUo+rmkO8h7KNI
	5diqixzXAv+4MpGDRBoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe8UZ-008CLK-0F;
	Mon, 20 Mar 2023 05:55:35 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe8UV-008CI2-1o
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 05:55:34 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 445E224E047;
	Mon, 20 Mar 2023 13:54:40 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 13:54:40 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 13:54:39 +0800
Message-ID: <e38efd81-9c79-553b-7556-7aff30f6ec50@starfivetech.com>
Date: Mon, 20 Mar 2023 13:54:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RESEND v6 1/2] dt-bindings: soc: starfive: Add StarFive syscon
 doc
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Emil
 Renner Berthing" <kernel@esmil.dk>
References: <20230315055813.94740-1-william.qiu@starfivetech.com>
 <20230315055813.94740-2-william.qiu@starfivetech.com>
 <850bc37e-c6d1-2381-a851-965a4cbee8a0@linaro.org>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <850bc37e-c6d1-2381-a851-965a4cbee8a0@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_225531_934485_FB72FF0C 
X-CRM114-Status: GOOD (  13.23  )
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



On 2023/3/19 20:27, Krzysztof Kozlowski wrote:
> On 15/03/2023 06:58, William Qiu wrote:
>> Add documentation to describe StarFive System Controller Registers.
>> 
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> ---
>>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 41 +++++++++++++++++++
>>  MAINTAINERS                                   |  5 +++
>>  2 files changed, 46 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> new file mode 100644
>> index 000000000000..ae7f1d6916af
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH7110 SoC system controller
>> +
>> +maintainers:
>> +  - William Qiu <william.qiu@starfivetech.com>
>> +
>> +description: |
>> +  The StarFive JH7110 SoC system controller provides register information such
>> +  as offset, mask and shift to configure related modules such as MMC and PCIe.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - starfive,jh7110-aon-syscon
>> +          - starfive,jh7110-stg-syscon
>> +          - starfive,jh7110-sys-syscon
>> +      - const: syscon
> 
> Does not look like you tested the bindings. Please run `make
> dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> 
> ... or your PLL clock controller was not tested.
> 
> Best regards,
> Krzysztof
> 
Hi Krzysztof,

I've already done`make dt_binding_check`, and get no error. So maybe PLL clock controller
was not tested which I didn't add in this patch series. And PLL clock controller belongs
to Xingyu Wu, I would tell him.

Best regards
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

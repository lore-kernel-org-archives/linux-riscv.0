Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962F5C07CA9
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 07:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IDTD11mkvs4fr5fr7jmEPj6TTubmNR/EQsILztblXFA=; b=HfG6OG9ElQvCv0
	t/s0kenbR9/n0FR518Gn8j/xZ4Tq62Q4G0gJgXPaxC1m+ZV20x4r1bS21rsW0cLhQplZ8qFsUyTgy
	MUzPC1VwiJyzCRwVw7WxNGvKFe3+vG4GgrLoryEFTRJ/LWuShQ/gPMMeI05ylXbsBunuteJqNKgan
	1ClthPaaUkBXn49ODreoDdFSdIx1jRccWb44gfZatEN5SD2q3sc4VudOElZ9OwgL/tfzaH0PQxI3d
	qXEMwOHfbS7F/SSkpQw4VblUf95Ms853cCdJ0AC96gNGIDoumMlOU/exE24sjPdAzEG9LcnwucmVL
	Zz/kdSNK6U2rHN/1nfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8bZA-00A6hl-2n;
	Thu, 30 Nov 2023 07:34:32 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8bZ7-00A6gu-1T
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 07:34:31 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9B58424E25C;
	Thu, 30 Nov 2023 15:33:59 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 30 Nov
 2023 15:33:59 +0800
Received: from [192.168.120.47] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 30 Nov
 2023 15:33:58 +0800
Message-ID: <ac934dc1-0239-47c6-b28d-d4cd690f54c1@starfivetech.com>
Date: Thu, 30 Nov 2023 15:33:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/4] dt-bindings: pwm: Add bindings for OpenCores PWM
 Controller
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pwm@vger.kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Hal Feng <hal.feng@starfivetech.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
References: <20231129092732.43387-1-william.qiu@starfivetech.com>
 <20231129092732.43387-2-william.qiu@starfivetech.com>
 <20231129-chaplain-unseeing-e433ec830946@spud>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <20231129-chaplain-unseeing-e433ec830946@spud>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_233429_807456_61BB8453 
X-CRM114-Status: GOOD (  15.40  )
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



On 2023/11/29 22:33, Conor Dooley wrote:
> On Wed, Nov 29, 2023 at 05:27:29PM +0800, William Qiu wrote:
>> Add bindings for OpenCores PWM Controller.
>> 
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../bindings/pwm/opencores,pwm.yaml           | 56 +++++++++++++++++++
>>  1 file changed, 56 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
>> new file mode 100644
>> index 000000000000..133f2cd417f0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
>> @@ -0,0 +1,56 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pwm/opencores,pwm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: OpenCores PWM controller
>> +
>> +maintainers:
>> +  - William Qiu <william.qiu@starfivetech.com>
>> +
>> +description:
>> +  OpenCores PTC ip core contains a PWM controller. When operating in PWM mode,
> 
> nit: "The OpenCores PTC IP core"
> 
Will update.
>> +  the PTC core generates binary signal with user-programmable low and high
>> +  periods. All PTC counters and registers are 32-bit.
>> +
>> +allOf:
>> +  - $ref: pwm.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - starfive,jh7100-pwm
>> +              - starfive,jh7110-pwm
>> +          - const: opencores,pwm-v1
> 
> properties:
>   compatible:
>     items:
>       - enum:
>           - starfive,jh7100-pwm
>           - starfive,jh7110-pwm
>       - const: opencores,pwm-v1
> 
> Please use this form here instead.
> 
> Otherwise, this looks good to me now.
> 
I see. I'll update it.

Thanks for spending time to review this patchset.

Best Regards,
William
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  "#pwm-cells":
>> +    const: 3
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    pwm@12490000 {
>> +        compatible = "starfive,jh7110-pwm", "opencores,pwm-v1";
>> +        reg = <0x12490000 0x10000>;
>> +        clocks = <&clkgen 181>;
>> +        resets = <&rstgen 109>;
>> +        #pwm-cells = <3>;
>> +    };
>> -- 
>> 2.34.1
>> 
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

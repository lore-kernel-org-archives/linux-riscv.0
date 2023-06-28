Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C95EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 06:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZhnzKBSw25mDWPt2lGgakDArbQfD5/ygUuVwSvQUVNA=; b=D+ZFxAqJMvBaco
	kd+cvhbVe3GOJA07KJ6x07LSycUJ6lFu5uQ4ZFW8XVYMGutvAdtSyYNimA+AYB18z4lj73ZaPZDF9
	AvHkGQcUDhv9iGQgwXGKKf5R6a9iWu2uej9QN629irie7iHMVNPbfquJAGYQrCqHCBz3nXRgrAZsB
	J5kIx4Xyw08gbKPZ2rSbQEubLX8zhr1L+D2QybV0XUf1FGbTMbJ5PHK+MG3bEbEmI5Be+mkNe+WSI
	QCnmvQeYq96BI9PFsWFusy2ns2yRME5fC8Y4b8FuvLZQ3l8/Kc2njoxz+wNhwrMd9SinRV6rCwlaf
	tvVAn0qIx4QTE+2ei50w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEOyD-00EzFY-2P;
	Wed, 28 Jun 2023 06:48:05 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEOy9-00Ez98-13
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 06:48:04 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A98C324E22D;
	Wed, 28 Jun 2023 14:47:10 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 28 Jun
 2023 14:47:10 +0800
Received: from [192.168.125.128] (183.27.97.206) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 28 Jun
 2023 14:47:09 +0800
Message-ID: <a83c98ae-2f6c-00c4-5d05-fc304718e05a@starfivetech.com>
Date: Wed, 28 Jun 2023 14:44:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 2/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Conor
 Dooley" <conor+dt@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, William Qiu
	<william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
References: <20230613125852.211636-1-xingyu.wu@starfivetech.com>
 <20230613125852.211636-3-xingyu.wu@starfivetech.com>
 <7e2d6bfe-5687-97c5-778b-c02e9c0894af@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <7e2d6bfe-5687-97c5-778b-c02e9c0894af@linaro.org>
X-Originating-IP: [183.27.97.206]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_234801_672618_03D3258F 
X-CRM114-Status: GOOD (  17.87  )
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

On 2023/6/14 2:31, Krzysztof Kozlowski wrote:
> On 13/06/2023 14:58, Xingyu Wu wrote:
>> From: William Qiu <william.qiu@starfivetech.com>
>> 
>> Add documentation to describe StarFive System Controller Registers.
>> 
>> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> ---
>>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 62 +++++++++++++++++++
>>  MAINTAINERS                                   |  7 +++
>>  2 files changed, 69 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> new file mode 100644
>> index 000000000000..a81190f8a54d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> @@ -0,0 +1,62 @@
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
>> +    oneOf:
>> +      - items:
>> +          - const: starfive,jh7110-sys-syscon
>> +          - const: syscon
>> +          - const: simple-mfd
>> +      - items:
>> +          - enum:
>> +              - starfive,jh7110-aon-syscon
>> +              - starfive,jh7110-stg-syscon
>> +          - const: syscon
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clock-controller:
>> +    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
>> +    type: object
>> +
>> +  "#power-domain-cells":
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: starfive,jh7110-aon-syscon
>> +    then:
>> +      required:
>> +        - "#power-domain-cells"
> 
> Where did you implement the results of the discussion that only some
> devices can have power and clock controller?
> 
> According to your code all of above - sys, aon and stg - have clock and
> power controllers. If not, then the code is not correct, so please do
> not respond with what is where (like you did last time) but actually
> implement what you say.
> 

Hi Krzysztof, I need to modify the code to implement it.
If I drop the 'clock-controller' and '"#power-domain-cells"' in properites, and change to this:

--- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
@@ -29,28 +29,33 @@ properties:
   reg:
     maxItems: 1
 
-  clock-controller:
-    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
-    type: object
-
-  "#power-domain-cells":
-    const: 1
-
 required:
   - compatible
   - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7110-sys-syscon
+    then:
+      properties:
+        clock-controller:
+          $ref: /schemas/clock/starfive,jh7110-pll.yaml#
+          type: object
+
   - if:
       properties:
         compatible:
           contains:
             const: starfive,jh7110-aon-syscon
     then:
-      required:
-        - "#power-domain-cells"
+      properties:
+        "#power-domain-cells":
+          const: 1
 
-additionalProperties: false
+additionalProperties: true


Would it be better to show that sys-syscon only has clock-controller and aon-syscon is power controller?

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

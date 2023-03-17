Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A7CC74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 10:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+IYLjAQ1mHT8D7xng20qSxHJhXRhr15UCn5Bzk9jlE=; b=LB5ZUPw2GV+Huy
	E6i07pI+nv1xII0feU8JEiYiAXlK0bAMBpthYzrxsRSLhAjEXES8Fx/sjTHykYqxuSueuV3phiQ2+
	IXC3kNXOv8kPcif9/DMIDrRUEd+8jbWdWeFnZHLQcv3j5ahlKa+vBV80qaUmLh5sJfGaAAokFSMUM
	2JRycC5jE/zspDU31mmRs+ieRl2C5fdPVP0Akh1BxqQH1HNGtA4FuCTSVvw+xs14REsTAeUeYEmOu
	cjgwyvNWcjKDUIHPVvbAzEa5IVPdlNixeFSuYh6nOWCG46sVIhlG1iP8AWTJOMaGpHiu6q5JeuDiK
	mE6MFKtFq41/lca4Lk8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd7L9-001uQJ-00;
	Fri, 17 Mar 2023 10:29:39 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd7L4-001uO6-1g;
	Fri, 17 Mar 2023 10:29:37 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id CE24924E1E4;
	Fri, 17 Mar 2023 18:29:07 +0800 (CST)
Received: from EXMBX071.cuchost.com (172.16.6.81) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 17 Mar
 2023 18:29:07 +0800
Received: from [192.168.125.108] (113.72.145.194) by EXMBX071.cuchost.com
 (172.16.6.81) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 17 Mar
 2023 18:29:06 +0800
Message-ID: <f836d98d-bb3b-64a5-1598-1ef489e62fb6@starfivetech.com>
Date: Fri, 17 Mar 2023 18:29:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: Add StarFive JH7110 USB/PCIe
 document
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, "Vinod
 Koul" <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
	<peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230315104411.73614-1-minda.chen@starfivetech.com>
 <20230315104411.73614-2-minda.chen@starfivetech.com>
 <f7752f68-11a6-cbf4-2f28-1de4c7ff9da2@linaro.org>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <f7752f68-11a6-cbf4-2f28-1de4c7ff9da2@linaro.org>
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX071.cuchost.com
 (172.16.6.81)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_032934_855977_BCA45EBB 
X-CRM114-Status: GOOD (  12.81  )
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



On 2023/3/17 16:39, Krzysztof Kozlowski wrote:
> On 15/03/2023 11:44, Minda Chen wrote:
>> Add StarFive JH7110 SoC USB 2.0/3.0 and PCIe 2.0 PHY dt-binding.
>> PCIe 2.0 phy can use as USB 3.0 PHY.
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> ---
>>  .../phy/starfive,jh7110-usb-pcie-phy.yaml     | 62 +++++++++++++++++++
>>  1 file changed, 62 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-usb-pcie-phy.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-pcie-phy.yaml
>> new file mode 100644
>> index 000000000000..aa1c3fe93100
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-pcie-phy.yaml
>> @@ -0,0 +1,62 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/starfive,jh7110-usb-pcie-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive USB 2.0 and PCIe 2.0 PHY
>> +
>> +maintainers:
>> +  - Minda Chen <minda.chen@starfivetech.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - starfive,jh7110-usb-phy
>> +      - starfive,jh7110-pcie-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#phy-cells":
>> +    const: 0
>> +
>> +  clocks:
>> +    items:
>> +      - description: usb 125m clock
>> +      - description: app 125m clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: 125m
>> +      - const: app_125
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#phy-cells"
>> +
> 
> It seems pci phy does not take these clocks, thus you should have
> allOf:if:then which will customize it per variant. Otherwise binding is
> incorrect for the pci.
> 
ok
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    phy@10200000 {
>> +      compatible = "starfive,jh7110-usb-phy";
>> +      reg = <0x10200000 0x10000>;
>> +      clocks = <&syscrg 95>,
>> +               <&stgcrg 6>;
>> +      clock-names = "125m", "app_125";
>> +      #phy-cells = <0>;
>> +    };
>> +
>> +    phy@10210000 {
>> +      compatible = "starfive,jh7110-pcie-phy";
>> +      reg = <0x10210000 0x10000>;
>> +      #phy-cells = <0>;
>> +    };
>> +
>> +    phy@10220000 {
>> +      compatible = "starfive,jh7110-pcie-phy";
>> +      reg = <0x10220000 0x10000>;
>> +      #phy-cells = <0>;
>> +    };
> 
> Drop duplicated examples. Keep usb and maybe one phy.
> 
ok, thanks
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

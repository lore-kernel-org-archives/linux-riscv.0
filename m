Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C0AC64EC4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 03:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UG4tjyNZhxWhwp7A2OJhUHPngxDCq42JcQAzvz70U1M=; b=w5tH+xxH9JAA9b
	entKKBorbTSSLnHiQ6RbHbUpuQHD1Oyr8ENaPEoWCh6nQ1CCDM60gs6gpr4zOAcQ+AGgZn24SYOMR
	ZOgbG18PYdann7Qpr+Ko14/qFK2AKh9Q9Edu6kRQ3TYROBUkWlDSur0JQw9w3XRYCkm/WpH+O4WoM
	RqgHgKwtMvcTEYGZ8QxSYWdCmDrglPz1G16EkyQ3LdiA3nuAxEzp1JvobNkc1fr/902A7VxPd4Nmm
	JTgI4H7nL88STTou/TFTc0FupVL+HIhxujVWA5vJc+l3HHM4nAUYoe+KpP6+O3FyrTlRIKtI+vTEi
	LTP7XxVyiyvi522hevXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa7E5-007hLE-Np; Thu, 09 Mar 2023 03:45:57 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa7E2-007hIh-9Z; Thu, 09 Mar 2023 03:45:56 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1794D24DB89;
	Thu,  9 Mar 2023 11:45:31 +0800 (CST)
Received: from EXMBX071.cuchost.com (172.16.6.81) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 9 Mar
 2023 11:45:30 +0800
Received: from [192.168.125.108] (183.27.96.115) by EXMBX071.cuchost.com
 (172.16.6.81) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 9 Mar
 2023 11:45:30 +0800
Message-ID: <70e0d1b2-349a-079c-646f-394edf080fbe@starfivetech.com>
Date: Thu, 9 Mar 2023 11:45:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: Add StarFive JH7110 USB
 dt-binding
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Pawel Laszczak <pawell@cadence.com>, Vinod Koul <vkoul@kernel.org>,
	"Albert Ou" <aou@eecs.berkeley.edu>, Kishon Vijay Abraham I
	<kishon@kernel.org>, "Peter Chen" <peter.chen@kernel.org>, Roger Quadros
	<rogerq@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
	<devicetree@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, "Emil Renner Berthing"
	<emil.renner.berthing@canonical.com>, <linux-usb@vger.kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Conor
 Dooley <conor@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
References: <20230308082800.3008-1-minda.chen@starfivetech.com>
 <20230308082800.3008-2-minda.chen@starfivetech.com>
 <167828360080.2613078.14112010625330944896.robh@kernel.org>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <167828360080.2613078.14112010625330944896.robh@kernel.org>
X-Originating-IP: [183.27.96.115]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX071.cuchost.com
 (172.16.6.81)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_194554_656631_9962C4A8 
X-CRM114-Status: GOOD (  16.64  )
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



On 2023/3/8 22:06, Rob Herring wrote:
> 
> On Wed, 08 Mar 2023 16:27:58 +0800, Minda Chen wrote:
>> Add StarFive JH7110 SoC USB 3.0 phy dt-binding.
>> USB controller is cadence USB 3.0 IP.
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> ---
>>  .../bindings/phy/starfive,jh7110-usb-phy.yaml | 158 ++++++++++++++++++
>>  1 file changed, 158 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
>> 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.example.dtb: usb@10100000: phy-names:1: 'anyOf' conditional failed, one must be fixed:
> 	'cdns3,usb2-phy' was expected
> 	'cdns3,usb3-phy' was expected
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.example.dtb: usb@10100000: 'phys' is a dependency of 'phy-names'
> 	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/phy/phy-consumer.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230308082800.3008-2-minda.chen@starfivetech.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 
I am sorry about this, I just run dtbs_check, not dt_binding_check. Next version I will fix it. 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

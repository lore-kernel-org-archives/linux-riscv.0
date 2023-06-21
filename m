Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE68EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 06:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GTjsSze216gttBkil7Oi426x+qFcsOOyz7nZ+sURR2U=; b=swo7kNCukFwhuR
	X+VuIQNX9COx43Q3Cs7uvNstxk0RS4HzRtw2IuT7O9ibDRVIsY9A2xO6GPlIr6TvGEDDlh55VsMJb
	/q8viH/MEiOqst9J/mLBHsc44yrHYID9uAqhbaA8RDidLXOmXTNcc+OYpHXriRWV3YnT9mwSJgox4
	tgPLIp8GKSDO4tkGvm/iXWuToAMVxTgumlk6f9DxxLPT5srwIDGHgidwZuQ0qcWwEyILpdmeIRJwo
	4+sPwKwfAWd9+A8a8sH3jpSxe2WmtOepf+Db+GK11NJmVQC7ksOe27tUXznZEcSi0mM5U79xhZCwh
	Lxg41Lqz+SX/OXerr+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBr9H-00DOEf-03;
	Wed, 21 Jun 2023 06:16:59 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBr9D-00DODi-13
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 06:16:57 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id AAD2224E271;
	Wed, 21 Jun 2023 14:16:37 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 21 Jun
 2023 14:16:37 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 21 Jun
 2023 14:16:36 +0800
Message-ID: <ddad3e67-05b1-e0fd-0241-fb47c5a0bbde@starfivetech.com>
Date: Wed, 21 Jun 2023 14:16:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/3] dt-bindings: qspi: cdns,qspi-nor: Add clocks for
 StarFive JH7110 SoC
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Emil
 Renner Berthing" <kernel@esmil.dk>, Ziv Xu <ziv.xu@starfivetech.com>
References: <20230619083517.415597-1-william.qiu@starfivetech.com>
 <20230619083517.415597-2-william.qiu@starfivetech.com>
 <168716619573.242780.12121020614995223090.robh@kernel.org>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <168716619573.242780.12121020614995223090.robh@kernel.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_231655_681317_E75ADC72 
X-CRM114-Status: GOOD (  17.92  )
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



On 2023/6/19 17:16, Rob Herring wrote:
> 
> On Mon, 19 Jun 2023 16:35:15 +0800, William Qiu wrote:
>> The QSPI controller needs three clock items to work properly on StarFive
>> JH7110 SoC, so there is need to change the maxItems's value to 3. Other
>> platforms do not have this constraint.
>> 
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  .../bindings/spi/cdns,qspi-nor.yaml           | 20 ++++++++++++++++++-
>>  1 file changed, 19 insertions(+), 1 deletion(-)
>> 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/cdns,qspi-nor.example.dtb: spi@ff705000: clocks: [[4294967295]] is too short
> 	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230619083517.415597-2-william.qiu@starfivetech.com
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
It seems that my changes are not compatible with other dts files, I'll try to
fix it.

Thanks for reminding.

Best regards
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

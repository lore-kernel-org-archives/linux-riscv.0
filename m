Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D67EC3A5A7
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 08:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=to1I4i/UXtVRnvArSFpKaekyex+Khn0shSodwIkzHps=; b=Hw2xa+QrKxGwax
	qM/LFVu4/sxrYo0PHJQ4s3yaQbGNpsk28NEfmBVbdjRxtG2iSJLoSxu96rblh1kZCd2O959kMf12Y
	6+IVcJN6etxQeagy7wn0iVARncPyl0jTeuCkzNF4HL2mS+Bqq9iJdzhf2QrhEHH7VqJG+vzRnb3iK
	CcW9uvgBTqiQDtsHEItnzoLhHkvsfRxG4NSQeyQ1pLPg0eonDQLSwbIHONyHYFr1dhs7sVBUr8gTd
	GH1DGgOlk/EqAyMazRUJg17Ho+PwDPJAdYRfzJGcGhO96JzzdmOoN8NpqjmrY1J78dWZCwvMJYhZ1
	HJ9f4gXTy9YNvG4HOwtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3CNK-009x56-U7; Thu, 08 Dec 2022 08:35:26 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3CNH-009wRl-PO
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 08:35:25 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 73FFB24DD6E;
	Thu,  8 Dec 2022 16:35:00 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Dec
 2022 16:35:00 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Dec
 2022 16:34:59 +0800
Message-ID: <9602e9db-5107-42cb-7f92-68fe8ab9624f@starfivetech.com>
Date: Thu, 8 Dec 2022 16:34:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Add bindings for StarFive
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <linux-mmc@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, <linux-riscv@lists.infradead.org>, Jaehoon Chung
	<jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	<devicetree@vger.kernel.org>
References: <20221207131731.1291517-1-william.qiu@starfivetech.com>
 <20221207131731.1291517-2-william.qiu@starfivetech.com>
 <167042222472.2111911.2050446708831690640.robh@kernel.org>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <167042222472.2111911.2050446708831690640.robh@kernel.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_003524_124750_333F5F5A 
X-CRM114-Status: GOOD (  18.00  )
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



On 2022/12/7 22:19, Rob Herring wrote:
> 
> On Wed, 07 Dec 2022 21:17:29 +0800, William Qiu wrote:
>> Add documentation to describe StarFive
>> designware mobile storage host controller driver.
>> 
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> ---
>>  .../bindings/mmc/starfive,jh7110-sdio.yaml    | 71 +++++++++++++++++++
>>  1 file changed, 71 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-sdio.yaml
>> 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/mmc/starfive,jh7110-sdio.example.dts:21:18: fatal error: dt-bindings/clock/starfive-jh7110.h: No such file or directory
>    21 |         #include <dt-bindings/clock/starfive-jh7110.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/mmc/starfive,jh7110-sdio.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1492: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221207131731.1291517-2-william.qiu@starfivetech.com
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

Hi Rob Herring,

Thank you for taking time to review and provide helpful comments for this patch.
I'll take Conor's suggestion and replace the IDs and drop the header then.

Best regards,
William Qiu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

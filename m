Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883C4C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 06:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LywWz4RHVWVjt0ymwqvNFDK/ErMn/hdSa5V1pUcxpyI=; b=maZtLmCtdoZEvI
	4xPeLo8i1cUZIxNk+lX8IYV0WLWNORlr+O3wmXFMu+LrwMrqz7xExiq6PmphBWGNgYuGf18YFVpJA
	8Wq3hjB2HFOzyLHIQG18n6VY8YD7d9NAyeiaFGkYU+6A+uDNQZFq/a4UFbQq8ZI5hWCkxb7+YzQCO
	7XeW2OhRKtA88WdeqC8qqdtx7zEIFYb6FFOH8Uv4YGkdN9sJd4YAqUcXAEljWfyP5RhLaQB2C4g0i
	w93i1XqZsQ7ufeQx2hfzDLNoCXfq26O5yCOFbG+FM0IcetHSwqVMYplXjsqJ3H3tArx4LFpmYIX+4
	PZ/SzV0u41ITPlg2LvfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZmqs-003dy0-DR; Wed, 08 Mar 2023 06:00:38 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZmqm-003dtM-VD
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 06:00:36 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D3ED724E2F7;
	Wed,  8 Mar 2023 13:59:29 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 8 Mar
 2023 13:59:29 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 8 Mar
 2023 13:59:28 +0800
Message-ID: <20e56116-ab76-fa8c-b321-d32c8b24a6be@starfivetech.com>
Date: Wed, 8 Mar 2023 13:59:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 1/2] dt-bindings: syscon: Add StarFive syscon doc
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, <linux-riscv@lists.infradead.org>
References: <20230307024646.10216-1-william.qiu@starfivetech.com>
 <20230307024646.10216-2-william.qiu@starfivetech.com>
 <39ba7357-541b-a70e-5793-91bb9e038938@linaro.org>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <39ba7357-541b-a70e-5793-91bb9e038938@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_220033_368443_D0D285F8 
X-CRM114-Status: GOOD (  12.29  )
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



On 2023/3/7 17:00, Krzysztof Kozlowski wrote:
> On 07/03/2023 03:46, William Qiu wrote:
>> Add documentation to describe StarFive System Controller Registers.
> 
> Use subject prefixes matching the subsystem (which you can get for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching). This is not "syscon" subsystem, but rather
> starfive.
> 
Will update.
>> 
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  .../bindings/soc/starfive/jh7110-syscon.yaml  | 41 +++++++++++++++++++
>>  MAINTAINERS                                   |  5 +++
>>  2 files changed, 46 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
>> new file mode 100644
>> index 000000000000..72c8850602b5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
> 
> Filename: starfive,jh7110-syscon.yaml
> 

Will update.
Thanks for taking times to review this patch series.

Best regards
William
> 
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

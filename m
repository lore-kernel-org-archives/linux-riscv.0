Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBBBEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 06:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8SRjXDM+DiWSgMDpV0xjVmrI+7y3u3rXChQwu/VKbnY=; b=JbK6+/3+mu0QLf
	mCpUxq6rAceTAspFQNBNZG2VNQGxJ1SNji2EtTdElPyKHMK/2L4RAdDlrz+QkJAChrvNten7vsbHY
	/KdsMzE6M7aEY4svbK7Jq1tLY6gWLmvivqUZNmAvwg7+YRHS2wlrwpW2/cZ5o2Nx/nesSegWYbfcM
	ZHTrjO1F3ThVv7qx1+MWBLSZPYbPx1UlHNhLP80zZBJJufL/p/+PqHHtc/v9xRiyM/8ls88a6zyTl
	XnQQSwTAxOdgBwFHXMWVliY+ewDbwrYfNUu2It9IYJFRSsPxD5pmwKxJjaXUwgwH4DGz56AgHMDfo
	B6DwAtqHG+Jml9LrMmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGvsx-00Et37-2l;
	Wed, 05 Jul 2023 06:21:07 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGvss-00Eszp-2o
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 06:21:06 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id DB84424E257;
	Wed,  5 Jul 2023 14:20:15 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 5 Jul
 2023 14:20:15 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 5 Jul
 2023 14:20:14 +0800
Message-ID: <3cbff4f7-b113-7f37-83d7-c147260343b5@starfivetech.com>
Date: Wed, 5 Jul 2023 14:20:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND v1 1/2] dt-binding: spi: constrain minItems of clocks and
 clock-names
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Linus Walleij
	<linus.walleij@linaro.org>
References: <20230704092200.85401-1-william.qiu@starfivetech.com>
 <20230704092200.85401-2-william.qiu@starfivetech.com>
 <1b65e8d1-d5e1-0d6b-1248-d9683be44db8@linaro.org>
 <c5027d42-b9be-090d-bd43-86c9b1448c99@starfivetech.com>
 <afcf67e3-a017-b747-a0cf-284a87a8d24a@linaro.org>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <afcf67e3-a017-b747-a0cf-284a87a8d24a@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_232103_212120_8F7B1AA7 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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



On 2023/7/5 14:00, Krzysztof Kozlowski wrote:
> On 05/07/2023 05:37, William Qiu wrote:
>>>> ---
>>>>  Documentation/devicetree/bindings/spi/spi-pl022.yaml | 11 ++++++++---
>>>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/spi/spi-pl022.yaml b/Documentation/devicetree/bindings/spi/spi-pl022.yaml
>>>> index 91e540a92faf..42bb34c39971 100644
>>>> --- a/Documentation/devicetree/bindings/spi/spi-pl022.yaml
>>>> +++ b/Documentation/devicetree/bindings/spi/spi-pl022.yaml
>>>> @@ -11,6 +11,7 @@ maintainers:
>>>>
>>>>  allOf:
>>>>    - $ref: spi-controller.yaml#
>>>> +  - $ref: /schemas/arm/primecell.yaml#
>>>
>>> This looks unrelated, so keep it as separate commit with its own rationale.
>>>
>> Because "arm,primecell-periphid"  is need in JH7110 SoC, so I added them in
>> one commit, so do I need to put them in two commit?
> 
> You need to provide rationale why this is needed. I would assume this is
> needed for every primecell, not only JH7110, right?
> 
> 
All right, I'll keep it as separate commit.
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

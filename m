Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12879C6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 08:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qldNM5derIVmRNzK3kgIHfOQDyP3FES9ORzWRjGRKIM=; b=gKhXRZp8Tn0Ffe
	BGeabW5RUpbls8HCDoqXK5cpviMFRZgDiW+eHPBloDeVSLrgSMRYh/ye5HK3W+/QyxCiWX+qU6sGM
	YH8Y53R0j5ZCwbVJFBgUQjZaZpzv70CSIF1UxHTDV5SWKSnOn2vMPaH4YqxPzGK9LADrYaUC0HCTR
	m9EPTVSOEbSfJWWOanGRxnTVlqTs36YhSWd8stgpaqYX0ls8E/aHtGNJkR+jYdlRQVmU+AYdwxOC+
	+33OaOhjWxDht5x7B+b5IrKTbDtIsPPzJq+CrGWkH8The0SOG0snLJTQb2ZHkjFSZ9hOmLbhPkjpy
	Kz3tJXlVWnRUsnsbE7bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paBPl-008SSK-OX; Thu, 09 Mar 2023 08:14:17 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paBPh-008SPw-U4
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 08:14:16 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2138B24E1D3;
	Thu,  9 Mar 2023 16:13:47 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 9 Mar
 2023 16:13:47 +0800
Received: from [192.168.125.128] (183.27.96.115) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 9 Mar
 2023 16:13:45 +0800
Message-ID: <783fe50c-1649-b1c4-06cd-ac81bcad5117@starfivetech.com>
Date: Thu, 9 Mar 2023 16:13:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/3] dt-bindings: watchdog: Add watchdog for StarFive
 JH7100 and JH7110
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Samin Guo
	<samin.guo@starfivetech.com>, <linux-kernel@vger.kernel.org>
References: <20230308034036.99213-1-xingyu.wu@starfivetech.com>
 <20230308034036.99213-2-xingyu.wu@starfivetech.com>
 <94ba1427-21ea-86ee-d60d-7817f8e673fa@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <94ba1427-21ea-86ee-d60d-7817f8e673fa@linaro.org>
X-Originating-IP: [183.27.96.115]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_001414_290262_6060536B 
X-CRM114-Status: GOOD (  18.36  )
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

On 2023/3/9 15:30, Krzysztof Kozlowski wrote:
> On 08/03/2023 04:40, Xingyu Wu wrote:
>> Add bindings to describe the watchdog for the StarFive JH7100/JH7110 SoC.
>> And Use JH7100 as first StarFive SoC with watchdog.
>> 
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
> 
> What happened here? You wrote in changelog "Modified" but what exactly?
> How am I supposed to find it?
> 
> Provide detailed description, since you decided to remove my tag.
> Otherwise, standard response:
> 
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions. However, there's no need to repost patches *only* to add the
> tags. The upstream maintainer will do that for acks received on the
> version they apply.
> 
> https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540
> 
> If a tag was not added on purpose, please state why and what changed.
> 

I am sorry I did not elaborate it. The dt-bindings was only supported JH7110 watchdog in v3 patchset
and you had sent Reviewed-by tags. But at the same time tried to add JH7100 watchdog after discussion
and used JH7100 as the dt-binding's name because JH7100 is the first StarFive SoCs about watchdog.
The compatible also add 'starfive,jh7100-wdt' in the dt-binding. It is different from the v3 patch and
I did not add the Reviewed-by tag.

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

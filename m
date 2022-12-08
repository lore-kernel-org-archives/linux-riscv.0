Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C397DC4708E
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 01:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ORrsCnhyvVlk6SuHbH6jP2+y+ssd9CLiIoyy45SVW/0=; b=XQFGcnpy2aozeA
	RQqv1lMYCHjBDNVzEmUPE4vqlC/0vAs+LCuhc95b61FrIXlDQitSAiT3XoWp7RpZ9h2RhScBvRngN
	XssHcnLWRjv/mucoEB9BEUCTw3+dbkuOLLGsCyOYdhWLbTJzKYY3IHLk29CEH/sk3NHhpmsZcrtuV
	B3jBMh7eMz3IAuKqU5U/0x2E9C7LGCXWd5GdX2Q6SkRwkHu2U8KXSs6gpukfSPxcVjdoK2RpSa/Jf
	EFgGx+MC1uDVGN6KcGoGKne5V0gn0FSr4AOr9uLQqaOe1kfNzf2CAYGqiE7/BAwilZp7LqobdeM68
	5Up/eDIGVdb/nLYNdBgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p35oQ-00HOlf-Dg; Thu, 08 Dec 2022 01:34:58 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p35oM-00HNm0-FR
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 01:34:57 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 036A524E1BE;
	Thu,  8 Dec 2022 09:34:18 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Dec
 2022 09:34:18 +0800
Received: from [192.168.120.49] (171.223.208.138) by EXMBX173.cuchost.com
 (172.16.6.93) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Dec
 2022 09:34:16 +0800
Message-ID: <c897c858-14d1-3059-7307-84df9460e86e@starfivetech.com>
Date: Thu, 8 Dec 2022 09:34:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 1/7] dt-bindings: net: snps,dwmac: Add compatible
 string for dwmac-5.20 version.
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-2-yanhong.wang@starfivetech.com>
 <277f9665-e691-b0ad-e6ef-e11acddc2006@linaro.org>
 <22123903-ee95-a82e-d792-01417ceb63b1@starfivetech.com>
 <3a9ef360-73c3-cf26-3eca-4903b9a04ea3@linaro.org>
 <CAJM55Z-iLy1fZmoyk3FU7oDQcKBk6APYf-cbamKr7Gjx+NaoTQ@mail.gmail.com>
From: yanhong wang <yanhong.wang@starfivetech.com>
In-Reply-To: <CAJM55Z-iLy1fZmoyk3FU7oDQcKBk6APYf-cbamKr7Gjx+NaoTQ@mail.gmail.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_173454_704732_820579AC 
X-CRM114-Status: GOOD (  14.91  )
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



On 2022/12/7 21:56, Emil Renner Berthing wrote:
> On Fri, 2 Dec 2022 at 09:04, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 02/12/2022 03:53, yanhong wang wrote:
>> >
>> >
>> > On 2022/12/2 0:18, Krzysztof Kozlowski wrote:
>> >> On 01/12/2022 10:02, Yanhong Wang wrote:
>> >>> Add dwmac-5.20 version to snps.dwmac.yaml
>> >>
>> >> Drop full stop from subject and add it here instead.
>> >>
>> >
>> > Will update in the next version.
>> >
>> >>>
>> >>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> >>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
>> >>
>> >> Two people contributed this one single line?
>> >>
>> >
>> > Emil made this patch and I submitted it.
>>
>> If Emil made this patch, then your From field is incorrect.
> 
> Yes, please don't change the author of the commits you cherry-picked
> from my tree.
> 
> But now I'm curious. Did you check with your colleagues that the dwmac
> IP on the SoC is in fact version 5.20?

I can confirm that the IP version is 5.20 on JH7110 SoC.

> This was just an educated guess from my side.
> 
> /Emil
> 
>> Best regards,
>> Krzysztof
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E13C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 02:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0Cr70AZZXD6dT+DXfc63RxJtHeYMqunNUHkBqsyxJ8=; b=0+AEccrDz2ExD7
	5vn7E7ESravDQ3tq5zyYgAU3oUdzbJHmrFczJDxgAUvRyXZ/+bOOGzlTlqtDFihLoC9TlncYjeQH8
	0mS4HxQ2qBPqGblOz0OG6LPhFtIHLOOk78HDEPdv58Kaje1Dr1yl45c9BbyyCgRYqV/Qu1drsUZVf
	CX7kor+5ZoeitOunnYXc5x0sKQApuZEuarebRwRmzNPkHQeicZdgcz+WOkGIPODg2XSjeU+BCyHhZ
	nmRDHNCkCwKElxuvPom7kG6dqwn4m7L4gFC7IB0d4xaaF33/5TCnGRS+ZeH13oAV3oVWCk5to8/O3
	5cIIa/3/iV3GwTvgp8kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPDyi-00AZYB-Cq; Tue, 07 Feb 2023 02:45:04 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPDyd-00AZSb-0l
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 02:45:01 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 58D0624E1FC;
	Tue,  7 Feb 2023 10:43:58 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Feb
 2023 10:43:58 +0800
Received: from [192.168.120.49] (171.223.208.138) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Feb
 2023 10:43:57 +0800
Message-ID: <c9ab22b5-3ffb-d034-b8b8-b056b82a96ce@starfivetech.com>
Date: Tue, 7 Feb 2023 10:43:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 2/7] dt-bindings: net: snps,dwmac: Update the maxitems
 number of resets and reset-names
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
 <20230118061701.30047-3-yanhong.wang@starfivetech.com>
 <15a87640-d8c7-d7aa-bdfb-608fa2e497cb@linaro.org>
From: yanhong wang <yanhong.wang@starfivetech.com>
In-Reply-To: <15a87640-d8c7-d7aa-bdfb-608fa2e497cb@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_184459_259270_7B3744E1 
X-CRM114-Status: GOOD (  10.97  )
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



On 2023/1/18 23:47, Krzysztof Kozlowski wrote:
> On 18/01/2023 07:16, Yanhong Wang wrote:
>> Some boards(such as StarFive VisionFive v2) require more than one value
>> which defined by resets property, so the original definition can not
>> meet the requirements. In order to adapt to different requirements,
>> adjust the maxitems number definition.
>> 
>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
>> ---
>>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 9 +++------
>>  1 file changed, 3 insertions(+), 6 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> index e26c3e76ebb7..baf2c5b9e92d 100644
>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> @@ -133,12 +133,9 @@ properties:
>>          - ptp_ref
>>  
>>    resets:
>> -    maxItems: 1
> 
> Also, this does not make sense on its own and messes constraints for all
> other users. So another no for entire patch.
> 

Thanks. Change the properties of 'resets' and reset-names like this:

  resets:
    minItems: 1
    maxItems: 2

  reset-names:
    minItems: 1
    maxItems: 2

Is it right?  Do you have any other better suggestions?

> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

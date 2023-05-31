Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48ED5C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 02:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wreq5CYLRWadUwwEyh3R8Jx1GQBoD3ya8OigFXvEmuE=; b=n4xV/NCpxg9xX8
	n73qFsPAqAEQ4fspPz49MBb4oHKgpUz6tqDY7Baq4Y02MSN4JBLrAfNzeTxP2pDBkLGsQGDl9TYfR
	CMRO/ImsI1U7VSwTmjGEOH2eb0kmPQFOBuzndqAPSfu8z83PfHMPja98E3IquYHaaAGAIrY2tmrnh
	bqYpCRnnq18ZjGg6gdM2zAM8lzrBpfVlReZbhq82/4r7+Jw3s7cQfgI+zjhl0wPNF0NfmwTbjZRUB
	iwTGRzbDf2/M71P6OVzeEHzu1t0kcvUXi65Je2jS2LNuOGSM6aTaxaNfqx7d/aB1SZxVt2AVCV/v1
	W4xySSc+4VKMDsNN4Zcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4BWt-00Fn8I-1K;
	Wed, 31 May 2023 02:25:39 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4BWp-00Fn7K-2O
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 02:25:38 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2B8457FE2;
	Wed, 31 May 2023 10:24:53 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 31 May
 2023 10:24:53 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 31 May
 2023 10:24:52 +0800
Message-ID: <d9b4a420-14f9-4678-804c-9edbd848c01d@starfivetech.com>
Date: Wed, 31 May 2023 10:24:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 1/3] dt-bindings: qspi: cdns,qspi-nor: Add clocks for
 StarFive JH7110 SoC
To: Mark Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Emil Renner Berthing" <kernel@esmil.dk>, Ziv Xu <ziv.xu@starfivetech.com>
References: <20230526062529.46747-1-william.qiu@starfivetech.com>
 <20230526062529.46747-2-william.qiu@starfivetech.com>
 <87e9ed95-ea57-44c8-85f8-34264b5c6dde@sirena.org.uk>
 <a09cc0c9-ef4e-120f-e61a-94f628d67e38@starfivetech.com>
 <d417628d-7994-4b07-a670-ec14ad938764@sirena.org.uk>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <d417628d-7994-4b07-a670-ec14ad938764@sirena.org.uk>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_192535_957355_FC3FBCD9 
X-CRM114-Status: UNSURE (   9.55  )
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



On 2023/5/30 18:02, Mark Brown wrote:
> On Mon, May 29, 2023 at 02:44:13PM +0800, William Qiu wrote:
>> On 2023/5/26 23:33, Mark Brown wrote:
>> > On Fri, May 26, 2023 at 02:25:27PM +0800, William Qiu wrote:
> 
>> >> +        clock-names:
>> >> +          items:
>> >> +            - const: qspi-ref
>> >> +            - const: qspi-ahb
>> >> +            - const: qspi-apb
> 
>> 	I'm going to change the names of these three clocks to hclk, pclk,
>> and ref_clk, as defined in the data book. What do you think?
> 
> That looks fine.  ref, ahb and apb would also be fine, it's just the
> qspi- prefix that I was querying.

That's fine. I will fix it in next version.

Best regards,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

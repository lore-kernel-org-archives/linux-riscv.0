Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7CCC77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 02:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YaLYRsY258SshDXiRo8VaGQVo64v1Z/VYpX1t9/akRc=; b=WWSj4K3eJZKN+s
	ofsCasbc6j11YZqaurmY4kIv0ysHuj8LMrouo0pl6W9f7lC5fzJ9tVbd3TEwdj8jGpyvmiKiFxcQN
	wZs+Cl+jm18ONhWGu0laYOs4bMURmxa5aeywmHb9FC9ZlUWX6SrJneGanm/sgZTMzc9gLMggML2go
	1wVImrpioVSEg0D1LdzyxiqenMJCUgXNpwDH20ZwM/Yub1chaHydRYsJcRVinONWjVvLfYdeQGjVm
	/DJNz8+fUYlxRFzAkcCqTlhIWPe23xO3wUYTCyA1nni3uIoG4gQbkuNPp2aZGyzSupuBWx7FWuduE
	ITBHjTyXGICR9crJh30A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwviD-007Vnx-1P;
	Thu, 11 May 2023 02:07:21 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwvi9-007Vkm-1O
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 02:07:19 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id DDE0E24E0FC;
	Thu, 11 May 2023 10:06:25 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 11 May
 2023 10:06:25 +0800
Received: from [192.168.125.107] (113.72.146.187) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 11 May
 2023 10:06:25 +0800
Message-ID: <2a6add59-981a-f5c1-e744-1cef2b81f29a@starfivetech.com>
Date: Thu, 11 May 2023 10:06:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 1/5] dt-bindings: power: Add JH7110 AON PMU support
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Walker Chen
	<walker.chen@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230510015311.27505-1-changhuang.liang@starfivetech.com>
 <20230510015311.27505-2-changhuang.liang@starfivetech.com>
 <20230510-cloning-clapping-e262f00a94e8@wendy>
 <d80646ae-cf1b-234a-261c-3753f6cc9080@starfivetech.com>
 <20230510-city-scarf-023705d3c96a@spud>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230510-city-scarf-023705d3c96a@spud>
X-Originating-IP: [113.72.146.187]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_190717_797646_00670C14 
X-CRM114-Status: GOOD (  15.07  )
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



On 2023/5/11 3:51, Conor Dooley wrote:
> On Wed, May 10, 2023 at 03:20:14PM +0800, Changhuang Liang wrote:
>> On 2023/5/10 15:06, Conor Dooley wrote:
>>> On Tue, May 09, 2023 at 06:53:07PM -0700, Changhuang Liang wrote:
>>>> +          - starfive,jh7110-pmu
>>>> +      - items:
>>>> +          - enum:
>>>> +              - starfive,jh7110-aon-syscon
>>>> +          - const: syscon
>>>
>>> Unfortunately, this is not what was wanted.
>>> This syscon, of which power domain control is just one of the things that
>>> it can do, should be documented in
>>> Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>> alongside it's brethern "starfive,jh7110-sys-syscon" &
>>> "starfive,jh7110-stg-syscon".
>>>
>>
>> That means that I don't need to modify this original yaml file? 
> 
> Does "this original" mean starfive,jh7100-pmu.yaml?
> If so then...
> 

Yes.

>> I just need to move current changes in this patch into 
>> "Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml"?
> 
> Correct.
> It makes most sense for that binding, as it depends on the pll binding
> (because it has a ref: to it), to go through the clock tree in Xingyu's
> series.
> I'll apply the driver changes once the binding has been applied.
> 

I think that I have to send v4 after Xingyu's series resend new version. 
If drivers have no other comments. I will make the following changes:

patch 1/5: Only keep the content in starfive,jh7110-pmu.h, move other content into Xingyu's PLL series.
patch 5/5: Drop this patch, move the content into Xingyu's PLL series.
other patch: no change.

Thanks,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

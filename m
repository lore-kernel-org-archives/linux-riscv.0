Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0795EC6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 06:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9DEI7RjrVpnh/OgeroSQU9WwjmF6wqDMFJk5mCn949A=; b=rg2rG1ydghpx+o
	4PYIZC9liv4t3bN01q+jq0NMkUkj6wEx63pB92gfJrXGKFLcS1BzEGPTSzXFraRnfEV9M8siPXZPu
	5rgBwSwDWsmFKXeSUzU0S0BXkHU28M6609I2m4YKFlfdJXNbEIggOBWpbOreroM4KqXDe3FpCAc78
	bvx3GHisGoU4fRNBgiZNMnKe2Bz2Qo1sAm9TJA6ZTj7uDLeWc51o1Zw3LPAsrInJBPMQh70Paahc/
	v9ANViclY/cvKNkUXnJ555UNOgdmTzNYkWVh9qp4HDQIDYoLAe1nCfPbX3aIGLKKdQ6inMUTbF4d2
	MW8/Ny6Vs/5/4FPE6/tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp1lZ-004J9L-0O;
	Wed, 19 Apr 2023 06:58:09 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp1lV-004J5b-1Z
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 06:58:07 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2A64724E268;
	Wed, 19 Apr 2023 14:57:45 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Apr
 2023 14:57:45 +0800
Received: from [192.168.125.106] (113.72.144.253) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Apr
 2023 14:57:44 +0800
Message-ID: <17a9c045-9a82-bf36-65f1-b5bf6a7b2f33@starfivetech.com>
Date: Wed, 19 Apr 2023 14:57:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RESEND v2 0/6] Add JH7110 AON PMU support
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>, Hal Feng
	<hal.feng@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
 <20230419-subway-itinerary-9f5532929c14@wendy>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230419-subway-itinerary-9f5532929c14@wendy>
X-Originating-IP: [113.72.144.253]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_235805_680024_39104760 
X-CRM114-Status: UNSURE (   9.92  )
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



On 2023/4/19 14:23, Conor Dooley wrote:
> On Tue, Apr 18, 2023 at 08:56:40PM -0700, Changhuang Liang wrote:
[...]
>> - Used pmu_status save the pmu status offset.
>> - Changed "JH71XX_PMU_DPHY_SWITCH" to "JH71XX_AON_PMU_SWITCH"
>> - Changed copyright to "2022-2023"
> 
> For the future, when you resend, please say why you did.
> 

OK, thanks for your correction. I'll pay attention.

>>
>> v1: https://lore.kernel.org/all/20230411064743.273388-1-changhuang.liang@starfivetech.com/
>>
[...]
>>
>> base-commit: 197b6b60ae7bc51dd0814953c562833143b292aa
>> prerequisite-patch-id: 388b8adbb0fe2daf4d07a21eafd4f1bd50ce2403
> 
> Also, all of this pre-req patch id stuff is pretty useless. You've
> already pointed out the patches that this is based on, so IMO this
> information isn't helpful & is probably more likely confuse tooling
> than anything else.
> 
> Cheers,
> Conor.

OK, will not use "--base" for next.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

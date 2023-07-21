Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CAFEB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 09:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rAfh/eOpC4rehHetZmc6/hIO3vmSvxqI8XXqXfP9l+8=; b=YAzpajuJg21qro
	3+Pm2CBnDRDKfBa4nUa2xTEczUZhqkx6jd3W2A9+Fe0Mh6Xa1Xi580gAVWYPA3Bqj7aDnP1Xz9XzW
	dhOAcDw9LaVOjiuhLFxPjmVFHC461p8ZPG7phN41MeeUFZCPWYSZnhFcYvLr89loYHtzdmOwr3k+0
	QtgZ/+Y72uROs2paUkQnpZYpziomdPFi0y54gIqvoujAV6XEmSDI54VYZpbClQ+QQAl9dpTrLtGn4
	vW/qMh6to241RvPHoIB5K8A9RyuT9E6HMDGrBdqDdzXcCI15/e0ezawkViFl/B+taDok6smXgDIbM
	Hrkx1kLankSqDXQYEcLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMmY6-00DYsq-04;
	Fri, 21 Jul 2023 09:35:46 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMmY2-00DYpH-0Q
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 09:35:44 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 69B5980B2;
	Fri, 21 Jul 2023 17:35:18 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 17:35:18 +0800
Received: from [192.168.120.43] (171.223.208.138) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 17:35:16 +0800
Message-ID: <46663f3b-44b8-f2b6-df4b-9d639b3aff66@starfivetech.com>
Date: Fri, 21 Jul 2023 17:35:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 0/2] Add ethernet nodes for StarFive JH7110 SoC
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jose Abreu
	<joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
	<yanhong.wang@starfivetech.com>, Tommaso Merciai <tomm.merciai@gmail.com>
References: <20230714104521.18751-1-samin.guo@starfivetech.com>
 <20230720-cardstock-annoying-27b3b19e980a@spud>
 <42beaf41-947e-f585-5ec1-f1710830e556@starfivetech.com>
 <A0012BE7-8947-49C8-8697-1F879EE7B0B7@kernel.org>
 <ce3e0ffb-abcd-2392-8767-db460bce4b4b@starfivetech.com>
 <20230721-passive-smoked-d02c88721754@spud>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <20230721-passive-smoked-d02c88721754@spud>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_023542_520203_9D2B5D77 
X-CRM114-Status: GOOD (  15.69  )
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



on 2023/7/21 17:16:41, Conor Dooley wrote:
> On Fri, Jul 21, 2023 at 03:27:33PM +0800, Guo Samin wrote:
> 
>> Re: [PATCH v1 0/2] Add ethernet nodes for StarFive JH7110 SoC
>> From: Conor Dooley <conor@kernel.org>
> 
>> to: Guo Samin <samin.guo@starfivetech.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, netdev@vger.kernel.org
>> data: 2023/7/21
> 
> btw, please try and remove this stuff from your mails.
>

Sure
 
>>> On 21 July 2023 03:09:19 IST, Guo Samin <samin.guo@starfivetech.com> wrote:
> 
>>>> There is a question about the configuration of phy that I would like to consult you.
>>>>
>>>> Latest on motorcomm PHY V5[1]: Follow Rob Herring's advice
>>>> motorcomm,rx-xxx-driver-strength Changed to motorcomm,rx-xxx-drv-microamp .
>>>> V5 has already received a reviewed-by from Andrew Lunn, and it should not change again.
>>>>
>>>> Should I submit another pacthes based on riscv-dt-for-next? 
>>>
>>> Huh, dtbs_check passed for these patches,
>>> I didn't realise changes to the motorcomm stuff
>>> were a dep. for this. I'll take a look later.
> 
>> After discussing with HAL, I have prepared the code and considered adding the following patch to 
>> Motorcomm's patchsetes v6. (To fix some spelling errors in v5[1])
>> which will then send patches based on linux-next. What do you think? @Andrew @Conor
> 
> I think you are better off just sending the dts patch to me, adding a
> dts patch that will not apply to net-next to your motorcomm driver series
> will only really cause problems for the netdev patchwork automation.
>

Okay, I'll send you DTS separately.
 
>> [1] https://patchwork.kernel.org/project/netdevbpf/cover/20230720111509.21843-1-samin.guo@starfivetech.com
> 
> I meant to ack this yesterday, but it wasn't in my dt-binding review
> queue. I'll go do that now.


Best regards,
Samin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

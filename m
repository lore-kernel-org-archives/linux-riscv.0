Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A9EC636CC
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 01:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Zq+iDZsTCg4yT/qPAYfs0VUAozkZGL9ZDhYL5xAENI=; b=sdS63STBYBD8TH
	TgL3XZCA3UyQtc0069geoWh+KPf6SAY0oMDy9PW/awP8iyZfQ90qDacWfoLGBaRuMwIla3mcCIRe3
	xikxPoV3mMc1WLYeydlEOzfSGt4x9IdrIDZ/M6/a6+VrOf2DS0W99IY1RbBuT3F7wbsVLdC/QNyQh
	3UzAE90Sn/3xZ/2wSCU0Nxgbe7ilmKYfGUBJ7iGUeVaog5RoqNcfnoZzYZAwNxoWToX21CHi+N6oj
	Vnd7Auq/IbgklG8E+rUNBoFMglOc1NjVNHM4EJFHxlFyfdQRkBAP49p4YM5AIzB+HxntYjgiAhddA
	ESs+ru0wUTJkwjDKCCQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOq6k-0076sY-AY; Mon, 06 Feb 2023 01:15:46 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOq6b-0076qk-Ex
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 01:15:38 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id CDC8E24E337;
	Mon,  6 Feb 2023 09:15:13 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Feb
 2023 09:15:13 +0800
Received: from [192.168.120.49] (171.223.208.138) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Feb
 2023 09:15:12 +0800
Message-ID: <1866abb0-d49c-e911-817a-04700cc96cbb@starfivetech.com>
Date: Mon, 6 Feb 2023 09:15:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 0/7] Add Ethernet driver for StarFive JH7110 SoC
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
 <Y8h/D7I7/2KhgM00@spud>
 <81217dc9-5673-f7eb-3114-b39de8302687@starfivetech.com>
 <958E7B1C-E0FF-416A-85AD-783682BA8B54@kernel.org> <Y96S/MMzC92cOkbX@lunn.ch>
From: yanhong wang <yanhong.wang@starfivetech.com>
In-Reply-To: <Y96S/MMzC92cOkbX@lunn.ch>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230205_171537_658877_29247E66 
X-CRM114-Status: UNSURE (   9.74  )
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



On 2023/2/5 1:16, Andrew Lunn wrote:
>> >For the patchs of yt8531, see [1]
>> >
>> >1 - https://patchwork.kernel.org/project/netdevbpf/cover/20230202030037.9075-1-Frank.Sae@motor-comm.com/
>> 
>> Please put that info into the cover of the next round of your submission then.
> 
> These patches just got merged, so it is less of an issue now. Just
> make sure you are testing with net-next.
> 
> You might need an updated DT blob, the binding for the PHY had a few
> changes between the initial version to what actually got merged.
> 

I will update the DT blob about the binding for the PHY in the next version.

>      Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

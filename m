Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB66CC636D4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 01:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tjg3liOIShwraVvbIuraDdJ7EcJmoJ0lMoTXEczE3Rg=; b=iq0xD+OOaYAGTr
	VUw0ZP86IlYoKdYibuxYXgwjzPD2TTuXzcnvnqUg9LicdzvwSZBJ/8YGEJF6e7kBzHu4uKX4hM94X
	ZT/YCy9kUdKSb1OYVHbZpb2uE48bMiFoFokqpLnZbn96POAuuKjhvkZJ63z/Q3XI3bIKUOqAp0wgK
	SNnXGJNIIjgbCwbhTJ5IiAfnWCuEnUmcaOM0UiqKYar3cyjEIdT0nvp2e5MPfWO4l2GEoPfrvzXiy
	742h9pZMeU8e5tV+wXjQUe6nUoZwDJi3o2aDrZ24P4/+RsLDXeHzl0rjNc/5HeNpxt7dNOqa9nibc
	pKVug4BiFjwnrKmVFQOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOpxj-0076Ml-Mp; Mon, 06 Feb 2023 01:06:27 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOpxf-0076L1-0t
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 01:06:25 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6F6CD24E20D;
	Mon,  6 Feb 2023 09:05:45 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Feb
 2023 09:05:45 +0800
Received: from [192.168.120.49] (171.223.208.138) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Feb
 2023 09:05:43 +0800
Message-ID: <5daccff5-6f51-4ee3-29ca-a2ae32c6780e@starfivetech.com>
Date: Mon, 6 Feb 2023 09:05:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 0/7] Add Ethernet driver for StarFive JH7110 SoC
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
 <Y8h/D7I7/2KhgM00@spud>
 <81217dc9-5673-f7eb-3114-b39de8302687@starfivetech.com>
 <958E7B1C-E0FF-416A-85AD-783682BA8B54@kernel.org>
From: yanhong wang <yanhong.wang@starfivetech.com>
In-Reply-To: <958E7B1C-E0FF-416A-85AD-783682BA8B54@kernel.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230205_170623_381014_EA9A333C 
X-CRM114-Status: GOOD (  16.64  )
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



On 2023/2/4 22:22, Conor Dooley wrote:
> 
> 
> On 3 February 2023 04:02:54 GMT+01:00, yanhong wang <yanhong.wang@starfivetech.com> wrote:
>>
>>
>>On 2023/1/19 7:21, Conor Dooley wrote:
>>> Hey Yanhong!
>>> 
>>> On Wed, Jan 18, 2023 at 02:16:54PM +0800, Yanhong Wang wrote:
>>>> This series adds ethernet support for the StarFive JH7110 RISC-V SoC. The series
>>>> includes MAC driver. The MAC version is dwmac-5.20 (from Synopsys DesignWare).
>>>> For more information and support, you can visit RVspace wiki[1].
>>>> 	
>>>> This patchset should be applied after the patchset [2], [3], [4].
>>>> [1] https://wiki.rvspace.org/
>>>> [2] https://lore.kernel.org/all/20221118010627.70576-1-hal.feng@starfivetech.com/
>>>> [3] https://lore.kernel.org/all/20221118011108.70715-1-hal.feng@starfivetech.com/
>>>> [4] https://lore.kernel.org/all/20221118011714.70877-1-hal.feng@starfivetech.com/
>>> 
>>> I've got those series applied, albeit locally, since they're not ready,
>>> but I cannot get the Ethernet to work properly on my board.
>>> I boot all of my dev boards w/ tftp, and the visionfive2 is no exception.
>>> The fact that I am getting to the kernel in the first place means the
>>> ethernet is working in the factory supplied U-Boot [1].
>>> 
>>> However, in Linux this ethernet port does not appear to work at all.
>>> The other ethernet port is functional in Linux, but not in the factory
>>> supplied U-Boot.
>>> 
>>> Is this a known issue? If it's not, I'll post the logs somewhere for
>>> you. In case it is relevant, my board is a v1.2a.
>>> 
>>> Thanks,
>>> Conor.
>>> 
>>> 1 - U-Boot 2021.10 (Oct 31 2022 - 12:11:37 +0800), Build: jenkins-VF2_515_Branch_SDK_Release-10
>>
>>
>>No, this is not a issue. 
>>These patches need to rely on the yt8531 phy driver of motorcomm company
>>and the corresponding clock delay configuration to work normally, 
>>and the yt8531 phy driver is being submitted. I have applied the
>>motorcomm patchs during my test on board v1.2b, so the ethernet cannot work without
>>the application of the motorcomm patchs. 
>>
>>For the patchs of yt8531, see [1]
>>
>>1 - https://patchwork.kernel.org/project/netdevbpf/cover/20230202030037.9075-1-Frank.Sae@motor-comm.com/
> 
> Please put that info into the cover of the next round of your submission then.
> 

I will put the info into the cover letter in the next version.

> Thanks,
> Conor.
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

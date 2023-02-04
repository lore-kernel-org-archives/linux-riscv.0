Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB27C636CC
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Feb 2023 14:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5xAzTkp4+rQ+xWiSiWunjYfYs3TL/mJTUXEfvf0rBM=; b=tgUpfLW1n1/Clm
	lrxphh1hrAlew5/c7K8Geon4IOXV3veThPKyl1OswUnZ0lPDgXbUqAARKI8bU7UyX+yfnls9aiBNv
	+NV+007/o9T1Lkad7yeEconB1k3rOiJBhJdWHrVwxd1e5fqvxhu3VLXFAA+LQGMUVyyR1S30QFMrh
	95usEnc+vPpf3YehAHeumVkj3Rlnz1/kndYzzEtc+tlewHYwRWTtPVosGxttHsPj8Uzr1n53Vk7ZQ
	DvatE5bEwS5kk3S/2rmsGo7wWNvglLq3gabwJV/37eiILQEPh6Die+ErZF7AvwlQ8PMQob5MmgAtl
	8KReILLcbWQlMhSY5I6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOJcg-005BdC-NX; Sat, 04 Feb 2023 14:34:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOJcd-005BcI-IQ
	for linux-riscv@lists.infradead.org; Sat, 04 Feb 2023 14:34:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4A80BB80AE2;
	Sat,  4 Feb 2023 14:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518ADC433EF;
	Sat,  4 Feb 2023 14:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675521267;
	bh=LJ4CRn6Bmk26RHcXjAQDBTuF0R0J/GXwABjS4Ad3rmM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=sb1xBqtQluQbOFWab5ivA8tCeC+afVELQy2AUKSJwt02P2N7cxp2xJPvyAD52t9gn
	 I9c7VkhCeKbErCf7Ej+r4BcedPJ+LwDCiOAUxV15UG5okV411ENzILvbQYiGoMCrWz
	 PjZC8leRxjtvJQquLhhE9gH5IsFigb4eczwYr/3v7Ebqt7aCCdzWGb0AmPdJFUmnZZ
	 fDa73d+LT5eGVSFXM1DcXcGJaZKlbwSLjVUvDK0gF3HSPXC04SCVWIp9Kf/ZoJSQCM
	 cLGyTbbJ6rDhot6Cbu+IIaXB33eO6jqwxRBHl8BmJAEe+HmOK7A8eDfQsen8ntaYcS
	 2M9Q3YgyLDuiA==
Date: Sat, 04 Feb 2023 15:22:20 +0100
From: Conor Dooley <conor@kernel.org>
To: yanhong wang <yanhong.wang@starfivetech.com>
CC: linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v4 0/7] Add Ethernet driver for StarFive JH7110 SoC
User-Agent: K-9 Mail for Android
In-Reply-To: <81217dc9-5673-f7eb-3114-b39de8302687@starfivetech.com>
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com> <Y8h/D7I7/2KhgM00@spud> <81217dc9-5673-f7eb-3114-b39de8302687@starfivetech.com>
Message-ID: <958E7B1C-E0FF-416A-85AD-783682BA8B54@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_063431_937462_FBCBACA6 
X-CRM114-Status: GOOD (  18.20  )
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



On 3 February 2023 04:02:54 GMT+01:00, yanhong wang <yanhong.wang@starfivetech.com> wrote:
>
>
>On 2023/1/19 7:21, Conor Dooley wrote:
>> Hey Yanhong!
>> 
>> On Wed, Jan 18, 2023 at 02:16:54PM +0800, Yanhong Wang wrote:
>>> This series adds ethernet support for the StarFive JH7110 RISC-V SoC. The series
>>> includes MAC driver. The MAC version is dwmac-5.20 (from Synopsys DesignWare).
>>> For more information and support, you can visit RVspace wiki[1].
>>> 	
>>> This patchset should be applied after the patchset [2], [3], [4].
>>> [1] https://wiki.rvspace.org/
>>> [2] https://lore.kernel.org/all/20221118010627.70576-1-hal.feng@starfivetech.com/
>>> [3] https://lore.kernel.org/all/20221118011108.70715-1-hal.feng@starfivetech.com/
>>> [4] https://lore.kernel.org/all/20221118011714.70877-1-hal.feng@starfivetech.com/
>> 
>> I've got those series applied, albeit locally, since they're not ready,
>> but I cannot get the Ethernet to work properly on my board.
>> I boot all of my dev boards w/ tftp, and the visionfive2 is no exception.
>> The fact that I am getting to the kernel in the first place means the
>> ethernet is working in the factory supplied U-Boot [1].
>> 
>> However, in Linux this ethernet port does not appear to work at all.
>> The other ethernet port is functional in Linux, but not in the factory
>> supplied U-Boot.
>> 
>> Is this a known issue? If it's not, I'll post the logs somewhere for
>> you. In case it is relevant, my board is a v1.2a.
>> 
>> Thanks,
>> Conor.
>> 
>> 1 - U-Boot 2021.10 (Oct 31 2022 - 12:11:37 +0800), Build: jenkins-VF2_515_Branch_SDK_Release-10
>
>
>No, this is not a issue. 
>These patches need to rely on the yt8531 phy driver of motorcomm company
>and the corresponding clock delay configuration to work normally, 
>and the yt8531 phy driver is being submitted. I have applied the
>motorcomm patchs during my test on board v1.2b, so the ethernet cannot work without
>the application of the motorcomm patchs. 
>
>For the patchs of yt8531, see [1]
>
>1 - https://patchwork.kernel.org/project/netdevbpf/cover/20230202030037.9075-1-Frank.Sae@motor-comm.com/

Please put that info into the cover of the next round of your submission then.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

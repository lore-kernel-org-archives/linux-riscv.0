Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEF8C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 21:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e1hi5brN4+TZUD5tT/M2V9MvmSsVh76+NWvdQoRF1mc=; b=ZQ4nduUSOr+upV
	C2+8QdTtkVpUkZBjYCNs18tl1LR6W2JP62WHoYevLteV2XpwDXSrxKFLI5XjleywGQ8pP2z25AMtt
	19Fyx5rXDiHRalK+/yCvf9dyET35O7tiS7Mz3it1zhsgjAWbVQlkms8yXwUtcRNFNmIXsreE3vdX/
	pSDp6vSBhNtXjzM0/W9RuwGZgvFqK2jD/aUK+8zE0qzhuWIAlaJGCpXyElgFJ4bRoWpNSmSXfI/bM
	yGMPupeheH8Uz8Kxb2hJpIIqBXdp0GOeVioPcegtwUddIrdZR/EQAQ/ZWI7fHnPVOUewY5H/y3GDI
	/vTtMgFU6KmSQoDIdHGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovPZy-0082R5-6i; Wed, 16 Nov 2022 21:04:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovPZu-0082PQ-Qj
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 21:04:16 +0000
Received: from [192.168.1.90] (unknown [188.27.33.151])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C468966028E7;
	Wed, 16 Nov 2022 21:04:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668632647;
	bh=tiAa/p8KzV3n6K1lJ9/iA6qi8H8A6tMn2pTryJbY0x4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TKggDaOE9bBTxwTCEwcJ2SQncpcY06Lit5md6A2SdlZX1/mtfc39lR026QGfzWeoX
	 3VXjjHQtVn9oA5XUbpMKHkBZKd3COm9ymc7jWo/P70YgiyfvNDJgXV9VnBBLqC/qUP
	 BO9eyGe5+jGHMmEmvPALYfBF4UPfvyMN7KY7G7nC3HD66W7ZYaj3eYy5l9J8Ewi8Lk
	 1VGtR9zx7DaWaz/3/ru1Jj5k2eGx8IKerdxiSuefnHo/M4DIjAYBUNiFk526CapOvg
	 lxWTuk5nW5oU0VXm3zR7HsVZqeFQ7O/XDtOqrYV3V5mnjuOc4wTQtPGBhpV4FTKcdS
	 bFf0bTBNZ5rfA==
Message-ID: <3b4b8aef-a06d-36b5-a143-78f0ce30eb77@collabora.com>
Date: Wed, 16 Nov 2022 23:04:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 0/3] Enable initial support for StarFive VisionFive V1
 SBC
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Drew Fustini <drew@beagleboard.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor.dooley@microchip.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20221017210542.979051-1-cristian.ciocaltea@collabora.com>
 <Y3Ui9mmcvuWMw2AL@spud>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <Y3Ui9mmcvuWMw2AL@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_130415_124512_0E7350C8 
X-CRM114-Status: GOOD (  19.50  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/16/22 19:50, Conor Dooley wrote:
> On Tue, Oct 18, 2022 at 12:05:39AM +0300, Cristian Ciocaltea wrote:
>> The StarFive VisionFive V1 SBC [1] is similar with the already supported
>> BeagleV Starlight Beta board, both being based on the StarFive JH7100 SoC.
>>
>> In addition to documenting the necessary compatibles, this patch series
>> moves most of the content from jh7100-beaglev-starlight.dts to a new file
>> jh7100-common.dtsi, to be shared between the two boards.
>>
>> No other changes are required in order to successfully boot the board.
>>
>> [1] https://github.com/starfive-tech/VisionFive
> 
> Hey Cristian,
> 
> Apologies for the delay here, we've been sorting out re-routing RISC-V
> DT stuff via the SoC tree. That should be sorted now, so I have picked
> the series up. Should be at:
> https://git.kernel.org/conor/c/a3fe69160c7328a284ebc711ccb689f3beec42dc

Hi Conor,

No problem, thanks for taking care of this!

Regards,
Cristian

> Thanks,
> Conor.
> 
>>
>> Changes in v4:
>>   - Rebased onto v6.1.0-rc1
>>   - Fixed a conflict in patch 2/3 as pinctrl-starfive.h has been renamed
>>     to pinctrl-starfive-jh7100.h
>>
>> Changes in v3:
>>   - Added Reviewed-by tag from Krzysztof in patch 1/3
>>   - Optimized patch 2/3 by enabling copy detection on "git format-patch",
>>     as indicated by Krzysztof
>>
>> Changes in v2:
>>   - Simplified documentation by using 'enum' instead of 'const' in
>>     patch 1/3, according to Conor's review
>>   - Added Reviewed-by tags from Conor
>>
>> Cristian Ciocaltea (3):
>>    dt-bindings: riscv: starfive: Add StarFive VisionFive V1 board
>>    riscv: dts: starfive: Add common DT for JH7100 based boards
>>    riscv: dts: starfive: Add StarFive VisionFive V1 device tree
>>
>>   .../devicetree/bindings/riscv/starfive.yaml   |   4 +-
>>   arch/riscv/boot/dts/starfive/Makefile         |   2 +-
>>   .../dts/starfive/jh7100-beaglev-starlight.dts | 153 +-----------------
>>   ...aglev-starlight.dts => jh7100-common.dtsi} |   3 -
>>   .../jh7100-starfive-visionfive-v1.dts         |  20 +++
>>   5 files changed, 25 insertions(+), 157 deletions(-)
>>   copy arch/riscv/boot/dts/starfive/{jh7100-beaglev-starlight.dts => jh7100-common.dtsi} (96%)
>>   create mode 100644 arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
>>
>>
>> base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
>> -- 
>> 2.38.0
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

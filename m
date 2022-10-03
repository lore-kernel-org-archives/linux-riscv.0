Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44E1C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 11:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYhvhqbyDMX08FCKLgForpnIrSDRUEexGXfZgt4RjmQ=; b=VSSfF7RO0GYMeG
	RBte4ZgHUUbFvFSm0T5yxhHKnUFixzl7YDDS8MGx7ON6NYEJPjt/b27z5QumThSOkObpiqTmcLWWY
	RNNFUwXkQq9/VPk3s/AvDzgMBjiH6Gi4G3lX6qLxhB6Tk16IPHhj0exYOnNCkXrAcMYwlkPC9tQbs
	DlBRBluaxqAP9kRcrje8hBNyyMMNZ8oy3p2TcSI75kFrur3Pg3PgeseJcB9Ft81mG4OAbJ+kF5p2w
	T15ma2UlIIi1UyjB4WBrEI7Ftiz3+YRRQgrZao80PZmkpds4RH7Trwl/OuEnpOc6GvA+4c/IeVvl4
	3UmDg+AmXxIacmt0eCFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofJHY-005QY8-28; Mon, 03 Oct 2022 11:06:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofJHU-005QX8-MT
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 11:06:42 +0000
Received: from [192.168.1.90] (unknown [188.27.55.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D625A6602297;
	Mon,  3 Oct 2022 12:06:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664795196;
	bh=Uknm/eeST+46BULBKRwl+r3IUY1mmXz/O75r7yudO1U=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Ibf1wkp4l50qt4baeVbevrRUQA+SgpW1cAWfkZ3LYSmX/0ty4YUJnTAmeKyj15/sM
	 1IRcw3fnLRUvQP0Sj0JBgsCBcp7iSw6nOhPeW3YX+ga9m+Cq9Vncm9uxNHc4BMijeA
	 v53vUpmOTfYvR2pL5Ea01djCexkb/9vXMIrzIbwvrJtnMgSbsAfYbZJb8LqDIGw90k
	 JKt/eQ+hUgsWOz7C1FOYPBmCVnTqSLU5IU1vN4y87bSEuHyxj9cQfauwh9nD7Ube3Q
	 ABmQOUZY/qa/hrrbUACC9oQ9lQectosZDOj7eWon9o+ZdBMhrszxKev77az4Owm9d9
	 jW/77hBj9pv2Q==
Message-ID: <c5169131-486e-9808-ba48-b7abe1be6a99@collabora.com>
Date: Mon, 3 Oct 2022 14:06:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 0/3] Enable initial support for StarFive VisionFive V1
 SBC
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Drew Fustini <drew@beagleboard.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20220908142914.359777-1-cristian.ciocaltea@collabora.com>
In-Reply-To: <20220908142914.359777-1-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_040640_993277_6A93AA02 
X-CRM114-Status: GOOD (  18.10  )
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

Please let me know if there is anything else missing in order to get 
this queued for merging.

Thanks,
Cristian

On 9/8/22 17:29, Cristian Ciocaltea wrote:
> The StarFive VisionFive V1 SBC [1] is similar with the already supported
> BeagleV Starlight Beta board, both being based on the StarFive JH7100 SoC.
> 
> In addition to documenting the necessary compatibles, this patch series
> moves most of the content from jh7100-beaglev-starlight.dts to a new file
> jh7100-common.dtsi, to be shared between the two boards.
> 
> No other changes are required in order to successfully boot the board.
> 
> [1] https://github.com/starfive-tech/VisionFive
> 
> Changes in v3:
>   - Added Reviewed-by tag from Krzysztof in patch 1/3
>   - Optimized patch 2/3 by enabling copy detection on "git format-patch",
>     as indicated by Krzysztof
> 
> Changes in v2:
>   - Simplified documentation by using 'enum' instead of 'const' in
>     patch 1/3, according to Conor's review
>   - Added Reviewed-by tags from Conor
> 
> Cristian Ciocaltea (3):
>    dt-bindings: riscv: starfive: Add StarFive VisionFive V1 board
>    riscv: dts: starfive: Add common DT for JH7100 based boards
>    riscv: dts: starfive: Add StarFive VisionFive V1 device tree
> 
>   .../devicetree/bindings/riscv/starfive.yaml   |   4 +-
>   arch/riscv/boot/dts/starfive/Makefile         |   2 +-
>   .../dts/starfive/jh7100-beaglev-starlight.dts | 153 +-----------------
>   ...aglev-starlight.dts => jh7100-common.dtsi} |   3 -
>   .../jh7100-starfive-visionfive-v1.dts         |  20 +++
>   5 files changed, 25 insertions(+), 157 deletions(-)
>   copy arch/riscv/boot/dts/starfive/{jh7100-beaglev-starlight.dts => jh7100-common.dtsi} (96%)
>   create mode 100644 arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

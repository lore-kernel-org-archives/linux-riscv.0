Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C69C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 10:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2DTbavtuvajLxf6+jJazc13gRIVfZk35GvfmY2XEC4=; b=1hArV30kBmlkEY
	+9Bsc9uQVjVY12ekx0t3Kq7zW3TzPAbQqB7UzUfkFDO0eUuvH8p3hZiE7PRf/yEacLbP746ruW1qA
	mj3hfyTQ7b4NScwEpNdrvBRtgS9K6doPTopjKiPij8406BYeeH8y20APL3M20d+01GEPcJjFaL3Mu
	RiXmSgH7BrwzFyZLwEoneCMoaB10r75h4uHYp1JfIyhVl0poi4LkZDbfzoH9sAK/EQWpcc7J7Kg+V
	9Hhl8e+Q045qElnxUGCOJQGwk2A7OKs7C3zrMw4xLhVnz8zgDKVGGLakshLOHsW7vNiGUImir3DR/
	CvwI5Db/X0r5E37H0JNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofey7-009KS3-8j; Tue, 04 Oct 2022 10:16:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofey3-009KQu-BS
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 10:16:05 +0000
Received: from [192.168.1.90] (unknown [188.27.55.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C77206601FFC;
	Tue,  4 Oct 2022 11:16:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664878561;
	bh=WmkVCX+UEBtG8eNVUracAzmGVBls4tSdfNa3kk6YxVs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ASCtbKQ2jTy3TdYyRI0ViiT2Ewo6X1dPv0YBzWRQXsdz1Ed/UgGsJwE+H7C6vE4ad
	 kSpXZqnqeiqprVEsDLKBSSsPTXSiYT2Uc9s9MhWiRTSG7x0yPTK8JU8unTeis7sKSb
	 5i3mlBykRLPeM57AJJ/XHhv5RHcrBUPwnF/FPTY5Bpc/jXu0pHOik7Tf0nKrwEBfmw
	 A8vQyt4XoZo3mwqVltDNiK+bgQkow7HjzKZ2HW3oKdeXRXIYvzTWERLjUx2ZyFzBwu
	 WjNs7f40IkO2u63UyMp2+LbJH4d+0S8kjLKkUHrzjugXjwBLq4O3qhHsSI22JCJUbr
	 zpSsv4178cC2g==
Message-ID: <b1139318-b87e-b257-28ba-e2b0c7596053@collabora.com>
Date: Tue, 4 Oct 2022 13:15:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 0/3] Enable initial support for StarFive VisionFive V1
 SBC
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Drew Fustini <drew@beagleboard.org>, Emil Renner Berthing <kernel@esmil.dk>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20220908142914.359777-1-cristian.ciocaltea@collabora.com>
 <c5169131-486e-9808-ba48-b7abe1be6a99@collabora.com> <YzwCWDN4NyIQ8a46@wendy>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <YzwCWDN4NyIQ8a46@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_031603_554125_DE1A2A9D 
X-CRM114-Status: GOOD (  18.80  )
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

On 10/4/22 12:52, Conor Dooley wrote:
> On Mon, Oct 03, 2022 at 02:06:32PM +0300, Cristian Ciocaltea wrote:
>> Please let me know if there is anything else missing in order to get this
>> queued for merging.
> 
> Hey Cristian,
> 
> LinusW has applied a conflicting change for 6.1 as he renamed the
> pinctrl header that you have moved from one file to another in this
> patch [0]. Could you rebase once that lands upstream please?

Hi Conor,

Sure, I will rebase as soon as rc1 is out.

Thanks,
Cristian

> 
> Thanks,
> Conor.
> 
> 0 - https://lore.kernel.org/linux-riscv/CACRpkdZmmMjVwpHxkJP+Ui0XJgrdZx8kpVybifbwkRB1_uMhAg@mail.gmail.com/
> 
>>
>> Thanks,
>> Cristian
>>
>> On 9/8/22 17:29, Cristian Ciocaltea wrote:
>>> The StarFive VisionFive V1 SBC [1] is similar with the already supported
>>> BeagleV Starlight Beta board, both being based on the StarFive JH7100 SoC.
>>>
>>> In addition to documenting the necessary compatibles, this patch series
>>> moves most of the content from jh7100-beaglev-starlight.dts to a new file
>>> jh7100-common.dtsi, to be shared between the two boards.
>>>
>>> No other changes are required in order to successfully boot the board.
>>>
>>> [1] https://github.com/starfive-tech/VisionFive
>>>
>>> Changes in v3:
>>>    - Added Reviewed-by tag from Krzysztof in patch 1/3
>>>    - Optimized patch 2/3 by enabling copy detection on "git format-patch",
>>>      as indicated by Krzysztof
>>>
>>> Changes in v2:
>>>    - Simplified documentation by using 'enum' instead of 'const' in
>>>      patch 1/3, according to Conor's review
>>>    - Added Reviewed-by tags from Conor
>>>
>>> Cristian Ciocaltea (3):
>>>     dt-bindings: riscv: starfive: Add StarFive VisionFive V1 board
>>>     riscv: dts: starfive: Add common DT for JH7100 based boards
>>>     riscv: dts: starfive: Add StarFive VisionFive V1 device tree
>>>
>>>    .../devicetree/bindings/riscv/starfive.yaml   |   4 +-
>>>    arch/riscv/boot/dts/starfive/Makefile         |   2 +-
>>>    .../dts/starfive/jh7100-beaglev-starlight.dts | 153 +-----------------
>>>    ...aglev-starlight.dts => jh7100-common.dtsi} |   3 -
>>>    .../jh7100-starfive-visionfive-v1.dts         |  20 +++
>>>    5 files changed, 25 insertions(+), 157 deletions(-)
>>>    copy arch/riscv/boot/dts/starfive/{jh7100-beaglev-starlight.dts => jh7100-common.dtsi} (96%)
>>>    create mode 100644 arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
>>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

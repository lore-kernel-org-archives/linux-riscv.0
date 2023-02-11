Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED3AC636CC
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 11:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JypjbR3KtwYh0eTLbej6VQBAk9N5+4Pv2dYE29CpuyE=; b=Bz6JYqKYQoP0dL
	VwfOMhQgqpjN9YDzUKrL59ynWNyj1nSNYtMOJ5kd2HYuIZNQ9DJqUjpmcB/WSqL1y4RlTxLO0AX86
	/jxMdb9OjU+GuN/6DZxTn56Bm73/E0sHMGsDGXVQPAGA6T3yFVQ2XY5DFXYuQ1oNZJCpeDeUAZmQ0
	Uvk14ZhScBK7S9hr9nagO8hbXic+TqF/ZBhnNasT/fgdG0EsQ3szLbJ+iIVvJ1Xgegzf6HcsYnT87
	2EXXkBtjX5adQHnDtZTgTndRbP6jToYx6aXFhso4BOKNei7HBvRkO2W+RqaKS2WUoKsXkRE2945hz
	fc2YcTmCzTQ2AOKT1BJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQoSB-009NR4-8x; Sat, 11 Feb 2023 11:54:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQoRz-009NPn-V9; Sat, 11 Feb 2023 11:53:53 +0000
Received: from [192.168.1.90] (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A68AF6602111;
	Sat, 11 Feb 2023 11:53:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676116430;
	bh=pg4cvypY8FQKYrpV9fWDZ348Gx/msla9+ReQno8Gwf4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TTpyL64WvTvjHDWR4s8teHDz+yxz7/0DnZ/kaLk9N9qvglrWYAPmktHIo44GAPyYM
	 IS9aG4ozuS/c/j0GYEnQJzRRzOVQsEiyCw66j/flJaAQYmU64KNuqMlM62Hbm9Uw79
	 tnHmsoTqFX7G8pwinGvFonBYPwbdcSXEy/ltMvBSgB1YnBCqiCRHWmF74eUoYnsHCQ
	 S+BLhNB6xh17yQCRVtx3QPWslvxpr+CgZY5h2yYIpwBwZb+jKza/QvCZGdvw7JrNG6
	 JP7mobsbJLD0IOfQw/t1JxgzAufgSsgFgdPQw3HtAw1NtL5igpApMWPUS9qKUnuw4H
	 8IVCYNKbkvfDQ==
Message-ID: <b5fa8148-1dc6-b8a7-2f5d-95f0354197e6@collabora.com>
Date: Sat, 11 Feb 2023 13:53:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 00/12] Enable networking support for StarFive JH7100 SoC
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, arnd@arndb.de,
 prabhakar.csengg@gmail.com
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <Y+d36nz0xdfXmDI1@spud>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <Y+d36nz0xdfXmDI1@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_035352_304613_D1C39AEB 
X-CRM114-Status: GOOD (  24.06  )
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

Hi Conor,

On 2/11/23 13:11, Conor Dooley wrote:
> Hey Cristian!
> 
> +CC Arnd, Prabhakar
> 
> On Sat, Feb 11, 2023 at 05:18:09AM +0200, Cristian Ciocaltea wrote:
>> This patch series adds ethernet support for the StarFive JH7100 SoC and
>> makes it available for the StarFive VisionFive V1 and BeagleV Starlight
>> boards, although I could only validate on the former SBC.
>>
>> The work is heavily based on the reference implementation [1] and requires
>> the non-coherent DMA support provided by Emil via the Sifive Composable
>> Cache controller.
>>
>> Also note there is an overlap in "[PATCH 08/12] net: stmmac: Add glue layer
>> for StarFive JH7100 SoC" with the Yanhong Wang's upstreaming attempt [2]:
>> "[PATCH v4 5/7] net: stmmac: Add glue layer for StarFive JH7110 SoCs".
>>
>> Since I cannot test the JH7110 SoC, I dropped the support for it from Emil's
>> variant of the stmmac glue layer. Hence, we might need a bit of coordination
>> in order to get this properly merged.
> 
> To be honest, that one is the least of your worries sequencing wise.
> Anything doing non-coherent DMA on RISC-V that doesn't use instructions is
> dependant on Prabhakar's series:
> https://lore.kernel.org/linux-riscv/20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com/#t
> That's kinda stalled out though, waiting on Arnd to make some changes to
> the cross-arch DMA code:
> https://lore.kernel.org/linux-riscv/ea4cb121-97e9-4365-861a-b3635fd34721@app.fastmail.com/

Thank you for pointing this out, I wasn't aware of it!

> I was talking to Emil about the non-coherent support at FOSDEM actually,
> and I see no real reason not to bring the JH7100 non-coherent support in
> if we are doing it for other SoCs.
> 
> So yeah, hopefully we shall get there at some point soonTM...

That would be great, I'll try to monitor the progress and re-spin the 
series as soon as the non-coherent support is figured out.

Regards,
Cristian

> Sorry,
> Conor.

>> [1] https://github.com/starfive-tech/linux/commits/visionfive
>> [2] https://lore.kernel.org/linux-riscv/20230118061701.30047-6-yanhong.wang@starfivetech.com/
>>
>> Cristian Ciocaltea (7):
>>    dt-bindings: riscv: sifive-ccache: Add compatible for StarFive JH7100
>>      SoC
>>    dt-bindings: riscv: sifive-ccache: Add 'uncached-offset' property
>>    dt-bindings: net: Add StarFive JH7100 SoC
>>    riscv: dts: starfive: Add dma-noncoherent for JH7100 SoC
>>    riscv: dts: starfive: jh7100: Add ccache DT node
>>    riscv: dts: starfive: jh7100: Add sysmain and gmac DT nodes
>>    riscv: dts: starfive: jh7100-common: Setup pinmux and enable gmac
>>
>> Emil Renner Berthing (5):
>>    soc: sifive: ccache: Add StarFive JH7100 support
>>    soc: sifive: ccache: Add non-coherent DMA handling
>>    riscv: Implement non-coherent DMA support via SiFive cache flushing
>>    dt-bindings: mfd: syscon: Add StarFive JH7100 sysmain compatible
>>    net: stmmac: Add glue layer for StarFive JH7100 SoC
>>
>>   .../devicetree/bindings/mfd/syscon.yaml       |   1 +
>>   .../devicetree/bindings/net/snps,dwmac.yaml   |  15 +-
>>   .../bindings/net/starfive,jh7100-dwmac.yaml   | 106 ++++++++++++
>>   .../bindings/riscv/sifive,ccache0.yaml        |  33 +++-
>>   MAINTAINERS                                   |   6 +
>>   arch/riscv/Kconfig                            |   6 +-
>>   .../boot/dts/starfive/jh7100-common.dtsi      |  78 +++++++++
>>   arch/riscv/boot/dts/starfive/jh7100.dtsi      |  55 +++++++
>>   arch/riscv/mm/dma-noncoherent.c               |  37 ++++-
>>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
>>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>>   .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 155 ++++++++++++++++++
>>   drivers/soc/sifive/Kconfig                    |   1 +
>>   drivers/soc/sifive/sifive_ccache.c            |  71 +++++++-
>>   include/soc/sifive/sifive_ccache.h            |  21 +++
>>   15 files changed, 587 insertions(+), 11 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/net/starfive,jh7100-dwmac.yaml
>>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
>>
>> -- 
>> 2.39.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

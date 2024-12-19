Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8058CE77184
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 09:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gr7NAmlliqEIsxk8o6zKC72BEyCpl3smDrMxo991vvc=; b=MUsCCJ76BJAKNh
	3h+88TgkMVLXQGFoJvU7MI94oi6u3Y6tm5Ye1pGl4t7uZKoQl8WWABxd5P3HqgKAzdBocbmJZENg2
	fGcPGUfi8nYbSICX5clfe6J3iEVbS6noJa5f2C3AeKD1Tzfv9QXmIt/r8ER0in5v/qjZRlQeBgjIi
	4HD5lQxubuf2blTHykzPv4b1qEiudpHdKMdui1XHeJiWZQ1xrfDVDjjq8LuCpkq+jIO84EcLQYSVi
	rv8wGAgiXgNTPz8gZyp2JUkHDLy93s6BqS40OFxoVj503MEjCvx5pCLYZCqTVi3Mfh2BGA3RFWX2c
	bvxO1lhoCqhGdtwM9N1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOD2V-00000001Reu-1g4P;
	Thu, 19 Dec 2024 09:41:51 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOD2R-00000001Rck-1735
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 09:41:49 +0000
Received: from [IPV6:2605:59c8:31de:bf00:37c2:fe62:c21b:ab46] (unknown [IPv6:2605:59c8:31de:bf00:37c2:fe62:c21b:ab46])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id E20F8B221243;
	Thu, 19 Dec 2024 10:41:38 +0100 (CET)
Message-ID: <4ae45ee4-69ed-4fe8-9350-9f83c13a9c89@freeshell.de>
Date: Thu, 19 Dec 2024 01:41:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: Use named definition
 for mmc1 card detect
To: Conor Dooley <conor@kernel.org>
Cc: Hal Feng <hal.feng@starfivetech.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Jisheng Zhang <jszhang@kernel.org>, Conor Dooley
 <conor.dooley@microchip.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20241210040652.164030-1-e@freeshell.de>
 <20241216-elixir-cupped-f7a83bce4e12@spud>
 <ZQ2PR01MB1307F1FC7EEB8701525AC9DEE604A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <bd4df536-0a5d-4ba9-ad0c-51a7828acd9c@freeshell.de>
 <20241217-strained-latch-52bf7d03716d@spud>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20241217-strained-latch-52bf7d03716d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_014148_293699_89B2C48B 
X-CRM114-Status: GOOD (  13.61  )
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



On 12/17/24 10:33, Conor Dooley wrote:
> On Mon, Dec 16, 2024 at 07:25:59PM -0800, E Shattow wrote:
>> Hi, Hal
>>
>> On 12/16/24 18:02, Hal Feng wrote:
>>>> On 17.12.24 04:13, Conor Dooley wrote:
>>>> On Mon, 09 Dec 2024 20:06:46 -0800, E Shattow wrote:
>>>>> Use named definition for mmc1 card detect GPIO instead of numeric literal.
>>>>>
>>>>>
>>>>
>>>> Applied to riscv-dt-for-next, thanks!
>>>>
>>>> [1/1] riscv: dts: starfive: jh7110-common: Use named definition for mmc1
>>>> card detect
>>>>         https://git.kernel.org/conor/c/c96f15d79172
>>>
>>> No, here "41" means the GPIO number, but GPI_SYS_SDIO1_CD means the
>>> multiplexed function and should be used by pinctrl pinmux not gpio subsystem.
>>> Although GPI-SYS_SDIO1_CD is numerically the same as 41.
>>>
>>> Best regards,
>>> Hal
>>
>> You're right, Hal. I'm confused trying to make sense of this.
>>
>>  From dts/upstream/src/riscv/starfive/jh7110-pinfunc.h:
>>
>> "gpio nr:  gpio number, 0 - 63"
>>
>> And yet in dts/upstream/src/riscv/starfive/jh7110-common.dtsi there's:
>>
>>>                         pinmux = <PINMUX(64, 0)>,
>>>                                  <PINMUX(65, 0)>,
>>>                                  <PINMUX(66, 0)>,
>>>                                  <PINMUX(67, 0)>,
>>>                                  <PINMUX(68, 0)>,
>>>                                  <PINMUX(69, 0)>,
>>>                                  <PINMUX(70, 0)>,
>>>                                  <PINMUX(71, 0)>,
>>>                                  <PINMUX(72, 0)>,
>>>                                  <PINMUX(73, 0)>;
>>
>>
>> Loosely on the subject of MMC interface and GPIO numbering, what is the
>> above code doing? These are not GPIO numbers 0-63 so what is this?
>>
>> I'm trying to understand this so I can write the Mars CM (-Lite) dts.
>>
> 
> 
>> Conor, and Hal: sorry for the mistake there.
> 
> No worries, I've dropped the patch.

Okay. I was able to find pad definitions in the vendor Linux source: 
https://github.com/starfive-tech/linux/blob/5dfc879916d946dcc2521ef1eccd1d8bfb06a75e/include/dt-bindings/pinctrl/starfive%2Cjh7110-pinfunc.h

There are definitions for GPIO indexes beyond 0-63:

 > #define   PAD_SD0_CLK     64
 > #define   PAD_SD0_CMD     65
 > #define   PAD_SD0_DATA0   66
 > #define   PAD_SD0_DATA1   67
 > #define   PAD_SD0_DATA2   68
 > #define   PAD_SD0_DATA3   69
 > #define   PAD_SD0_DATA4   70
 > #define   PAD_SD0_DATA5   71
 > #define   PAD_SD0_DATA6   72
 > #define   PAD_SD0_DATA7   73
 > #define   PAD_SD0_STRB    74
 > #define   PAD_GMAC1_MDC   75
 > #define   PAD_GMAC1_MDIO  76
 > #define   PAD_GMAC1_RXD0  77
 > #define   PAD_GMAC1_RXD1  78
 > #define   PAD_GMAC1_RXD2  79
 > #define   PAD_GMAC1_RXD3  80
 > #define   PAD_GMAC1_RXDV  81
 > #define   PAD_GMAC1_RXC   82
 > #define   PAD_GMAC1_TXD0  83
 > #define   PAD_GMAC1_TXD1  84
 > #define   PAD_GMAC1_TXD2  85
 > #define   PAD_GMAC1_TXD3  86
 > #define   PAD_GMAC1_TXEN  87
 > #define   PAD_GMAC1_TXC   88
 > #define   PAD_QSPI_SCLK   89
 > #define   PAD_QSPI_CSn0   90
 > #define   PAD_QSPI_DATA0  91
 > #define   PAD_QSPI_DATA1  92
 > #define   PAD_QSPI_DATA2  93
 > #define   PAD_QSPI_DATA3  94

Where I got lost is that these are in mainline with 
include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h

I did not find these pad definitions above index 63 mentioned in the 
JH7110 Technical Reference Manual.

Is it worth sending a patch to use those definitions in jh7110-common.dtsi?

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

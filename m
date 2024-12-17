Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930D9E77183
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 03:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kBq+OpJMyRXi8CjsMhd0Cs9RPN9dTTpHttQBKMbqZq4=; b=TD3iWyfDZw9hzS
	fKCqN7ZBYzbildobIqLDFAgZhVTeFGxnhfkYQryCn5etSqGOkHr3yfZbFaqCPQseVyJG+d7fxnGE5
	QYTmzgUmVJpEHnRbOFukNiwSIIgVyOcVFZC05zwA1hJF+vyNurIRLZ6p4/RAqWwriMYKw6ZaVF351
	sNbxhI/UII/3oKqwerrmmAqnrbDT4yPH/ggtsIuPw6upbDMimBun92yPTdF2c94quakyJgAUCm1IM
	MPp1MiUHlEcH5SPnCltrq/Gd9kbtfl4xC4BekvXL1Bfae0L1vL1m6cFrCcmX7U67d6FuhTVnG+18P
	F6TE0iRSwvqnpim83deg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNODr-0000000C2km-1Dsr;
	Tue, 17 Dec 2024 03:26:11 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNODo-0000000C2kM-3QGa
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 03:26:10 +0000
Received: from [IPV6:2605:59c8:31de:bf00:37c2:fe62:c21b:ab46] (unknown [IPv6:2605:59c8:31de:bf00:37c2:fe62:c21b:ab46])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 745A8B4B2470;
	Tue, 17 Dec 2024 04:26:01 +0100 (CET)
Message-ID: <bd4df536-0a5d-4ba9-ad0c-51a7828acd9c@freeshell.de>
Date: Mon, 16 Dec 2024 19:25:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: Use named definition
 for mmc1 card detect
To: Hal Feng <hal.feng@starfivetech.com>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Jisheng Zhang <jszhang@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20241210040652.164030-1-e@freeshell.de>
 <20241216-elixir-cupped-f7a83bce4e12@spud>
 <ZQ2PR01MB1307F1FC7EEB8701525AC9DEE604A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <ZQ2PR01MB1307F1FC7EEB8701525AC9DEE604A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_192609_010264_E7950A8B 
X-CRM114-Status: UNSURE (   9.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi, Hal

On 12/16/24 18:02, Hal Feng wrote:
>> On 17.12.24 04:13, Conor Dooley wrote:
>> On Mon, 09 Dec 2024 20:06:46 -0800, E Shattow wrote:
>>> Use named definition for mmc1 card detect GPIO instead of numeric literal.
>>>
>>>
>>
>> Applied to riscv-dt-for-next, thanks!
>>
>> [1/1] riscv: dts: starfive: jh7110-common: Use named definition for mmc1
>> card detect
>>        https://git.kernel.org/conor/c/c96f15d79172
> 
> No, here "41" means the GPIO number, but GPI_SYS_SDIO1_CD means the
> multiplexed function and should be used by pinctrl pinmux not gpio subsystem.
> Although GPI-SYS_SDIO1_CD is numerically the same as 41.
> 
> Best regards,
> Hal

You're right, Hal. I'm confused trying to make sense of this.

 From dts/upstream/src/riscv/starfive/jh7110-pinfunc.h:

"gpio nr:  gpio number, 0 - 63"

And yet in dts/upstream/src/riscv/starfive/jh7110-common.dtsi there's:

 >                        pinmux = <PINMUX(64, 0)>,
 >                                 <PINMUX(65, 0)>,
 >                                 <PINMUX(66, 0)>,
 >                                 <PINMUX(67, 0)>,
 >                                 <PINMUX(68, 0)>,
 >                                 <PINMUX(69, 0)>,
 >                                 <PINMUX(70, 0)>,
 >                                 <PINMUX(71, 0)>,
 >                                 <PINMUX(72, 0)>,
 >                                 <PINMUX(73, 0)>;


Loosely on the subject of MMC interface and GPIO numbering, what is the 
above code doing? These are not GPIO numbers 0-63 so what is this?

I'm trying to understand this so I can write the Mars CM (-Lite) dts.

Conor, and Hal: sorry for the mistake there.

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

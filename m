Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43398C636D6
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 10:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGOygs/gePhbgQBcLoLhWGDVR5LfuQbDNaTnRrKu2zU=; b=g0J7jyZaHqhy95
	6RIn9zo8JPiug70EXsmFMlEpPgm9sj0xQH5rDM1CRnkKiRITWOJMBwud7nlUvqWzmKCdSlEgBGYiz
	qGl0dLXInPh/ocveiIb9FJ45hpyqiCGmMnDlhzKahc4ukek/O1iYipeXf9JU03HL6aVF5Nl7PxuQV
	ZGJ8SZ1lFSvKqk0eH7svfVbY7e+IJGmLQNIil4nJes1KaZjm6r/kxIQjLK6qF4qTn33MKgexqgv/W
	yeVnIyfw0aTbVuDxyi44IIdPiGmk9dUsPR/vG2ongUgm0NDvnGGmySZmP+2Fum4YVHSHCVYGRqDYU
	Pr2Dp8qGMkRyCQ9bO/fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8l5-00Fv99-S7; Thu, 23 Feb 2023 10:23:27 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8l0-00Fv2S-Lr
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 10:23:26 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1D09424E289;
	Thu, 23 Feb 2023 18:22:59 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 18:22:59 +0800
Received: from [192.168.125.82] (113.72.147.165) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 18:22:57 +0800
Message-ID: <04e071d8-3195-d065-d33f-ef81e3fcfb22@starfivetech.com>
Date: Thu, 23 Feb 2023 18:22:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v4 09/19] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-10-hal.feng@starfivetech.com>
 <e4c2b711-7953-821b-4281-04e4b40154ea@linaro.org> <Y/XxOw+T0WdYY7jP@wendy>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <Y/XxOw+T0WdYY7jP@wendy>
X-Originating-IP: [113.72.147.165]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_022323_015925_2144D4DA 
X-CRM114-Status: GOOD (  21.03  )
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

On Wed, 22 Feb 2023 10:40:59 +0000, Conor Dooley wrote:
> On Wed, Feb 22, 2023 at 10:13:19AM +0100, Krzysztof Kozlowski wrote:
>> On 21/02/2023 03:46, Hal Feng wrote:
>> > From: Emil Renner Berthing <kernel@esmil.dk>
>> > 
>> > Add bindings for the system clock and reset generator (SYSCRG) on the
>> > JH7110 RISC-V SoC by StarFive Ltd.
>> > 
>> > Reviewed-by: Rob Herring <robh@kernel.org>
>> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> 
>> I don't know what is happening here as neither this nor other patchset
>> explains anything. Please stop writing what you do in the patches, but
>> explain why. What is easy to get.
>> 
>> (...)
>> 
>> 
>> > +
>> > +#define JH7110_SYSCLK_PLL0_OUT			190
>> > +#define JH7110_SYSCLK_PLL1_OUT			191
>> > +#define JH7110_SYSCLK_PLL2_OUT			192
>> 
>> NAK. Do not add incorrect bindings just to remove it THE SAME TIME.
> 
> For some context, the PLL driver series [1] does the following, which is
> where this complaint stems from:
>> diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
>> index 5e4f21ca0642..086a6ddcf380 100644
>> --- a/include/dt-bindings/clock/starfive,jh7110-crg.h
>> +++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
>> @@ -6,6 +6,12 @@
>>  #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>>  #define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>>  
>> +/* PLL clocks */
>> +#define JH7110_CLK_PLL0_OUT			0
>> +#define JH7110_CLK_PLL1_OUT			1
>> +#define JH7110_CLK_PLL2_OUT			2
>> +#define JH7110_PLLCLK_END			3
>> +
>>  /* SYSCRG clocks */
>>  #define JH7110_SYSCLK_CPU_ROOT			0
>>  #define JH7110_SYSCLK_CPU_CORE			1
>> @@ -198,11 +204,7 @@
>>  #define JH7110_SYSCLK_TDM_TDM_INV		188
>>  #define JH7110_SYSCLK_JTAG_CERTIFICATION_TRNG	189
>>  
>> -#define JH7110_SYSCLK_PLL0_OUT			190
>> -#define JH7110_SYSCLK_PLL1_OUT			191
>> -#define JH7110_SYSCLK_PLL2_OUT			192
> 
> I was talking to Emil, who pointed out that these defines aren't
> actually ever used in the dts, so there's nothing really gained
> by adding them here in the first place.
> Seems like this series could simply move these defines into the driver
> (as the PLL addition series also does) and then we would not have to
> be worried about breaking the ABI in the future?

Sorry for that I didn't synchronize this with Xingyu. I'll move these
PLL definitions into the driver in the next version.

Best regards,
Hal

> 
> 1 - https://patchwork.kernel.org/project/linux-riscv/patch/20230221141147.303642-3-xingyu.wu@starfivetech.com/
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

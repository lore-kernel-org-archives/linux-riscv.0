Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757D1C77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 02:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgBYHP3PnNv/y7rnpO+UjkMyZaJWRj7E1A4/ZbbZdVw=; b=qPjQAYjTOYVZTV
	qHMwSO5/Sn+bUOBBAexlmcjwUbb0Ry35JEsMCl5D0vNpPLTi7Lgeh1dhgrVLKZe0rTcRihJdMGuXp
	nMTaSNZ9ah4RZ2uIZIL1QQleFD5pHlsWy9K06h21EyEtAGV614P+yYgIg6/4y1z4ibt9kNXSd9QCx
	H8JYR5hXsQgRkOJXgqmtsTwk0R3IMfoJF2J0RZ41GpLyVdUs316/tb8qctocixGTh6ycq8w4OiROY
	esDJ9Fcs8lvRaCYjsK2adXMkPLYUkKD/y5WuTy+FNBYSzHJYylzU2uJSl9GON8cie6zg7cbGXyriC
	opUBIdEcoS60rEYxfYAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1IEv-008kgD-1D;
	Tue, 23 May 2023 02:59:09 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1IEs-008kdd-1M
	for linux-riscv@lists.infradead.org;
	Tue, 23 May 2023 02:59:08 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D4DEF24DC7F;
	Tue, 23 May 2023 10:58:32 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 23 May
 2023 10:58:32 +0800
Received: from [192.168.125.131] (183.27.98.143) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 23 May
 2023 10:58:31 +0800
Message-ID: <df43411e-8982-74f5-6148-e7281c37dada@starfivetech.com>
Date: Tue, 23 May 2023 10:56:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: Add StarFive JH7110 PLL clock
 generator
To: Conor Dooley <conor.dooley@microchip.com>, Torsten Duwe <duwe@lst.de>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<yanhong.wang@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, "Rob
 Herring" <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Hal
 Feng" <hal.feng@starfivetech.com>, William Qiu
	<william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-2-xingyu.wu@starfivetech.com>
 <20230519135733.GA10188@lst.de>
 <20230519-smokeless-guileless-2a71cae06509@wendy>
Content-Language: en-US
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <20230519-smokeless-guileless-2a71cae06509@wendy>
X-Originating-IP: [183.27.98.143]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_195906_721161_ED2ED9C4 
X-CRM114-Status: GOOD (  12.98  )
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

On 2023/5/19 22:16, Conor Dooley wrote:
> On Fri, May 19, 2023 at 03:57:33PM +0200, Torsten Duwe wrote:
>> On Fri, May 12, 2023 at 10:20:30AM +0800, Xingyu Wu wrote:
>> [...]
>> >  #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>> >  #define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>> >  
>> > +/* PLL clocks */
>> > +#define JH7110_CLK_PLL0_OUT			0
>> > +#define JH7110_CLK_PLL1_OUT			1
>> > +#define JH7110_CLK_PLL2_OUT			2
>> 
>> In U-Boot commit 58c9c60b Yanhong Wang added:
>> 
>> +
>> +#define JH7110_SYSCLK_PLL0_OUT                       190
>> +#define JH7110_SYSCLK_PLL1_OUT                       191
>> +#define JH7110_SYSCLK_PLL2_OUT                       192
>> +
>> +#define JH7110_SYSCLK_END                    193
>> 
>> in that respective file.
>> 
>> > +#define JH7110_PLLCLK_END			3
>> > +
>> >  /* SYSCRG clocks */
>> >  #define JH7110_SYSCLK_CPU_ROOT			0
>> 
>> If the symbolic names referred to the same items, would it be possible
>> to keep the two files in sync somehow?
> 
> Ohh, that's not good.. If you pass the U-Boot dtb to Linux it won't
> understand the numbering. The headers are part of the dt-binding :/

Because PLL driver is separated from SYSCRG drivers in Linux, the numbering
starts from 0. But in Uboot, the PLL driver is included in the SYSCRG driver,
and the number follows the SYSCRG.

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665E3C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 09:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XArykksLlF39JVlBhxid6bkP3NpQnkwa4XvRIvtLhm0=; b=ZNC0FABhX3n2tJ
	mo08nHpDRLkLV4/2Ita6pnLsEafQibxZl/EtOEBtijb2mE3Evwh5cON7ih6+1NCexzxr+WVIDCQvp
	1j6c92tZTz2Cs0Y8GOf/IZnjU4wa6gQLjhKO6rWpiZ+TBEKGJyxHc2DDpMeKCZlV9IlBRvPRalZiQ
	7oR/k/PIZMLQdDWxhq+SQAeVZt8xD+Jhawc4jCoT/JmN4s3pK0ELK+HyX0Wo/jOdtfnth/od+F3vG
	sKSXxNy5SWuaB23saUjnPEYzZMQAFhYGZTgzCTm4XEIg8JDCKRp5a+7rx2VJbZiN5Ke44tQehMk84
	GKPYM1HfbT6S7prfmF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1kOO-00Csli-2R;
	Wed, 24 May 2023 09:02:48 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1kOM-00CsiM-05
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 09:02:48 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 1012524E26B;
	Wed, 24 May 2023 17:01:53 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 24 May
 2023 17:01:52 +0800
Received: from [192.168.125.131] (183.27.98.143) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 24 May
 2023 17:01:51 +0800
Message-ID: <38a9cb77-18b3-4daa-724b-9f2282f7d948@starfivetech.com>
Date: Wed, 24 May 2023 17:00:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: Add StarFive JH7110 PLL clock
 generator
Content-Language: en-US
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
	<linux-clk@vger.kernel.org>, <u-boot@lists.denx.de>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-2-xingyu.wu@starfivetech.com>
 <20230519135733.GA10188@lst.de>
 <20230519-smokeless-guileless-2a71cae06509@wendy>
 <df43411e-8982-74f5-6148-e7281c37dada@starfivetech.com>
 <20230523-fondue-monotype-0c751a8f0c13@wendy>
 <20230523131006.46997d84@blackhole.lan>
 <20230523-saturate-axis-f46b78b7b82b@wendy>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <20230523-saturate-axis-f46b78b7b82b@wendy>
X-Originating-IP: [183.27.98.143]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_020246_354643_75597CA1 
X-CRM114-Status: GOOD (  29.79  )
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

On 2023/5/23 19:28, Conor Dooley wrote:
> On Tue, May 23, 2023 at 01:10:06PM +0200, Torsten Duwe wrote:
>> On Tue, 23 May 2023 09:28:39 +0100
>> Conor Dooley <conor.dooley@microchip.com> wrote:
>> 
>> > On Tue, May 23, 2023 at 10:56:43AM +0800, Xingyu Wu wrote:
>> > > On 2023/5/19 22:16, Conor Dooley wrote:
>> > > > On Fri, May 19, 2023 at 03:57:33PM +0200, Torsten Duwe wrote:
>> > > >> On Fri, May 12, 2023 at 10:20:30AM +0800, Xingyu Wu wrote:
>> > > >> [...]
>> 
>> > > >> > +/* PLL clocks */
>> > > >> > +#define JH7110_CLK_PLL0_OUT			0
>> > > >> > +#define JH7110_CLK_PLL1_OUT			1
>> > > >> > +#define JH7110_CLK_PLL2_OUT			2
>> > > >> 
>> > > >> In U-Boot commit 58c9c60b Yanhong Wang added:
>> > > >> 
>> > > >> +
>> > > >> +#define JH7110_SYSCLK_PLL0_OUT                       190
>> > > >> +#define JH7110_SYSCLK_PLL1_OUT                       191
>> > > >> +#define JH7110_SYSCLK_PLL2_OUT                       192
>> > > >> +
>> > > >> +#define JH7110_SYSCLK_END                    193
>> [...]
>> > > > Ohh, that's not good.. If you pass the U-Boot dtb to Linux it
>> > > > won't understand the numbering. The headers are part of the
>> > > > dt-binding :/
>> 
>> In fact, the clock index >= 190 makes linux hang on boot, waiting with
>> EPROBE_DEFER for every device's clock, because the sysclk driver errors
>> out with EINVAL (jh7110_sysclk_get()).
> 
> Yup, that's about what I expected to happen.
> 
>> > > Because PLL driver is separated from SYSCRG drivers in Linux, the
>> > > numbering starts from 0. But in Uboot, the PLL driver is included
>> > > in the SYSCRG driver, and the number follows the SYSCRG.
>> > 
>> > Unfortunately, how you choose to construct your drivers has nothing to
>> > do with this.
>> > These defines/numbers appear in the dts and are part of the DT ABI.
>> > The same dts is supposed to work for Linux & U-Boot.
>> 
>> The JH7110 has 6 blocks of 64k iomem in that functional area:
>> {SYS,STG,AON} x {CRG,SYSCON}. None of these has 190 clocks.
>> The good news: the current DTS, as proposed here and in U-Boot master,
>> provides nodes for all 6 entities. The bad news is that the clock
>> assignments to those nodes and their numbering is messed up.
>> 
>> AFAICT PLL{0,1,2} _are_ generated in SYS_SYSCON and thus U-Boot gets it
>> wrong, in addition to the erroneous DTS.
> 
> The numbers are kinda hocus-pocus anyway, they are just made up since the
> clock numbering usually isn't something with a nice TRM to go and
> reference (unlike interrupts which usually are documented in that way).
> It is very helpful to make them aligned some register/bit positions or,
> but that is not required.
> IOW U-Boot is not wrong per se to use 190 instead of 0, but it is wrong
> to have different numbers in both places.
> 
> It sounds like you're saying that (and I have not looked) the U-Boot dts
> actually has structural difference w.r.t. what provides which clock?
> If so, that'll need to be fixed independently of the numbering problem.
> 
> Otherwise Xingyu & Yanhong should coordinate on which is the "correct"
> way of doing things & do it in both places.
> 

Oh, unfortunately, the 7110 can not support to mix the uboot dtb and linux dtb up.
If boot the Linux and should use the linux dtb instead of the uboot dtb.
Because all clock ids and reset ids in Linux and Uboot are different include
PLL, and some modules can work in Linux but not in uboot.
I suggest to boot Linux with its own linux dtb.

Best regards,
Xingyu Wu



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

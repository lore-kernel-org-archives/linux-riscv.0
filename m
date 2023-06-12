Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4870DC7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Kqv8LeySb31K5VP13D79uzGya2NBCgQESnOYkKtsl0=; b=wyt1DKXPOMGAwd
	R5hP75UjXuajkPMHb1+KY6ZhaJCCQ1p5H3d1ET4jmHlNay31htjJcuKB+9FMunuMEwZe5ZE2EY/uB
	CN21Wr1X8DA0/SjFAHrUE1wOFY8IxlD1q2Se+q5uv3oqeEH9I9Bs176RSPzppN3j7hB6HNrt9a5Q8
	OWMK+SWxfp/SaAX1fle6G9SfXmlJpUGDmzo6aEp9LNuhfum4i8LU7WZKXO213IuWfEHslMu6ynzC8
	ukgMS8ctUmi+pfT3ImywBu5NVIw9XHZ5Qh3/nWi3S7+5nJTFIh0WWP+kqy2bOxeY1/F3wzXjsK7CI
	0Lv3OHDRghP3R3KrlENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8Y11-002Phn-2F;
	Mon, 12 Jun 2023 03:14:47 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8Y0w-002Pep-2w
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 03:14:46 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 3F27182CA;
	Mon, 12 Jun 2023 11:14:05 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 12 Jun
 2023 11:09:06 +0800
Received: from [192.168.125.128] (113.72.145.34) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 12 Jun
 2023 11:09:05 +0800
Message-ID: <b693397d-b8d6-ec79-098a-528919786e49@starfivetech.com>
Date: Mon, 12 Jun 2023 11:06:49 +0800
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
	<linux-clk@vger.kernel.org>, <u-boot@lists.denx.de>
References: <20230512022036.97987-2-xingyu.wu@starfivetech.com>
 <20230519135733.GA10188@lst.de>
 <20230519-smokeless-guileless-2a71cae06509@wendy>
 <df43411e-8982-74f5-6148-e7281c37dada@starfivetech.com>
 <20230523-fondue-monotype-0c751a8f0c13@wendy>
 <20230523131006.46997d84@blackhole.lan>
 <20230523-saturate-axis-f46b78b7b82b@wendy>
 <38a9cb77-18b3-4daa-724b-9f2282f7d948@starfivetech.com>
 <20230524-jittery-sway-41b578b24153@wendy>
 <20230526093432.4682eab8@blackhole.lan>
 <20230526-unwashed-musty-dee883f1d6a7@wendy>
Content-Language: en-US
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <20230526-unwashed-musty-dee883f1d6a7@wendy>
X-Originating-IP: [113.72.145.34]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_201443_450560_3C85D333 
X-CRM114-Status: GOOD (  48.23  )
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

On 2023/5/26 20:23, Conor Dooley wrote:
> On Fri, May 26, 2023 at 09:34:32AM +0200, Torsten Duwe wrote:
>> On Wed, 24 May 2023 11:19:48 +0100
>> Conor Dooley <conor.dooley@microchip.com> wrote:
>> 
>> > On Wed, May 24, 2023 at 05:00:02PM +0800, Xingyu Wu wrote:
>> > > On 2023/5/23 19:28, Conor Dooley wrote:
>> > > > On Tue, May 23, 2023 at 01:10:06PM +0200, Torsten Duwe wrote:
>> > > >> On Tue, 23 May 2023 09:28:39 +0100
>> > > >> Conor Dooley <conor.dooley@microchip.com> wrote:
>> > > >> 
>> > > >> > On Tue, May 23, 2023 at 10:56:43AM +0800, Xingyu Wu wrote:
>> > > >> > > On 2023/5/19 22:16, Conor Dooley wrote:
>> > > >> > > > On Fri, May 19, 2023 at 03:57:33PM +0200, Torsten Duwe
>> > > >> > > > wrote:
>> > > >> > > >> On Fri, May 12, 2023 at 10:20:30AM +0800, Xingyu Wu wrote:
>> [...]
>> 
>> > > >> > > Because PLL driver is separated from SYSCRG drivers in
>> > > >> > > Linux, the numbering starts from 0. But in Uboot, the PLL
>> > > >> > > driver is included in the SYSCRG driver, and the number
>> > > >> > > follows the SYSCRG.
>> > > >> > 
>> > > >> > Unfortunately, how you choose to construct your drivers has
>> > > >> > nothing to do with this.
>> 
>> Exactly. As I wrote (quote below), the PLLx frequencies are controlled
>> by the I/O block SYS_SYSCON (starting there at offset 0x18), according
>> to the public datasheets. All(?) other clocks are derived from those in
>> the *_CRG units. That *is* the hardware to be described, in *the* (one
>> and only!) DT. U-Boot, and any OS, are free to reorganise their driver
>> framework around that, but the hardware description is quite clear.
> 
> The dt-binding that is in this series specifies that the pll clock
> controller is a child of the syscon:
> https://lore.kernel.org/linux-riscv/20230512022036.97987-1-xingyu.wu@starfivetech.com/T/#Z2e.:..:20230512022036.97987-6-xingyu.wu::40starfivetech.com:1soc:starfive:starfive::2cjh7110-syscon.yaml
> 
> That seems correct to me & U-Boot's devicetree is not compliant.
> 
>> > > >> > These defines/numbers appear in the dts and are part of the DT
>> > > >> > ABI. The same dts is supposed to work for Linux & U-Boot.
>> > > >> 
>> > > >> The JH7110 has 6 blocks of 64k iomem in that functional area:
>> > > >> {SYS,STG,AON} x {CRG,SYSCON}. None of these has 190 clocks.
>> > > >> The good news: the current DTS, as proposed here and in U-Boot
>> > > >> master, provides nodes for all 6 entities. The bad news is that
>> > > >> the clock assignments to those nodes and their numbering is
>> > > >> messed up.
>> > > >> 
>> > > >> AFAICT PLL{0,1,2} _are_ generated in SYS_SYSCON and thus U-Boot
>> > > >> gets it wrong, in addition to the erroneous DTS.
>> > > > 
>> > > > The numbers are kinda hocus-pocus anyway, they are just made up
>> > > > since the clock numbering usually isn't something with a nice TRM
>> > > > to go and reference (unlike interrupts which usually are
>> > > > documented in that way). It is very helpful to make them aligned
>> > > > some register/bit positions or, but that is not required.
>> > > > IOW U-Boot is not wrong per se to use 190 instead of 0, but it is
>> > > > wrong to have different numbers in both places.
>> 
>> U-Boot reuses the Common Clock Framework from Linux, and I'm not sure
>> whether the clock IDs need to be unique in order for the appropriate
>> clock to be found.
> 
> Unique within the clock controller, otherwise it is impossible to tell
> the difference between <&cctrl 1> and <&cctrl 1> apart! (The same
> follows even with increased #clock-cells, something must be unique).
> That's besides the point of this particular issue though.
> 
>> But that would be the only restriction, if it
>> applies. Even then, each driver could register a clock with its own,
>> arbitrarily chosen base offset with the CCF, so each CRG unit could
>> still have its own clocks enumerated starting with 0 in the DTB.
>> 
>> > > > It sounds like you're saying that (and I have not looked) the
>> > > > U-Boot dts actually has structural difference w.r.t. what
>> > > > provides which clock? If so, that'll need to be fixed
>> > > > independently of the numbering problem.
>> 
>> > > 
>> > > Oh, unfortunately, the 7110 can not support to mix the uboot dtb
>> > > and linux dtb up.
>> > 
>> > What does "cannot support" mean? It's normal and desirable for the
>> 
>> IMHO "desirable" is too weak.
> 
> Yeah, agreed. I just don't like being prescriptive about what happens in
> projects that I do not maintain things for I guess.
> 
>> > same dtb to be usable for both. The Linux kernel's dt-bindings are
>> > used for multiple projects, not just Linux - it'd be silly for
>> > U-Boot, FreeBSD etc etc to go off and each have their open set of
>> > (incompatible) bindings.
>> > 
>> > > If boot the Linux and should use the linux dtb instead of the uboot
>> > > dtb. Because all clock ids and reset ids in Linux and Uboot are
>> > > different include PLL, and some modules can work in Linux but not
>> > > in uboot.
>> [...]
>> > 
>> > > I suggest to boot Linux with its own linux dtb.
>> 
>> This is a fragile band-aid, to be used only as a last resort. It
>> creates more problems than it solves. Your DTB will then match your
>> kernel, but whether it describes the actual hardware is a game of
>> chance. Doesn't the VisionFive2 have an RPi connector... ?
>> 
>> One of the IMO few valid use cases of adding a DTB to the kernel
>> at boot is OpenWRT, when you build an OS Image for a particular piece
>> of hardware you have at hand.
>> 
>> > I suggest to make sure that you can use the same dtb for both.
>> 
>> Interestingly enough, U-Boot already has the PLL driver in a separate
>> file. I have a half-baked patch here that moves the sys_syscon DT
>> matching into that file...
> 
> If you have patches that fix the devicetree & drivers in U-Boot, please
> post them. I don't really care at all which set of arbitrary numbers are
> chosen (as long as there is one and one only) but it looks like U-Boot's
> devicetree has an incorrect description of the clock controllers.
> 

Hi Conor and Torsten,
After our internal discussions, it was decided to make the change on Uboot.
The clock id in Uboot are changed to be same with Linux and the PLL clocks become the child node of SYSCON.
And we will send this patch on Uboot soon.

Best Regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

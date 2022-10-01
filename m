Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DD9C433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Oct 2022 01:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gCkjtJkfVJlFByaZugJI+4XJUKXhH1YQaDSiP0wLL8E=; b=mP/4/lYHZzef+d
	Iuk4gDIRlu1fgU6vYr3/vxn7GUQSp7kTVZxzmbKUBhIgY2pUqFZ3FLLhvOGKgv0KrnZm534clkU4E
	Tn5yWVRA/7AoldzxAyN2UKMvF0Gbmlj5HZbncVoLbC8F6/A49TzDnLafHqmBN1f2vkOtxitmeFe/L
	oYoLGGGvvVI42j06OaYUCsClF1tvvyFHxSqU/nd0wN+xSYXsK1jgyZN1rzCxRtwxg2FiwcyVib9/F
	TGL9aJZi80Igvjk+xefO3Yq7RW3vIGh0Z5PrweJD2TXYoaMkYXd7bX7I6iPaqsGnfB8udjPYHd43Y
	1/9AIIX1b+S4GJiZWVCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeR9V-00CSum-82; Sat, 01 Oct 2022 01:18:49 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeR9R-00CSq9-9u
	for linux-riscv@lists.infradead.org; Sat, 01 Oct 2022 01:18:47 +0000
X-QQ-mid: bizesmtp91t1664586871tcwf5ude
Received: from CSD1051 ( [113.72.146.201])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 01 Oct 2022 09:14:29 +0800 (CST)
X-QQ-SSF: 01000000000000308000000A0000000
X-QQ-FEAT: PXtIlpCZyqdoUCaznDtdk1gVxdQFhDYD3xz//q16G0AgZvwIO2tuR6R0JunZn
	uxvR+gjF7QCJd/Vn6HBzqgWAfDT0XURA9RI5t+BFQetFrVz9CFQnuU6VO6Nk+L8kIEZ4Gna
	0WhRHPrxLqR4kbt8kzIozEzYDeg3FOe0/VFf2mzwKPM86sf0cNpmmSciBtnnKl7La4P6iXy
	TbFieBvcljfVC5YsGyJQLSk9IlT4ZzCYCI4cgAGwC7/5EUBU0IU0djPo6pZ86BTHKhhja9o
	k6XXlhPiWxO2Ox6oyTAjEOR0f4nTM2SoXpUxD02jtmKFRMMk28OQILWco8LehWnqTB9xrv0
	zucVUFcdqPvSqxvf88=
X-QQ-GoodBg: 0
From: <hal.feng@linux.starfivetech.com>
To: "'Conor Dooley'" <conor@kernel.org>,
	"'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>
Cc: <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>,
	"'Rob Herring'" <robh+dt@kernel.org>,
	"'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>,
	"'Paul Walmsley'" <paul.walmsley@sifive.com>,
	"'Palmer Dabbelt'" <palmer@dabbelt.com>,
	"'Albert Ou'" <aou@eecs.berkeley.edu>,
	"'Daniel Lezcano'" <daniel.lezcano@linaro.org>,
	"'Thomas Gleixner'" <tglx@linutronix.de>,
	"'Marc Zyngier'" <maz@kernel.org>,
	"'Philipp Zabel'" <p.zabel@pengutronix.de>,
	"'Stephen Boyd'" <sboyd@kernel.org>,
	"'Michael Turquette'" <mturquette@baylibre.com>,
	"'Linus Walleij'" <linus.walleij@linaro.org>,
	"'Emil Renner Berthing'" <kernel@esmil.dk>,
	<linux-kernel@vger.kernel.org>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com> <4ddabe3a-9f55-2a6a-c1c1-ccc3fc74e98a@linaro.org> <YzXc/FSbDpkElK0O@spud>
In-Reply-To: <YzXc/FSbDpkElK0O@spud>
Subject: Re: [PATCH v1 00/30] Basic StarFive JH7110 RISC-V SoC support
Date: Sat, 1 Oct 2022 09:13:01 +0800
Message-ID: <617C2EE03810F071+013401d8d532$f4548310$dcfd8930$@linux.starfivetech.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQLyOrMrqu8us6tOmdilaJnshXDZwAImr5qgAixKxMCro1Q8gA==
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_181845_729005_6CDAE22D 
X-CRM114-Status: GOOD (  13.13  )
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

On Thu, Sep 29, 2022 at 18:59:24 +0100, Conor Dooley wrote:
> On Thu, Sep 29, 2022 at 04:45:26PM +0200, Krzysztof Kozlowski wrote:
> > On 29/09/2022 16:31, Hal Feng wrote:
> >
> > > This series is also available at
> > > https://github.com/hal-feng/linux/commits/visionfive2-minimal
> > >
> > > [1]
> > > https://www.cnx-software.com/2022/08/23/starfive-visionfive-2-quad-c
> > > ore-risc-v-sbc-linux/
> > > [2] https://wiki.rvspace.org/
> > >
> > > Emil Renner Berthing (17):
> > >   dt-bindings: riscv: Add StarFive JH7110 bindings
> > >   dt-bindings: timer: Add StarFive JH7110 clint
> > >   dt-bindings: interrupt-controller: Add StarFive JH7110 plic
> > >   dt-bindings: sifive-l2-cache: Support StarFive JH71x0 SoCs
> > >   soc: sifive: l2 cache: Convert to platform driver
> > >   soc: sifive: l2 cache: Add StarFive JH71x0 support
> > >   reset: starfive: jh7100: Use 32bit I/O on 32bit registers
> > >   dt-bindings: reset: Add StarFive JH7110 reset definitions
> > >   clk: starfive: Factor out common clock driver code
> > >   dt-bindings: clock: Add StarFive JH7110 system clock definitions
> > >   dt-bindings: clock: Add starfive,jh7110-clkgen-sys bindings
> > >   clk: starfive: Add StarFive JH7110 system clock driver
> > >   dt-bindings: clock: Add StarFive JH7110 always-on definitions
> > >   dt-bindings: clock: Add starfive,jh7110-clkgen-aon bindings
> > >   clk: starfive: Add StarFive JH7110 always-on clock driver
> > >   RISC-V: Add initial StarFive JH7110 device tree
> > >   RISC-V: Add StarFive JH7110 VisionFive2 board device tree
> >
> > Where is the rest of patches? Lists got only 5 of them. Anyway this is
> > a bit too big patchset. Split per subsystem.
> 
> They seem to be coming in over time in dribs and drabs. I assume it is not
a
> mailing list problem given how many lists are CCed on the mail and the
fact
> that they have different providers.
> 
> For v2 (or multiple v2s) please fix up your process so that this gets sent
> normally and not a couple of patches every hour.

Our email server has technical issue and we are aware of this.
Will fix in next revision. Sorry for the inconvenience caused.

Best Regards,
Hal


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

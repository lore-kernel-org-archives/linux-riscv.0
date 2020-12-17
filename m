Return-Path: <SRS0=FwEc=FV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05F5C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 10:17:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A4DF238EF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 10:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A4DF238EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A7QILW4k0RtJqLa1zU3e4KG4glTksCGpI3/85wzYNAQ=; b=U++06lGH9xMf00sgqMdwduvRb
	O475682YEUIH3DurSe1lsrL4oLsAnXRRZYCqk0rY8zc+12Teg1tq36dFRDYOrW+e3dsBrT9izBti7
	hygZbIZOb3cPLYhjcV1WY897/ZJE3rfaSEQFN6ovvvBNOWgPckZIGCJzRjZai+YdYkpUELyWAvFq3
	t3oHF1tZh+DnF8f+P3a9SYdqHsOK4MCIB1knfAoxGObaJc+mq4HRjJS/PbFqzkvpJG0IMnUbDCa5X
	LmkSjZatWUu8ng3uPbUXzzKZg7V3/qAllhvZO5eoVAASN9xaU7F7pGWq7J4lG0KSKgC35LF/NR8W9
	QtHEDvoUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpqLS-0000uc-Na; Thu, 17 Dec 2020 10:17:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpqLC-0000pv-Nf
 for linux-riscv@lists.infradead.org; Thu, 17 Dec 2020 10:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608200218;
 bh=R0x1PA8BvcIrgXrlUvqF6asRJGMm2WhicqNyzRbZC2o=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=mCL1L9zgdfqLhBl2s7Z9cWUEM5KEpflWhFZaOhh3dbYhlmraw4KTFW1Yh6wHlWEsS
 Eu427VLD3QX6z2qjMeyRu7gLqwgHoiEJbuzK72wlgEYQMjpj66IKazEg3bIZCa0tS3
 x14drQubinSh3dl3V1RbLu0itU7G9142RXMd3bMO9YFornBfgvT7byTXJcz706WCl2
 DhVkteYoW7WUlR/JfEqu+NbvfpnB6F+FzQKyiO3PAujPt3HBZMSS9ChuQ+tRHiQsR4
 taLbQSCM/AqHjaBNZixdrhHexcseMI3PvmqWJ/sxqc+53WDHEPCCCYeme3Zk6OycoJ
 h2zjkylROTluw==
MIME-Version: 1.0
In-Reply-To: <CH2PR04MB65227B0B94F919406CB84C28E7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
 <20201213135056.24446-10-damien.lemoal@wdc.com>
 <160819259979.1580929.9332027241734052085@swboyd.mtv.corp.google.com>
 <CH2PR04MB65227B0B94F919406CB84C28E7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
Subject: Re: [PATCH v10 09/23] dt-binding: clock: Document canaan,
 k210-clk bindings
From: Stephen Boyd <sboyd@kernel.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Thu, 17 Dec 2020 02:16:55 -0800
Message-ID: <160820021596.1580929.1686334340234415270@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_051658_923511_B001FBCD 
X-CRM114-Status: GOOD (  19.20  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Damien Le Moal (2020-12-17 00:13:57)
> On 2020/12/17 17:10, Stephen Boyd wrote:
> > Quoting Damien Le Moal (2020-12-13 05:50:42)
> >> diff --git a/include/dt-bindings/clock/k210-clk.h b/include/dt-bindings/clock/k210-clk.h
> >> index 5a2fd64d1a49..b2de702cbf75 100644
> >> --- a/include/dt-bindings/clock/k210-clk.h
> >> +++ b/include/dt-bindings/clock/k210-clk.h
> >> @@ -3,18 +3,51 @@
> >>   * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
> >>   * Copyright (c) 2020 Western Digital Corporation or its affiliates.
> >>   */
> >> -#ifndef K210_CLK_H
> >> -#define K210_CLK_H
> >> +#ifndef CLOCK_K210_CLK_H
> >> +#define CLOCK_K210_CLK_H
> >>  
> >>  /*
> >> - * Arbitrary identifiers for clocks.
> >> - * The structure is: in0 -> pll0 -> aclk -> cpu
> >> - *
> >> - * Since we use the hardware defaults for now, set all these to the same clock.
> >> + * Kendryte K210 SoC clock identifiers (arbitrary values).
> >>   */
> >> -#define K210_CLK_PLL0   0
> >> -#define K210_CLK_PLL1   0
> >> -#define K210_CLK_ACLK   0
> >> -#define K210_CLK_CPU    0
> > 
> > This seems to open a bisection hole. I see that ACLK is used in the
> > existing dtsi file, and that is the same as CLK_CPU, but after this
> > patch it will change to not exist anymore. Can we leave ACLK around
> > defined to be 0? I imagine it won't be used in the future so we can
> > remove it later. I can then apply this for v5.11-rc1 and then merge the
> > clk driver patch in clk tree.
> > 
> >> +#define K210_CLK_CPU   0
> >> +#define K210_CLK_SRAM0 1
> >> +#define K210_CLK_SRAM1 2
> > 
> 
> Patch 6 of the series removes the use of K210_CLK_CPU and K210_CLK_ACLK from the
> device trees. I added that patch as the DT modification proper comes only at
> patch 16. Maybe I should squash patch 6 into this one ?
> 

Preferably the defines are just left alone forever and then forgotten.
The dt-bindings directory is almost ABI and so changing numbers or
removing defines is hard to do. Usually patches in this directory are an
additive thing.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=FwEc=FV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EC2C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 10:49:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23A422389A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 10:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23A422389A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=74aJAEVxLlZZhiEnUWAX9M9Fwu2gNwtVjxs5YcqIZYY=; b=KTqhQsN8uprBFj59TxwmhBcIZ
	9B3k0OgkQFtuDd0qm35mnETiSkJhGQHw+iHeuQjF6FRdkneGBKNVLlgnNXoyGcuQTrrzmxFlnyzD+
	0L4WQx+MtBIYtJolhW3Wdp7jY3K4RNBuD1+5DYogiqd6+/SHosO37T/mbDDWIHdlLsGAz1X6/UAm5
	Ov1PH6rSlbiin95UaQDamWclmsW4P8RrEHU27pVorXueRd1vWMZo6HbnlQ9HMcXKLzfXxRyb1OyXV
	UKO8+s6+tNmj98b9I+Dk70by0vuKoCEEKMpqwUAvH0TvL7pYQfiEj7VjD3TOiilWiRmL92vxU/b7l
	aGQ4pxfMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpqqf-0003me-Bv; Thu, 17 Dec 2020 10:49:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpqqd-0003mK-Bp
 for linux-riscv@lists.infradead.org; Thu, 17 Dec 2020 10:49:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608202166;
 bh=IHqvIzeT44TaD9aaUc8PyL7YXy3hvVBgUG/OHFSFaaA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=mdSvliX2x2jj1hqcaE9GugLxg+uvTty8dWlmPINRIQ73YGm4sgircwj3elJ7HmkCg
 8PQsHRvtNf3X+Ds/dYrJhh4BmfYa8mSd5ywvLMvs90U8llnZEsS/2y6M7z1TJcs8OL
 H1XOkWupOhiQK4v1F1n1hm/qMXJDkXQviX5ex6h5bXea7cBkNHZ3LT4MflavUn+DH4
 F0P29NBqTlUtpqObZDVYltt4R2tLru7clWkB1/trvyjX2f4xuiBH165sEhmDqiqo8m
 YVh9kP6S9mSXwEnR+2+axplesYCr8a4clFUxvwQ7vuEknnMdRXQFmbAmzBj+TCtEMA
 3F8FHJdPtRXAQ==
MIME-Version: 1.0
In-Reply-To: <CH2PR04MB6522E9EC44FF8FFA5981107CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
 <20201213135056.24446-10-damien.lemoal@wdc.com>
 <160819259979.1580929.9332027241734052085@swboyd.mtv.corp.google.com>
 <CH2PR04MB65227B0B94F919406CB84C28E7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
 <160820021596.1580929.1686334340234415270@swboyd.mtv.corp.google.com>
 <CH2PR04MB6522E9EC44FF8FFA5981107CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
Subject: Re: [PATCH v10 09/23] dt-binding: clock: Document canaan,
 k210-clk bindings
From: Stephen Boyd <sboyd@kernel.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Thu, 17 Dec 2020 02:49:24 -0800
Message-ID: <160820216451.1580929.9401304620489565784@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_054927_500368_F915DDB4 
X-CRM114-Status: GOOD (  13.76  )
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

Quoting Damien Le Moal (2020-12-17 02:43:50)
> 
> I just did that. It works.
> 
> Ideally, patches 7, 8 and 9 need to go in together with the clk driver patch.
> Since the builtin DTB patch precedes the clock driver patch that touches the
> sysctl driver, I need to rework it a little, keeping the
> SOC_DECLARE_BUILTIN_DTB() for now. And finally, a small DTS update patch needs
> to be added too for the sysctl & sysclk nodes update. That would make it a 5
> patch series for the clock driver addition. Would this work ?
> 
> Or, you just take patch 9 (clk doc) and patch 13 (clk driver), slightly modified
> to move the sysctl register definitions into a common header (currently part of
> patch 7). 2 patches only, without any other change, resulting in the clock
> driver not being used until the rest of the series goes into 5.12. Do you prefer
> that solution ?
> 

I was thinking of just applying this DT binding patch now so it gets
merged into the next -rc1. Then anyone can use the defines because
they're in Linus' tree and wherever the dts file ends up can just base
on -rc1. I probably won't merge the clk driver until v5.12 given that
the merge window is open.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

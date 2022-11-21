Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D95C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 06:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vuE9/lui+jw/HABNAsYZDXbj6f//P/Xsrdg1zzXmJ8=; b=aBuTXwLCHVzPd8
	lsplQzUtsPJUqi3PILQXzZIUKU59lwMw0PdhDKi0rvw+u+RqDJjS5TiQ4VyFOjtxcAQvMz0ISM97H
	6cAVfa36G95uT1e9ncNFARFNkKD3DC1Ttbvh2VKov7iQij0NDhw/L/zRQ+CnVGSCU2uJsfrkiYlSV
	5csD0TS6Af9sxPrqw0kGspsS+Iie2QOZRC1aoRyITwy3hv7R24rsRjkgIhyVCHnqgI3bHZ4jcyU7Z
	ppcMJLP3kpd2+btO4ViVtgAOWkrNca6llaOMe6dt+mORVko7/tlp9Ervq9NxkVRX4WqQRGffVl0yZ
	qtvRNxHCejlju7fRGoOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox0GG-009oMM-FQ; Mon, 21 Nov 2022 06:26:32 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox0GB-009o8d-Hi
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 06:26:30 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id AA67B24E205;
	Mon, 21 Nov 2022 14:25:35 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Nov
 2022 14:25:35 +0800
Received: from [192.168.50.235] (113.72.144.23) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Nov
 2022 14:25:34 +0800
Message-ID: <7cf9be4a-6ef2-f1f9-07a3-4801fd2833a8@starfivetech.com>
Date: Mon, 21 Nov 2022 14:25:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 01/14] clk: starfive: Factor out common JH7100 and
 JH7110 code
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Conor Dooley
	<conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-2-hal.feng@starfivetech.com>
 <CAJM55Z8nGNm_TrTsw0HZnAVehWrFU9-MtAj0ngRRx_E8jFapGg@mail.gmail.com>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <CAJM55Z8nGNm_TrTsw0HZnAVehWrFU9-MtAj0ngRRx_E8jFapGg@mail.gmail.com>
X-Originating-IP: [113.72.144.23]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_222627_817793_891F004B 
X-CRM114-Status: GOOD (  14.84  )
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

On Sat, 19 Nov 2022 00:22:10 +0800, Emil Renner Berthing wrote:
> On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
> >
> > From: Emil Renner Berthing <kernel@esmil.dk>
> >
> > The clock control registers on the StarFive JH7100 and JH7110 work
> > identically, so factor out the code then drivers for the two SoCs
> > can share it without depending on each other. No functional change.
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  MAINTAINERS                                |   2 +-
> >  drivers/clk/starfive/Kconfig               |   5 +
> >  drivers/clk/starfive/Makefile              |   3 +-
> >  drivers/clk/starfive/clk-starfive-jh7100.c | 325 --------------------
> >  drivers/clk/starfive/clk-starfive-jh7100.h |   2 +
> >  drivers/clk/starfive/clk-starfive-jh71x0.c | 333 +++++++++++++++++++++
> >  6 files changed, 343 insertions(+), 327 deletions(-)
> >  create mode 100644 drivers/clk/starfive/clk-starfive-jh71x0.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 256f03904987..d43daa89d5f1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19602,7 +19602,7 @@ STARFIVE JH7100 CLOCK DRIVERS
> >  M:     Emil Renner Berthing <kernel@esmil.dk>
> >  S:     Maintained
> >  F:     Documentation/devicetree/bindings/clock/starfive,jh7100-*.yaml
> > -F:     drivers/clk/starfive/clk-starfive-jh7100*
> > +F:     drivers/clk/starfive/
> 
> When this entry cover all the starfive clock drivers the header should
> also match. Eg.
> STARFIVE CLOCK DRIVERS

OK, will fix it. Ditto for the reset driver.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

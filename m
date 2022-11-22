Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F204CC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 01:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3fNuJcC4CNNh7jtrYMSJVT0/3z5VDwezztzMUjF1iUw=; b=imed/g6TR6I1X/
	cWufej/oi0DYiOlPW7gT96HHhVS5E7U9L9vYYB3zZG2XKV+2ggfcTx2ewDRM4mwiZiRy1Xyd+xrzp
	oUBiO3cbiQkHBfFj21G/Dq/XpwSTJXcdFV7AjZW6yyOEXI5rySCBFOK5BlrwFjfFF9O0F29RA3Rps
	UVlvNbYtNgJpQRYLqGbD5MFucoqXJvZVoPRP6yd3bWdq6H43ozplCSzREPbSsW3ux7/mWT9bU86iA
	IffG7QZIFLPzy5WnO0FdO0RRRzQeft3SD7Ql/+sA0XUxHnVdZrbQdSvwhGSwZ9uD8g3MJHmRFzsQF
	tm14Co3LnNDVpF2Drc4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxI41-001tYr-RG; Tue, 22 Nov 2022 01:27:05 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxI3y-001tWn-AM
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 01:27:03 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9ECF524E09F;
	Tue, 22 Nov 2022 09:26:48 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 22 Nov
 2022 09:26:48 +0800
Received: from [192.168.125.106] (113.72.144.23) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 22 Nov
 2022 09:26:49 +0800
Message-ID: <37d5a252-6540-7ba1-41f0-f68cb1c817d1@starfivetech.com>
Date: Tue, 22 Nov 2022 09:26:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 08/14] dt-bindings: reset: Add StarFive JH7110 system
 and always-on reset definitions
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-9-hal.feng@starfivetech.com>
 <e4237444-2d3a-d168-f95f-d1b1e6ac95ec@linaro.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <e4237444-2d3a-d168-f95f-d1b1e6ac95ec@linaro.org>
X-Originating-IP: [113.72.144.23]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_172702_653082_BF205BE2 
X-CRM114-Status: GOOD (  11.72  )
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

On Mon, 21 Nov 2022 09:50:13 +0100, Krzysztof Kozlowski wrote:
> On 18/11/2022 02:06, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> > 
> > Add resets for the StarFive JH7110 system (SYS) and always-on (AON)
> > reset controller.
> > 
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  MAINTAINERS                                 |   5 +-
> >  include/dt-bindings/reset/starfive-jh7110.h | 154 ++++++++++++++++++++
> >  2 files changed, 157 insertions(+), 2 deletions(-)
> >  create mode 100644 include/dt-bindings/reset/starfive-jh7110.h
> > 
> 
> Thank you for your patch. There is something to discuss/improve.
> 
> > +#define JH7110_SYSRST_TIMER0			118
> > +#define JH7110_SYSRST_TIMER1			119
> > +#define JH7110_SYSRST_TIMER2			120
> > +#define JH7110_SYSRST_TIMER3			121
> > +#define JH7110_SYSRST_INT_CTRL_APB		122
> > +#define JH7110_SYSRST_TEMP_APB			123
> > +#define JH7110_SYSRST_TEMP_CORE			124
> > +#define JH7110_SYSRST_JTAG_CERTIFICATION	125
> > +
> > +#define	JH7110_SYSRST_END			126
> 
> Drop weird indentation in the middle of syntax.

Will fix it.

> 
> > +
> > +/* AONCRG resets */
> > +#define JH7110_AONRST_GMAC0_AXI			0
> > +#define JH7110_AONRST_GMAC0_AHB			1
> > +#define JH7110_AONRST_AON_IOMUX			2
> > +#define JH7110_AONRST_PMU_APB			3
> > +#define JH7110_AONRST_PMU_WKUP			4
> > +#define JH7110_AONRST_RTC_APB			5
> > +#define JH7110_AONRST_RTC_CAL			6
> > +#define JH7110_AONRST_RTC_32K			7
> > +
> > +#define	JH7110_AONRST_END			8
> 
> Ditto

Will fix it. Thanks.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

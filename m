Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E72C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 01:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4CCVQyzUQPc27PSRwor23u1BPzInGbmfHyUSZS1Oh8=; b=lyjOh47Y9Nd6MV
	7jSkZgzE0kTT5JAVQsOs9Zx4rFQHj3KOgBxYMrDmxUXa/YZsf63DT8MbqIdajiwbPU2MG+uPZJPCV
	iKE1xfak81lQa9jMFV0rSK/D84UFXVVhela72/E9FvTBG2WC3DiaNixHFnlRhI3ML+rh5EBp9nLya
	uz5IozRJSu6HOhfJI1l3AKgaknakBf2jEqFUXNgdph4UMxZLJU5hY1DeiOUaqTUXbfQkST0aHTiV8
	XYjmU0oMTK5sBhcHTsVOjX+QM3E/6KRVmbNA2sNsq5Su/p5Ud6c8MLqr5guIskt+681dVb7EzGIgN
	cglZYiVxhkek+yaIr0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHgv-001mkt-9L; Tue, 22 Nov 2022 01:03:13 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHgr-001mir-SV
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 01:03:12 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id EFE6924E1B5;
	Tue, 22 Nov 2022 09:02:37 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 22 Nov
 2022 09:02:38 +0800
Received: from [192.168.125.106] (113.72.144.23) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 22 Nov
 2022 09:02:38 +0800
Message-ID: <1db979d5-1fb6-f3c9-8ce0-e3e2e23e5d14@starfivetech.com>
Date: Tue, 22 Nov 2022 09:02:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 07/14] dt-bindings: clock: Add StarFive JH7110 system
 and always-on clock definitions
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
 <20221118010627.70576-8-hal.feng@starfivetech.com>
 <4d1fbddc-ee8b-1ab3-d1a9-8496bda3f668@linaro.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <4d1fbddc-ee8b-1ab3-d1a9-8496bda3f668@linaro.org>
X-Originating-IP: [113.72.144.23]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_170310_088779_6B6D137A 
X-CRM114-Status: GOOD (  11.23  )
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

On Mon, 21 Nov 2022 09:45:11 +0100, Krzysztof Kozlowski wrote:
> On 18/11/2022 02:06, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> > 
> > Add all clock outputs for the StarFive JH7110 system (SYS) and
> > always-on (AON) clock generator.
> > 
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  MAINTAINERS                                 |   5 +-
> >  include/dt-bindings/clock/starfive-jh7110.h | 234 ++++++++++++++++++++
> >  2 files changed, 237 insertions(+), 2 deletions(-)
> >  create mode 100644 include/dt-bindings/clock/starfive-jh7110.h
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e6f1060e7964..e97dac9c0ee4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19598,12 +19598,13 @@ M:	Ion Badulescu <ionut@badula.org>
> >  S:	Odd Fixes
> >  F:	drivers/net/ethernet/adaptec/starfire*
> >  
> > -STARFIVE JH7100 CLOCK DRIVERS
> > +STARFIVE CLOCK DRIVERS
> >  M:	Emil Renner Berthing <kernel@esmil.dk>
> > +M:	Hal Feng <hal.feng@starfivetech.com>
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/clock/starfive,jh7100-*.yaml
> >  F:	drivers/clk/starfive/
> > -F:	include/dt-bindings/clock/starfive-jh7100*.h
> > +F:	include/dt-bindings/clock/starfive*
> >  
> >  STARFIVE JH7100 PINCTRL DRIVER
> >  M:	Emil Renner Berthing <kernel@esmil.dk>
> > diff --git a/include/dt-bindings/clock/starfive-jh7110.h b/include/dt-bindings/clock/starfive-jh7110.h
> 
> Filename based / the same as compatible (or bindings filename).

Should I split this file into two files for "SYSCRG" and "AONCRG", which
maybe named as "starfive-jh7110-sys.h" and "starfive-jh7110-aon.h". Ditto
for the patch 8.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

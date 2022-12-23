Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F7FC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 06:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DfkNFlYz3pWUe8uEDGEkg4mB0l2r8zHy/hW54XGuDhw=; b=JkSAUAPUnnSbok
	EFxr4aOxf+gR/fI5tUD0iIafU8OuEBsGwquumy7bHhWb1ug5IlU2nhX4hlmr3RcAfUeLqxC+oy7VU
	LXd0U6sDEpkxtfopxYg08c8QoAZiweFuRacPfkz7JUGcbmmjxRHH0ubhh25Z2YnSQcgHMRZPYYLJH
	wB37EgjPQzNr7B0xMcGoEJy/GK7CbCDtCZlSEslZoivmI+kY6IigG75UbuEiAyfL0+PkeFDaQ1ear
	aFX46MOrItSTBk4mkvmFm1cGmo08SmTxEKEiH7hKUt9QPn9Plim8YRYJITt4imFa44hWBqhScr8ZX
	pwNgHPRd+fMXrSExe3+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8bSA-004Kaa-Ev; Fri, 23 Dec 2022 06:22:46 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8bS5-004KUh-4N
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 06:22:44 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id E996E24E035;
	Fri, 23 Dec 2022 14:22:06 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 23 Dec
 2022 14:22:06 +0800
Received: from [192.168.125.65] (183.27.97.120) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 23 Dec
 2022 14:22:06 +0800
Message-ID: <20e6b9af-3bee-6a4a-880f-df22ebcbe3b5@starfivetech.com>
Date: Fri, 23 Dec 2022 14:23:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 02/11] clk: starfive: Rename "jh7100" to "jh71x0" for
 the common code
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
References: <20221220005054.34518-1-hal.feng@starfivetech.com>
 <20221220005054.34518-3-hal.feng@starfivetech.com> <Y6IyRlEtiS6ye96q@spud>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <Y6IyRlEtiS6ye96q@spud>
X-Originating-IP: [183.27.97.120]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_222241_607125_449A8DA1 
X-CRM114-Status: GOOD (  18.84  )
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

On Tue, 20 Dec 2022 22:08:06 +0000, Conor Dooley wrote:
> On Tue, Dec 20, 2022 at 08:50:45AM +0800, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> > 
> > Rename "clk-starfive-jh7100.h" to "clk-starfive-jh71x0.h" and rename
> > some variables from "jh7100" or "JH7100" to "jh71x0" or "JH71X0".
> > 
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  .../clk/starfive/clk-starfive-jh7100-audio.c  |  74 ++--
> >  drivers/clk/starfive/clk-starfive-jh7100.c    | 388 +++++++++---------
> >  drivers/clk/starfive/clk-starfive-jh7100.h    | 114 -----
> >  drivers/clk/starfive/clk-starfive-jh71x0.c    | 284 ++++++-------
> >  drivers/clk/starfive/clk-starfive-jh71x0.h    | 114 +++++
> >  5 files changed, 487 insertions(+), 487 deletions(-)
> >  delete mode 100644 drivers/clk/starfive/clk-starfive-jh7100.h
> >  create mode 100644 drivers/clk/starfive/clk-starfive-jh71x0.h
> > 
> > diff --git a/drivers/clk/starfive/clk-starfive-jh7100-audio.c b/drivers/clk/starfive/clk-starfive-jh7100-audio.c
> > index 8473a65e219b..02aefb7264f8 100644
> > --- a/drivers/clk/starfive/clk-starfive-jh7100-audio.c
> > +++ b/drivers/clk/starfive/clk-starfive-jh7100-audio.c
> > @@ -16,7 +16,7 @@
> >  
> >  #include <dt-bindings/clock/starfive-jh7100-audio.h>
> >  
> > -#include "clk-starfive-jh7100.h"
> > +#include "clk-starfive-jh71x0.h"
> >  
> >  /* external clocks */
> >  #define JH7100_AUDCLK_AUDIO_SRC			(JH7100_AUDCLK_END + 0)
> > @@ -28,66 +28,66 @@
> >  #define JH7100_AUDCLK_I2SDAC_LRCLK_IOPAD	(JH7100_AUDCLK_END + 6)
> >  #define JH7100_AUDCLK_VAD_INTMEM                (JH7100_AUDCLK_END + 7)
> >  
> > -static const struct jh7100_clk_data jh7100_audclk_data[] = {
> > -	JH7100__GMD(JH7100_AUDCLK_ADC_MCLK, "adc_mclk", 0, 15, 2,
> > +static const struct jh71x0_clk_data jh7100_audclk_data[] = {
> > +	JH71X0__GMD(JH7100_AUDCLK_ADC_MCLK, "adc_mclk", 0, 15, 2,
> 
> Heh, I'm not sure what to think about these _s for alignment!

Maybe it looks clearer. These code are made previously.

> This one is a little harder to verify with my git show wizardary, but it
> also looks like it does what it says on the tin. Might've been easier to
> verify with git show if the renaming of variables and code movement had
> been split.

Should I split it?

Best regards,
Hal

> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

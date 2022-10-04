Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC88C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 08:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Hv0Q8ry5AgtjtCDDxsU3+34tmtAa2GK2zpt5ux/NyQ=; b=U50VC0XRT6KcNr
	f+bmbh9NZWyr++JnN+punpS5UOSPg/P67XNwo6yZ9Eh1HKxEHq72Ewi/VAJ1aAEPfrEam4JNghZho
	r3PgQXmEwwBQgrXzHbbxRqTBqWu3Z/6YActXi24mQHdLaoUWLtnXVcv2ftUghyXz4lZbEOZ4YDafe
	du5mdMXoe4ysjDRbv4RX4Q1kT8AUGZjas8uzcB85Ursu1Jb03bHVONwpNHrbHsXKUfqkkVrC4hFqZ
	LLj4cbN8k3Msg0TIi/1DvlrHUr5e/h0E8EVWjzm88c2AffelIcIggWrPRhm/WkY+99xlFKHTNwsKd
	akF9yN7CP8Rm5WF/OwBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofdlb-0093DI-UG; Tue, 04 Oct 2022 08:59:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofdlY-0093BJ-Ee
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 08:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664873944; x=1696409944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/xgi/yxDRPadkAgvOtl9fDzZRFHQFZI7oFHBqCZZe6E=;
  b=ey7tqKbZhzWV/zrJh2gPr4yYAARVnvI7Iyk8RUKyK82fi/qLKZUqLivO
   wDAdTNz3XjDcnx2EPGO70vCfRh+OI7/35Zl9Rux83klNiEtYYAQTr/j+6
   5MDQnB3sJE0gHEByhzIvCRoLsQZzfarN9iflSZ043awHlA4MTcKkPMdqj
   SL8i3OWVd2aP7bIhvCg1LlfkSbkL5wrG+YxuG6shcYMMVZyxE7wsE4lE3
   Eut9PK8loK0y3VWxhzKYvVCb/fOuC6NTDAJlyLwPmV+JUR5cQj/Ab9HX+
   ibFPOMuWUmuO8QdeUn/jBUcxynS95B/77dIx277/p6nRNLTQmxAe2PvIz
   w==;
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; 
   d="scan'208";a="180251560"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Oct 2022 01:58:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 4 Oct 2022 01:58:57 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 4 Oct 2022 01:58:54 -0700
Date: Tue, 4 Oct 2022 09:58:32 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>, Hal Feng <hal.feng@linux.starfivetech.com>,
	Rob Herring <robh+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Philipp Zabel <p.zabel@pengutronix.de>, <devicetree@vger.kernel.org>, Albert
 Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, <linux-riscv@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v1 23/30] pinctrl: starfive: Rename "pinctrl-starfive" to
 "pinctrl-starfive-jh7100"
Message-ID: <Yzv1uJbGMuFmRsRL@wendy>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220930061404.5418-1-hal.feng@linux.starfivetech.com>
 <166457324093.1075476.18009315584754055366.robh@kernel.org>
 <CACRpkdZmmMjVwpHxkJP+Ui0XJgrdZx8kpVybifbwkRB1_uMhAg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZmmMjVwpHxkJP+Ui0XJgrdZx8kpVybifbwkRB1_uMhAg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_015904_572004_5E762F1C 
X-CRM114-Status: GOOD (  18.89  )
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

On Tue, Oct 04, 2022 at 10:48:38AM +0200, Linus Walleij wrote:
> On Fri, Sep 30, 2022 at 11:28 PM Rob Herring <robh@kernel.org> wrote:
> > On Fri, 30 Sep 2022 14:14:04 +0800, Hal Feng wrote:
> > > From: Jianlong Huang <jianlong.huang@starfivetech.com>
> > >
> > > Add the SoC name to make it more clear. Also the next generation StarFive
> > > SoCs will use "pinctrl-starfive" as the core of StarFive pinctrl driver.
> > > No functional change.
> > >
> > > Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> > > ---
> > >  .../bindings/pinctrl/starfive,jh7100-pinctrl.yaml           | 2 +-
> > >  arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts   | 2 +-
> > >  drivers/pinctrl/starfive/Kconfig                            | 2 +-
> > >  drivers/pinctrl/starfive/Makefile                           | 2 +-
> > >  .../{pinctrl-starfive.c => pinctrl-starfive-jh7100.c}       | 2 +-
> > >  .../{pinctrl-starfive.h => pinctrl-starfive-jh7100.h}       | 6 +++---
> > >  6 files changed, 8 insertions(+), 8 deletions(-)
> > >  rename drivers/pinctrl/starfive/{pinctrl-starfive.c => pinctrl-starfive-jh7100.c} (99%)
> > >  rename include/dt-bindings/pinctrl/{pinctrl-starfive.h => pinctrl-starfive-jh7100.h} (98%)
> > >
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > Would be good to pull this out separately and apply for 6.1. It's kind
> > of messy with cross tree dependencies.
> 
> OK I applied this for V6.1.

Will this need to be done immutably so it can be pulled into the riscv
tree in case this gets applied as a late change for 6.1:
https://lore.kernel.org/linux-riscv/c5169131-486e-9808-ba48-b7abe1be6a99@collabora.com/

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

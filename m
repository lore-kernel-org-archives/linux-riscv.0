Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF994C77B6F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 13:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2/svNubRqupll9JEIY6jX1+a7j3Wngj0aXr3TT7H98=; b=Uy2WMFzAWWEtSd
	bcpaBC7SeXE4WkqHSiK4SXyKqProCFcpn7mYMnKJVwCdR8ZaVv2lT40f/w5fPQ1I1qHAOAUA2F7zS
	O1sRw30DZjhY3/9vOc3FdMy6ZtD6URMpy5tpasLeon7dCSDFm7W0ylyRLAFG4tot2dTJ13BHZa7G8
	hlYFpaWPfJBA+yaiszWp+eT6V34iP0aGXrMZwcsODKAc7skTT1eSwOv9toeUetY4v5J727xqZoTBi
	NNJGNi/s08+PQnLA0bEKvXAKQqap7gyHlIvDjaY7mdNC7eajAl8KK9hcy8lf4dd0EYAH9tqLu8PkK
	mgfanYdPOBCJ4cyGKp3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmDr8-0005ZM-1O;
	Tue, 11 Apr 2023 13:16:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmDr5-0005Yo-0w
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 13:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681218970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=65PIpy4Fo017P9Ewq+jSXe0ekV1mHG3Go0w7yGOYFXo=;
	b=DeO1XobI6x4JRwjOFVeZnsviM7+6p1Xa/rToJGnA4ufMCi27xTikLJhteTX7UyJ2/lONMy
	OlgnUuQYFmWDwyEz6xXGaItHAcMGm5YleVyK2E9CvsjLV356Iqa8nTQAbE6601CgtJ9Xek
	1+fLMGiPMBr5LQn2smxZsnELL/Rcr20=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-P5CNWDj4PD6A7cOohlG5Fw-1; Tue, 11 Apr 2023 09:16:07 -0400
X-MC-Unique: P5CNWDj4PD6A7cOohlG5Fw-1
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-b8ee07f380aso187378276.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Apr 2023 06:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681218967;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=65PIpy4Fo017P9Ewq+jSXe0ekV1mHG3Go0w7yGOYFXo=;
        b=o98t3miLlCJ8skBHQXf8jSYOD/eFDNO7IJj8dNa/uncqZJpq2b2s69FQQbA/Bi0pIC
         029IPDb8m+xCWt1NNQly+PaFgdE2o51m4KO07d9uGPPw+9qDkfGoaLA9uRzCOGgqD+i4
         j3FIVyizVopPVgAU+aItHESZ0duH56hGvolUzkbVEqpJAteFRLUe9r8CbNlUEq8Q2CUU
         /VLJKmf3Egg38ZgpBRmjal7IRdax/4uMm5cIneF/FebDRVx1WFTgnN+enZey1nk8GGef
         N9fJp/IAApm3ALNRielcL6U4tfEt9jnE3Q3rUtnIL05+3x/Wtm9YcSPm/UEqNvRob9VN
         etMQ==
X-Gm-Message-State: AAQBX9fWuDHN2MwweDgSkv0sP6TUmwpIUPSAehMqQt2AlLuTXqogfDkY
	H/ye80aUgc5ibjFlD399dH7mBDNx4wVuEY/RwinVvVpOseatoAM0oey0SFDUcC2kI/N5ALnKK2S
	eg3gqwWBWBaPe8Ptb5faxmTjoRMB5
X-Received: by 2002:a25:ad65:0:b0:b8f:2258:a4d9 with SMTP id l37-20020a25ad65000000b00b8f2258a4d9mr1572203ybe.0.1681218966700;
        Tue, 11 Apr 2023 06:16:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350bcJp1EL0kh9WfurAeUa23/WA0DCHGOQMqC4gQUclro08FTcMd90O7JjKKUuxS7+Zr9P6vPkA==
X-Received: by 2002:a25:ad65:0:b0:b8f:2258:a4d9 with SMTP id l37-20020a25ad65000000b00b8f2258a4d9mr1572169ybe.0.1681218966324;
        Tue, 11 Apr 2023 06:16:06 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-239-96.dyn.eolo.it. [146.241.239.96])
        by smtp.gmail.com with ESMTPSA id q17-20020a37f711000000b007468765b411sm3940487qkj.45.2023.04.11.06.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 06:16:05 -0700 (PDT)
Message-ID: <cda1f9a630516ab8d02454cd052cb03b35d1b279.camel@redhat.com>
Subject: Re: [-net-next v11 5/6] net: stmmac: Add glue layer for StarFive
 JH7110 SoC
From: Paolo Abeni <pabeni@redhat.com>
To: Guo Samin <samin.guo@starfivetech.com>, Emil Renner Berthing
	 <emil.renner.berthing@canonical.com>, Arun.Ramadoss@microchip.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, netdev@vger.kernel.org, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
 <kernel@esmil.dk>,  Pedro Moreira <pmmoreir@synopsys.com>, Richard Cochran
 <richardcochran@gmail.com>, Conor Dooley <conor@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
 <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
 <yanhong.wang@starfivetech.com>, Tommaso Merciai <tomm.merciai@gmail.com>
Date: Tue, 11 Apr 2023 15:16:00 +0200
In-Reply-To: <62fc36bc-7e43-0214-85d7-be66748a901b@starfivetech.com>
References: <20230407110356.8449-1-samin.guo@starfivetech.com>
	 <20230407110356.8449-6-samin.guo@starfivetech.com>
	 <CAJM55Z9jCdPASsk+fw_j+9QH3+Kj28tpCA4PgW_nB_ce7qWL8w@mail.gmail.com>
	 <b8764e20-f983-177c-63c5-36bb3b57ba9e@starfivetech.com>
	 <CAJM55Z8jSPz70ri_sFnKMjZDoNvoA=K-o7VCeAMmXztzOKRxaA@mail.gmail.com>
	 <62fc36bc-7e43-0214-85d7-be66748a901b@starfivetech.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_061615_426699_CC5CD641 
X-CRM114-Status: GOOD (  42.07  )
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

On Mon, 2023-04-10 at 16:29 +0800, Guo Samin wrote:
> Re: [-net-next v11 5/6] net: stmmac: Add glue layer for StarFive JH7110 SoC
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> to: Guo Samin <samin.guo@starfivetech.com>
> data: 2023/4/9
> 
> > On Sat, 8 Apr 2023 at 03:16, Guo Samin <samin.guo@starfivetech.com> wrote:
> > > 
> > >  Re: [-net-next v11 5/6] net: stmmac: Add glue layer for StarFive JH7110 SoC
> > > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > to: Samin Guo <samin.guo@starfivetech.com>
> > > data: 2023/4/8
> > > 
> > > > On Fri, 7 Apr 2023 at 13:05, Samin Guo <samin.guo@starfivetech.com> wrote:
> > > > > 
> > > > > This adds StarFive dwmac driver support on the StarFive JH7110 SoC.
> > > > > 
> > > > > Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > > > > Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> > > > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > > > > Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> > > > > ---
> > > > >  MAINTAINERS                                   |   1 +
> > > > >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
> > > > >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> > > > >  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 123 ++++++++++++++++++
> > > > >  4 files changed, 137 insertions(+)
> > > > >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> > > > > 
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index 6b6b67468b8f..46b366456cee 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -19910,6 +19910,7 @@ M:      Emil Renner Berthing <kernel@esmil.dk>
> > > > >  M:     Samin Guo <samin.guo@starfivetech.com>
> > > > >  S:     Maintained
> > > > >  F:     Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> > > > > +F:     drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> > > > > 
> > > > >  STARFIVE JH7100 CLOCK DRIVERS
> > > > >  M:     Emil Renner Berthing <kernel@esmil.dk>
> > > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > > > > index f77511fe4e87..5f5a997f21f3 100644
> > > > > --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > > > > +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > > > > @@ -165,6 +165,18 @@ config DWMAC_SOCFPGA
> > > > >           for the stmmac device driver. This driver is used for
> > > > >           arria5 and cyclone5 FPGA SoCs.
> > > > > 
> > > > > +config DWMAC_STARFIVE
> > > > > +       tristate "StarFive dwmac support"
> > > > > +       depends on OF && (ARCH_STARFIVE || COMPILE_TEST)
> > > > > +       select MFD_SYSCON
> > > > > +       default m if ARCH_STARFIVE
> > > > > +       help
> > > > > +         Support for ethernet controllers on StarFive RISC-V SoCs
> > > > > +
> > > > > +         This selects the StarFive platform specific glue layer support for
> > > > > +         the stmmac device driver. This driver is used for StarFive JH7110
> > > > > +         ethernet controller.
> > > > > +
> > > > >  config DWMAC_STI
> > > > >         tristate "STi GMAC support"
> > > > >         default ARCH_STI
> > > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > > > > index 057e4bab5c08..8738fdbb4b2d 100644
> > > > > --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> > > > > +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > > > > @@ -23,6 +23,7 @@ obj-$(CONFIG_DWMAC_OXNAS)     += dwmac-oxnas.o
> > > > >  obj-$(CONFIG_DWMAC_QCOM_ETHQOS)        += dwmac-qcom-ethqos.o
> > > > >  obj-$(CONFIG_DWMAC_ROCKCHIP)   += dwmac-rk.o
> > > > >  obj-$(CONFIG_DWMAC_SOCFPGA)    += dwmac-altr-socfpga.o
> > > > > +obj-$(CONFIG_DWMAC_STARFIVE)   += dwmac-starfive.o
> > > > >  obj-$(CONFIG_DWMAC_STI)                += dwmac-sti.o
> > > > >  obj-$(CONFIG_DWMAC_STM32)      += dwmac-stm32.o
> > > > >  obj-$(CONFIG_DWMAC_SUNXI)      += dwmac-sunxi.o
> > > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> > > > > new file mode 100644
> > > > > index 000000000000..4963d4008485
> > > > > --- /dev/null
> > > > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> > > > > @@ -0,0 +1,123 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0+
> > > > > +/*
> > > > > + * StarFive DWMAC platform driver
> > > > > + *
> > > > > + * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
> > > > > + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> > > > > + *
> > > > > + */
> > > > > +
> > > > > +#include <linux/mfd/syscon.h>
> > > > > +#include <linux/of_device.h>
> > > > > +#include <linux/regmap.h>
> > > > > +
> > > > > +#include "stmmac_platform.h"
> > > > > +
> > > > > +struct starfive_dwmac {
> > > > > +       struct device *dev;
> > > > > +       struct clk *clk_tx;
> > > > > +};
> > > > > +
> > > > > +static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed)
> > > > > +{
> > > > > +       struct starfive_dwmac *dwmac = priv;
> > > > > +       unsigned long rate;
> > > > > +       int err;
> > > > > +
> > > > > +       rate = clk_get_rate(dwmac->clk_tx);
> > > > 
> > > > Hi Samin,
> > > > 
> > > > I'm not sure why you added this line in this revision. If it's just to
> > > > not call clk_set_rate on the uninitialized rate, I'd much rather you
> > > > just returned early and don't call clk_set_rate at all in case of
> > > > errors.
> > > > 
> > > > > +
> > > > > +       switch (speed) {
> > > > > +       case SPEED_1000:
> > > > > +               rate = 125000000;
> > > > > +               break;
> > > > > +       case SPEED_100:
> > > > > +               rate = 25000000;
> > > > > +               break;
> > > > > +       case SPEED_10:
> > > > > +               rate = 2500000;
> > > > > +               break;
> > > > > +       default:
> > > > > +               dev_err(dwmac->dev, "invalid speed %u\n", speed);
> > > > > +               break;
> > > > 
> > > > That is skip the clk_get_rate above and just change this break to a return.
> > > > 
> > > 
> > > Hi Emil,
> > > 
> > > We used the solution you mentioned before V3, but Arun Ramadoss doesn't think that's great.
> > > (https://patchwork.kernel.org/project/linux-riscv/patch/20230106030001.1952-6-yanhong.wang@starfivetech.com)
> > > 
> > > 
> > > > +static void starfive_eth_plat_fix_mac_speed(void *priv, unsigned int
> > > > speed)
> > > > +{
> > > > +     struct starfive_dwmac *dwmac = priv;
> > > > +     unsigned long rate;
> > > > +     int err;
> > > > +
> > > > +     switch (speed) {
> > > > +     case SPEED_1000:
> > > > +             rate = 125000000;
> > > > +             break;
> > > > +     case SPEED_100:
> > > > +             rate = 25000000;
> > > > +             break;
> > > > +     case SPEED_10:
> > > > +             rate = 2500000;
> > > > +             break;
> > > > +     default:
> > > > +             dev_err(dwmac->dev, "invalid speed %u\n", speed);
> > > > +             return;
> > > 
> > > Do we need to return value, since it is invalid speed. But the return
> > > value of function is void.(Arun Ramadoss)
> > > 
> > > 
> > > So in v9, after discussing with Jakub Kicinski, the clk_set_rate was used to initialize the rate.
> > > (It is a reference to Intel's scheme:    dwmac-intel-plat.c: kmb_eth_fix_mac_speed)
> > > (https://patchwork.kernel.org/project/linux-riscv/patch/20230328062009.25454-6-samin.guo@starfivetech.com)
> > > 
> > 
> > Yeah, I think this is a misunderstanding and Arun is considering if we
> > ought to return the error which we can't without changing generic
> > dwmac code, and Jakub is rightly concerned about using a local
> > variable uninitialized. I don't think anyone is suggesting that
> > getting the rate just to set it to the exact same value is better than
> > just leaving the clock alone.
> > 
> HI Emil,
> 
> Yeah, return early saves time and code complexity, and seems like a good solution so Yanhong did the same before v3. (Jakub has suggested it before),
> I wonder if Arun or other maintainers accept this solution or if there are other solutions?

I think is not a big deal either way.

To avoid too much back and forth I'll stick to the current code.

Please address Emil comment on patch 6/6

Thanks!

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AA8C8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 00:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ri4aLPX9RaQONzTFwcU2QQ9ZXNSqQgg2as0riVsZBuU=; b=WDOcmP8jrVP5VH
	tRrY1X3sbGzKu/pUhlKWhleeDriXL4Szf7s2HhVKoQA9WKT346xaqtGQHM6PR2Q5J42b83kZc2qoF
	DzJd8YJZ66/Wai20+eu5hYQNb5zVLrQLvXdnBTvIGNncVYi6u9Ei36p4j9TpIFKAr71RX5loRU7qi
	c+ABhOrPWoApkznp7iijjjDo71LV0DQxlyCjgaoyToORQJCTxFwDibsCavDoyNajGGM1XVTTqgdTt
	/yolfM6OLSucSya3AVnzLXDJUcPQ5dWbgQQHfxXc/vOpn+W+bMJM6klmDk4CmmaYhlwhn4orNDHfc
	NcSbM9Nxm+3jjoZAP1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWOzB-00000003k8G-1pcQ;
	Tue, 01 Jul 2025 00:36:33 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWOz9-00000003k7p-27W0
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 00:36:32 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso3305854b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 17:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751330190; x=1751934990; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fYK0EMxlksXo/Dbg3CdSxsVmRLSPWk16y3vUzHbd8ns=;
        b=RIu/YhK6HdkPicUnPHidvZPaVFRVPZ8/fGH8a/QdFDNWmBtBQP9ltICqMdJFfFhzEF
         uH/XaBtRFHkjnKLH5ccAVVhtIag0QrhvMCEjfJNMmnvRdPn9gnx3j2jozSZkAd2yLsAt
         2N/JlhJINTz47jKnug5w3ihNQcedpyz6aosAmgSB5Bw/eyiDztLyQZ3QuiLwOEBrYdRm
         h5yGrXnFvu0oCYlmqxgyJ0CfKAspYPwBYYBb7fFmQPRcvSluaSl7kwxrF96t83tloJpv
         X3n0Qj/x/lS2++D3PegtCEORBsxq0hqFzdAkxsVDl+Wxpo1wpXU3qIA5NFtxEO5k1CQk
         3tTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751330190; x=1751934990;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fYK0EMxlksXo/Dbg3CdSxsVmRLSPWk16y3vUzHbd8ns=;
        b=XirhC7reQ9wZXvbyWzA+zH2+ZSUnLObYvn7AryXpb6hHlz1GRD9MLLcc/iX71DlA0p
         s7O2f7jDhlTtGLS3rddcdCKn4FnLaE9a9CUeNxrM2GcEY/sdKa+NIRqelBlthPuFNDUw
         Cwr9bIkBQBsEDxlUHVbtpVtS0kSEi9vjNwBSRhhJFoNFEChGOjOkDorAPazydLUn/B4p
         Lp5T2WEJHtBbZDdYCf25EAizztZD7B8qQdKddJ9OqFiZQd3yiU4CUqpgP1V28jPb67CK
         W80ZnW6UwKzV3tzRKrGgryIyfExdaBRfp+Ri/76ZydO76+9FReRrXgK5UwozEfbgjylv
         A01g==
X-Forwarded-Encrypted: i=1; AJvYcCX5YCwQOJFUxpXTWFqdB1MOAcaVJnbsCT96NvXa0kgRISopGsKCQ4HeYfoLcIwDoj9/ARoTD3FOWNZ5/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvQoRzYWAOqXYecjgVd6Z6nodrrg2dXPhWzj3FQx6dRPyMw0A0
	d3FyHzg23QnEgKc6Mp+Ky3rxN2SAAmBNyPJUoX+90ioKH1q2lZsg4OmZ
X-Gm-Gg: ASbGncsZRYcjRt+56MmB85V5ljl2If8QO3UgRSU0hsjMrRLm0Kwub3Fwv9Ps2BCPFQq
	QSQmJeik++QfxaUla3/v2b8WXBUPB6hlVa+fwUxdHP4rnCaKWawySpt76vpo4O7ALCMFZgW8uBV
	Wnr4lTv+ajUPUzmEMbpEZ7up2Mp2XBmxbiAkL7a43qtc0/CeafTn/Gcm6CzUitv150x3OIHw7nz
	sRRVyXBsssi8vW6bD7ZNkAp5FHTqi2C6vhcA82AOIm9JbeBk8XNwsbRME0EpJRxcem+/XFnKu+z
	bGePCM0iX/uPupeusIH2pwZ/AwpZP2yUA/ibQ3qVHHHehV0kDr1Eej/bxhhbZqSVhp2VFoLs
X-Google-Smtp-Source: AGHT+IGKImkUMqI2z1gYD78QbviBmg1fxYvY1gFIlaFkYpHjQXCCeDUr0So2MH05sHoga4eLCxoPHg==
X-Received: by 2002:a05:6a00:b42:b0:736:31cf:2590 with SMTP id d2e1a72fcca58-74af70291e3mr20221152b3a.16.1751330190407;
        Mon, 30 Jun 2025 17:36:30 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af541b6e5sm9662133b3a.43.2025.06.30.17.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 17:36:29 -0700 (PDT)
Date: Tue, 1 Jul 2025 08:36:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 2/2] net: mdio-mux: Add MDIO mux driver for
 Sophgo CV1800 SoCs
Message-ID: <255j5pbi3pty5n3dmcalq4uhsoj37rsq5263fijn76o3vrkbs5@cctlwa5567om>
References: <20250611080228.1166090-1-inochiama@gmail.com>
 <20250611080228.1166090-3-inochiama@gmail.com>
 <b8e37f3b89209f6674b0419ec28e0302de6b3c4e.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b8e37f3b89209f6674b0419ec28e0302de6b3c4e.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_173631_545897_905411D3 
X-CRM114-Status: GOOD (  33.06  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 30, 2025 at 11:08:37PM +0200, Alexander Sverdlin wrote:
> Hi Inochi!
> =

> On Wed, 2025-06-11 at 16:02 +0800, Inochi Amaoto wrote:
> > Add device driver for the mux driver for Sophgo CV18XX/SG200X
> > series SoCs.
> > =

> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> > =A0drivers/net/mdio/Kconfig=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 10 +++
> > =A0drivers/net/mdio/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 1 +
> > =A0drivers/net/mdio/mdio-mux-cv1800b.c | 119 ++++++++++++++++++++++++++=
++
> > =A03 files changed, 130 insertions(+)
> > =A0create mode 100644 drivers/net/mdio/mdio-mux-cv1800b.c
> > =

> > diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
> > index 7db40aaa079d..fe553016b77d 100644
> > --- a/drivers/net/mdio/Kconfig
> > +++ b/drivers/net/mdio/Kconfig
> > @@ -278,5 +278,15 @@ config MDIO_BUS_MUX_MMIOREG
> > =A0
> > =A0	=A0 Currently, only 8/16/32 bits registers are supported.
> > =A0
> > +config MDIO_BUS_MUX_SOPHGO_CV1800B
> > +	tristate "Sophgo CV1800 MDIO multiplexer driver"
> > +	depends on ARCH_SOPHGO || COMPILE_TEST
> > +	depends on OF_MDIO && HAS_IOMEM
> > +	select MDIO_BUS_MUX
> > +	default m if ARCH_SOPHGO
> > +	help
> > +	=A0 This module provides a driver for the MDIO multiplexer/glue of
> > +	=A0 the Sophgo CV1800 series SoC. The multiplexer connects either
> > +	=A0 the external or the internal MDIO bus to the parent bus.
> > =A0
> > =A0endif
> > diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
> > index c23778e73890..a67be2abc343 100644
> > --- a/drivers/net/mdio/Makefile
> > +++ b/drivers/net/mdio/Makefile
> > @@ -33,3 +33,4 @@ obj-$(CONFIG_MDIO_BUS_MUX_MESON_G12A)	+=3D mdio-mux-m=
eson-g12a.o
> > =A0obj-$(CONFIG_MDIO_BUS_MUX_MESON_GXL)	+=3D mdio-mux-meson-gxl.o
> > =A0obj-$(CONFIG_MDIO_BUS_MUX_MMIOREG)=A0	+=3D mdio-mux-mmioreg.o
> > =A0obj-$(CONFIG_MDIO_BUS_MUX_MULTIPLEXER)=A0	+=3D mdio-mux-multiplexer.o
> > +obj-$(CONFIG_MDIO_BUS_MUX_SOPHGO_CV1800B) +=3D mdio-mux-cv1800b.o
> > diff --git a/drivers/net/mdio/mdio-mux-cv1800b.c b/drivers/net/mdio/mdi=
o-mux-cv1800b.c
> > new file mode 100644
> > index 000000000000..6c69e83c3dcd
> > --- /dev/null
> > +++ b/drivers/net/mdio/mdio-mux-cv1800b.c
> > @@ -0,0 +1,119 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Sophgo CV1800 MDIO multiplexer driver
> > + *
> > + * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/delay.h>
> > +#include <linux/clk.h>
> > +#include <linux/io.h>
> > +#include <linux/mdio-mux.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define EPHY_PAGE_SELECT		0x07c
> > +#define EPHY_CTRL			0x800
> > +#define EPHY_REG_SELECT			0x804
> > +
> > +#define EPHY_PAGE_SELECT_SRC		GENMASK(12, 8)
> > +
> > +#define EPHY_CTRL_ANALOG_SHUTDOWN	BIT(0)
> > +#define EPHY_CTRL_USE_EXTPHY		BIT(7)
> > +#define EPHY_CTRL_PHYMODE		BIT(8)
> > +#define EPHY_CTRL_PHYMODE_SMI_RMII	1
> > +#define EPHY_CTRL_EXTPHY_ID		GENMASK(15, 11)
> > +
> > +#define EPHY_REG_SELECT_MDIO		0
> > +#define EPHY_REG_SELECT_APB		1
> > +
> > +#define CV1800B_MDIO_INTERNAL_ID	1
> > +#define CV1800B_MDIO_EXTERNAL_ID	0
> > +
> > +struct cv1800b_mdio_mux {
> > +	void __iomem *regs;
> > +	void *mux_handle;
> > +};
> > +
> > +static int cv1800b_enable_mdio(struct cv1800b_mdio_mux *mdmux, bool in=
ternal_phy)
> > +{
> > +	u32 val;
> > +
> > +	val =3D readl(mdmux->regs + EPHY_CTRL);
> > +
> > +	if (internal_phy)
> > +		val &=3D ~EPHY_CTRL_USE_EXTPHY;
> > +	else
> > +		val |=3D EPHY_CTRL_USE_EXTPHY;
> > +
> > +	writel(val, mdmux->regs + EPHY_CTRL);
> > +
> > +	writel(EPHY_REG_SELECT_MDIO, mdmux->regs + EPHY_REG_SELECT);
> > +
> > +	return 0;
> > +}
> =

> Seems that it actually doesn't multiplex the buses? As seen on SG2000:
> =


A switch is also a multiplexer.

> # mdio mdio_mux-0.0
>  DEV      PHY-ID  LINK
> 0x00  0x00435649  up
> 0x01  0x00435649  up
> 0x02  0x00000000  down
> ...
> # mdio mdio_mux-0.1
>  DEV      PHY-ID  LINK
> 0x00  0x00435649  up
> 0x01  0x00435649  up
> ...
> =

> The single internal PHY appears on two addresses (0 and 1) and on both bu=
ses.

Only address 1 is right, all phy will respond address 0.
And you should not probe bus 1 when using internal bus,
it is not existed.

> Maybe it just switches the external MDIO master on/off?

Yes

> Seems that we need the documentation for this thing ;-)
> =


Please ask for the vendor.

> BTW, above LINK up is unfortunately without any cable attached...

I have repeat the led problem. After setting the right pinctrl,
It is always light and not blink. I guess there may be a internal
bug for it. I will ignore this problem as it is not the driver
issue.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63977C7113E
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CzKIysqYyDxp9+g3RgbVJOSqhmV2up8poO4JvLIF3a0=; b=VOwkbX+GDmU+GB
	mQ8+l79BfCVuiA8MlqVO9quYzkBdWMN2crEPC4w80yDuSWKVJ19DoofgJSBsGQ6o8ttnCWZlxjZwH
	L06P2z4nrkuI4mjB8+RH/uas7/a0yE1RbT+jgPgHiUTSHvHx+CJxtoeaHjR1RO2TiSQhv/wFtDH5k
	lo26MK4pk8d45S3z59+H3drdovC3la60XZwx80FvxNw63H0ojWXtap1UQN+C+zpmTjlDAIwrfFBH3
	TOo+xbOtEwZWTCzpSsPYJudUFDcttwjwJKusQl/XCudffzj+ys0dsAMuxSNCrRGvTIqDZvFAsB6Mo
	Cr/ZeE1yrL/elCKBEJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRYL-0000000B483-0rZS;
	Wed, 11 Jun 2025 19:56:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO4m-0000000AZ1O-2Zx1
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 16:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5Pah9/CBtffo+lrIVkKDlsrLYUZHo+PGjMuqf3Dti3w=; b=nHNSOBGbRNP8l8/sOdiLU3RC5W
	7oIdZKQsC3Yyg5Nz4H1AsjKFQSG3miVUFKAYqSkGkVKLxk6roKXNElCQHyV3Q91pTENKucD11UZcX
	zfZoyNJ4Cl0yj+fZJaNFXs0pDjXUuAFYQhvO9hovm+8deePxRYep9qk7Y/OlwVxg6auM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uPO4S-00FQMS-G7; Wed, 11 Jun 2025 18:13:00 +0200
Date: Wed, 11 Jun 2025 18:13:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 2/2] net: mdio-mux: Add MDIO mux driver for
 Sophgo CV1800 SoCs
Message-ID: <eb419ffa-055f-48db-8c6a-60bf240fbb9d@lunn.ch>
References: <20250611080228.1166090-1-inochiama@gmail.com>
 <20250611080228.1166090-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611080228.1166090-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_091320_649219_B1698C11 
X-CRM114-Status: GOOD (  11.63  )
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

On Wed, Jun 11, 2025 at 04:02:00PM +0800, Inochi Amaoto wrote:
> Add device driver for the mux driver for Sophgo CV18XX/SG200X
> series SoCs.
> 
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Sophgo CV1800 MDIO multiplexer driver
> + *
> + * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/mdio-mux.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#define EPHY_PAGE_SELECT		0x07c
> +#define EPHY_CTRL			0x800
> +#define EPHY_REG_SELECT			0x804
> +
> +#define EPHY_PAGE_SELECT_SRC		GENMASK(12, 8)
> +
> +#define EPHY_CTRL_ANALOG_SHUTDOWN	BIT(0)
> +#define EPHY_CTRL_USE_EXTPHY		BIT(7)
> +#define EPHY_CTRL_PHYMODE		BIT(8)
> +#define EPHY_CTRL_PHYMODE_SMI_RMII	1
> +#define EPHY_CTRL_EXTPHY_ID		GENMASK(15, 11)

There are a lot of defines here which are not used, but as far as i
see, there is one 8bit register, where bit 7 controls the mux.

It looks like you can throw this driver away and just use
mdio-mux-mmioreg.c. This is from the binding documentation with a few
tweaks:

   mdio-mux@3009000 {
        compatible = "mdio-mux-mmioreg", "mdio-mux";
        mdio-parent-bus = <&xmdio0>;
        #address-cells = <1>;
        #size-cells = <0>;
        reg = <0x3009000 1>;
        mux-mask = <128>;

        mdio@0 {
            reg = <0>;
            #address-cells = <1>;
            #size-cells = <0>;

            phy_xgmii_slot1: ethernet-phy@4 {
                compatible = "ethernet-phy-ieee802.3-c45";
                reg = <4>;
            };
        };

        mdio@128 {
            reg = <128>;
            #address-cells = <1>;
            #size-cells = <0>;

            ethernet-phy@4 {
                compatible = "ethernet-phy-ieee802.3-c45";
                reg = <4>;
            };
        };
    };

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

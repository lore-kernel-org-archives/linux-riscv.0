Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5B0D2ECF7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 11:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ccJjO6/X4z2UP3A7kfCL64o9Y3AgFpG7LZRP5FxsSJM=; b=UrA8xvwQLD15qd
	94h193wOyqPKHFkzW5UIT1wOm9Tk/jK/y2r0Ydwo1lRMuJswoSoPVEibOTfoOOoOZ2QS9YKcSbjHK
	qUZziffrKR8QYcsiDdiE0pl4M60C+YsKXKwMA8L5SfDxOQmmBtfit1iCLHyZpDTpSWW1Rpb+cgu9S
	r2c91IbEHKR6R0pFVaf5xbLwZGSDRMIzk0qpcfFS9uE2hzVgEcAd/Krn8i9nipH3LQDrT5GRhwNgG
	T4wJTYQeUx0Sp95CVdxTc3ZV872ljs0/7b+MyHjljAU7xAxqZyMuvk43sBgb1Hm2C8T1Ns5svHy5N
	haS0U+lKQ6W1dfHs06lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA7G-00000003jV7-3Dyh;
	Tue, 20 Jan 2026 11:41:46 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA7E-00000003jU7-1i4i
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 11:41:45 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2b04fcfc0daso6238692eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 03:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768909303; x=1769514103; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VjkNqktI4MZMt6SSfHT5UbzSxH8+GJApfRaBdqEuizY=;
        b=K304N57KHAwAA95nanJWLfeu67Lu3UEUIXwQUcqaXbR0VsK874buSw7AJq4pE+clvj
         N2trdzhtjP+MovDAwdYxXUNZSy0fuYRTUf61g0d306q99UT9XciaTRlS6uV1yeR3/7pH
         +ciH3j72Og1g845GobKSLOQg6BDfY8Z+kVRbCdS8+Z6dm31u3Lf8DWErDviCrj1RnVqq
         dL16RaJgUTHcbM92U9mgJlEoxytDemzvX28cKOcZPcbUD43xkqiZ5KatMysg3f3XNjTw
         xcOJmYJ9ZpmytmnUGjooT82uHBX1VvB7K5JyYOTzTosO/qdqcwz461bIbV98L6itagd5
         5yVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768909303; x=1769514103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjkNqktI4MZMt6SSfHT5UbzSxH8+GJApfRaBdqEuizY=;
        b=MmIBlcbfXfkwZMEbqsuS2FQ+WUANc1zJxUzZ+GSMZ5AzOmFchLNC75RkchcHur+FpN
         P1sOqRoR7iUeeFmArmlJJhh7AL9qt0MI4BPV3qdoXnSXD5WLJHU6B/9ENfPwXgDj+kiZ
         kQiqy8cATuA1haBGmd7kawTLAhSrV/k+jLaYnI207X047PnHWa0+XwJs1ALvSKtp8Gjg
         uchsujLLcpvBLOGc9LNX+9uyMSYxl2cLFCRLKb+cGBBhM6d0vYvFuIcMkFniwPO/Vo+K
         ZF1O4OnPLMs0I0+WeYecSdwIJ8SSsiexNRcJyu7u51XiaLv0y8T6C3H/lP3Jj23PgfDN
         +fug==
X-Forwarded-Encrypted: i=1; AJvYcCVYjb2+ks9Tmg5V8/MRkN+TFD2iIAXHo08vl0nA05lM6XAbWKpygnTeM42fzaO2Apm4pXiue4G4hLH4QA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHVeEXhRUa5Vqj9DFBS8tAjveSEejBKYSr08Yi54gtDfnBTV94
	fc7z5ogahUlodsB+ooNTHU4br9oRilwGRBS9WDBpLRha1gaX7qfgEj1w
X-Gm-Gg: AZuq6aLk+0bdrGy9c7cYrSJF/Gv859uwBJWfrOlmgRPoddB5ZvC5Jf3oPR6JZX5V43L
	ofdJZYeCREvvuhyDaaFaq6UyvZP8oz4/zjfpnQSGvS2wAiM5lni33jWtsnmhwU/RtZdFkO0++z5
	j0sjIRI+3qCFuy/3e4AP3f0jBBaIgqwujOn2USC1gq83j9wm7X1zkjyXp9vm5e+6o9AvwlkrgWe
	XiutUPfWOkst84cgNaoFiRuksCKtFOV75s+fexKPzZcoI+2QyuKrDKMJMdEr5nr6Zpvj2fOf+Xs
	gR0ZftLDH2g/JUYe/x6pwkhscN+qiY0Th/IEyAk5MP8s4KdiZ0WnwqpjkowcpucSBoWn3CraGKu
	CxXSrUGlElwHChhCPvOk38F9WIR/+EvO4uP5xKZqEDSValsTpAHO/X3Tm46S745b1Lt1Y8802Wi
	Xli3viHmsGaw==
X-Received: by 2002:a05:7301:3d0d:b0:2ab:ca55:89c6 with SMTP id 5a478bee46e88-2b6b412b2cemr9952612eec.41.1768909302992;
        Tue, 20 Jan 2026 03:41:42 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6c2de1f29sm14737037eec.15.2026.01.20.03.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:41:42 -0800 (PST)
Date: Tue, 20 Jan 2026 19:41:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yao Zi <me@ziyao.cc>, Inochi Amaoto <inochiama@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add glue layer for Spacemit K3
 SoC
Message-ID: <aW9plNvIujPTqHtZ@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <aW9jbqBSgkiLLw8r@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aW9jbqBSgkiLLw8r@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_034144_454639_71387027 
X-CRM114-Status: GOOD (  32.66  )
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

On Tue, Jan 20, 2026 at 11:13:50AM +0000, Yao Zi wrote:
> On Tue, Jan 20, 2026 at 12:36:08PM +0800, Inochi Amaoto wrote:
> > Adds Spacemit dwmac driver support on the Spacemit K3 SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >  .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 224 ++++++++++++++++++
> >  3 files changed, 237 insertions(+)
> >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> 
> ...
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> > new file mode 100644
> > index 000000000000..72744e60d02a
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> > @@ -0,0 +1,224 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Spacemit DWMAC platform driver
> > + *
> > + * Copyright (C) 2026 Inochi Amaoto <inochiama@gmail.com>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/math.h>
> 
> These are the only two headers listed out-of-order. Is this intended?
> 

I will fix this.

> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> 
> ...
> 
> > +static int spacemit_dwmac_detected_delay_value(unsigned int delay,
> > +					       unsigned int *config)
> > +{
> > +	int i;
> > +	int code, best_code = 0;
> > +	unsigned int best_delay = 0;
> > +	unsigned int best_config = 0;
> > +
> > +	if (delay == 0)
> > +		return 0;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(k3_delay_step_10x); i++) {
> > +		unsigned int step = k3_delay_step_10x[i];
> > +
> > +		for (code = 1; code <= MAX_DLINE_DELAY_CODE; code++) {
> > +			/*
> > +			 * Note K3 require a specific factor for calculate
> > +			 * the delay, in this scenario it is 0.9. So the
> > +			 * formula is code * step / 10 * 0.9
> > +			 */
> > +			unsigned int tmp = code * step * 9 / 10 / 10;
> > +
> > +			if (abs(tmp - delay) < abs(best_delay - delay)) {
> > +				best_code = code;
> > +				best_delay = tmp;
> > +				best_config = i;
> > +			}
> 
> Is the inner loop really necessary? Could it be replaced by
> 
> 	this_code = DIV_ROUND_CLOSEST(delay * 10 * 10, step * 9);
> 	this_delay = this_code * step * 9 / 10 / 10;
> 
> Then comparing abs(this_delay - delay) and abs(best_delay - delay)?
> 

This is a good idea, thanks.

> > +		}
> > +	}
> > +
> > +	*config = best_config;
> > +
> > +	return best_code;
> > +}
> 
> ...
> 
> > +static int spacemit_dwmac_update_ifconfig(struct plat_stmmacenet_data *plat_dat,
> > +					  struct stmmac_resources *stmmac_res,
> > +					  struct regmap *apmu,
> > +					  unsigned int ctrl_offset)
> > +{
> > +	unsigned int mask = PHY_INTF_MII | PHY_INTF_RGMII | WAKE_IRQ_EN;
> > +	unsigned int val = 0;
> > +
> > +	switch (plat_dat->phy_interface) {
> > +	case PHY_INTERFACE_MODE_MII:
> > +		val |= PHY_INTF_MII;
> > +		break;
> 
> The OR operation seems unnecessary and could be replaced with an
> assignment. Same for PHY_INTERFACE_MODE_RGMII's case.
> 

That's tree, an assignment is better than the OR operation, I will
change this in the next version.

> > +
> > +	case PHY_INTERFACE_MODE_RMII:
> > +		break;
> > +
> > +	case PHY_INTERFACE_MODE_RGMII:
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +		val |= PHY_INTF_RGMII;
> > +		break;
> > +
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> 
> ...
> 
> > +static int spacemit_dwmac_probe(struct platform_device *pdev)
> > +{
> 
> ...
> 
> > +	of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps", &tx_delay);
> > +	of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps", &rx_delay);
> 
> According to of.h, of_property_read_u32, which in turn calls
> of_property_read_u32_array, could fail with -ENODATA if there's no value
> associated with the property. Should the case be handled?
> 
> Regards,
> Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

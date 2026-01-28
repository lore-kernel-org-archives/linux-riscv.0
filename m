Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB05CD25B45
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 11:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+Ui4EEQ2/MBjfE7DFkDzvLeFBbXl5YZKYg0PGPT0Tw=; b=NkWtfiMfODai1X
	9q5aMuR1t/ZOZbITipHKrGKFuk7AftZM6VvKRwcAG/HWtYplbJT3oBEJVHC+qhedjxwLONGswga/s
	Hr+OwJBf621ZvXxenHhl9O6G1xSRnpons9pw9ftlc3qiXfgt/cpOaNZty7AUfc640AjRw87uFUPl7
	mznwYoNvnbGgQrCvxBSZGC/6QO/MliCXi4kqWtOnlKdDa+qPKCyxhOIVer73qc6JTQuT74hw/eHqz
	rVnI1LnPXwb5zUuemofdgRO8VqOSmqmj2GyQTJ6d3ZF2ODlSFwQbEB9QENU056J9VrsrP67RGYM3c
	E095/P2f/CPm85jQtsXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3cv-0000000FuxN-3iHc;
	Wed, 28 Jan 2026 11:22:28 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3cs-0000000Fuvb-25us
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 11:22:24 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-12336c0a8b6so2375399c88.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 03:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769599341; x=1770204141; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QJUI8NJKVSDnIT+QSuw3y5qsdf/HcwP4R02WUPv/Zns=;
        b=BGUg5WuYB1mRlKrQMzX8VMMeF4/2ZEfRrRiRZ3AN1+wrwSHuaj7MH5VIXZMlM5PNSJ
         Kj8JcdhXdL2pbekUzBHKICvb7V2rZye27wc6VPO7i529kOlqE5dEJUJ/4TcGQvs7O4SF
         p8uZSlTS5ktXd2fmQh0TxJhGFVzyzRA0Vv0oLvyq1Fy8M8buHwAYWugf9ncxtFchn8Ey
         +tP98VZZtEt1DTjZAyxA8ELIPEyBQxgDIzsWy2XOXFpjGkmZmbVlr40P29Ud99L5ceM6
         vRslRzfNEbso3n455rJflOY06q0/S6weHwGZLbX3hkLTvQ5X0qSlvkDczzk/gczwDlKr
         a9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599341; x=1770204141;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJUI8NJKVSDnIT+QSuw3y5qsdf/HcwP4R02WUPv/Zns=;
        b=RCqR8CaH/YoV1oPUcHEl9HyKR2e76qfBK71tfErgWqmQi3DzrvuW2iQ2PEn4pNANxz
         xF9QzIl36g9TzuA76ieesHzunPEDai4SlLPrcYvFTM5m8taMVfUjVfIKTF+wvDILORPC
         bk+WqKxoFseks2EqItntCJeUpepKMhgq32vKMVyPLuSLr4Cyl8SMir3TNEi8PzrVO9fA
         tqwfUYqi+HaMiPegfTO4+IbFfyMwazZPxp/bPmnMWWliVJIgfkC39gAgWzRPEQh0XvX1
         c3OeYVLtIZXKebhxR37GFt500qNcQtynuP7NXRQZE1U40iFNoUMq5ChR0BU1DL5I8hNL
         HIeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDMZaviq0/bGjfbzb7+VY9llVgqn8CtSNhmUE+YMqHSuaBDd5NpQ7tJ14m3nSi1lErJQupcqpwS+mQuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDnuSVZ581kBA/lYDdqlniQ8toSsdUO2KMAPG24g5X0Lp7SU/N
	mdL/UbcnbtaM3xXHmS0/Pp+hHgQfVsvueziY25HZUqzBdcFmcDwzwopC
X-Gm-Gg: AZuq6aLrpYaopjnouDfJlBZyON85ErhQ4fD/nO9KzK7pr8z+r/18OAL/ui9I3TkY55/
	euznp8Lu0bdnTOtakm0cBZsTuCIYTLflUWXAR02F1Ans3rzqspQnkXB96PEwGdNmW3BJ+5rSlPg
	7Oi2aNEFx+lGFrncmmQ3DIllEel7V7iojdLPnSkFUBttvOvYJQYc/eZZyUklmzotkRBrg3fF6kJ
	rUoNypWi1qeYNHeusNuywD+MlyQ42XMmdCvcfJPyewv4icj1Hqp6qQOz38ZgPWBNf/6+odYU9QF
	lTMQqpJJMQRoDvqVEXcO60q/CuYk/SxVAWSi8ZcpB5PJmzUD1CNYjUOZi0ShzLhq/40djcxHJC0
	0+0Y/IX7yIHU4pM8yMo6PJPFjGuOKyxHVVgpYrMfozrXlAx60+ZIpnaR+TJnleprfvgnfgXMFH1
	McxL+q2x9EWg==
X-Received: by 2002:a05:7022:eb47:20b0:11d:fd26:234e with SMTP id a92af1059eb24-124a0070cbdmr2385944c88.16.1769599341399;
        Wed, 28 Jan 2026 03:22:21 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cf8d6sm2140833eec.3.2026.01.28.03.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:22:20 -0800 (PST)
Date: Wed, 28 Jan 2026 19:22:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>, 
	Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yao Zi <ziyao@disroot.org>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aXnxDlExQRYrbf6s@inochi.infowork>
References: <20260128072931.875041-1-inochiama@gmail.com>
 <20260128072931.875041-4-inochiama@gmail.com>
 <f73fc83c-b38d-4974-ba3c-80c5e5556e7e@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f73fc83c-b38d-4974-ba3c-80c5e5556e7e@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_032223_145913_0DDB8C2C 
X-CRM114-Status: GOOD (  31.04  )
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

On Wed, Jan 28, 2026 at 05:16:46PM +0800, Vivian Wang wrote:
> Hi Inochi,
> =

> I have some comments below.
> =

> On 1/28/26 15:29, Inochi Amaoto wrote:
> > The etherenet controller on Spacemit K3 SoC is Synopsys DesignWare
> Typo: etherenet -> ethernet
> > MAC (version 5.40a), with the following special point:
> Nit: point -> points=A0

Thanks

> > 1. The rate of the tx clock line is auto changed when the mac speed
> >    rate is changed, and no need for changing the input tx clock.
> > 2. This controller require a extra syscon device to configure the
> >    interface type, enable wake up interrupt and delay configuration
> >    if needed.
> >
> > Add Spacemit dwmac driver support on the Spacemit K3 SoC.
> >
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >  .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 218 ++++++++++++++++++
> >  3 files changed, 231 insertions(+)
> >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> >
> > [...]
> >
> > +
> > +/* dline register bits */
> > +#define RGMII_RX_DLINE_EN		BIT(0)
> > +#define RGMII_RX_DLINE_STEP		GENMASK(5, 4)
> > +#define RGMII_RX_DLINE_CODE		GENMASK(15, 8)
> > +#define RGMII_TX_DLINE_EN		BIT(16)
> > +#define RGMII_TX_DLINE_STEP		GENMASK(21, 20)
> > +#define RGMII_TX_DLINE_CODE		GENMASK(31, 24)
> > +
> > +#define MAX_DLINE_DELAY_CODE		0xff
> > +#define MAX_WORKED_DELAY		2800
> > +
> > +/* Note: the delay step value is at 0.1ps */
> > +static const unsigned int k3_delay_step_10x[4] =3D {
> > +	367, 493, 559, 685
> > +};
> > +
> > +static int spacemit_dwmac_set_delay(struct regmap *apmu,
> > +				    unsigned int dline_offset,
> > +				    unsigned int tx_code, unsigned int tx_config,
> > +				    unsigned int rx_code, unsigned int rx_config)
> > +{
> > +	unsigned int mask, val;
> > +
> > +	mask =3D RGMII_TX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_E=
N |
> > +	       RGMII_RX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > +	val =3D FIELD_PREP(RGMII_TX_DLINE_STEP, tx_config) |
> > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > +	      FIELD_PREP(RGMII_RX_DLINE_STEP, rx_config) |
> > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> > +
> > +	return regmap_update_bits(apmu, dline_offset, mask, val);
> > +}
> > +
> > +static int spacemit_dwmac_detected_delay_value(unsigned int delay,
> > +					       unsigned int *config)
> > +{
> > +	unsigned int best_delay =3D 0;
> > +	unsigned int best_config =3D 0;
> > +	int best_code =3D 0;
> > +	int i;
> > +
> > +	if (delay =3D=3D 0)
> > +		return 0;
> > +
> > +	if (delay > MAX_WORKED_DELAY)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * Note K3 require a specific factor for calculate
> > +	 * the delay, in this scenario it is 0.9. So the
> > +	 * formula is code * step / 10 * 0.9
> > +	 */
> > +	for (i =3D 0; i < ARRAY_SIZE(k3_delay_step_10x); i++) {
> > +		unsigned int step =3D k3_delay_step_10x[i];
> > +		int code =3D DIV_ROUND_CLOSEST(delay * 10 * 10, step * 9);
> > +		unsigned int tmp =3D code * step * 9 / 10 / 10;
> > +
> > +		if (abs(tmp - delay) < abs(best_delay - delay)) {
> > +			best_code =3D code;
> > +			best_delay =3D tmp;
> > +			best_config =3D i;
> > +		}
> > +	}
> > +
> > +	*config =3D best_config;
> > +
> > +	return best_code;
> =

> Is this really necessary? For K1 I just used the smallest step size.
> =

> It seems to me you have, for the smallest step size, about 36.7ps * 0.9
> =3D 33ps per step. Theoretically speaking that lets you fine tune the
> delay to within 1% of the 2ns total required RGMII delay (MAC + PCB +
> PHY). In practice this number shouldn't be that marginal.=A0
> =


I think it is reasonable, I will take you advice and use the
smallest step size.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

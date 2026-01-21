Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02878C44508
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 00:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNurNuDmf/cai/MDwRwALvjHCPpZ6ier6u4Q2ZiFsXY=; b=PxmMnU9KBISevg
	+JvdcQbJ4+ILgb6SkVJ1EI4rYKYGPeUZ4Il8BhXMda6ojnXd+HiBjfDU9D8SwuFe1vm16EaTeBqZG
	YNOgxuWb05ScKZ0WGvBjBXPHtn302zf6qXrEMSPXs60WF+Ap8CI00ykmIMpBt76DlbCpgws6D4Imv
	0J7MhTQcG64kfqVGzZLYxu6QWS2QdCeu4jJcb0Y+UX2olHgROr/5uyFr3ECZz0pqJyxOlkQz1ouXL
	UveauL2kx5iayfSuvqQqoesadDZz9n8L+VTqCjJkRLsAAgF1VCHhS12iZRmvJJ3MUJEg/tdJC3cO0
	24kOMHniFYnR3/EWso7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viiYl-00000006DIA-30zq;
	Thu, 22 Jan 2026 00:28:27 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viiYj-00000006DHP-20H0
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 00:28:26 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-5ed065f1007so249108137.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 16:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769041704; x=1769646504; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tzXSISnrF9gPuh5VrYor9F9pE35gc9wpvxNp6irLpQw=;
        b=QZoNyQwc3cMbymM+EAGlWiLp44ucK6bxc7vMQxawLMHV5k4YxN/5TCBPEnpo6Sgvkd
         uIIuuofY/etPnaVZKXQWxjwJaqAyNaofnDBPx7IVe+ZZm4aiUxV4frfaMxstwzlQ5QrH
         V7uINKwS/MuhsF6OPP8KZgOMxCaDwiqSwWK/Gu+zu+GaYI4gke317t2L/eORUM34SX0o
         6bixJydUMcNOA6srkLQ5VcDu+U1e9GOw7skWV6GCGLSMsH8VEqRy6YRuwOtFoN2N6PhG
         6/i8S46n4wM/y/HzDv4MrorXy/0cRrGt5HrOK7l0SftxWhgrrU6aDKBaHD5d279+1fXW
         q16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769041704; x=1769646504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzXSISnrF9gPuh5VrYor9F9pE35gc9wpvxNp6irLpQw=;
        b=FXuHwWtlaHFevNfxeOKtAYAVhvBTlcSMpkb8HSqxEwGXNsoACjGEHIlGQFu0d0y29J
         isWNUpZLisw6xMsDsE+VyQBLAzJVDj1PnE0cXNvl8gxVnaXh0KyR/0X5jeTcV3U4lV4m
         AwPvxJCsXmnpLZP8ecYyY4+tqSafhxRjVQYukiYCdxT3uT2iErFcrsnR8JjV7/XTygPx
         3CCa7CRBb+7McC8LcPc5NRPwqpLhab0ocyQOGXKvZDZFNOjTHl26wsU6jwpGv2meVMjp
         TrFms2gLhfb7Nx7sYDQyPMjEFOHqRiysuNJDG8djJX26I3OygK34EgK9cA7qu8Xefpg0
         2gbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCndl2/CRh/KEhUkz5Hkobz04XQWjv3BSNQ3IWK7o2VMoEQBkKBU7LqqvFaIGKvvKI2csbltTUeHv2ew==@lists.infradead.org
X-Gm-Message-State: AOJu0YyN6YR2Nw5U3/UFV9CTuEfz1DWdY2QaNkfHQWZBBYMwb9PPDq/I
	vv50zuhn8ofOyHVvy3zPAnyhlnTi43sSXC+9ZJwFpaKX7bnmlqeaFRNv
X-Gm-Gg: AZuq6aIfx1ZowR+vsdb+FQVApolrVR+fLlftEcICppg+ODVkNKGYidDYDtpLHlVSrjn
	ubCSaWOSumG9lgImc33U4i+Le5r+TYREZ46mAh50YBMUQpg02iIEbVM834wqgZs06q44Ed7N8il
	JwsnZHcc0FYKhxwfQJ329MK0FiA/vCHKFadrwiD2/eJfSlvqbeon7fnEQZpPHim/qoQL4Mey5NN
	ds2xGWHOsweAG94A6K1Vrk304way5J05B6bLObYHC8zv2Gv0r9YYpJVNSPspUKiwpOUtX8Sr+NA
	XezymVBmRGS7JPU8eaO4EPojMp0V8b+R2dro8gDCKWJg6vM9rO3k5yz527ecpjAt7H3E39bG+0O
	2K/9aMQzCFq4o1eXIFNZYrD08qAmVj+9idZK6nyVXPet4en9GUMIy1lMfO9LFnm/la/ALr4vlVY
	FxbeqjP3ccPDDeLNqFCKjd
X-Received: by 2002:a05:7300:bc08:b0:2ae:5470:2e61 with SMTP id 5a478bee46e88-2b6b46c68e2mr15434088eec.2.1769034989298;
        Wed, 21 Jan 2026 14:36:29 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3503a30sm25165715eec.13.2026.01.21.14.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:36:28 -0800 (PST)
Date: Thu, 22 Jan 2026 06:36:18 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Yao Zi <ziyao@disroot.org>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add glue layer for Spacemit K3
 SoC
Message-ID: <aXFS7fW8kdsi_2ud@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <aW8LAFhCRWlMVemz@shell.armlinux.org.uk>
 <aW8MJpERR3TmsiKg@inochi.infowork>
 <aXDAmDEpUArE1_en@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXDAmDEpUArE1_en@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_162825_535781_C4306BD9 
X-CRM114-Status: GOOD (  28.61  )
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

On Wed, Jan 21, 2026 at 12:03:36PM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 20, 2026 at 01:05:39PM +0800, Inochi Amaoto wrote:
> > > > +	mask = RGMII_RX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
> > > > +	       RGMII_TX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > > > +	val = FIELD_PREP(RGMII_TX_DLINE_CODE, tx_config) |
> > > > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > > > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, rx_config) |
> > > > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> > > 
> > > These FIELD_PREP() fields look wrong. Did you mean to use DLINE_CODE
> > > both tx_config and tx_code, and did you mean to use TX_DLINE_CODE for
> > > rx_config ?
> > > 
> > 
> > This should be RGMII_TX_DLINE_CODE. This is a copy paste error, I
> > will fix it.
> 
> Are you sure?
> 
> In that case, please change this to:
> 
> 	val = FIELD_PREP(RGMII_TX_DLINE_CODE, tx_config | tx_code |
> 					      rx_config | rx_code) |
> 	      RGMII_TX_DLINE_EN | RGMII_RX_DLINE_EN;
> 
> If that isn't what you meant, then your reply is wrong, and it seems
> you're confused, which makes me then question how reliable your
> replies are.
> 

That's wrong, I think I have reply it in a wrong way, it should be

RGMII_TX_DLINE_STEP -> tx_config
RGMII_TX_DLINE_CODE -> tx_code
RGMII_RX_DLINE_STEP -> rx_config
RGMII_RX_DLINE_CODE -> rx_code

The RGMII_[RX|TX]_DLINE_STEP register selects which step is used for
rx/tx delay. The RGMII_[RX|TX]_DLINE_CODE register provides the factor
used for calculating the delay. These register are computed in the
spacemit_dwmac_detected_delay_value(). And finally we can got a delay
with "code * step / 10 * 0.9" for both rx and tx.

Regards,
Inochi

> > > > +	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
> > > > +	if (IS_ERR(plat_dat->clk_tx_i))
> > > > +		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
> > > > +				     "failed to get tx clock\n");
> > > 
> > > You set plat_dat->clk_tx_i, but you don't point
> > > plat_dat->set_clk_tx_rate at anything, which means the stmmac core
> > > does nothing with this.
> > > 
> > 
> > Yes, the vendor told me that the internal tx clock rate will be auto
> > changed when the speed rate is changed. So no software interaction
> > is needed.
> 
> Please do not assign a clock to clk_tx_i that is not the dwmac
> clk_tx_i input. clk_tx_i is a name used by the Synopsys DWMAC for a
> specific clock.
> 
> As you don't need to do anything with it other than to get and enable
> it, consider using just a local variable here.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

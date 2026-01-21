Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3E2C44500
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 22:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C15+RlpuADUVGfJt9UnfqcD2NHijyfmjoU/KZjacp7g=; b=pk0UJ/qYbF3rju
	8oMsOEnJqFJJHgLhBLOjwNXrFFULq/0/h1r3/NgQ9fxRLDz5ARNgHhB6dIF/ij3H6IIvD2VuQ2N/J
	OxAND+858nwbyqGpbPL5O+LnIkcZxasZPI5SDDDJzEyIl1AB5zN6FYhQP1OKVAg6TnE8sKKxhJ3Lj
	6i6o9DoyPwT2K1czaCXsb/TSleWxcSpGK9UBBeWIfE4pj65OcfxE8DkUy/YGD1jeQtmImxG6RxtdH
	D5UUZyEpBDy87hjenE8RtDRw6ujTsJw11rQBhjQjampIN3BVujIeVo/tlYdQR3HqtPh7hthu06epE
	rHb3hKQrMIzrKIJp/e/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vigpL-000000067QK-3EoJ;
	Wed, 21 Jan 2026 22:37:27 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vigpI-000000067Pa-2TDF
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 22:37:26 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2b720bb90d0so379245eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 14:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769035044; x=1769639844; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pgjMJi+m/42Lvq5w641HEHT7p6jawBc1Rvrn2olmX9o=;
        b=WFjt5JTKzwt9YrfDGOLf31IYN4LMOGnUCrWFL6F2jg6meiI7cXQ/WAIuUyLRxNOja+
         K2xFzD5mUvSa30UZ5WmK+EASWHpJfvluS2Wk4owjEb/LzM29jFsbTS9ovDYT8MVKGfjr
         RkX0Shjr6tI/N7uBniUbOBF9FmZwCVpuQKSnjGwEfaXo2PPuwJn/ja54iV4IwmTKA8kp
         ABIxEbNvyncPZZZjN+l3NZxbNdB8h5v4+YcbHrq6cKl72jgdwLZT/sczhg4S/q/3FLaT
         IAuRtRuvXYRPh+EsnhCqzQEh95ui6qwWvw7oMQZ3kxtzjst9J2HwvweLID4hxOcToZZc
         wOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769035044; x=1769639844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgjMJi+m/42Lvq5w641HEHT7p6jawBc1Rvrn2olmX9o=;
        b=npT/0SmSRzJA0syjM8WsfzO0tX0+n+YsD/px6/Rhy901YtoUG4ntQ5xsvwJuHuk+/P
         OZ2uPnHkmIkRFjvP3DkGE4IAG/d10y0OZlLTFp9TgHhM49MPqntHiWPGmfUrA2OuP51i
         riCr3lzd6pi65CZw12BgNDjpNrPUszluhfeTjBYQaVO9iUjqDxbq6aEHxzfGitapcmPa
         rB7IlVDawy1SgBlB3x16ld+xnXEvNiwgUp/U9a/LyD+38hInhi4vkZst1M5sNjeUdqsg
         F/pyH1wG94jFzvG9kaxrzbv43954q7OMLhUoFNRnl0RrVKZnIgXHXSQJUMJ7llz+V2GS
         u/jA==
X-Forwarded-Encrypted: i=1; AJvYcCUWuIL7M2vjZoqmxk2v2h+XPcNDTfM1Y+nGIqPZE2eVU+UfFxGUI08pgPJoLQW9C7G6hLwPX1Gc43gHvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YziBT0XrZUq2//CeLTno34U7awLINeFtUHjnRCBkxCFrty8Bdt0
	WWs4mzavW+d3JqM/VcyGdrgJ5A4ktW7yUlsbafz6q65ieS9F8O1xt656
X-Gm-Gg: AZuq6aLlnmYoaOoY2B9eUqR6RgslRyqOzI810Z8y7uUHdtl/u1P8kQBltlwu0kRNQOQ
	nIz+iRgNnBQjwKDKby1nItnKWUtg5L7ry0cWcL1UU7LxVEH9JWfQGUw4KMQvvUMJEMbY1rwhcgk
	X4TSGUFPc+haP46BL5L6cutY8uFZ6Qn6Nvcyp6vQqXg4XpjRP5bi2ekE2C55xMuL2TZHrEeug+H
	UmarOSA0e2rA433h7GsdTbUi90BhwmvuW7YnhC69KbQGy/PwGZRnHmUu8fLkzoDn+e3apySPWWv
	BO88ZbmSMNgdL3hQymB5zsyU8J9ozjjkJMgoCU/QG8RUPMZFz7GrqMAwi1y5gG2HpDZRbPrpkyn
	XYfoZIFgZdZxKIZ33xiqPLGJ8GD/fkyu49/d7NebbnqeoKqVpb+oJbGiycZUfYriDjzyzjX105Y
	LBaqKFyZT9XQ==
X-Received: by 2002:a05:7300:8b14:b0:2ae:5555:4880 with SMTP id 5a478bee46e88-2b6b4713257mr14102244eec.13.1769035043476;
        Wed, 21 Jan 2026 14:37:23 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b70d7f729bsm6725736eec.16.2026.01.21.14.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:37:23 -0800 (PST)
Date: Thu, 22 Jan 2026 06:37:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <ziyao@disroot.org>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v2 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aXFVAoChTPZhjnGu@inochi.infowork>
References: <20260121071315.940130-1-inochiama@gmail.com>
 <20260121071315.940130-4-inochiama@gmail.com>
 <aXDBCsfaNrgfGjNK@shell.armlinux.org.uk>
 <73bf2977-ad1a-45fa-9b06-5df083c060a8@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73bf2977-ad1a-45fa-9b06-5df083c060a8@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_143724_630623_C87103D7 
X-CRM114-Status: GOOD (  22.61  )
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

On Wed, Jan 21, 2026 at 02:45:24PM +0100, Andrew Lunn wrote:
> On Wed, Jan 21, 2026 at 12:05:30PM +0000, Russell King (Oracle) wrote:
> > On Wed, Jan 21, 2026 at 03:13:11PM +0800, Inochi Amaoto wrote:
> > > +	mask = RGMII_RX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
> > > +	       RGMII_TX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > > +	val = FIELD_PREP(RGMII_TX_DLINE_STEP, tx_config) |
> > > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > > +	      FIELD_PREP(RGMII_RX_DLINE_STEP, rx_config) |
> > > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> > 
> > So your reply where you basically stated that all the RGMII.*DLINE.*
> > constants here should be the same was nonsense. How can we trust your
> > replies?
> > 
> > > +static int spacemit_dwmac_fix_delay(struct plat_stmmacenet_data *plat_dat,
> > > +				    struct regmap *apmu,
> > > +				    unsigned int dline_offset,
> > > +				    unsigned int tx_delay, unsigned int rx_delay)
> > > +{
> > > +	bool mac_rxid = rx_delay != 0;
> > > +	bool mac_txid = tx_delay != 0;
> > > +	unsigned int rx_config = 0;
> > > +	unsigned int tx_config = 0;
> > > +	int rx_code;
> > > +	int tx_code;
> > > +
> > > +	plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
> > > +								  mac_txid,
> > > +								  mac_rxid);
> > 
> > Maybe Andrew can confirm, but this function was to fix up existing
> > broken DT, and shouldn't be used by brand new drivers.
> 
> Hi Russell, thanks for pointing this out.
> 
> This function should not be used in this case. MAC drivers in general
> only add small delays, in order to do fine tuning. The PHY adds the
> 2ns delay. There are however some MACs who cannot disable their 2ns
> delay, or have historically been broken, and add 2ns delay. In such
> cases, the phy_interface passed to the PHY needs masking, to indicate
> the PHY should not add the 2ns delays. That is what this function
> does.
> 
> Please don't call it. Pass phy_interface as is to the PHY.
> 

Great, I will remove this call and pass the phy_interface.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

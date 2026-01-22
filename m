Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEB0C44536
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 00:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NqDKaI4ywsuh7R6FdqKTnZlSrK/2vdrxQ7uiT9htLZA=; b=AGPbb22bO5Q6sb
	1JQMkNLqrqJrqrT2rPWd5SbUiKJS/TPecpjydj8Wm6562Pi7HLCXTqE2Tkz9eGmEw2K0RtChh1dPK
	ntMEZelr8NUAu0pDpVgR66y99wZjdXSdDpsZaCpZRlFBEMDyny96eZFHbzHhhIoaqxlJuee/zACf8
	QBBEtfH0XuQUp14plJT4Iwt3XtsLP5BghV9skc68x1YnrHcRLHoEDh2vXW2jZfv4lozmkyv3RK/U6
	SHPiZcvS7PfQd2L8ln/BIvNm/OwwyvNZq2Q19IqqFBUBqlPrSyyln89qZFGkIo2+YUt0S+pApOJpn
	0i3QdABCbKETxZpNkfzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viiaI-00000006DOo-0Ztb;
	Thu, 22 Jan 2026 00:30:02 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viiaF-00000006DNn-2KME
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 00:30:00 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2b6fd5bec41so790702eec.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 16:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769041798; x=1769646598; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aLRvrHf0GT+SLm7VDguQ+pvYrJH4LqQuaP1lqxnXl2s=;
        b=Za4nV9sqxK7BkZWZM44QxbCnZjvpYEpIozMgzn4ZLGXlU43KtRUY1uZlkEEZbDpWD9
         baThjcORvjYmgMp1MuaPhHWDnz237rxVvTuUHCW+0yyJCSbAZ+RuHOqRB2gCfNMTcfF8
         rk+nPvSlW1TYsh7jB9BkBXcx4OTUOkm0y0mHTEcM6tVlG4nMAmuMjZDh10+9p+SY0I0X
         hO3RSr3LsCS8evwYi2g/k1FwRwA8iaRAxq8rlSEtqP7FbMvZGhitLKolDghX8BPh4T+L
         L9Iwd2mhlfiTI7OgBRyLOjomBIfkzs/BRL6W4F4Pc7NXju7sfd2kQ0izh7RbpzZY35WP
         y1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769041798; x=1769646598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLRvrHf0GT+SLm7VDguQ+pvYrJH4LqQuaP1lqxnXl2s=;
        b=B9LIt8omNy6ZioDvlmDojl+6E7at17MEsFzV2kIKM1S4Dy9nS7r4vBECegaQjb5bHA
         vswB5fwMnxbIBRaxxl7Gmi9vtkJct3MdgKPbif4Pe8NJX4SoQBKcC6rs90JrYmGz8uvz
         J5R1PSG/EP3T6uI5NJYvr4sEFfF7HT2EE5jjcOPyUYfc6g2Lr/pf1v/0lfNKAqULkzDB
         l/BO31dGYm766fYS62FzN4fK1yOCJ8qPFAjgwkSilFOsbsJ8zXDHEPtrsE37jgryCZeE
         dMlVf/E6reVu6FdrKx0RIiB2B1W0KWYCYWWtNxe++2rjBsZzvjZi724YxWuclFeKBsuy
         55EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVkqI3bd7hz/SvywhoWtdp1nvOSy/G0+FPduBU7+C0V/por/vlkbsGchvPAiWOeu5VcTjryVUorbJJDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxocRC4Zs0uqwI47LOMq04QrqWNKYhjxcN7Ob8WvbBOTKBzauoe
	f4QZiAsFxheObB5q6cqXDhcc5Z8lhnCkthHDjlc3+NycfOMDDMvYxYQQ
X-Gm-Gg: AZuq6aJSi/Zh7NRWXh0qo0ghBx9GAHUwDxzorvQ+hgzGq+oC1DdA22MPRTsu5apnkY0
	8xTvgSy5RXwxl2uPccg1RcGYP2Fhn2fMfn4MERGyBhiSyG5Rr82Q6HgQvRp/gyLA1w/yDSXnE6O
	WAoVsXeozqPDIYrFcjx2gzZn2iEbtzRCpF6CTTuSbFu3bqVx4Caw4+6+kQYsRQaDpqfcRWOXURI
	0WqCjGe4BMCeTKD9CnLIj6cRxpIvrzb13fKuimNfvUZImac/N5/w9D4MIk9M5uNtdfJosqmizW6
	uL/7a1SpCUJTI5NtgDraSzhoDPq8wos6ua67j07qTc0gYxKgog5bO9a/XikehZ9ZFf7yxqRGGLi
	xujriFNZ+00QW/Qz093nnX376Y00b7rgaAsmKVyWmWC8lbISJX3ITJqsdrPZlj9mNXEeIRbrH/q
	8lRFjl3k1XJb95FPGcwBMn
X-Received: by 2002:a05:7300:324b:b0:2b0:580b:856c with SMTP id 5a478bee46e88-2b6b41005a9mr13294371eec.28.1769041796817;
        Wed, 21 Jan 2026 16:29:56 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac6c2besm29548495c88.5.2026.01.21.16.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 16:29:56 -0800 (PST)
Date: Thu, 22 Jan 2026 08:29:46 +0800
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
Message-ID: <aXFvWzw1BlooyG7s@inochi.infowork>
References: <20260121071315.940130-1-inochiama@gmail.com>
 <20260121071315.940130-4-inochiama@gmail.com>
 <aXDBCsfaNrgfGjNK@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXDBCsfaNrgfGjNK@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_162959_593624_0FBF8E97 
X-CRM114-Status: GOOD (  19.24  )
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

On Wed, Jan 21, 2026 at 12:05:30PM +0000, Russell King (Oracle) wrote:
> On Wed, Jan 21, 2026 at 03:13:11PM +0800, Inochi Amaoto wrote:
> > +	mask = RGMII_RX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
> > +	       RGMII_TX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > +	val = FIELD_PREP(RGMII_TX_DLINE_STEP, tx_config) |
> > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > +	      FIELD_PREP(RGMII_RX_DLINE_STEP, rx_config) |
> > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> 
> So your reply where you basically stated that all the RGMII.*DLINE.*
> constants here should be the same was nonsense. How can we trust your
> replies?
> 
> > +static int spacemit_dwmac_fix_delay(struct plat_stmmacenet_data *plat_dat,
> > +				    struct regmap *apmu,
> > +				    unsigned int dline_offset,
> > +				    unsigned int tx_delay, unsigned int rx_delay)
> > +{
> > +	bool mac_rxid = rx_delay != 0;
> > +	bool mac_txid = tx_delay != 0;
> > +	unsigned int rx_config = 0;
> > +	unsigned int tx_config = 0;
> > +	int rx_code;
> > +	int tx_code;
> > +
> > +	plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
> > +								  mac_txid,
> > +								  mac_rxid);
> 
> Maybe Andrew can confirm, but this function was to fix up existing
> broken DT, and shouldn't be used by brand new drivers.
> 
> > +	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
> > +	if (IS_ERR(plat_dat->clk_tx_i))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
> > +				     "failed to get tx clock\n");
> 
> As stated on the previous series, please don't abuse clk_tx_i for
> soemthing that isn't the dwmac's clk_tx_i signal.
> 

I have seen this comments, I will switch to a local variable in the
next version

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

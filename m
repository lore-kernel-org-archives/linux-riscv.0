Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8F9C44536
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 01:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BgN/hZmnfUq6DcXwJRgEh37gxU0TQWDfRkdZqsobKbc=; b=kKs9MN8bAFmPT+
	5ZZkZU74Z/bMOesswG6W0uJmR8oqFxppOM1g7hIrZFxO0zmAgS4C5uIVdXOCzCpDz0k+0fASthmYR
	oI+0BSCiT/6Tap4RInQ9BNcE93/RSsKLMJx88VcuNruelWemOJxrbHBRP9mctcz/CKxcSnaa6Il23
	gxuUXvqlrwGwTa9tua4Zby2ABHzDXpTNEiOyts9abXWmbqKus/s4Nu4e/cVg9meOEEtNt2hphlyyc
	1VK6DMEgZLaiuibnXBCtxomueNq3jh8yjyZNcEuIA+vJiRYC/kDJB39Z/rdQ6I9cNTGhXjVMITcNs
	aNTvBkT+8wcYWDgYA9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vijUp-00000006GnM-0fwD;
	Thu, 22 Jan 2026 01:28:27 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vijUm-00000006Gmq-0ZOz
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 01:28:25 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-4058fd4666eso292505fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 17:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769045302; x=1769650102; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pGEOJU/uiNboJwAtLEE6S07BEXT+vA5BV+sOD/aPObo=;
        b=mNxdDsWBb+Xheho2zlsETtRRPWkUApAqjyrkMDLZ7EpQG9DwCRe3kjjr1jvzx8Nga4
         YiP4FQ3lFyxabAys6PkoaXZioZ1fDfVejiomJrZtHgmBUy7kJAIxelTbqlTHCWNHkXK7
         pHb0jskiSJrVNz9J8bI7bGlYwalFYsj3074QBnVjV1nM2AdVf76enfAy7wvkp/SHyUCI
         c9eb/e8ctF5LhovQIcSWQ7uWKb6wmaRF0u/uGzyPm3EhPPZRyxuuehhAVwOrue9jDpCh
         M+9LgolW/APNwmbbKZNoMp/6pFh3u0zwpDBYQKHQB4UqS+IMUzVKjRro0TMTq5l0Dj8U
         51qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769045302; x=1769650102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGEOJU/uiNboJwAtLEE6S07BEXT+vA5BV+sOD/aPObo=;
        b=Ff5x0IlmdKRqvWoCRcqQAVKslOuQO5NKfro13vUTHcXoM3eH/yw+0g+tJHJQhJWGuX
         L6vyHIgDXuroQXUc74yH78uiT1o6NVckzveDnXeC8wBCkizrhh8j9iKs7cVfLhLOo2ev
         96ir+kolem6F1YXm3RvYmzbt0SzQ5i4xZD5pfzmVXnKBPftBPlQ+CsnHgycK8bkiU9Jn
         8c4SNVU6ZUv0JIp2tvdUddUzBJM7eHv7m8ok2k9lyIaZ62tK+ioY1BHlu6fzHWMIJKJO
         S8QPXcjoIh4YAvhd1iq/pkHs6nK8Mh292wUolBOgFiFryjuNqCQD0VTGmbXJwopsAgkS
         Hp9g==
X-Forwarded-Encrypted: i=1; AJvYcCVRy2G4GWrsvfNKM4dotbIvPRLbCmV7GfFCo2TyLP1+4tgJclmVexTDfmeemJDJNqVr1z7s6GsfTAKrFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YweSFTO/tTNQYWTMwOXGcVJM3awSpaTBo7lXKl2oFhLHB38DdIQ
	V/buHmXQmdk4VIlBvOnXFJ4IXgk7Jf04+Zt/a2dgoGglIuaCgIBgF9pmAQbEZC0U
X-Gm-Gg: AZuq6aIzemJKtHE8SflmMFA+8dLL+DDj6jml6rZ7nUBh1M4e4w1n/hbfpI2zn14VhX7
	KvhH81IfGZ2ctOMOQKAARCkj/21Ksb1QQ1eY5+UxIWGNUBZTqE9VXGilKzUBfgA6BMlvTTaP1YL
	1pm6Ux/MhtFeTAuzxsxSIsArscNztL7mtx0zGTHnFS8JXoayWxazCMMoomcpuaadVgeFCHjSBMA
	n+UAQLHOKreWbNH2ZVyLGXzSdK7yKJVzNyAKSxVDMlGm5VqACQAu7nrUE3wgWMF2Xn86ra4xAzW
	1TKBkRUYD/7lu5McdlbzQ+Zfsl6NKPQXDJ8mZV7lhSw5/FHRQQAn8mp45YVNExyApHyZmjl0AhE
	aaEN/TV4X74RqhbH3puDSX65kYikEB1g54bJ7p0pEm+b0K+Akq57LMzMc90ZNOSjEshtqEZ4LU+
	9BjTzLQ/xcOw==
X-Received: by 2002:a05:7301:408c:b0:2b7:143a:9a8f with SMTP id 5a478bee46e88-2b7143a9e6bmr2183820eec.7.1769039928585;
        Wed, 21 Jan 2026 15:58:48 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b361f5d4sm23459514eec.17.2026.01.21.15.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 15:58:48 -0800 (PST)
Date: Thu, 22 Jan 2026 07:58:37 +0800
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
Message-ID: <aXFVIK57ZNMD_Sbg@inochi.infowork>
References: <20260121071315.940130-1-inochiama@gmail.com>
 <20260121071315.940130-4-inochiama@gmail.com>
 <aXDBCsfaNrgfGjNK@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXDBCsfaNrgfGjNK@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_172824_174873_2B50B0FF 
X-CRM114-Status: GOOD (  19.95  )
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

Sorry, I have found there is a mistake for replying you.
Now I give a detailed description about this registers.
You can check it at 
https://lore.kernel.org/netdev/aXFnmXIwSdKCS9Uc@inochi.infowork/

Regards,
Inochi

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
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

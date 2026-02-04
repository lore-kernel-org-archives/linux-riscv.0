Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2059E8B397
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 04:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJN0smitatgygPpxv85TO3NjU2UD8YzmmHtXNIqbpvE=; b=g3XV82d2Xz4MGQ
	u0Z93VfkAXY6Nz8YYogDK90xhYL6/VwE1TiRsNWloYpbw/1tyLSlYDS2dAvs+/EsSuzems5gGb6f/
	KV9XMp3C5VVhY74kf3a3CMwlCpgtUfRUvaI4O1oCl/t5aauANj5nKBQTPpMb6JvzUAJTxM90z017w
	42tv5XOrtOZLa9PiJfLvqzrSbG0VTsm6HsNXNfcDClMdP9f0+ryJ8bPU9PY3oNFJKtYhNw3c5ZWki
	b/d83sxMIdWnnZRe+uBNi91nlthFv5SVqn8suwYpbs3tqCPf/HrIf4nKIxNH3oAOGP+x+t+SIStO0
	sfVejM5kTo+mAlOxBCpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnU4o-00000007sTF-0jps;
	Wed, 04 Feb 2026 04:01:14 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnU4j-00000007sSh-2gH1
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 04:01:11 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8c5386f1c9fso866174985a.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Feb 2026 20:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770177668; x=1770782468; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rs6BBarzwmD2Zm1TSaGTp7E5XeDaUo3g+3j+s/whg7M=;
        b=TYLA6Kz8AkJlDAdWd4TILZlqXWIqFnaX6iMTTZEx2m10yioi/agcD2l10lLCB8LApu
         x0cn2rdYe51hjKmMwOhlHftIwJv50vP/K8rN4ku1h3EnAqYOUrIqzBS4pOiN/xwGkiOC
         zZiNPk2+rNfIZ3t/yggXZ8SDXd8cSCZTvRCmOfzIySzOgu4k8OUFwQdePM1YpJjX5pj1
         uoVUJZ8CpxrvOPVLBBpKai5XFWF43FRezYDSO9n/aovESpb2gj0gNwGR2NRDuHeqRNFu
         w9A2eEFdCPeYVqqnsY0p/unsNpLGMFJ3k9bl4y07+1h5l7BMRObT9feqU52BZYIUfCdf
         TM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770177668; x=1770782468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rs6BBarzwmD2Zm1TSaGTp7E5XeDaUo3g+3j+s/whg7M=;
        b=Qk3G1I+LfWS0nr+72NWNfSpthXU2iNSkHxmjzrxL1PguuPhtij94fqCPaXL8qoIPPr
         jbvNJlNUp/Y0eB+qa/vcmXbEKAsfwWLChJ+Velk6vNklhJmSHJ3z9aEaC1F2ZFdsJmOU
         nPNbODudS7ktN/MjuJS4ZtU68/EIwj6uzVoy8/+66/NZ3u98UlzVmJLi2ln5F/6DyrhZ
         5Dj/67iEZYnIy108RmaQ6kgwit0bOSVjc6Gkc9F6mMqIcYa8DLT8lV9zep0LZ7PUsBEM
         Exeiv+hrxRCAy7WNcDKIHcEXNFAVw/T0Li+irIhLMeGHowgqAe4inbXrNxj49jAfmvM2
         AyEg==
X-Forwarded-Encrypted: i=1; AJvYcCUanjv9Eu2t7HnVYyxZLYX6GzXhOSNwuy0unP3uRR/VAiSn8YckB43dKR8UEP3/bevVDTe7vgwkJD8bbg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0inmfbM2WTOQklkb9NRx6dPUTlGCpT4gYT37svr14WofWvypP
	m2ZK89oODYYd81zjkejcvYEpQuCsloBmpQq4aWAG0bHQNLiPzJUKT5Wd
X-Gm-Gg: AZuq6aIA1NNPuQToNSkNaK9AUiOic6FIgLy+3wCAgsVS+9P5Auucb1vTp/Z9hIV4hYx
	6QA0c4r+su/nQjG1wFk41zcNRnxSF8kEQO8OkNRUfeQPYJUosrotoaEQQRVyExJCkl91GoIDfro
	kgHnfgRJ8dpo3l0fIRtaAEnaM830iheZ5/cfiGPkxnBpR8icpgXN0wtZojSC/FTyBE64C2MOnTQ
	IdnEHUMMalVfifOba1HgfxWG9Wtyd6PF8FSstDjamn5jjFVlmv/b9XgfvlI1rTpThtXUa/rRAYC
	37g2VuRFAu1GNKubcLDxjg2BcOCO0eI/muzucq4Vk663OKccGLIyjuycmEmTh0SWzTqG5Fnhg+g
	YkkwpmvuUlfr0mQgzCLRfMYOY2U8ykVoZ5V2oTxruausKKuUI4cLK1uzUg+WBiDvn9sN8VGSLSv
	sb/DM+ADQcgA==
X-Received: by 2002:a05:7022:f103:b0:119:e56b:91f2 with SMTP id a92af1059eb24-126f47daa76mr613066c88.35.1770171313127;
        Tue, 03 Feb 2026 18:15:13 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832feacc6sm940814eec.35.2026.02.03.18.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:15:12 -0800 (PST)
Date: Wed, 4 Feb 2026 10:14:47 +0800
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
	Yao Zi <ziyao@disroot.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Zhi Li <lizhi2@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v4 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aYKq4qlgCDo42rnw@inochi.infowork>
References: <20260130022705.1059214-1-inochiama@gmail.com>
 <20260130022705.1059214-4-inochiama@gmail.com>
 <aYI00Exytbgbnuzp@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYI00Exytbgbnuzp@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_200109_710775_1FDB2C7F 
X-CRM114-Status: GOOD (  23.69  )
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

On Tue, Feb 03, 2026 at 05:48:00PM +0000, Russell King (Oracle) wrote:
> On Fri, Jan 30, 2026 at 10:27:04AM +0800, Inochi Amaoto wrote:
> > +/* ctrl register bits */
> > +#define CTRL_PHY_INTF_RGMII		BIT(3)
> > +#define CTRL_PHY_INTF_MII		BIT(4)
> > +#define CTRL_WAKE_IRQ_EN		BIT(9)
> > +#define CTRL_PHY_IRQ_EN			BIT(12)
> 
> Thanks for updating these.
> 
> > +static int spacemit_dwmac_update_ifconfig(struct plat_stmmacenet_data *plat_dat,
> > +					  struct stmmac_resources *stmmac_res,
> > +					  struct regmap *apmu,
> > +					  unsigned int ctrl_offset)
> > +{
> > +	unsigned int mask = CTRL_PHY_INTF_MII | CTRL_PHY_INTF_RGMII | CTRL_WAKE_IRQ_EN;
> > +	unsigned int val = 0;
> > +
> > +	switch (plat_dat->phy_interface) {
> > +	case PHY_INTERFACE_MODE_MII:
> > +		val = CTRL_PHY_INTF_MII;
> > +		break;
> > +
> > +	case PHY_INTERFACE_MODE_RMII:
> > +		break;
> > +
> > +	case PHY_INTERFACE_MODE_RGMII:
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +		val = CTRL_PHY_INTF_RGMII;
> > +		break;
> > +
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	if (stmmac_res->wol_irq >= 0)
> > +		val |= CTRL_WAKE_IRQ_EN;
> > +
> > +	return regmap_update_bits(apmu, ctrl_offset, mask, val);
> 
> I would suggest that this is split into two parts - first, this is
> renamed and reduced to just controlling CTRL_WAKE_IRQ_EN.
> 
> Next, a function hooked into plat_dat->set_phy_intf_sel which sets
> the CTRL_PHY_INTF_RGMII and CTRL_PHY_INTF_MII bits as appropriate.
> Note that this function is passed the dwmac's own phy_intf_sel
> value from common.h which will be PHY_INTF_SEL_GMII_MII,
> PHY_INTF_SEL_RGMII or PHY_INTF_SEL_RMII for you.
> 
> It would also be good to have plat_dat->get_interfaces populated
> using phy_interface_set_rgmii(), and __set_bit(PHY_INTERFACE_MODE_MII)
> and __set_bit(PHY_INTERFACE_MODE_RMII) to indicate to phylink which
> interface modes are permissable.
> 
> Thanks.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

Thanks for your detailed guide, I will try to switch to these helper
apis in the next version.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

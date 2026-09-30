Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810A9CA5FC1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 09:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zikJM0gEAKc8O0JZzz3z+C0PLyWygIF/d9PNZ4Nofjw=; b=wok0S8Xbgo0kmt
	KBqzdru0ApwIc4qFguU4m6RckPQRkUwaDo1DuEEAl33w10G6TXSEeIrlbnjU7TKtk75jHPpJWb1rm
	teEM3U/WU/jXtojDhbBXwSUgluObsX2Fh4u80XhlDU48UBWyJXu/cNwophSdr0e5Ft9in6swL8Ovb
	aaPvVub6raLCdXhSTT+VjStKkofCwy4j7QYOTPTcPwkA4FyzoagDDqS4dPZ0rvfPI2EHtKjMWD+xw
	qnweMx6oZxww+4QdJO79nAFDWhLe8jralFVh5AnhiQKJTqmRNJJtxx53oMqaRHuMnia6m39I9OedN
	IvR5edeFNWpcp0P48ABw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqre-00000005bjI-39Yj;
	Wed, 30 Sep 2026 09:44:38 +0000
Received: from mail-pj2-x2a.google.com ([2607:f8b0:4864:39::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqrb-00000005biu-3dho
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 09:44:37 +0000
Received: by mail-pj2-x2a.google.com with SMTP id 98e67ed59e1d1-3a4b940d3d7so513311a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 02:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790761475; x=1791366275; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LJ7pv3JvMpjktv8pMXQeW+L1mKgAG5YebBgrxPcoffs=;
        b=QCqC5Fqfi4VDRlFWTMQMTL7n9LXIHRbIA0cfKpMQVDgmfx3d8epmvdRRLpjrrY3GOf
         1FciA/msMS0EqXnKnuc3w7XAuSiqxkFnAvTkGL0G6hz0vlUFur7NNhMQnPlMJU0UlBfA
         H2IPur/i5px+1Y14v+wyKIVkN8CtgLobWQ4JrFfwQAmvpWf0HGqIO48be+wzTP5ftv/I
         1dsLTOp9aQ1toE6X/uxzUDcrMTR8CWRWbMwDirWptRW4w6YM+0BSXPlD+8FyYyuJFjSV
         kRLGnkbkcj4PMxdVZhsVoXv+EwTOY2ullRie28TQJCj/WyOclHBpUx51dLhSmITTD4Q5
         QScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761475; x=1791366275;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LJ7pv3JvMpjktv8pMXQeW+L1mKgAG5YebBgrxPcoffs=;
        b=Q9HCPGvwKnw84kszcS631xG8R4tWEkVLyE5Q/TanmCz9aB9cObeqwXhR4L2fBHxPjn
         eLzQYSuKloY9eLWsI1UKo9hL2yuMbfx49IkbXckJtGZr7B3yzgNzwn9IJqt5SkFF4QEe
         EZ1iO5iZRCQvuRwn8Rm+eVc0OmREMwfeiU7JaXxo+w3Kya6B6C0m36R/CvlGzcf/GvJy
         K+BzNO7q906warJ6Jk6mRVkd6DtAS07/3XQ+rVdl2hS1uctnm1TYyr8VZ6KaAM4S9i+2
         XxgR1EmfXUfRqs8x/mqCbgCrOUOIo7zDB6Vp/2e3k3MFSj3ujwTmc+xE4VNLObV6+9Bw
         PJWw==
X-Forwarded-Encrypted: i=1; AKwUvBxVwsyNiuuJ9o6/IlC5X6DsWIKQq2WxAFfotqUSHiGBEeeA5Hto24OBqU+vcWhm3xt9543iwieDXcp5Aw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKQxiTXoQkxi5vfeV/fZB5xGD/gQkoGa+OhyGIZt0dDipEjpktW
	cJyPB5JJt1gUOS9sCy4ynEL/d8khegrAE0GbgiGOMkkGYiVTb8VZVlui
X-Gm-Gg: AYBFou1cFw4T/V+u53UC7mrYulcOcSsZ0Q9A/yMo3/C7QSs5/lE0D16KkNFkfuaQ2F0
	Ca5A0TQpUQNDDlgDsDlJuFWc1O7HbSQTofvP4H2iWPZ5g1FZW6V9wgLnsXAPJKCd01GIdLQr5YL
	fhUMJDStpAPDgwOd/FFNI0tgIK0Fdxj9CTxdc0y4DqpfFKcMdLr7ctA8ZR975pc1h/KqSpQ2+/t
	oYG+nB15xJZY0odZfLkM+fl5yAUGi23ue5NhyOo4gc2vVRsbGZUFOlZDx+tuajaWkpKR0+hIbPD
	fV2XquiK480nxIdrKJ2MkTAAbKE1m1QA3FS/Wf22qX17pIDtZDFD1ktIJYvsVwjI3erVZsjquas
	DL60Pd585ba/OELjZvlLSvmRO4h5CvGDdyG/dLXULHjcgp2MKoMlY87U1zM4rnDs8GjmejUzQga
	PZ+ElglZNwLvwb0SUHoG67WNpG5aSsSzvpM8IL3tsVFKfOG5cS2M6B8ZumWfwDZWQJakh6
X-Received: by 2002:a17:90a:ec8f:b0:3a0:97ba:cc05 with SMTP id 98e67ed59e1d1-3a4d1509b4bmr792148a91.22.1790761474707;
        Wed, 30 Sep 2026 02:44:34 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4c75bd93fsm1219229a91.3.2026.09.30.02.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:44:34 -0700 (PDT)
Date: Wed, 30 Sep 2026 17:44:25 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Niklas Cassel <cassel@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Randolph Lin <randolph@andestech.com>, Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
	Alex Elder <elder@riscstar.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Vidya Sagar <vidyas@nvidia.com>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <arzYt1svE0HtZPSB@inochi.infowork>
References: <20260929083755.458238-1-inochiama@gmail.com>
 <20260929083755.458238-7-inochiama@gmail.com>
 <arzAGOKLOustEW7F@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <arzAGOKLOustEW7F@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_024435_912895_6A76D2B8 
X-CRM114-Status: GOOD (  27.62  )
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

On Wed, Sep 30, 2026 at 10:54:00AM +0300, Andy Shevchenko wrote:
> On Tue, Sep 29, 2026 at 04:37:52PM +0800, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 is almost a standard Synopsys
> > DesignWare PCIe IP with extra link and reset control. Unlike
> > the PCIe controller on K1, this controller supports external MSI
> > interrupt controller and can use multiple PHYs at the same time.
> > 
> > Add driver to support PCIe controller on Spacemit K3 PCIe.
> 
> ...
> 
> > +static int k3_pcie_init(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct k1_pcie *k1 = to_k1_pcie(pci);
> > +	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
> > +	u32 val;
> > +	int ret;
> > +
> > +	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);
> > +
> > +	k1_pcie_toggle_soft_reset(k1);
> > +
> > +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> > +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT,
> > +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE);
> 
> Would it make sense to define permutations
> 
>   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE
> 
> for here...
> 

I think it does not make sense, they are two separate fields.
A combine does not make the thing easier.

> > +	ret = k1_pcie_enable_resources(k1);
> > +	if (ret)
> > +		goto failed_resources;
> > +
> > +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> > +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> > +
> > +	ret = phy_bulk_init(k1->phy_count, k1->phys);
> > +	if (ret)
> > +		goto failed_phy_init;
> > +
> > +	ret = phy_bulk_power_on(k1->phy_count, k1->phys);
> > +	if (ret)
> > +		goto failed_phy_power_on;
> > +
> > +	msleep(PCIE_T_PVPERL_MS);
> > +
> > +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
> 
> ...and
> 
>   PCIE_PERSTN_OUT | PCIE_PERSTN_OE
> 
> for here and elsewhere?
> 
> > +	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> 
> > +	val = u32_replace_bits(val, BIT(7),
> > +			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> 
> It's perfectly a single line. Check your editor settings (I believe I have
> commented on a such in one of the previous rounds).
> 

Yes, but it is too hard for me as the intellisense plugin will show
the argument name so I am toot hard to keep that for a line that near
80 chars....

> > +	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
> > +
> > +	k1_pcie_set_device_id(k1);
> > +
> > +	/* Finally, as a workaround, disable ASPM L1 */
> > +	k1_pcie_disable_aspm_l1(k1);
> > +
> > +	return 0;
> > +
> > +failed_phy_power_on:
> > +	phy_bulk_exit(k1->phy_count, k1->phys);
> > +failed_phy_init:
> > +	k1_pcie_disable_resources(k1);
> > +failed_resources:
> > +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			   PCIE_PERSTN_OUT | PCIE_PERSTN_OE,
> > +			   PCIE_PERSTN_OE);
> > +
> > +	return ret;
> > +}
> 
> ...
> 
> You checked everything but regmap IO. Why? Do you except it won't ever fail?
> Perhaps to add a note about this (if not yet) to the cover letter?
> 

It should not fail. IIRC the regmap will not fail for an
exclusive usage. The regmap here is just as handle for
the common device, but the device driver only use its
exclusive area so it should be safe.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

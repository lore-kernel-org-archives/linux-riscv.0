Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B8BC79F8C
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 07:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jp9oVGGHVRaWSkmptbX4o0SpeFbR6gKWLdnH+Q09gCE=; b=qwpOy6URTEAIJp
	a1NRv+HGhq49dLXvFj7+icoKPjqKd+hSumond0vMiD6MGOx4mJw/EdbGaTmpn6r9G53htfMH/5dh3
	SK/HpT1Tk0npyfm/7ex9VA/DWczR9disuMUismkunnXsXnVhy3lPXxM9RGvctsQW9/ibKRMejyATI
	xuWGkVcufTGQkza0Pk2tkXmbjzHe4gsyN0ao/bEWIj9O5cCDNI9oFB0SiZKa7odXf90lFREE8txVb
	m9vMVDWR4Jf9dbMnsRZIiMcJASVkcYjV7qOQjhQElIpFNMojAqzpuuX4Zqn1c00WJ/QvO7wIM/wDo
	0ai0fUfKBNeOdnsE/bvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4D5m-0000000B1pV-0apA;
	Wed, 09 Sep 2026 07:51:38 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4D5j-0000000B1oo-3n8I
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 07:51:37 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2d6f9e2f681so61081415ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940295; x=1789545095; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jKrEyC/4kP8ddKpasgLPQzfssOl6topa0dwYgM8fxlQ=;
        b=Ucx/fm3JCiVnWPo6wPJWie4NOboxPSZM8mp+MCmiMZYMpXC+3JTnhAnTHZL9aMN3HB
         zDOIjR8VQf6ysw6jyfbDXIxhpzGc1REoETMV/ZAw/ge1vMGCFgK1Ww80NEDw/p2EPIOL
         9WOyujViuxWnVT6B4B9rA4D79202FdkqMgqxEGuM5+YhxIn7x/IU2qOS1rQGZxWueOmK
         I8mPsGN74u64q768o0sFKUVh2iiE/Ff11okjtP4LSP6hFlM4PWwqnzRJa6p4xatN+jP3
         pm9nC/X+JuDd8MUfPNPyVSwRndb4Z/tDy43ttK7pFqU+EEJ5m2DnMBty32j3uC2Q8dlw
         F9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940295; x=1789545095;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jKrEyC/4kP8ddKpasgLPQzfssOl6topa0dwYgM8fxlQ=;
        b=mq+rRCxYl/FYCY7ajaMQJDrH0RqwpUV0p/qhgfZDn4hfKQ58laYDotP+5JIbqwDg35
         5wU2br7RA2esLf7cpEkpT0Iyrg0l/YUR5LMWWCyvrOpE8OqCl1Adav1yxHXcy+ALOgoi
         po8jNTHmcCIEnaG6lzfjjXEiQg22TBgmXDo4KmvJumUk4RqGff/Jn9/1qnG7HNrVZPB9
         O1lXRyzcvTlGavbyWXlaJLR3psEHGE8vMhnNxyz3BgZPTlIVb2YbARrfwk4zXxFILtbk
         PBhM8JV3nEbNvcc2oaQTmdiGx8E5tKIMj4pZXP2GVr1dQ6zDQZuG6V4lYjBl6y1yl2uQ
         URlw==
X-Forwarded-Encrypted: i=1; AKwUvBxFi1Ghpt537zuG3cJzHZiKVXTrnTESzOWQQpUJC5gDvGwqW1fOTRO56wXKfmRG2GfhYztlGbMNGslHew==@lists.infradead.org
X-Gm-Message-State: AFuF++lXft4WTpi9O64+mz8h58X3Dcup73qWrdn+BsoE5qfwneTRPIsG
	79z5VThAKJ/0oyEwIJ2jFBCBTZmVdg97MT3gMfbDpJQf8BTAzlfNn2gK
X-Gm-Gg: AYBFou3jMMYiRet9Vli1Mh3j50Ul4ikZ0pE+VgzcUPHsxV2hxZPC0aVs229NDlN5jPW
	V8WqpzTBcBmSxEFtPabqxAOgB3TPAOJvOKuR/J1yHrk5/ggD6GlRA7zveJSPVmvzO+NCaHdbo5B
	YucMYGzx44TSuiipVVIFlXpYcWrSGmz7hcgmINHFPhAKhxQhCdXOkWK2sZrTCXXS79g8uRm8VG+
	vYa67hJELXo4Dac/F74x0dAGwtkJKpiY0is2pwJriARCZgT+Re7/qovGL/VgCdy8uiydWVa2SRa
	35+EETgPxlEhMhkCBvP5M0UTlykc0UiDI3ZUaEF+GmQ+03W2wV553HVKA/lUXtKbvUX2viB1k4h
	aHPpKn2gY/NY4RG8T+mCL4gyNsOBBewQbFLTufN1VIy6adwoNbB40RqAGvcmbi/rP0O3NaBYh/B
	I7bGu621h1s3sjMYs+mjoRoN0A/dpH5GfVAxIwVPz3VvHMw/4+zxz4BCK1usqaMXCMot9XmA==
X-Received: by 2002:a17:903:3c47:b0:2db:eb5:47ea with SMTP id d9443c01a7336-2db12106896mr504658855ad.0.1788940294598;
        Wed, 09 Sep 2026 00:51:34 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497d9f9sm67640495ad.32.2026.09.09.00.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:51:33 -0700 (PDT)
Date: Wed, 9 Sep 2026 15:51:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Niklas Cassel <cassel@kernel.org>, 
	Sherry Sun <sherry.sun@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Bruel <christian.bruel@foss.st.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Alex Elder <elder@riscstar.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Randolph Lin <randolph@andestech.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Danilo Krummrich <dakr@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <aqEOHmlKdKqQWYE8@inochi.infowork>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-7-inochiama@gmail.com>
 <DL940SRP94AG.408BKFWHDVY3@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DL940SRP94AG.408BKFWHDVY3@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_005135_968423_D4FFE60E 
X-CRM114-Status: GOOD (  32.88  )
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

On Mon, Sep 07, 2026 at 09:14:23PM +0800, Troy Mitchell wrote:
> On Mon, Sep 7, 2026 at 07:26:05PM +0800, Inochi Amaoto wrote:
> > [...]
> >
> > @@ -303,6 +316,116 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> > [...]
> >
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
> > +
> > +	ret = k1_pcie_enable_resources(k1);
> > +	if (ret)
> > +		goto failed_resources;
> > +
> > +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> > +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> > +
> > +	ret = phy_bulk_init(k1->phy_count, k1->phys);
> > +	if (ret)
> > +		goto failed_phy;
> > +
> > +	msleep(PCIE_T_PVPERL_MS);
> > +
> > +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
> > +
> 
> Should we use pci->pe_rst when reset-gpios is provided, and keep the PMU path as
> a fallback? The SDK handles both cases. The DWC core requests that GPIO with
> GPIOD_OUT_HIGH, but this path only releases PERST# through the PMU, so an
> endpoint using the GPIO would remain in reset.
> 

I do not think this should be included in this version. I found PICO-ITX
has no reset gpio support. This means I can not test this feature.

I suggest adding this function when there is a board using this function.

> > [...]
> >
> > +	/* Finally, as a workaround, disable ASPM L1 */
> > +	k1_pcie_disable_aspm_l1(k1);
> > +
> > +	return 0;
> > +
> 
> Would we also need to configure IOMMU bypass during initialization? The SDK sets
> the PCIe A/B/C bypass bits in PMUA_PCIE_SUBSYS_MGMT when there is no usable
> iommu-map. The proposed K3 PCIe DTS has no iommu-map, and I could not find the
> corresponding bypass setup in this series.
> 
> Is bypass already guaranteed by firmware or the reset state, or should the
> driver set it here? My concern is that enumeration could succeed while endpoint
> DMA still goes through an unconfigured IOMMU.
> 

I think the firmware should mark it bypassed as the default, at least
I have notice this behavior, but I am not sure whether it is the builtin
firmware or the uboot do this trick.

> > [...]
> >
> > +static int k3_pcie_parse_port(struct k1_pcie *k1)
> > +{
> > +	u32 status0, status1, status2;
> > +
> > +	/* This register require a RAW for cleanup */
> > +	status0 = readl_relaxed(k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> > +	status1 = readl_relaxed(k1->link + INTR_STATUS);
> > +	status2 = readl_relaxed(k1->link + K3_ADDR_INTR_STATUS1);
> > +
> > +	writel_relaxed(status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> > +	writel_relaxed(status1, k1->link + INTR_STATUS);
> > +	writel_relaxed(status2, k1->link + K3_ADDR_INTR_STATUS1);
> > +
> > +	return k1_pcie_parse_port(k1);
> > +}
> > +
> 
> Are these status registers accessible before the controller clocks are enabled
> and resets released? k3_pcie_parse_port() runs before dw_pcie_host_init(), which
> calls k3_pcie_init() to enable those resources.
> 

Yes they can. It is something interesting.

> The SDK uses the same ordering, but I am not sure whether it relies on firmware
> leaving the registers accessible. If so, would it be safer to move this clearing
> into k3_pcie_init(), after enabling the resources?
> 

In fact, I have no idea about which clock control this MMIO area, if it is dbi
clock (but I guest it is not), it is kind of weird for this clear and should
move to the init. Do you have some knowledge on this?

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

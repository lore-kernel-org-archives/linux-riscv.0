Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE42FC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 04:38:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FB1964EF2
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 04:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FB1964EF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c8G7v7kp5ry2QJQT2683YR5HtH6nAmvFJa7Q14yT4H0=; b=M5BuW9AZzGP9Gbrh4MkzX+9G+
	7snQGnuc6BWA1qX67LZD+4YCLWlHRzN+F9iR2alNIfUgCO/s9n6AX+8Kqy+tH19pbvISHmYuPY7Ix
	3kFhJ8TIvfhTxHD7ZGrlBv2R2D5gqNxuHCyFEdU+ebCEW31XTPDTVMNAHkIV6GLJ/Rf3NAni1lCN7
	oZr8aYyvfwIkR/h2iTaHFDB0arpZo+4cXnxwEtMh/waKZiYrNYjlJc/gYuzFAJT4Fm5C1pLCBarHd
	f0O7GZrM09YOf4vkK2uGP49i65QAfJ+u0snIPXrVUDxSmiOzU+qdjJfR2k5lbXX0JwRIxmGdOpnRw
	d2Rbr/FVQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN6tj-006Usf-5c; Fri, 19 Mar 2021 04:38:07 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN6te-006UsL-2i
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 04:38:04 +0000
Received: by mail-ed1-f50.google.com with SMTP id j3so9229131edp.11
 for <linux-riscv@lists.infradead.org>; Thu, 18 Mar 2021 21:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JBj2UN2uQeOtTh3wtXdg/hjMvqwljwZZ1QrLxONTaQo=;
 b=PFD+3f9P+06u8zSOFk1YLgqCupbcGwzM/YCUuC4KmFQalcqQiMG/bGdgmlaaXsGPw5
 VAagggIfqwWiHX+/8VTKL0EkjzcsiP8W+BSO1MoKLHdJleQhYsnH+yDo7myfx/os56Qo
 XBweCX5KacmekAcIy4ZbtWOsYwdn8nvdxdpAXHyJ78QlNyZ8rzCvrfIBBw2aIgbcMuOb
 /pWy+86d/4VDRtL4msdRqoEGtyE9Q5vETVUPh2JjEiBzehNk19axoaaBYnUHWLDHz+Xg
 AwDTcvO1VnGkObZfXbIIpyAZhHHH3GtM/fHwE1sr8xL4qGHc2ssnJ7nZpAZgi8SlhLm2
 Uy6w==
X-Gm-Message-State: AOAM530xbYFCXHO1tw6GomdiPk05BH5j+GqvTzbStRhK1GDGacIHYdhR
 Z6lxGiRC3yvjFC9N/9QIVPg=
X-Google-Smtp-Source: ABdhPJz63lSyBqfKhnaTLrwU10m6AdwJSQqRVOX+01TzOi9uwdOBbDXQoiwlpZ7vAZkBK52YUPlzXA==
X-Received: by 2002:aa7:d1cd:: with SMTP id g13mr7400468edp.369.1616128680675; 
 Thu, 18 Mar 2021 21:38:00 -0700 (PDT)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id r4sm3027217ejd.125.2021.03.18.21.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 21:38:00 -0700 (PDT)
Date: Fri, 19 Mar 2021 05:37:58 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: paul.walmsley@sifive.com, hes@sifive.com, erik.danie@sifive.com,
 zong.li@sifive.com, bhelgaas@google.com, robh+dt@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, mturquette@baylibre.com,
 sboyd@kernel.org, lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
 alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com,
 jh80.chung@samsung.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: Re: [PATCH v2 5/6] PCI: fu740: Add SiFive FU740 PCIe host controller
 driver
Message-ID: <YFQqpojmJyX0l6lx@rocinante>
References: <cover.1615954045.git.greentime.hu@sifive.com>
 <27f491c113e1bb369d25aca02571b34422986142.1615954046.git.greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27f491c113e1bb369d25aca02571b34422986142.1615954046.git.greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_043802_350022_A825CF10 
X-CRM114-Status: GOOD (  17.22  )
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

Hi,

[...]
> +static void fu740_phyregwrite(const uint8_t phy, const uint16_t addr,
> +			      const uint16_t wrdata, struct fu740_pcie *afp)
> +{
> +	struct device *dev = afp->pci.dev;
> +	void __iomem *phy_cr_para_addr;
> +	void __iomem *phy_cr_para_wr_data;
> +	void __iomem *phy_cr_para_wr_en;
> +	void __iomem *phy_cr_para_ack;
> +	int ret, val;
> +
> +	/* Setup */
> +	if (phy) {
> +		phy_cr_para_addr = afp->mgmt_base + PCIEX8MGMT_PHY1_CR_PARA_ADDR;
> +		phy_cr_para_wr_data = afp->mgmt_base + PCIEX8MGMT_PHY1_CR_PARA_WR_DATA;
> +		phy_cr_para_wr_en = afp->mgmt_base + PCIEX8MGMT_PHY1_CR_PARA_WR_EN;
> +		phy_cr_para_ack = afp->mgmt_base + PCIEX8MGMT_PHY1_CR_PARA_ACK;
> +	} else {
> +		phy_cr_para_addr = afp->mgmt_base + PCIEX8MGMT_PHY0_CR_PARA_ADDR;
> +		phy_cr_para_wr_data = afp->mgmt_base + PCIEX8MGMT_PHY0_CR_PARA_WR_DATA;
> +		phy_cr_para_wr_en = afp->mgmt_base + PCIEX8MGMT_PHY0_CR_PARA_WR_EN;
> +		phy_cr_para_ack = afp->mgmt_base + PCIEX8MGMT_PHY0_CR_PARA_ACK;
> +	}
> +
> +	writel_relaxed(addr, phy_cr_para_addr);
> +	writel_relaxed(wrdata, phy_cr_para_wr_data);
> +	writel_relaxed(1, phy_cr_para_wr_en);
> +
> +	/* Wait for wait_idle */
> +	ret = readl_poll_timeout(phy_cr_para_ack, val, val, 10, 5000);
> +	if (ret)
> +		dev_err(dev, "Wait for wait_ilde state failed!\n");

It would be "wait_idle" rather than "wait_idle".

[...]
> +	/* Wait for ~wait_idle */
> +	ret = readl_poll_timeout(phy_cr_para_ack, val, !val, 10, 5000);
> +	if (ret)
> +		dev_err(dev, "Wait for !wait_ilde state failed!\n");
[...]

Same as above, it would be "wait_idle" in the above.

> +static void fu740_pcie_ltssm_enable(struct device *dev)
> +{
> +	struct fu740_pcie *afp = dev_get_drvdata(dev);
> +
> +	/* Enable LTSSM */
> +	writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_APP_LTSSM_ENABLE);
> +}
> +
> +static int fu740_pcie_start_link(struct dw_pcie *pci)
> +{
> +	struct device *dev = pci->dev;
> +
> +	/* Start LTSSM. */

Nitpick.  No need for a dot in this comment to keep it consistent with
the comment in the function above this one.

> +static int fu740_pcie_host_init(struct pcie_port *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct fu740_pcie *afp = to_fu740_pcie(pci);
> +	struct device *dev = pci->dev;
> +	int ret;
> +
> +	/* Power on reset */
> +	fu740_pcie_drive_perstn(afp);
> +
> +	/* Enable pcieauxclk */
> +	ret = clk_prepare_enable(afp->pcie_aux);
> +	if (ret)
> +		dev_err(dev, "unable to enable pcie_aux clock\n");
> +
> +	/*
> +	 * Assert hold_phy_rst (hold the controller LTSSM in reset after
> +	 * power_up_rst_n for register programming with cr_para)
> +	 */
> +	writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_APP_HOLD_PHY_RST);
> +
> +	/* Deassert power_up_rst_n */
> +	ret = reset_control_deassert(afp->rst);
> +	if (ret)
> +		dev_err(dev, "unable to deassert pcie_power_up_rst_n\n");
> +
> +	fu740_pcie_init_phy(afp);
> +
> +	/* Disable pcieauxclk */
> +	clk_disable_unprepare(afp->pcie_aux);
> +	/* Clear hold_phy_rst */
> +	writel_relaxed(0x0, afp->mgmt_base + PCIEX8MGMT_APP_HOLD_PHY_RST);
> +	/* Enable pcieauxclk */
> +	ret = clk_prepare_enable(afp->pcie_aux);
> +	/* Set RC mode */
> +	writel_relaxed(0x4, afp->mgmt_base + PCIEX8MGMT_DEVICE_TYPE);
> +
> +	return 0;
> +}
[...]

It seems that the error handling is somewhat broken in the above
function, especially when you look at how the "ret" variables does not
seem to be used for anything once there was an error.

Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

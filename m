Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89022CA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 00:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pm9oTsYTwFpyo64nTbHxKDpNThz5oxSQyCtJnHo5vvM=; b=co9W9nNfmEg/p9
	PpZq/HqlRSh3pWB6qpi9cqHMeGctqdhygsCuHmE2Obac2v/yNYqDhylyKcg9q7i0mq2JIClkFDDqJ
	L6GhhMuY7ZxaWY79JjD72j3jaEjdFhYD1r14JDRC6u/GKIWPAe+tXxeU+RrMeNz50mLgGDnmCLJyr
	eZEoA7ssmmIP5UUsOwtd99C0pSQPrDe5/OpkF8wsrVjxBpkZ1j6j/8NfathL5IvsNv5nInhl5eCzS
	gBMZUBz5v88w0v9S801o+8iIauY0mr7gc5EW58JMluGIJlEDc0ShnkcDV44gYGTARWNEojfHschp6
	U1jbRIyeAwEpoYLYTsrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiff-00000000xIa-2M0f;
	Fri, 15 Aug 2025 00:51:51 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umhpi-00000000pB2-0VQA;
	Thu, 14 Aug 2025 23:58:11 +0000
Received: from localhost (unknown [180.158.240.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 9610033E3A9;
	Thu, 14 Aug 2025 23:58:07 +0000 (UTC)
Date: Fri, 15 Aug 2025 07:57:57 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, kishon@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, tglx@linutronix.de, johan+linaro@kernel.org,
	thippeswamy.havalige@amd.com, namcao@linutronix.de,
	mayank.rana@oss.qualcomm.com, shradha.t@samsung.com,
	quic_schintav@quicinc.com, fan.ni@samsung.com,
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: Re: [PATCH 4/6] phy: spacemit: introduce PCIe/combo PHY
Message-ID: <20250814235757-GYA1008367@gentoo>
References: <20250813184701.2444372-1-elder@riscstar.com>
 <20250813184701.2444372-5-elder@riscstar.com>
 <valmrbddij2dn4fjxefr46zud2u6eco2isyaa62sd66d27foyl@4hrhafqftgb5>
 <4eaa30bc-9a25-4fe0-b685-1d0d8fa503c2@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4eaa30bc-9a25-4fe0-b685-1d0d8fa503c2@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_165810_179601_810907DB 
X-CRM114-Status: GOOD (  33.45  )
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

Hi Alex,

On 07:15 Thu 14 Aug     , Alex Elder wrote:
> On 8/13/25 6:42 PM, Inochi Amaoto wrote:
> > On Wed, Aug 13, 2025 at 01:46:58PM -0500, Alex Elder wrote:
> >> Introduce a driver that supports three PHYs found on the SpacemiT
> >> K1 SoC.  The first PHY is a combo PHY that can be configured for
> >> use for either USB 3 or PCIe.  The other two PHYs support PCIe
> >> only.
> >>
> >> All three PHYs must be programmed with an 8 bit receiver termination
> >> value, which must be determined dynamically; only the combo PHY is
> >> able to determine this value.  The combo PHY performs a special
> >> calibration step at probe time to discover this, and that value is
> >> used to program each PHY that operates in PCIe mode.  The combo
> >> PHY must therefore be probed--first--if either of the PCIe-only
> >> PHYs will be used.
> >>
> >> During normal operation, the USB or PCIe driver using the PHY must
> >> ensure clocks and resets are set up properly.  However clocks are
> >> enabled and resets are de-asserted temporarily by this driver to
> >> perform the calibration step on the combo PHY.
> >>
> >> Tested-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> >> Signed-off-by: Alex Elder <elder@riscstar.com>
> >> ---
> >>   drivers/phy/Kconfig                |  11 +
> >>   drivers/phy/Makefile               |   1 +
> >>   drivers/phy/phy-spacemit-k1-pcie.c | 639 +++++++++++++++++++++++++++++
> >>   3 files changed, 651 insertions(+)
> >>   create mode 100644 drivers/phy/phy-spacemit-k1-pcie.c
> 
> . . .
> 
> >> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> >> index c670a8dac4680..20f0078e543c7 100644
> >> --- a/drivers/phy/Makefile
> >> +++ b/drivers/phy/Makefile
> 
> . . .
> 
> >> +static int k1_pcie_pll_lock(struct k1_pcie_phy *k1_phy, bool pcie)
> >> +{
> >> +	u32 val = pcie ? CFG_FORCE_RCV_RETRY : 0;
> >> +	void __iomem *virt;
> >> +
> >> +	writel(val, k1_phy->regs + PCIE_RC_DONE_STATUS);
> >> +
> >> +	/*
> >> +	 * Wait for indication the PHY PLL is locked.  Lanes for ports
> >> +	 * B and C share a PLL, so it's enough to sample just lane 0.
> >> +	 */
> >> +	virt = k1_phy->regs + PCIE_PU_ADDR_CLK_CFG;	/* Lane 0 */
> >> +
> >> +	return readl_poll_timeout(virt, val, val & PLL_READY,
> >> +				  POLL_DELAY, PLL_TIMEOUT);
> >> +}
> >> +
> > 
> > Can we use standard clk_ops and clk_mux to normalize this process?
> 
> I understand you're suggesting that we represent this as a clock.
> 
> Can you be more specific about how you suggest I do that?
> 
> For example, are you suggesting I create a separate clock driver
> for this one PLL (in each PCIe register space)?
> 
> Or do you mean use clock structures and callbacks within this
> driver to represent this?
> 
> I'm just not sure what you have in mind, and the two options I
> mention seem a lot more complicated than this one function.
> 
> Thanks.
you can take a look at k1's i2c patch that Troy just sent which has similar case

https://lore.kernel.org/all/20250814-k1-i2c-ilcr-v3-1-317723e74bcd@linux.spacemit.com/

> 
> 					-Alex
> 
> > Regards,
> > Inochi
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

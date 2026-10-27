Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7263606A31A
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 08:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bOanWmmR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SKJHOV5BOOrBusKVuHDDKk2S63301ZNzkD3RJpQ2RCo=; b=bOanWmmRL8uEX2509hvI+rfYwn
	ChFLvVuDHj5njOMsMYDZVpidX9apJv94+9zO3y+vC+nX2wHUOWypGYd/itiRMHvckwwLG/GfqbfDE
	4So889hPCTzqM5Ct5R9tFQisoWZahK9FdEatEoa7i7KuUk3eBRobWzCN0Wb5qRK4qqr67SopPmTFc
	Z+J4+tdcUcgkTrddzslxN1nPbj1o3ElYDKdDHShOJLYPyRFaQgKuyMW9Zyix+1kDsIF57kOjeIBTp
	xjeBwAX71GPToX85KGJrJTBzn7dgvyzQJp5aOmFsa5yvw74WdE0P06Evqt97L1KnP60y5axs7frGj
	BWS7lH0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLc7L-00000003yAL-3e9B;
	Tue, 27 Oct 2026 08:01:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLc7K-00000003yAE-2d0N
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 08:01:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 63D2A43EC8;
	Tue, 27 Oct 2026 08:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B3E1F01825;
	Tue, 27 Oct 2026 08:00:53 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v7 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Niklas Cassel <cassel@kernel.org>, 
 Christian Bruel <christian.bruel@foss.st.com>, 
 Senchuan Zhang <zhangsenchuan@eswincomputing.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Randolph Lin <randolph@andestech.com>, 
 Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
 Alex Elder <elder@riscstar.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Vidya Sagar <vidyas@nvidia.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
In-Reply-To: <bddc44d0-5446-40a9-b211-28d0b03f89ad@ti.com>
References: <20260929083755.458238-1-inochiama@gmail.com>
 <20260929083755.458238-7-inochiama@gmail.com>
 <179232693939.2114.10956498814503201256.b4-reply@b4>
 <athvDzJHs7WQmBnx@inochi.infowork>
 <bddc44d0-5446-40a9-b211-28d0b03f89ad@ti.com>
Date: Tue, 27 Oct 2026 13:30:45 +0530
Message-Id: <179308804504.2479.5374380919602671853.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6234;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=iOohDRtxxe9CNbFudFpxxtv+wrhF1+p97PhHV4HpkC0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq4FowyUBvub8gHFvOntzFuPIDgQkxWHu9pPjWw
 7FstetbLnqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauBaMAAKCRBVnxHm/pHO
 9ZvJCACRv09Mq7Pi4mwNeBkYn0omULLAUDZ+vefsb7uf5r6eAWaz/W/Sbkm5JeoQZ0PnRrgtPMJ
 8dJBpAjk9HJDhrTZQnE5Y8wiih/odeQ42YpmUWwZCFnOTGNWdGwTeVubE+SJCwbxHGX8qMxZWnF
 O7G7NthKI9jx/ytADIoT+Gp2DTe3nN5i6/AftHK1KY0BMRGVQr2EZ4AiRzgA+XY2skVuktf7zGN
 iX4kPqcYsK0WxKVqQWy3DSk4+eJnhZuHhl8oxlfApyQsBl+1M/PLbE9j9SggnO2+wC1ZMPuGKZq
 ytzs7F06LggMAisEEkIwZDt1Wxv7cLKo3gKZJoomkSBEuFJR
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-21 13:56 +0530, Siddharth Vadapalli wrote:
> On 10/21/26 1:26 PM, Inochi Amaoto wrote:
> > On Sun, Oct 18, 2026 at 06:05:39PM +0530, Manivannan Sadhasivam wrote:
> >> On 2026-09-29 16:37 +0800, Inochi Amaoto wrote:
> >>> The PCIe controller on Spacemit K3 is almost a standard Synopsys
> >>> DesignWare PCIe IP with extra link and reset control. Unlike
> >>> the PCIe controller on K1, this controller supports external MSI
> >>> interrupt controller and can use multiple PHYs at the same time.
> >>>
> >>> Add driver to support PCIe controller on Spacemit K3 PCIe.
> >>>
> >>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> >>> ---
> >>>   drivers/pci/controller/dwc/Kconfig            |   4 +-
> >>>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 139 ++++++++++++++++++
> >>>   2 files changed, 141 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> >>> index dcfbe7e229fd..f9c27165260e 100644
> >>> --- a/drivers/pci/controller/dwc/Kconfig
> >>> +++ b/drivers/pci/controller/dwc/Kconfig
> >>> @@ -443,7 +443,7 @@ config PCIE_SOPHGO_DW
> >>>   	  Sophgo SoCs.
> >>>   
> >>>   config PCIE_SPACEMIT_K1
> >>> -	tristate "SpacemiT K1 PCIe controller (host mode)"
> >>> +	tristate "SpacemiT PCIe controller (host mode)"
> >>>   	depends on ARCH_SPACEMIT || COMPILE_TEST
> >>>   	depends on HAS_IOMEM
> >>>   	select PCIE_DW_HOST
> >>> @@ -451,7 +451,7 @@ config PCIE_SPACEMIT_K1
> >>>   	default ARCH_SPACEMIT
> >>>   	help
> >>>   	  Enables support for the DesignWare based PCIe controller in
> >>> -	  the SpacemiT K1 SoC operating in host mode.  Three controllers
> >>> +	  the SpacemiT SoC operating in host mode. Three controllers
> >>>   	  are available on the K1 SoC; the first of these shares a PHY
> >>>   	  with a USB 3.0 host controller (one or the other can be used).
> >>>   
> >>> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> >>> index ec59ccb710ec..61b430f2294a 100644
> >>> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> >>> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> >>> @@ -28,8 +28,18 @@
> >>>   #define SMLH_LINK_UP			BIT(1)
> >>>   #define RDLH_LINK_UP			BIT(12)
> >>>   
> >>> +#define INTR_STATUS				0x0010
> >>> +
> >>>   #define INTR_ENABLE				0x0014
> >>>   #define MSI_CTRL_INT			BIT(11)
> >>> +#define RDLH_LINK_UP_INT		BIT(20)
> >>> +
> >>> +#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008
> >>> +
> >>> +#define K3_ADDR_INTR_STATUS1			0x0018
> >>> +
> >>> +#define K3_CACHE_MSTR_AWCACHE_MODE	GENMASK(14, 11)
> >>> +#define K3_CACHE_MSTR_AWCACHE_BEHAVIOR	0xf
> >>>   
> >>>   /* Some controls require APMU regmap access */
> >>>   #define SYSCON_APMU			"spacemit,apmu"
> >>> @@ -44,6 +54,9 @@
> >>>   
> >>>   #define PCIE_CONTROL_LOGIC			0x0004
> >>>   #define PCIE_SOFT_RESET			BIT(0)
> >>> +#define PCIE_PERSTN_OE			BIT(24)
> >>> +#define PCIE_PERSTN_OUT			BIT(25)
> >>> +#define PCIE_IGNORE_PERSTN		BIT(31)
> >>>   
> >>>   struct k1_pcie;
> >>>   
> >>> @@ -315,6 +328,123 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> >>>   	return ret;
> >>>   }
> >>>   
> >>> +static int k3_pcie_init(struct dw_pcie_rp *pp)
> >>> +{
> >>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >>> +	struct k1_pcie *k1 = to_k1_pcie(pci);
> >>> +	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
> >>> +	u32 val;
> >>> +	int ret;
> >>> +
> >>> +	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);
> >>> +
> >>> +	k1_pcie_toggle_soft_reset(k1);
> >>> +
> >>> +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> >>> +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> >>> +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT,
> >>> +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE);
> >>> +
> >>> +	ret = k1_pcie_enable_resources(k1);
> >>> +	if (ret)
> >>> +		goto failed_resources;
> >>> +
> >>> +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> >>> +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> >>> +
> >>> +	ret = phy_bulk_init(k1->phy_count, k1->phys);
> >>> +	if (ret)
> >>> +		goto failed_phy_init;
> >>
> >> You got me confused with this PHY bulk API for a moment. I think you are trying
> >> to control all the PHYs of the multi-port RC setup at once. But I believe
> >> that's not what we want mostly. Each port is an independent entity with its own
> >> PHY, PERST# etc... So the RC driver controlling all the PHYs at once, doesn't
> >> seem logical.
> >>
> > 
> > In fact this thing is different. Accoring to statement from spacemit,
> > for software, it does not need to care about how the phy topology,
> > and which phy/phys is/are attached to the RC. It just needs to enable
> > all the phy and configure the APMU, which is the one that give some
> > control on PERST# and others. The phy itself does nothing on this.
> According to section "14.1.4 PHY Configuration Block Diagram" in the User 
> Manual for the Spacemit K3 SoC [0],the x8 Lane PCIe Controller namely 'PCIe 
> A' requires multiple PHYs (ranging from PHY0 to PHY5) to be 
> initialized/enabled simultaneously for a single Root-Port configuration. So 
> the phy_bulk_init() API here seems to be used in that sense. Mani's concern 
> is that the PHYs for all PCIe Controller instances are being configured in 
> a single invocation to phy_bulk_init() rather than the potentially multiple 
> PHY instances of a single PCIe Controller instance. Since k3_pcie_init is 
> invoked per Root-Port instance (i.e. per PCIe Controller instance), the 
> phy_bulk_init() API should configure 'all' PHY instances _strictly_ 
> associated with the corresponding PCIe instance. This might already be the 
> case.
> 
> [0]: 
> https://spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/14_connectivity/pcie.md
> 

Thanks for sharing the link to the doc. I didn't know this SoC allows muxing
multiple PHYs for a single RP. Now the bulk API makes sense!

For the next iteration, please include a link to this page.

- Mani


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

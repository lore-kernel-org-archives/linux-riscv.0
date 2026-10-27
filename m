Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9F6606A31A
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 08:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AIJBn+uq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lE/lwxkG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RVdDNK7fjm0skudqQVr7Za45ugYGlQEcpZKHpioNwzk=; b=AIJBn+uq3fTJTZNaZLeQLWqfnZ
	7PpT/AOnyfDISjtQUhj0n3R334h1gZSkH8sjHnI6O18wpwh7ls3IXJtgTttgU52J1rknLDaTuh+Pw
	rkr1OVbsO1bF+RW4fG1LhqXaX4P+y7lvibj7AsFNXl86EElITIIb77Lv2ASk1pvjOQYm+28sMrB+P
	bZwL0wygJsLAlrzIfaXS1bu7yrC420G6cFhchdrdgI8shX4m50RtQoYyF/ZPhDc9b0V6kGs4iJi4U
	EFEnxfkSumUQYyaRwB4Xnzdey7Bx3/4MtJ9m+y6EznjXWBaKDCP7o8hCH5YDxEsQnSTy0F/2aa6xP
	HHIWoO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcmg-000000044Nx-1C3l;
	Tue, 27 Oct 2026 08:43:54 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcmd-000000044ME-3dxx
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 08:43:53 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2e95bd1c14cso34400295ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Oct 2026 01:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090631; x=1793695431; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WdGWi2lCPsVOQrfWu4TCiPig1JxwAx4MQlsKT53PN3c=;
        b=lE/lwxkGFBlgXXKcJOxiGN/5OH1QG4ALL2BsIDnSpAh6MmIuly/fa201+waoUvBS+v
         EZDTQwkCZ096+woMYSeLTL64HZRhgURhQhTU7oa/X2Yz2XJ7HAUGrb2cRja+Ryrt3nne
         mYhmI373XWZn427DSbIiXfi09xpjprMr8hbyMWvoafzuxC+Y5lTw5Fiqikp0snOPzulV
         JI/2w46Zn/UYmuUvTnJc6/uGPBt3KkzOSv9soeSU1UtiLkB18wu9sFk1ZbBfw5qfeeap
         WZPhjEqVv6UFXKwHhak9UEnNz5N0OaeUqA65uAUsQpmEYiClLJoZziKPEnBX3G7WM43i
         KQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090631; x=1793695431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WdGWi2lCPsVOQrfWu4TCiPig1JxwAx4MQlsKT53PN3c=;
        b=XABCmt7zyG+zI5GLO01JnH5viGCJmY3vR5PTNln8VqypvZVbeb0THs3Epzl4k4NenK
         5BpJpBs3SYJ0lUyPExYfD+1C+wHTkx01G0uMdPCMkeNBRK9GzDGP/qVkSnQriZI9pDZo
         y5oqVRwy5Obv6sS01FzuMD0PJj5gkUlp+fGiSYtqxBsgi7CVpvwBzC/BU8GLZ8LMzo+h
         w1Yg4szJ7OSa56jbgDbJKJykSVA0AOXrD56jb7/Dq57UxOaDM2g8FKPnvaF2udCZyYhA
         0kyfx4Ct+DrYvJMExCNSMRXg1UjFM4/jciKIzQ/21qEARwwnI0WyZtAKSmdWtFFeJj76
         WX8A==
X-Forwarded-Encrypted: i=1; AKwUvBwLkfyna1C1joVj518qYRhMF/TlZjWQ54ikld4gOPUvWZ5700YA9PSTCX3VwP+aAxs9lccs28eqEmhEOg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIfhgJMJopEqSAghlsc2+Fx0TcMocCHBGkcKsBL14lpY1bhtE2R
	xK3TVCKDbRcPRygFQ2vkmHS282fmSS8cijz2V8YGKwj//yCrinf4ZiOH
X-Gm-Gg: AYBFou3H9KFcAxIsvDznPqjjE1Dx+bsC1jFMLHt+HJaIpTxlO2oLuA6qL2/KAEPdDUb
	qNqWxSIhCyrL0l2kHGO3LAh8P7xp7df+06u8+bDAVDtFyAw3wE0vAcclayW+QUfKtfAP3SVueLd
	nnbEIsthRw4vgSftgamuha2TTFG68H90OtvOytdOxO5M5c1m/KihC8YAT/sWL/ZBLfoUsF1TgYB
	gHSK3+A2aFyEYN53eUvZDbyfy8MXkof/85u5JGRk8dJyXPZzjaOP3MF0H14unXG6qvyNsdvVx7j
	JNVUzWy0RaFJX/wgFMVII4flqp+SyR8LuQ9MB8vq0a8Lvs0jw2VePdWDF3Ew3fYIDi8RUV4vmeu
	fmBCldfuGcAJgW34A60SOxIM+U5rYfLhevQryCyAn34WFnC9rE+f99JZLvLKjAfu7F7TxFyQ4L7
	66QdxXJ4E+6Fb+FLRbLqEH1vI2jvY7TAxvWFuLEGRunXDRnGmFVCCVfLFEgGr2OmqDHwPlPVX0g
	ZBabO04wP2E1OBvLwG3cVfuvYG0CCty6pLZHvNELIDjhFYQX6xj7A==
X-Received: by 2002:a17:903:2389:b0:2e9:6788:9379 with SMTP id d9443c01a7336-2ea9c821072mr73512925ad.32.1793090630759;
        Tue, 27 Oct 2026 01:43:50 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm5640215ad.35.2026.10.27.01.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:43:50 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:43:04 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Niklas Cassel <cassel@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Randolph Lin <randolph@andestech.com>, Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
	Alex Elder <elder@riscstar.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Vidya Sagar <vidyas@nvidia.com>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <auBkBSr5N_FlCPxD@inochi.infowork>
References: <20260929083755.458238-1-inochiama@gmail.com>
 <20260929083755.458238-7-inochiama@gmail.com>
 <179232693939.2114.10956498814503201256.b4-reply@b4>
 <athvDzJHs7WQmBnx@inochi.infowork>
 <bddc44d0-5446-40a9-b211-28d0b03f89ad@ti.com>
 <179308804504.2479.5374380919602671853.b4-reply@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <179308804504.2479.5374380919602671853.b4-reply@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_014351_919921_545DC327 
X-CRM114-Status: GOOD (  38.32  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 01:30:45PM +0530, Manivannan Sadhasivam wrote:
> On 2026-10-21 13:56 +0530, Siddharth Vadapalli wrote:
> > On 10/21/26 1:26 PM, Inochi Amaoto wrote:
> > > On Sun, Oct 18, 2026 at 06:05:39PM +0530, Manivannan Sadhasivam wrote:
> > >> On 2026-09-29 16:37 +0800, Inochi Amaoto wrote:
> > >>> The PCIe controller on Spacemit K3 is almost a standard Synopsys
> > >>> DesignWare PCIe IP with extra link and reset control. Unlike
> > >>> the PCIe controller on K1, this controller supports external MSI
> > >>> interrupt controller and can use multiple PHYs at the same time.
> > >>>
> > >>> Add driver to support PCIe controller on Spacemit K3 PCIe.
> > >>>
> > >>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > >>> ---
> > >>>   drivers/pci/controller/dwc/Kconfig            |   4 +-
> > >>>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 139 ++++++++++++++++++
> > >>>   2 files changed, 141 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > >>> index dcfbe7e229fd..f9c27165260e 100644
> > >>> --- a/drivers/pci/controller/dwc/Kconfig
> > >>> +++ b/drivers/pci/controller/dwc/Kconfig
> > >>> @@ -443,7 +443,7 @@ config PCIE_SOPHGO_DW
> > >>>   	  Sophgo SoCs.
> > >>>   
> > >>>   config PCIE_SPACEMIT_K1
> > >>> -	tristate "SpacemiT K1 PCIe controller (host mode)"
> > >>> +	tristate "SpacemiT PCIe controller (host mode)"
> > >>>   	depends on ARCH_SPACEMIT || COMPILE_TEST
> > >>>   	depends on HAS_IOMEM
> > >>>   	select PCIE_DW_HOST
> > >>> @@ -451,7 +451,7 @@ config PCIE_SPACEMIT_K1
> > >>>   	default ARCH_SPACEMIT
> > >>>   	help
> > >>>   	  Enables support for the DesignWare based PCIe controller in
> > >>> -	  the SpacemiT K1 SoC operating in host mode.  Three controllers
> > >>> +	  the SpacemiT SoC operating in host mode. Three controllers
> > >>>   	  are available on the K1 SoC; the first of these shares a PHY
> > >>>   	  with a USB 3.0 host controller (one or the other can be used).
> > >>>   
> > >>> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > >>> index ec59ccb710ec..61b430f2294a 100644
> > >>> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > >>> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > >>> @@ -28,8 +28,18 @@
> > >>>   #define SMLH_LINK_UP			BIT(1)
> > >>>   #define RDLH_LINK_UP			BIT(12)
> > >>>   
> > >>> +#define INTR_STATUS				0x0010
> > >>> +
> > >>>   #define INTR_ENABLE				0x0014
> > >>>   #define MSI_CTRL_INT			BIT(11)
> > >>> +#define RDLH_LINK_UP_INT		BIT(20)
> > >>> +
> > >>> +#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008
> > >>> +
> > >>> +#define K3_ADDR_INTR_STATUS1			0x0018
> > >>> +
> > >>> +#define K3_CACHE_MSTR_AWCACHE_MODE	GENMASK(14, 11)
> > >>> +#define K3_CACHE_MSTR_AWCACHE_BEHAVIOR	0xf
> > >>>   
> > >>>   /* Some controls require APMU regmap access */
> > >>>   #define SYSCON_APMU			"spacemit,apmu"
> > >>> @@ -44,6 +54,9 @@
> > >>>   
> > >>>   #define PCIE_CONTROL_LOGIC			0x0004
> > >>>   #define PCIE_SOFT_RESET			BIT(0)
> > >>> +#define PCIE_PERSTN_OE			BIT(24)
> > >>> +#define PCIE_PERSTN_OUT			BIT(25)
> > >>> +#define PCIE_IGNORE_PERSTN		BIT(31)
> > >>>   
> > >>>   struct k1_pcie;
> > >>>   
> > >>> @@ -315,6 +328,123 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> > >>>   	return ret;
> > >>>   }
> > >>>   
> > >>> +static int k3_pcie_init(struct dw_pcie_rp *pp)
> > >>> +{
> > >>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > >>> +	struct k1_pcie *k1 = to_k1_pcie(pci);
> > >>> +	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
> > >>> +	u32 val;
> > >>> +	int ret;
> > >>> +
> > >>> +	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);
> > >>> +
> > >>> +	k1_pcie_toggle_soft_reset(k1);
> > >>> +
> > >>> +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> > >>> +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > >>> +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT,
> > >>> +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE);
> > >>> +
> > >>> +	ret = k1_pcie_enable_resources(k1);
> > >>> +	if (ret)
> > >>> +		goto failed_resources;
> > >>> +
> > >>> +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> > >>> +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> > >>> +
> > >>> +	ret = phy_bulk_init(k1->phy_count, k1->phys);
> > >>> +	if (ret)
> > >>> +		goto failed_phy_init;
> > >>
> > >> You got me confused with this PHY bulk API for a moment. I think you are trying
> > >> to control all the PHYs of the multi-port RC setup at once. But I believe
> > >> that's not what we want mostly. Each port is an independent entity with its own
> > >> PHY, PERST# etc... So the RC driver controlling all the PHYs at once, doesn't
> > >> seem logical.
> > >>
> > > 
> > > In fact this thing is different. Accoring to statement from spacemit,
> > > for software, it does not need to care about how the phy topology,
> > > and which phy/phys is/are attached to the RC. It just needs to enable
> > > all the phy and configure the APMU, which is the one that give some
> > > control on PERST# and others. The phy itself does nothing on this.
> > According to section "14.1.4 PHY Configuration Block Diagram" in the User 
> > Manual for the Spacemit K3 SoC [0],the x8 Lane PCIe Controller namely 'PCIe 
> > A' requires multiple PHYs (ranging from PHY0 to PHY5) to be 
> > initialized/enabled simultaneously for a single Root-Port configuration. So 
> > the phy_bulk_init() API here seems to be used in that sense. Mani's concern 
> > is that the PHYs for all PCIe Controller instances are being configured in 
> > a single invocation to phy_bulk_init() rather than the potentially multiple 
> > PHY instances of a single PCIe Controller instance. Since k3_pcie_init is 
> > invoked per Root-Port instance (i.e. per PCIe Controller instance), the 
> > phy_bulk_init() API should configure 'all' PHY instances _strictly_ 
> > associated with the corresponding PCIe instance. This might already be the 
> > case.
> > 
> > [0]: 
> > https://spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/14_connectivity/pcie.md
> > 
> 
> Thanks for sharing the link to the doc. I didn't know this SoC allows muxing
> multiple PHYs for a single RP. Now the bulk API makes sense!
> 
> For the next iteration, please include a link to this page.
> 
> - Mani
> 

OK, I will include that, thanks.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

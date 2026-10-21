Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74441606A334
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 07:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OAedEa6k;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DWmfGGDV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtM9ifbBqexpAsRJ4kTMOkESE9jhffYi+pVmPypzDzE=; b=OAedEa6kGIlnZ2
	tVCj7ZwbPR84lAIWzexwk6qEQaoa4/8pFNpPurjTNNPJqCNjC1lJPSF7LP6oBzOX96nIdhBITNf2L
	s4PtjdEk2QlPg9Jis1KKs4JMtikJoKSYF2DWEXLQ4lSzrNIYOVc0Y5tbFv0LLfnjBddWKGvdDv8w0
	KRDBsgi42F1xGdHKn/+R8Dv+ycb77cSXyihi+T9GSYqy14ie66QkuRJNy6kKXoqtQL63TeQH+zTQ7
	cR4Bf62hi4ploABYi52slfPXFtgGWfMbZRGIckJumAWwoiboPFfUVLsFASKjY6gZySfQ49UuQu2pB
	CCP6fZ2YSSB5D5w9jH1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRCa-0000000BHiX-086N;
	Wed, 21 Oct 2026 07:57:36 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRCX-0000000BHhi-00bg
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 07:57:34 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e96502e447so3470265ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 00:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792569452; x=1793174252; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s7OIxnjVnGRZmr1LgfXzEIcyEF1Urq62srWXFTWymcQ=;
        b=DWmfGGDVS4VHf4Qs9OUyHhIvguI7Fys9H3IrYLHWw5940pFZ0nMBzg56frfQqvNjZ8
         sGN6Cq5Vqs7aBQr1xuk3vB1q0stzAzu6p6+NaN2YbZkCCdaAxFje8XJbr9uulrgZopOG
         ezCQcTpot7d7YvYAhZNqzlVuMhxQMyTqbZBXZJrfCe8xjMvuPLNqVk/SYXOO1hNoE4k7
         Vcgx6oijnV/1sfjdxW2HO/KIICr7er5IeBTtZsmHqqRHKhh+rJYyftVvJWUieOmCSYb3
         okS0NgIMYyS3Wj9IWM6nNnBILrmbSGw4vDYVZMtu+SBhQJHpKPYqCx0/EGA48lBQRujq
         TZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569452; x=1793174252;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7OIxnjVnGRZmr1LgfXzEIcyEF1Urq62srWXFTWymcQ=;
        b=2koPimt6RNEOrycLQ1BtuBrt00Mb8PMbjcGItrDVQ7Y1YGfKZGVApOnieBLgCiSPFI
         1HspnbOV1bbootTfeI2MfM15O8jCGRMKQDXsHUJoZavjzUd1v5ujEGMYIbpmYZRclQw1
         ZIHp0ORxvJhS1nU2uf6g/fwI2JQ+bfHG6C1XF0t2GqURPuBip/Q8uTtQxEZvsEBQuwR2
         IzH8yC9TJSaUxdOulcpuBf1P4nulWztnSafAuSTD5n6YvXUqNreDphMMdn55l6yabviN
         r+Ond6kH+yqVho1AESLB5aziOjREv0D1s3BDYoyybKWXolyEXs4lP56lMGabUWgUb9re
         wwdg==
X-Forwarded-Encrypted: i=1; AKwUvBx+5RyAJZEfT1j7Pp57LAxZGZ0/XKYzXLZDZ7llzanaywGgPXPcRfkhPoVn2D8yc00ejihc3m7Nc0yyXA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKyB9lGAS4aNg14+6O+aS2GiUn3VCwHJkZAeSleCctV/hfB6ysS
	v8hul0yrMPubXxDT4zh0BpVy9rjLRDaMXFkxax4nLVnrFtwSkfIt2iWR
X-Gm-Gg: AYBFou0QmXVdvIWQxFumdNFNU82r7dsM0LicxdOrQAqddLmtb9+2r/Px4gv6r3c+qfN
	4MYKMNGpWNOMmHkFSh8vI3t9L1d0ljqcMdPsHmddj9jjPCgUqBhwj8Jii6WUhCinBsjO6WlUVUc
	bJ2DTW66jcCiUXaOyQAAgiLQVXhW2OcULfjBDg9Y+5XogDLWzrrd/WkzaMak5cZf4ueWNFiko7Q
	O/KuG7+a7hl85b+hdb2gBxiq0H8T0Q0PF+LCDGoNyaWn7cszZs9nFGdgQAwi4Wj2tloZWTGaqXD
	B9r5OPf2HxSIt5lcxzJhlaZKAwTooJgSPNimogZM1mfPgvF/inJEAfXYrUNKpykkhr7Q0u36Xys
	IQF9LVELTiNaP3Uz/CoEk/y3tXu4d3OaeL8qCFmP0LTO3LTrN3kpZtFlVB2py/xpnksFYP6njjl
	bddkeRFjeKpRhFFGipFvFC0iVGZKWknVVx1LOk9C8WAm5gieHy6U5cLFIY4X7REckInZJA47Dkq
	d2Tv5KyIZcIz2kSY+J9AS/SU3J0sReWw7cGd6tOIkP+i4l56Ksr3g==
X-Received: by 2002:a17:902:f70c:b0:2e9:53c2:760 with SMTP id d9443c01a7336-2ea43c79efbmr10549995ad.30.1792569451953;
        Wed, 21 Oct 2026 00:57:31 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b48866bsm8021975ad.65.2026.10.21.00.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:57:31 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:56:52 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
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
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Vidya Sagar <vidyas@nvidia.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <athvDzJHs7WQmBnx@inochi.infowork>
References: <20260929083755.458238-1-inochiama@gmail.com>
 <20260929083755.458238-7-inochiama@gmail.com>
 <179232693939.2114.10956498814503201256.b4-reply@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <179232693939.2114.10956498814503201256.b4-reply@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_005733_073456_30EEC0D7 
X-CRM114-Status: GOOD (  29.79  )
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

On Sun, Oct 18, 2026 at 06:05:39PM +0530, Manivannan Sadhasivam wrote:
> On 2026-09-29 16:37 +0800, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 is almost a standard Synopsys
> > DesignWare PCIe IP with extra link and reset control. Unlike
> > the PCIe controller on K1, this controller supports external MSI
> > interrupt controller and can use multiple PHYs at the same time.
> > 
> > Add driver to support PCIe controller on Spacemit K3 PCIe.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/pci/controller/dwc/Kconfig            |   4 +-
> >  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 139 ++++++++++++++++++
> >  2 files changed, 141 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > index dcfbe7e229fd..f9c27165260e 100644
> > --- a/drivers/pci/controller/dwc/Kconfig
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -443,7 +443,7 @@ config PCIE_SOPHGO_DW
> >  	  Sophgo SoCs.
> >  
> >  config PCIE_SPACEMIT_K1
> > -	tristate "SpacemiT K1 PCIe controller (host mode)"
> > +	tristate "SpacemiT PCIe controller (host mode)"
> >  	depends on ARCH_SPACEMIT || COMPILE_TEST
> >  	depends on HAS_IOMEM
> >  	select PCIE_DW_HOST
> > @@ -451,7 +451,7 @@ config PCIE_SPACEMIT_K1
> >  	default ARCH_SPACEMIT
> >  	help
> >  	  Enables support for the DesignWare based PCIe controller in
> > -	  the SpacemiT K1 SoC operating in host mode.  Three controllers
> > +	  the SpacemiT SoC operating in host mode. Three controllers
> >  	  are available on the K1 SoC; the first of these shares a PHY
> >  	  with a USB 3.0 host controller (one or the other can be used).
> >  
> > diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > index ec59ccb710ec..61b430f2294a 100644
> > --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > @@ -28,8 +28,18 @@
> >  #define SMLH_LINK_UP			BIT(1)
> >  #define RDLH_LINK_UP			BIT(12)
> >  
> > +#define INTR_STATUS				0x0010
> > +
> >  #define INTR_ENABLE				0x0014
> >  #define MSI_CTRL_INT			BIT(11)
> > +#define RDLH_LINK_UP_INT		BIT(20)
> > +
> > +#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008
> > +
> > +#define K3_ADDR_INTR_STATUS1			0x0018
> > +
> > +#define K3_CACHE_MSTR_AWCACHE_MODE	GENMASK(14, 11)
> > +#define K3_CACHE_MSTR_AWCACHE_BEHAVIOR	0xf
> >  
> >  /* Some controls require APMU regmap access */
> >  #define SYSCON_APMU			"spacemit,apmu"
> > @@ -44,6 +54,9 @@
> >  
> >  #define PCIE_CONTROL_LOGIC			0x0004
> >  #define PCIE_SOFT_RESET			BIT(0)
> > +#define PCIE_PERSTN_OE			BIT(24)
> > +#define PCIE_PERSTN_OUT			BIT(25)
> > +#define PCIE_IGNORE_PERSTN		BIT(31)
> >  
> >  struct k1_pcie;
> >  
> > @@ -315,6 +328,123 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> >  	return ret;
> >  }
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
> > +		goto failed_phy_init;
> 
> You got me confused with this PHY bulk API for a moment. I think you are trying
> to control all the PHYs of the multi-port RC setup at once. But I believe
> that's not what we want mostly. Each port is an independent entity with its own
> PHY, PERST# etc... So the RC driver controlling all the PHYs at once, doesn't
> seem logical.
> 

In fact this thing is different. Accoring to statement from spacemit, 
for software, it does not need to care about how the phy topology, 
and which phy/phys is/are attached to the RC. It just needs to enable
all the phy and configure the APMU, which is the one that give some
control on PERST# and others. The phy itself does nothing on this.

Regards,
Inochi



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

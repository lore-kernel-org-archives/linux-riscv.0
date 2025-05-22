Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAAAC54E90
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 11:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UDN+U//AVzHw4mZETmkIbyrYtQVLbVuwD60r6y4j2Fg=; b=AiryNMxg4hp4O0
	FAX/gZmljyKPHnat23tgH4c/rUNM9Bs0YpZYZ4gmY9Kb021jUdeIra08FuTpudw1smf6Nrb4IK6B7
	ykWBK86cqV1Cj7gJdj3ecIC82sxMzRpGmWBPAAHKdByl8b3tq8jEas4FSzMWDiu5rmQqwbYgbfNuE
	Yz3mhEdSTaMoONisDowcRi4zswdlh32ZygR9ycIPVBUA2MlETrJ4rD0EP5hMaiO/K3kIbJqvSrnRc
	8yk63Qji+wGU6ghUFBZLSwqKx+k1AbCRDaalTLwWRqD5kMC/ilIPvrYyxPM2w62WHpcoSzpzUaW1C
	eDey0nocpJiMTDEq/o4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI3iI-00000000n6V-39j2;
	Thu, 22 May 2025 11:03:50 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI3iG-00000000n5e-0bSn
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 11:03:49 +0000
Received: from localhost (unknown [116.232.18.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3B7F63430BD;
	Thu, 22 May 2025 11:03:44 +0000 (UTC)
Date: Thu, 22 May 2025 11:03:33 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alex Elder <elder@riscstar.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mmc: sdhci-of-k1: add support for SpacemiT K1 SoC
Message-ID: <20250522110333-GYA30672@gentoo>
References: <20250501-20-k1-sdhci-v2-0-3e7005fae29b@gentoo.org>
 <20250501-20-k1-sdhci-v2-2-3e7005fae29b@gentoo.org>
 <CAPDyKFoDWS6DWdKOaxTDEYeKv3hjVDoR7XGi19nESVssc-RG8g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFoDWS6DWdKOaxTDEYeKv3hjVDoR7XGi19nESVssc-RG8g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_040348_206952_61E0570F 
X-CRM114-Status: GOOD (  22.56  )
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

Hi Ulf,

On 13:34 Mon 19 May     , Ulf Hansson wrote:
> On Thu, 1 May 2025 at 10:51, Yixun Lan <dlan@gentoo.org> wrote:
> >
> > The SDHCI controller found in SpacemiT K1 SoC features SD,
> > SDIO, eMMC support, such as:
> >
> > - Compatible for 4-bit SDIO 3.0 UHS-I protocol, up to SDR104
> > - Compatible for 4-bit SD 3.0 UHS-I protocol, up to SDR104
> > - Compatible for 8bit eMMC5.1, up to HS400
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/mmc/host/Kconfig       |  14 ++
> >  drivers/mmc/host/Makefile      |   1 +
> >  drivers/mmc/host/sdhci-of-k1.c | 306 +++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 321 insertions(+)
> >
> > [...]
> > +
> > +#include "sdhci.h"
> > +#include "sdhci-pltfm.h"
> > +
> > +#define SDHC_MMC_CTRL_REG              0x114
I will add 'SPACEMIT_' prefix for the register definitions,
AFAIK, vendor will continue to reuse this IP for their next generation SoC

> > +#define  MISC_INT_EN                   BIT(1)
> > +#define  MISC_INT                      BIT(2)
for BITs definition, it's also quite generic.. I could add
'SDHC_' prefix to make them slightly unique, and as all those registers
fall into SDHC category..

> 
> These define-names look a bit too generic to me. Please add some
> additional prefixes so it becomes more clear what they are.
> 
Initially, I've followed the datasheet closely for creating those naming..

https://developer.spacemit.com/documentation?token=WZNvwFDkYinYx0k9jzPcMK5WnIe#12.5.4.36-sdhc_mmc_ctrl_reg-register

> This applies to all the others below too.
> 
> > +#define  ENHANCE_STROBE_EN             BIT(8)
> > +#define  MMC_HS400                     BIT(9)
> > +#define  MMC_HS200                     BIT(10)
> > +#define  MMC_CARD_MODE                 BIT(12)
> > +
> > +#define SDHC_TX_CFG_REG                        0x11C
> > +#define  TX_INT_CLK_SEL                        BIT(30)
> > +#define  TX_MUX_SEL                    BIT(31)
> > +
> > +#define SDHC_PHY_CTRL_REG              0x160
> > +#define  PHY_FUNC_EN                   BIT(0)
> > +#define  PHY_PLL_LOCK                  BIT(1)
> > +#define  HOST_LEGACY_MODE              BIT(31)
> > +
> > +#define SDHC_PHY_FUNC_REG              0x164
> > +#define  PHY_TEST_EN                   BIT(7)
> > +#define  HS200_USE_RFIFO               BIT(15)
> > +
> > +#define SDHC_PHY_DLLCFG                        0x168
> > +#define  DLL_PREDLY_NUM                        GENMASK(3, 2)
> > +#define  DLL_FULLDLY_RANGE             GENMASK(5, 4)
> > +#define  DLL_VREG_CTRL                 GENMASK(7, 6)
> > +#define  DLL_ENABLE                    BIT(31)
> > +
> > +#define SDHC_PHY_DLLCFG1               0x16C
> > +#define  DLL_REG1_CTRL                 GENMASK(7, 0)
> > +#define  DLL_REG2_CTRL                 GENMASK(15, 8)
> > +#define  DLL_REG3_CTRL                 GENMASK(23, 16)
> > +#define  DLL_REG4_CTRL                 GENMASK(31, 24)
> > +
> > +#define SDHC_PHY_DLLSTS                        0x170
> > +#define  DLL_LOCK_STATE                        BIT(0)
> > +
> > +#define SDHC_PHY_PADCFG_REG            0x178
> > +#define  PHY_DRIVE_SEL                 GENMASK(2, 0)
> > +#define  RX_BIAS_CTRL                  BIT(5)
> 
> [...]
> 
> > +
> > +static int spacemit_sdhci_pre_select_hs400(struct mmc_host *mmc)
> > +{
> > +       struct sdhci_host *host = mmc_priv(mmc);
> > +
> > +       spacemit_sdhci_setbits(host, MMC_HS400, SDHC_MMC_CTRL_REG);
> > +       host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY;
> 
> At least this deserves a comment. Isn't MMC_CAP_WAIT_WHILE_BUSY
> working for all cases?
> 
I mostly copy the logic from vendor driver while refactoring the code,
and again check the logic, it sounds a little bit weird that the flag
is enabled in pre_select_hs400(), then disabled in post_select_hs400(),
I really don't understand the logic behind this, or even any quirk?..

while, I've tested both cases of enabling or disabling the flag globally,
they both works fine as result.. so to be conservative, I plan to drop
this "enable-and-disable" logic, and would revisit them once adding
"SD card/SDIO" support in the future

> > +
> > +       return 0;
> > +}
> > +
> > +static void spacemit_sdhci_post_select_hs400(struct mmc_host *mmc)
> > +{
> > +       struct sdhci_host *host = mmc_priv(mmc);
> > +
> > +       spacemit_sdhci_phy_dll_init(host);
> > +       host->mmc->caps &= ~MMC_CAP_WAIT_WHILE_BUSY;
> 
> Dito.
> 
> [...]
> 
> Kind regards
> Uffe

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

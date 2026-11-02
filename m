Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562D660A2611
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 14:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=em7bXtBJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V7z/N3A4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DfxC9JutIdoAz/J6QKnJNJCCrMh2P4y41E0bA9IRkzg=; b=em7bXtBJM/1/U/fxmc7/9HJrO8
	f+6bAcKhafFRp9guLTD1VjNZJ02tVHSHkouPwHgh1KFCUOlUcYoW9HydFbE08P+oIg4MXpr5a2phG
	lp+Rsm3M409516r1cOYRAxDIATJwIKUQtyGHg85cyL8AUBM3OGn76QlyyMAnWEvMVou+f7Pv0sNBa
	HcT1MGJ8jFdAta3AtnTCco9H7109XewyJV3lLo5ty18t5jfkOg1FU1vE2BzAgOkLAAt8gtx+RzvmZ
	aPMK5sNOEUi3U9p7DDP/EEANvStBo43xERTj3gwM04vYStaHZZzPU9+ATKI6/i7kos9MdhYdh21B7
	TL0KF4Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsvq-0000000GmGK-3qtl;
	Mon, 02 Nov 2026 14:22:42 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsvm-0000000GmDW-3FfR
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 14:22:41 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6b19e291cc6so3249639eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Nov 2026 06:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793629357; x=1794234157; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ul5zAT5XA1IgDpSrbBJ3ibIOhSt8X7JWBFKnGAIgGGo=;
        b=V7z/N3A4/Hd6TCOy1AFz10T93FkjtguNUpz4oVKczcLeudulVlvbXYM1/36tidmzxL
         B2DxfIRc/0Wpsf6w/62Th6D2ZuzTQn2741tLZ6KMBMCriD05jllEsUH/+HFWj9nENlVE
         jvKAJgW3eqPeu6BDT2f0kLEUl3/l+zcTje1Och3m4tMAvrgR+Th5ANs0AupnLlOi8483
         AoZOXF8ecBsFzLfRslVnLe2lYutCSF3jnf88kjVd9q9x2LZSISI3W7Tnh34bd0Osm0BT
         89E+8HpQVW/hUgiDMIM9WsNFcomFE9A4VePCLJTb3cZt0TnpTxENL3hYasDwwvzOjjul
         Eezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629357; x=1794234157;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ul5zAT5XA1IgDpSrbBJ3ibIOhSt8X7JWBFKnGAIgGGo=;
        b=HxMIznQ5cFUNZRbgSwhxqXagSofQhY0Cr3S8B3Ug/7yeGZq7q+6BA6e8RIKJXMy0kE
         vIJf+vC/FuFxIclOli6IrcCC0C0Ir3bxbx3OSL2ridvQhx7PNdeWTcKAPGfz4dZcBmm4
         S/vN+QS17RWqjWyFShJnA0Sd2T+fuU6DRJoPg+snpVAXzdZqM5KTwoqndNhsppUCjHAi
         /L4yig9zs/aXUTbUaYPSo9KUIVJg2gRnDmSwqubJkTZCbKsxc8lTh5Ez2D5AB9JkMCzY
         I+tEY6Hd/wZyyoiV5lgoINsxcmZXi348CNo8va1FjF0c9CkiKNhlBuIp/8PVrfhfcc/i
         xGrg==
X-Forwarded-Encrypted: i=1; AKwUvBztSsX1KrKvPHTIgtcwx5eSIPT2+QXYHJRSFJedtSmk5sde2m8eC4MhTo8EpAD4yVfqQ52yFq6TdT90Og==@lists.infradead.org
X-Gm-Message-State: AFq9FYL+4iY6aSG8QZjp5DSv6R3++AWEUOhYMuc3TYP36ivTpyJaNuE7
	TFeZ1+v81Nx1Tx8FvMgLXCla84Qf+np+u2pezxXzNYguPGxqtjpCS6TyHgmD1mof48TpgwsBnwN
	fDojVDvQ=
X-Gm-Gg: AYBFou3U5GNDmlCPVp+/rnwI09cVd32m1qPhr0WIB8qw9LJn9ecfVgxFfYrEeMeM2Ek
	juLbRD234WwLJqVmKY9CRK71WNixx54ZO2lAZ3rSaPwLAbCvCCUC+edv3uXR5CftHR7HQYZuf5k
	oUVe2MVPpMkNPoeNVnYnnd/11i03CiciF5NxOA8WsRJNED5iN/TsvR85/lpaQx4MPRDX8HgLEww
	6JUCOaDe9xzK2Sz1vaA7kNUyIrGxI1YX8mUvxAni0Nd5xISoBoTHPEOCIee5wYewvR2wNd6znqk
	N62ecUvFQBcQ5V/FMA3ryzfzy9bTo8HHBg8iy5t7NtdcspiVbWrLr7TGiSRddMXVYe7qqHUiSlI
	LvYRyLTswNjrH+3Y1K7rK6PxKz5yDadtZvqBc5/njuzdU5fwlAiTNaU5QqEbHEDZR3BinImCifq
	zH/Z5OY5OoJz5fvCQeYqTfsJ0cmDctcdvbwb41EMRO3kAjnFo1HumOE66lXAFVZ1SBbJL9Bjmvp
	83AGTqiwNBhORYooozp9jQqmN0IBHGdEdZjKvQe6pRL4HL+go3UbjFxxLx+1vvljb5C6QwV2TLZ
	+BSI0BBlxVNofxEYQp7wBiNDboPglUzA22on2HDTIb5Pn8SY7tBsDDiYcG7+crS8
X-Received: by 2002:a05:6820:858a:20b0:6f4:5794:bf8c with SMTP id 006d021491bc7-714f290e6c8mr3860949eaf.17.1793629356802;
        Mon, 02 Nov 2026 06:22:36 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2e500d0sm8367464eaf.10.2026.11.02.06.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:22:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Mon, 02 Nov 2026 09:22:31 -0500
Message-Id: <DMKSJGTLCYII.3IM8GY1R9M653@baylibre.com>
Cc: "Anirudh Srinivasan" <asrinivasan@oss.tenstorrent.com>, "Aurelien Jarno"
 <aurelien@aurel32.net>, "Jennifer Berringer" <jberring@redhat.com>,
 <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Yixun Lan" <dlan@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Avri Altman" <avri.altman@sandisk.com>, "Bart Van Assche"
 <bvanassche@acm.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Martin K. Petersen" <mkp@kernel.org>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Subject: Re: [PATCH v7 2/2] scsi: ufs: spacemit: k3: Add UFS Host Controller
 driver
X-Mailer: aerc 0.22.0
References: <20261002-08-k3-ufs-support-v7-0-bb39007ff9ae@kernel.org>
 <20261002-08-k3-ufs-support-v7-2-bb39007ff9ae@kernel.org>
In-Reply-To: <20261002-08-k3-ufs-support-v7-2-bb39007ff9ae@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_062238_892680_035DD08B 
X-CRM114-Status: GOOD (  27.56  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu Oct 1, 2026 at 11:10 PM EDT, Yixun Lan wrote:
> SpacemiT K3 SoC consist of UFS (Universal Flash Storage) Host Controller
> which has features compatible with JEDEC UFS 2.2, MIPI UniPro v1.61 and
> M-PHY v3.0 standard.

Hi,

I've been testing this using a v7.3 kernel in Yocto's meta-riscv layer. It's
been working well on a K3 Pico-ITX with fastboot flash in our nightly CI. An
example:

https://forgejo.baylibre.com/tgamblin/boardgarden/actions/runs/827/jobs/9/attempt/1

Tested-by: Trevor Gamblin <tgamblin@baylibre.com>

> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/ufs/host/Kconfig        |  12 +
>  drivers/ufs/host/Makefile       |   1 +
>  drivers/ufs/host/ufs-spacemit.c | 652 ++++++++++++++++++++++++++++++++++++++++
>  drivers/ufs/host/ufs-spacemit.h |  77 +++++
>  4 files changed, 742 insertions(+)
>
> diff --git a/drivers/ufs/host/Kconfig b/drivers/ufs/host/Kconfig
> index ff170c0b6da0..6146872fcecc 100644
> --- a/drivers/ufs/host/Kconfig
> +++ b/drivers/ufs/host/Kconfig
> @@ -132,6 +132,18 @@ config SCSI_UFS_VARIABLE_SG_ENTRY_SIZE
>  	bool
>  	default y if SCSI_UFS_EXYNOS && SCSI_UFS_CRYPTO
>  
> +config SCSI_UFS_SPACEMIT
> +	tristate "SpacemiT UFS controller driver"
> +	depends on SCSI_UFSHCD_PLATFORM && (ARCH_SPACEMIT || COMPILE_TEST)
> +	help
> +	  This selects the SpacemiT specific additions to UFSHCD platform driver.
> +	  UFS host on SpacemiT needs some vendor specific configuration before
> +	  accessing the hardware which includes PHY configuration and vendor
> +	  specific registers.
> +
> +	  Select this if you have UFS controller on SpacemiT chipset.
> +	  If unsure, say N.
> +
>  config SCSI_UFS_SPRD
>  	tristate "Unisoc specific hooks to UFS controller platform driver"
>  	depends on SCSI_UFSHCD_PLATFORM && (ARCH_SPRD || COMPILE_TEST)
> diff --git a/drivers/ufs/host/Makefile b/drivers/ufs/host/Makefile
> index 7d8db67eb23c..a3c447b8fc21 100644
> --- a/drivers/ufs/host/Makefile
> +++ b/drivers/ufs/host/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_SCSI_UFS_HISI) += ufs-hisi.o
>  obj-$(CONFIG_SCSI_UFS_MEDIATEK) += ufs-mediatek.o
>  obj-$(CONFIG_SCSI_UFS_RENESAS) += ufs-renesas.o
>  obj-$(CONFIG_SCSI_UFS_ROCKCHIP) += ufs-rockchip.o
> +obj-$(CONFIG_SCSI_UFS_SPACEMIT) += ufs-spacemit.o
>  obj-$(CONFIG_SCSI_UFS_SPRD) += ufs-sprd.o
>  obj-$(CONFIG_SCSI_UFS_TI_J721E) += ti-j721e-ufs.o
>  obj-$(CONFIG_SCSI_UFS_AMD_VERSAL2) += ufs-amd-versal2.o ufshcd-dwc.o
> diff --git a/drivers/ufs/host/ufs-spacemit.c b/drivers/ufs/host/ufs-spacemit.c
> new file mode 100644
> index 000000000000..65aeba393b0f
> --- /dev/null
> +++ b/drivers/ufs/host/ufs-spacemit.c
> @@ -0,0 +1,652 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#include <ufs/ufshcd.h>
> +#include <ufs/ufshci.h>
> +#include <ufs/ufs_quirks.h>
> +#include <ufs/unipro.h>
> +
> +#include "ufshcd-pltfrm.h"
> +#include "ufs-spacemit.h"
> +
> +/* Special analog register */
> +#define ANA_EQ_CTRL_REG_ATTR		0x00CD
> +#define ANA_HSGEAR_CTRL_ATTR		0x00C1
> +
> +#define UFS_AXI_CLK_LOW_FREQ_HZ		409600000UL
> +
> +/* PHY register magic values */
> +#define MPHY_PU_ALL			0x87f
> +#define MPHY_PU_WITH_HB8_RESET		0xb7f
> +#define MPHY_DEVICE_REFCLK_OE		BIT(8)
> +#define MPHY_DEVICE_HW_RESET		BIT(0)
> +
> +#define MPHY_PLL_LOCK_BIT		BIT(31)
> +#define MPHY_PLL_LOCK_TIMEOUT_US	10000
> +
> +/* M-PHY FSM states */
> +#define MPHY_RX_FSM_STATE	0xC1
> +#define MPHY_TX_FSM_STATE	0x41
> +
> +static int ufs_spacemit_dme_set(struct ufs_hba *hba,
> +				const struct ufshcd_dme_attr_val *v, int n)
> +{
> +	int ret = 0;
> +	int attr_node = 0;
> +
> +	for (attr_node = 0; attr_node < n; attr_node++) {
> +		ret = ufshcd_dme_set(hba, v[attr_node].attr_sel,
> +				     v[attr_node].mib_val);
> +
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ufs_spacemit_check_hibern8(struct ufs_hba *hba)
> +{
> +	u32 tx_fsm_val_0 = 0;
> +	u32 tx_fsm_val_1 = 0;
> +	int retries = DIV_ROUND_UP(HBRN8_POLL_TOUT_MS * 1000, 100);
> +	int err = 0;
> +
> +	do {
> +		err = ufshcd_dme_get(hba,
> +				     UIC_ARG_MIB_SEL(MPHY_TX_FSM_STATE,
> +						     UIC_ARG_MPHY_TX_GEN_SEL_INDEX(0)),
> +				     &tx_fsm_val_0);
> +		if (err)
> +			break;
> +
> +		err = ufshcd_dme_get(hba,
> +				     UIC_ARG_MIB_SEL(MPHY_TX_FSM_STATE,
> +						     UIC_ARG_MPHY_TX_GEN_SEL_INDEX(1)),
> +				     &tx_fsm_val_1);
> +		if (err || (tx_fsm_val_0 == TX_FSM_HIBERN8 &&
> +			    tx_fsm_val_1 == TX_FSM_HIBERN8))
> +			break;
> +
> +		usleep_range(100, 200);
> +	} while (--retries > 0);
> +
> +	if (err) {
> +		dev_err(hba->dev, "%s: unable to get TX_FSM_STATE, err %d\n",
> +			__func__, err);
> +	} else if (tx_fsm_val_0 != TX_FSM_HIBERN8 ||
> +		   tx_fsm_val_1 != TX_FSM_HIBERN8) {
> +		err = -ETIMEDOUT;
> +		dev_err(hba->dev,
> +			"%s: invalid TX_FSM_STATE, lane0 = %u, lane1 = %u\n",
> +			__func__, tx_fsm_val_0, tx_fsm_val_1);
> +	}
> +
> +	return err;
> +}
> +
> +static u32 ufs_spacemit_get_sys1clk_1us(struct ufs_hba *hba)
> +{
> +	struct ufs_clk_info *clki, *clka = NULL;
> +	struct list_head *head = &hba->clk_list_head;
> +	unsigned long rate_hz = 0;
> +
> +	if (!list_empty(head)) {
> +		list_for_each_entry(clki, head, list) {
> +			if (clki->name && !strcmp(clki->name, "axi") && clki->clk) {
> +				clka = clki;
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (clka && clka->clk)
> +		rate_hz = clk_get_rate(clka->clk);
> +
> +	if (!rate_hz)
> +		return 0;
> +
> +	return DIV_ROUND_CLOSEST(rate_hz, 1000000);
> +}
> +
> +static int ufs_spacemit_wait_mphy_pll_lock(struct ufs_hba *hba)
> +{
> +	u32 val;
> +	int err;
> +
> +	err = read_poll_timeout(ufshcd_readl, val, val & MPHY_PLL_LOCK_BIT,
> +				10, MPHY_PLL_LOCK_TIMEOUT_US, false, hba,
> +				UFS_PHY_MNG_BASE + UFS_MPHY_PU_CTRL);
> +
> +	if (err)
> +		dev_err(hba->dev, "M-PHY PLL lock timeout\n");
> +
> +	return err;
> +}
> +
> +/**
> + * ufs_spacemit_mphy_init
> + * @hba: host controller instance
> + */
> +static int ufs_spacemit_mphy_init(struct ufs_hba *hba)
> +{
> +	int ret;
> +
> +	/* reset all mphy logical */
> +	ufshcd_writel(hba, 0x003, UFS_PHY_MNG_BASE + UFS_MPHY_RST_CTRL);
> +
> +	/* power up all */
> +	ufshcd_writel(hba, MPHY_PU_ALL, UFS_PHY_MNG_BASE + UFS_MPHY_PU_CTRL);
> +
> +	/* asserted ana_rx_hb8_reset */
> +	ufshcd_writel(hba, 0xb7f, UFS_PHY_MNG_BASE + UFS_MPHY_PU_CTRL);
> +	fsleep(500);
> +
> +	/* deasserted ana_rx_hb8_reset */
> +	ufshcd_writel(hba, MPHY_PU_ALL, UFS_PHY_MNG_BASE + UFS_MPHY_PU_CTRL);
> +
> +	/* Enable reference clock & deassert ufs device reset */
> +	ufshcd_writel(hba, MPHY_DEVICE_REFCLK_OE | MPHY_DEVICE_HW_RESET,
> +		      UFS_PHY_MNG_BASE + UFS_DEVICE_IO_CTRL);
> +
> +	fsleep(1000);
> +
> +	ret = ufs_spacemit_wait_mphy_pll_lock(hba);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev_dbg(hba->dev, "M-PHY PLL locked successfully\n");
> +
> +	ufshcd_writel(hba, 0x1, UFS_PHY_MNG_BASE + UFS_MPHY_BKDR_CTRL);
> +
> +	ufshcd_writel(hba, 0x40, UFS_ATOP_BASE + (0xC2 << 2));
> +
> +	ufshcd_writel(hba, 0x0, UFS_PHY_MNG_BASE + UFS_MPHY_BKDR_CTRL);
> +
> +	fsleep(2000);
> +
> +	dev_dbg(hba->dev, "M-PHY init completed\n");
> +
> +	return 0;
> +}
> +
> +static int ufs_spacemit_uniprov1p6_init(struct ufs_hba *hba)
> +{
> +	static const struct ufshcd_dme_attr_val setup_attrs[] = {
> +		{ UIC_ARG_MIB(PA_TXHSG1SYNCLENGTH), 0x4f },
> +		{ UIC_ARG_MIB(0x1553), 0xf }, /* PA_TXHSG1PREPARELENGTH */
> +		{ UIC_ARG_MIB(PA_TXHSG2SYNCLENGTH), 0x4f },
> +		{ UIC_ARG_MIB(0x1555), 0xf }, /* PA_TXHSG2PREPARELENGTH */
> +		{ UIC_ARG_MIB(PA_TXHSG3SYNCLENGTH), 0x4f },
> +		{ UIC_ARG_MIB(0x1557), 0xf }, /* PA_TXHSG3PREPARELENGTH */
> +		{ UIC_ARG_MIB(0x155A), 0x0 }, /* PA_TXMK2EXTENSION */
> +		{ UIC_ARG_MIB(0x155B), 0x1}, /* PA_PEERSCRAMBLING */
> +		{ UIC_ARG_MIB(0x155C), 0x1 }, /* PA_TXSKIP */
> +		{ UIC_ARG_MIB(0x155D), 250 }, /* PA_TXSKIPPERIOD */
> +		{ UIC_ARG_MIB(PA_LOCAL_TX_LCC_ENABLE), 0x0 },
> +		{ UIC_ARG_MIB(0x155F), 0x0 }, /* PA_PEER_TX_LCC_ENABLE */
> +		{ UIC_ARG_MIB(0x1585), 0x1 }, /* PA_SCRAMBLING */
> +		{ UIC_ARG_MIB(PA_GRANULARITY), 0x1 },
> +		{ UIC_ARG_MIB(0x15AB), 0x0 }, /* PA_MK2EXTENSIONGUARDBAND */
> +		{ UIC_ARG_MIB(PA_STALLNOCONFIGTIME), 15 },
> +		{ UIC_ARG_MIB(0x15A8), 0x64 }, /* PA_TACTIVATE */
> +		{ UIC_ARG_MIB(0x1564), 0x64 },	/* PA_TXTRAILINGCLOCKS */
> +		{ UIC_ARG_MIB_SEL(0x008D, 4), 0x0B }, /* RX_LS_PREPARELEN_TIME RX0 */
> +		{ UIC_ARG_MIB_SEL(0x008D, 5), 0x0B }, /* RX_LS_PREPARELEN_TIME RX1 */
> +
> +		/* RX_HIBERNATE_BKEN RX0 */
> +		{ UIC_ARG_MIB_SEL(0x00F4, UIC_ARG_MPHY_RX_GEN_SEL_INDEX(0)), 0x9F },
> +		/* RX_HIBERNATE_BKEN RX1 */
> +		{ UIC_ARG_MIB_SEL(0x00F4, UIC_ARG_MPHY_RX_GEN_SEL_INDEX(1)), 0x9F },
> +		/* PWM_BURST_closure_length */
> +		{ UIC_ARG_MIB_SEL(0x008E, UIC_ARG_MPHY_RX_GEN_SEL_INDEX(0)),   15 },
> +		{ UIC_ARG_MIB_SEL(0x008E, UIC_ARG_MPHY_RX_GEN_SEL_INDEX(1)),   15 },
> +		/* min_stall_not_config_time */
> +		{ UIC_ARG_MIB_SEL(0x0088, UIC_ARG_MPHY_RX_GEN_SEL_INDEX(0)), 0xFF },
> +		{ UIC_ARG_MIB_SEL(0x0088, UIC_ARG_MPHY_RX_GEN_SEL_INDEX(1)), 0xFF },
> +		/* TX HB8_TIME CAP */
> +		{ UIC_ARG_MIB_SEL(0x000F, UIC_ARG_MPHY_TX_GEN_SEL_INDEX(0)), 0x64 },
> +		{ UIC_ARG_MIB_SEL(0x000F, UIC_ARG_MPHY_TX_GEN_SEL_INDEX(1)), 0x64 },
> +		/* RX HB8_TIME CAP */
> +		{ UIC_ARG_MIB_SEL(0x0092, UIC_ARG_MPHY_RX_GEN_SEL_INDEX(0)), 0x64 },
> +		{ UIC_ARG_MIB_SEL(0x0092, UIC_ARG_MPHY_RX_GEN_SEL_INDEX(1)), 0x64 },
> +		/* TX EQ 3DB */
> +		{ UIC_ARG_MIB_SEL(0x00CD, UIC_ARG_MPHY_TX_GEN_SEL_INDEX(0)),  0x5 },
> +		/* RX garbage cnt = 32 SI */
> +		{ UIC_ARG_MIB_SEL(0x00F2, UIC_ARG_MPHY_RX_GEN_SEL_INDEX(0)), 0x9F },
> +		{ UIC_ARG_MIB_SEL(0x00F2, UIC_ARG_MPHY_RX_GEN_SEL_INDEX(1)), 0x9F },
> +	};
> +
> +	return ufs_spacemit_dme_set(hba, setup_attrs, ARRAY_SIZE(setup_attrs));
> +}
> +
> +static void ufs_spacemit_set_dev_cap(struct ufs_host_params *host_params, u32 pwr_hs)
> +{
> +	if (!host_params)
> +		return;
> +
> +	memset(host_params, 0, sizeof(struct ufs_host_params));
> +	host_params->tx_lanes = UFS_SPACEMIT_K3_LIMIT_NUM_LANES_TX;
> +	host_params->rx_lanes = UFS_SPACEMIT_K3_LIMIT_NUM_LANES_RX;
> +	host_params->hs_rx_gear = UFS_SPACEMIT_K3_LIMIT_HSGEAR_RX;
> +	host_params->hs_tx_gear = UFS_SPACEMIT_K3_LIMIT_HSGEAR_TX;
> +	host_params->pwm_rx_gear = UFS_SPACEMIT_K3_LIMIT_PWMGEAR_RX;
> +	host_params->pwm_tx_gear = UFS_SPACEMIT_K3_LIMIT_PWMGEAR_TX;
> +	host_params->rx_pwr_pwm = UFS_SPACEMIT_K3_LIMIT_RX_PWR_PWM;
> +	host_params->tx_pwr_pwm = UFS_SPACEMIT_K3_LIMIT_TX_PWR_PWM;
> +	host_params->rx_pwr_hs = pwr_hs;
> +	host_params->tx_pwr_hs = pwr_hs;
> +	host_params->hs_rate = UFS_SPACEMIT_K3_LIMIT_HS_RATE;
> +	host_params->desired_working_mode = UFS_HS_MODE;
> +}
> +
> +static int ufs_spacemit_link_startup_pre_change(struct ufs_hba *hba)
> +{
> +	u32 value, sys1clk_1us;
> +	int err;
> +
> +	err = ufs_spacemit_mphy_init(hba);
> +	if (err < 0)
> +		return err;
> +
> +	err = ufs_spacemit_uniprov1p6_init(hba);
> +	if (err < 0)
> +		return err;
> +
> +	/* config sysclk and tx symbol clk before link startup */
> +	value = UFS_MAX_LINKSTARTUP_TIMER;
> +
> +	/* clear bit0~bit3, select b0 design */
> +	value &= ~0xf;
> +
> +	ufshcd_writel(hba, value, UFS_PA_LINK_STARTUP_TIMER);
> +
> +	sys1clk_1us = ufs_spacemit_get_sys1clk_1us(hba);
> +	if (!sys1clk_1us)
> +		sys1clk_1us = DIV_ROUND_CLOSEST(UFS_AXI_CLK_LOW_FREQ_HZ, 1000000);
> +	ufshcd_writel(hba, sys1clk_1us, UFS_SYS1CLK_1US);
> +	ufshcd_writel(hba, UFS_TX_SYMBO_CLK, UFS_TX_SYMBOL_CLK_NS_US);
> +
> +	dev_dbg(hba->dev, "REG_UFS_SYS1CLK_1US: 0x%x\n",
> +		ufshcd_readl(hba, UFS_SYS1CLK_1US));
> +	dev_dbg(hba->dev, "REG_UFS_TX_SYMBOL_CLK_NS_US: 0x%x\n",
> +		ufshcd_readl(hba, UFS_TX_SYMBOL_CLK_NS_US));
> +
> +	return 0;
> +}
> +
> +static int ufs_spacemit_link_startup_post_change(struct ufs_hba *hba)
> +{
> +	/* Add 0xe8 make UFS2.1 run GEAR3 + 2Lane@409M */
> +	static const struct ufshcd_dme_attr_val setup_attrs[] = {
> +		{ UIC_ARG_MIB_SEL(0xe8, UIC_ARG_MPHY_TX_GEN_SEL_INDEX(0)), 0x97 },
> +		{ UIC_ARG_MIB_SEL(0xe8, UIC_ARG_MPHY_TX_GEN_SEL_INDEX(0)), 0xd7 },
> +		{ UIC_ARG_MIB_SEL(0xe8, UIC_ARG_MPHY_TX_GEN_SEL_INDEX(0)), 0x17 },
> +		{ UIC_ARG_MIB(DL_AFC0REQTIMEOUTVAL), UFS_DL_AFC0REQTIMEOUTVAL_MAX },
> +	};
> +
> +	return ufs_spacemit_dme_set(hba, setup_attrs, ARRAY_SIZE(setup_attrs));
> +}
> +
> +static int ufs_spacemit_link_startup_notify(struct ufs_hba *hba,
> +					    enum ufs_notify_change_status status)
> +{
> +	int err = 0;
> +
> +	switch (status) {
> +	case PRE_CHANGE:
> +		err = ufs_spacemit_link_startup_pre_change(hba);
> +		break;
> +	case POST_CHANGE:
> +		err = ufs_spacemit_link_startup_post_change(hba);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return err;
> +}
> +
> +static int ufs_spacemit_negotiate_pwr_mode(struct ufs_hba *hba,
> +					   const struct ufs_pa_layer_attr *dev_max_params,
> +					   struct ufs_pa_layer_attr *dev_req_params)
> +{
> +	struct ufs_host_params host_params;
> +	int ret;
> +
> +	ufs_spacemit_set_dev_cap(&host_params, FAST_MODE);
> +	ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params,
> +					  dev_req_params);
> +	if (ret) {
> +		dev_err(hba->dev, "Failed to negotiate power params: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(hba->dev,
> +		"Power mode config - gear_rx:%d, gear_tx:%d, lane_rx:%d, lane_tx:%d, pwr_rx:%d, pwr_tx:%d, hs_rate:%d\n",
> +		dev_req_params->gear_rx, dev_req_params->gear_tx, dev_req_params->lane_rx,
> +		dev_req_params->lane_tx, dev_req_params->pwr_rx, dev_req_params->pwr_tx,
> +		dev_req_params->hs_rate);
> +
> +	return ret;
> +}
> +
> +static int ufs_spacemit_pwr_change_notify(struct ufs_hba *hba,
> +					  enum ufs_notify_change_status status,
> +					  struct ufs_pa_layer_attr *dev_req_params)
> +{
> +	int ret = 0;
> +
> +	if (!dev_req_params) {
> +		dev_err(hba->dev, "Invalid Parameters\n");
> +		return -EINVAL;
> +	}
> +
> +	switch (status) {
> +	case PRE_CHANGE:
> +		break;
> +	case POST_CHANGE:
> +		ret = ufs_spacemit_wait_mphy_pll_lock(hba);
> +		if (ret < 0)
> +			return ret;
> +
> +		dev_dbg(hba->dev, "M-PHY PLL locked after power mode change\n");
> +		/* Set ANA_HSGEAR_CTRL_ATTR back to default value */
> +		ufshcd_dme_set(hba, UIC_ARG_MIB(ANA_HSGEAR_CTRL_ATTR), 0x00);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int ufs_spacemit_quirk_host_pa_saveconfigtime(struct ufs_hba *hba)
> +{
> +	int err;
> +	u32 pa_vs_config_reg1;
> +
> +	err = ufshcd_dme_get(hba, UIC_ARG_MIB(UFS_PA_VS_CONFIG_REG1), &pa_vs_config_reg1);
> +	if (err)
> +		return err;
> +
> +	/* Allow extension of MSB bits of PA_SaveConfigTime attribute */
> +	return ufshcd_dme_set(hba, UIC_ARG_MIB(UFS_PA_VS_CONFIG_REG1),
> +			      (pa_vs_config_reg1 | (1 << 12)));
> +}
> +
> +static int ufs_spacemit_apply_dev_quirks(struct ufs_hba *hba)
> +{
> +	static const struct ufshcd_dme_attr_val setup_attrs[] = {
> +		/* LCC_DISABLE */
> +		{ UIC_ARG_MIB_SEL(TX_LCC_ENABLE, UIC_ARG_MPHY_TX_GEN_SEL_INDEX(0)), 0 },
> +		{ UIC_ARG_MIB_SEL(TX_LCC_ENABLE, UIC_ARG_MPHY_TX_GEN_SEL_INDEX(1)), 0 },
> +		/* TX_Min_ActivateTime */
> +		{ UIC_ARG_MIB_SEL(TX_MIN_ACTIVATETIME, UIC_ARG_MPHY_TX_GEN_SEL_INDEX(0)), 0x0 },
> +		{ UIC_ARG_MIB_SEL(TX_MIN_ACTIVATETIME, UIC_ARG_MPHY_TX_GEN_SEL_INDEX(1)), 0x0 },
> +		{ UIC_ARG_MIB(ANA_HSGEAR_CTRL_ATTR), 0x25 },
> +	};
> +	int err;
> +
> +	if (hba->dev_quirks & UFS_DEVICE_QUIRK_HOST_PA_SAVECONFIGTIME) {
> +		err = ufs_spacemit_quirk_host_pa_saveconfigtime(hba);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	if (hba->dev_info.wmanufacturerid == UFS_VENDOR_WDC)
> +		hba->dev_quirks |= UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE;
> +
> +	err = ufs_spacemit_dme_set(hba, setup_attrs, ARRAY_SIZE(setup_attrs));
> +	if (err < 0)
> +		return err;
> +
> +	return ufs_spacemit_wait_mphy_pll_lock(hba);
> +}
> +
> +/**
> + * ufs_spacemit_advertise_quirks - advertise the known Spacemit UFS controller quirks
> + * @hba: host controller instance
> + *
> + * Spacemit UFS host controller might have some non standard behaviours (quirks)
> + * than what is specified by UFSHCI specification. Advertise all such
> + * quirks to standard UFS host controller driver so standard takes them into
> + * account.
> + */
> +static void ufs_spacemit_advertise_quirks(struct ufs_hba *hba)
> +{
> +	hba->quirks |= UFSHCD_QUIRK_BROKEN_AUTO_HIBERN8;
> +}
> +
> +/**
> + * ufs_spacemit_init - init phy and prepare clk
> + * @hba: host controller instance
> + */
> +static int ufs_spacemit_init(struct ufs_hba *hba)
> +{
> +	struct device *dev = hba->dev;
> +	struct ufs_spacemit_host *host;
> +	struct reset_control *rst;
> +
> +	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> +	if (!host)
> +		return -ENOMEM;
> +
> +	rst = devm_reset_control_get_exclusive_deasserted(dev, NULL);
> +	if (IS_ERR(rst))
> +		return dev_err_probe(dev, PTR_ERR(rst), "Failed to get reset control\n");
> +
> +	host->hba = hba;
> +	ufshcd_set_variant(hba, host);
> +	ufs_spacemit_advertise_quirks(hba);
> +
> +	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
> +
> +	return 0;
> +}
> +
> +/**
> + * ufs_spacemit_device_reset - Toggle device reset line
> + * @hba: per-adapter instance
> + *
> + * Toggles the reset line to reset the attached UFS device.
> + *
> + * Returns: 0 on success
> + */
> +static int ufs_spacemit_device_reset(struct ufs_hba *hba)
> +{
> +	/* Disable reference clock & asserted ufs device reset */
> +	ufshcd_writel(hba, 0x000, UFS_PHY_MNG_BASE + UFS_DEVICE_IO_CTRL);
> +	usleep_range(10, 15);
> +
> +	/* Enable reference clock & deassert ufs device reset */
> +	ufshcd_writel(hba, MPHY_DEVICE_REFCLK_OE | MPHY_DEVICE_HW_RESET,
> +		      UFS_PHY_MNG_BASE + UFS_DEVICE_IO_CTRL);
> +	usleep_range(10, 15);
> +
> +	return 0;
> +}
> +
> +/**
> + * ufs_spacemit_event_notify - Handle UFS error events
> + * @hba: host controller instance
> + * @evt: event type
> + * @data: event-specific data
> + *
> + * Handles error events from UFS core, print warning messages
> + */
> +static void ufs_spacemit_event_notify(struct ufs_hba *hba, enum ufs_event_type evt, void *data)
> +{
> +	switch (evt) {
> +	case UFS_EVT_PA_ERR:
> +		if (data)
> +			dev_warn(hba->dev, "PA error event, INT errors:0x%x, PA_ERR_CODE:0x%x\n",
> +				 hba->errors, *(u32 *)data);
> +
> +		break;
> +	case UFS_EVT_DL_ERR:
> +		if (data)
> +			dev_warn(hba->dev, "DL error event, INT errors:0x%x, DL_ERR:0x%x\n",
> +				 hba->errors, *(u32 *)data);
> +
> +		break;
> +	case UFS_EVT_ABORT:
> +		dev_warn(hba->dev, "Abort event, INT errors:0x%x\n", hba->errors);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +static void ufs_spacemit_pre_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
> +{
> +	static const struct ufshcd_dme_attr_val setup_attrs[] = {
> +		{ UIC_ARG_MIB_SEL(0xf1, UIC_ARG_MPHY_RX_GEN_SEL_INDEX(0)), 0x84 },
> +		{ UIC_ARG_MIB_SEL(0xf1, UIC_ARG_MPHY_RX_GEN_SEL_INDEX(1)), 0x84 },
> +		{ UIC_ARG_MIB_SEL(0xf1, UIC_ARG_MPHY_RX_GEN_SEL_INDEX(0)), 0x85 },
> +		{ UIC_ARG_MIB_SEL(0xf1, UIC_ARG_MPHY_RX_GEN_SEL_INDEX(1)), 0x85 },
> +	};
> +	int ret;
> +
> +	if (cmd == UIC_CMD_DME_HIBER_EXIT) {
> +		/* Enable reference clock & deassert ufs device reset */
> +		ufshcd_writel(hba, MPHY_DEVICE_REFCLK_OE | MPHY_DEVICE_HW_RESET,
> +			      UFS_PHY_MNG_BASE + UFS_DEVICE_IO_CTRL);
> +
> +		/* Power up all */
> +		ufshcd_writel(hba, MPHY_PU_ALL, UFS_PHY_MNG_BASE + UFS_MPHY_PU_CTRL);
> +
> +		/* Assert ana_rx_hb8_reset */
> +		ufshcd_writel(hba, MPHY_PU_WITH_HB8_RESET,
> +			      UFS_PHY_MNG_BASE + UFS_MPHY_PU_CTRL);
> +		fsleep(500);
> +
> +		/* Deassert ana_rx_hb8_reset */
> +		ufshcd_writel(hba, MPHY_PU_ALL, UFS_PHY_MNG_BASE + UFS_MPHY_PU_CTRL);
> +
> +		ret = ufs_spacemit_wait_mphy_pll_lock(hba);
> +		if (ret < 0)
> +			return;
> +
> +		ufshcd_dme_set(hba, UIC_ARG_MIB(0xdd), 0x57);
> +		ufshcd_dme_set(hba, UIC_ARG_MIB(0xe8), 0x57);
> +	}
> +
> +	if (cmd == UIC_CMD_DME_HIBER_ENTER)
> +		ufs_spacemit_dme_set(hba, setup_attrs, ARRAY_SIZE(setup_attrs));
> +}
> +
> +static void ufs_spacemit_post_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
> +{
> +	static const struct ufshcd_dme_attr_val setup_attrs[] = {
> +		{ UIC_ARG_MIB_SEL(0xf1, UIC_ARG_MPHY_RX_GEN_SEL_INDEX(0)), 0x84 },
> +		{ UIC_ARG_MIB_SEL(0xf1, UIC_ARG_MPHY_RX_GEN_SEL_INDEX(1)), 0x84 },
> +		{ UIC_ARG_MIB_SEL(0xf1, UIC_ARG_MPHY_RX_GEN_SEL_INDEX(0)), 0x80 },
> +		{ UIC_ARG_MIB_SEL(0xf1, UIC_ARG_MPHY_RX_GEN_SEL_INDEX(1)), 0x80 },
> +		{ UIC_ARG_MIB(0xdd), 0x57 },
> +		{ UIC_ARG_MIB(0xdd), 0xd7 },
> +		{ UIC_ARG_MIB(0xe8), 0x57 },
> +		{ UIC_ARG_MIB(0xe8), 0xd7 },
> +	};
> +	int err;
> +
> +	if (cmd == UIC_CMD_DME_HIBER_ENTER) {
> +		err = ufs_spacemit_check_hibern8(hba);
> +		if (err)
> +			dev_err(hba->dev, "ufs_spacemit_check_hibern8 error\n");
> +
> +		ufs_spacemit_dme_set(hba, setup_attrs, ARRAY_SIZE(setup_attrs));
> +
> +		/* Power down M-PHY */
> +		ufshcd_writel(hba, 0x0, UFS_PHY_MNG_BASE + UFS_MPHY_PU_CTRL);
> +
> +		/* Disable reference clock, keep device reset deasserted */
> +		ufshcd_writel(hba, MPHY_DEVICE_HW_RESET,
> +			      UFS_PHY_MNG_BASE + UFS_DEVICE_IO_CTRL);
> +	}
> +}
> +
> +/**
> + * ufs_spacemit_hibern8_notify - Handle hibernate enter/exit
> + * @hba: host controller instance
> + * @cmd: UIC command (HIBER_ENTER or HIBER_EXIT)
> + * @status: notification status
> + *
> + * Manages M-PHY power state during hibernate transitions.
> + */
> +static void ufs_spacemit_hibern8_notify(struct ufs_hba *hba, enum uic_cmd_dme cmd,
> +					enum ufs_notify_change_status status)
> +{
> +	if (status == PRE_CHANGE)
> +		ufs_spacemit_pre_hibern8(hba, cmd);
> +
> +	if (status == POST_CHANGE)
> +		ufs_spacemit_post_hibern8(hba, cmd);
> +}
> +
> +/**
> + * struct ufs_hba_spacemit_vops - UFS Spacemit specific variant operations
> + *
> + * The variant operations configure the necessary controller and PHY
> + * handshake during initialization.
> + */
> +static const struct ufs_hba_variant_ops ufs_hba_spacemit_vops = {
> +	.name = "ufshcd-spacemit",
> +	.init = ufs_spacemit_init,
> +	.link_startup_notify = ufs_spacemit_link_startup_notify,
> +	.negotiate_pwr_mode = ufs_spacemit_negotiate_pwr_mode,
> +	.pwr_change_notify = ufs_spacemit_pwr_change_notify,
> +	.device_reset = ufs_spacemit_device_reset,
> +	.event_notify = ufs_spacemit_event_notify,
> +	.apply_dev_quirks = ufs_spacemit_apply_dev_quirks,
> +	.hibern8_notify = ufs_spacemit_hibern8_notify,
> +};
> +
> +static const struct of_device_id __maybe_unused ufs_spacemit_of_match[] = {
> +	{ .compatible = "spacemit,k3-ufshc" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ufs_spacemit_of_match);
> +
> +static int ufs_spacemit_probe(struct platform_device *pdev)
> +{
> +	return ufshcd_pltfrm_init(pdev, &ufs_hba_spacemit_vops);
> +}
> +
> +static void ufs_spacemit_remove(struct platform_device *pdev)
> +{
> +	ufshcd_pltfrm_remove(pdev);
> +}
> +
> +static const struct dev_pm_ops ufs_spacemit_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(ufshcd_system_suspend, ufshcd_system_resume)
> +	SET_RUNTIME_PM_OPS(ufshcd_runtime_suspend, ufshcd_runtime_resume, NULL)
> +	.prepare	 = ufshcd_suspend_prepare,
> +	.complete	 = ufshcd_resume_complete,
> +};
> +
> +static struct platform_driver ufs_spacemit_pltform = {
> +	.probe	= ufs_spacemit_probe,
> +	.remove	= ufs_spacemit_remove,
> +	.driver	= {
> +		.name	= "ufshcd-spacemit",
> +		.of_match_table = of_match_ptr(ufs_spacemit_of_match),
> +		.pm	= &ufs_spacemit_pm_ops,
> +	},
> +};
> +module_platform_driver(ufs_spacemit_pltform);
> +
> +MODULE_DESCRIPTION("SpacemiT UFS Host Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/ufs/host/ufs-spacemit.h b/drivers/ufs/host/ufs-spacemit.h
> new file mode 100644
> index 000000000000..1415db85edd5
> --- /dev/null
> +++ b/drivers/ufs/host/ufs-spacemit.h
> @@ -0,0 +1,77 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * SpacemiT UFS Host Controller driver
> + *
> + * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
> + */
> +
> +#ifndef _UFS_SPACEMIT_H_
> +#define _UFS_SPACEMIT_H_
> +
> +#include <linux/regulator/consumer.h>
> +#include <linux/pm_qos.h>
> +#include <linux/workqueue.h>
> +
> +/* Spacemit K3 UFS host controller vendor specific registers */
> +#define UFS_SYS1CLK_1US			0xC0
> +#define UFS_TX_SYMBOL_CLK_NS_US		0xC4
> +#define UFS_LOCAL_PORT_ID_REG		0xC8
> +#define UFS_PA_ERR_CODE			0xCC
> +#define UFS_RETRY_TIMER_REG		0xD0
> +#define UFS_PA_LINK_STARTUP_TIMER	0xD8
> +#define UFS_CFG1			0xDC
> +
> +/* MPHY control registers */
> +#define UFS_PHY_MNG_BASE		0x1B00
> +#define UFS_MPHY_RST_CTRL		0x0
> +#define UFS_MPHY_PU_CTRL		0x4
> +#define UFS_MPHY_BKDR_CTRL		0x8
> +#define UFS_DEVICE_IO_CTRL		0xC
> +
> +/* ATOP base*/
> +#define UFS_ATOP_BASE			0x1C00
> +
> +#define UFS_TX_SYMBO_CLK		0x800
> +#define UFS_MAX_LINKSTARTUP_TIMER	0xFFFFFFFF
> +#define UFS_DL_AFC0REQTIMEOUTVAL_MAX	0xFFFF
> +
> +#define MPHY_TX_FSM_STATE		0x41
> +#define TX_FSM_HIBERN8			0x1
> +#define HBRN8_POLL_TOUT_MS		100
> +#define DEFAULT_CLK_RATE_HZ		1000000
> +#define BUS_VECTOR_NAME_LEN		32
> +
> +#define UFS_HW_VER_MAJOR_SHFT		28
> +#define UFS_HW_VER_MAJOR_MASK		(0x000F << UFS_HW_VER_MAJOR_SHFT)
> +#define UFS_HW_VER_MINOR_SHFT		16
> +#define UFS_HW_VER_MINOR_MASK		(0x0FFF << UFS_HW_VER_MINOR_SHFT)
> +#define UFS_HW_VER_STEP_SHFT		0
> +#define UFS_HW_VER_STEP_MASK		(0xFFFF << UFS_HW_VER_STEP_SHFT)
> +
> +#define UFS_SPACEMIT_K3_LIMIT_NUM_LANES_RX	2
> +#define UFS_SPACEMIT_K3_LIMIT_NUM_LANES_TX	2
> +#define UFS_SPACEMIT_K3_LIMIT_HSGEAR_RX		UFS_HS_G3
> +#define UFS_SPACEMIT_K3_LIMIT_HSGEAR_TX		UFS_HS_G3
> +#define UFS_SPACEMIT_K3_LIMIT_PWMGEAR_RX	UFS_PWM_G4
> +#define UFS_SPACEMIT_K3_LIMIT_PWMGEAR_TX	UFS_PWM_G4
> +#define UFS_SPACEMIT_K3_LIMIT_RX_PWR_PWM	SLOW_MODE
> +#define UFS_SPACEMIT_K3_LIMIT_TX_PWR_PWM	SLOW_MODE
> +#define UFS_SPACEMIT_K3_LIMIT_RX_PWR_HS		FAST_MODE
> +#define UFS_SPACEMIT_K3_LIMIT_TX_PWR_HS		FAST_MODE
> +#define UFS_SPACEMIT_K3_LIMIT_HS_RATE		PA_HS_MODE_B
> +#define UFS_SPACEMIT_K3_LIMIT_DESIRED_MODE	2
> +
> +#define UFS_PA_VS_CONFIG_REG1			0x9000
> +#define UFS_DME_VS_CORE_CLK_CTRL		0xD002
> +
> +#define UFS_HCLKDIV_REG 0xFC
> +
> +struct ufs_spacemit_host {
> +	struct ufs_hba *hba;
> +};
> +
> +struct ufshcd_dme_attr_val {
> +	u32 attr_sel;
> +	u32 mib_val;
> +};
> +#endif /* _UFS_SPACEMIT_H_ */



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

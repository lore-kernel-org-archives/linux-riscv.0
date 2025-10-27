Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB41CCCF9EB
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 22:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwMGp8oFq/K9GWVPog7mFrS4624d4jumVLjb2H5NwpM=; b=QnK8R/27bUhyOV
	aCjWK1+pdshioN+boUQWTjwO946L35pBgkgHFzB8I6Y/7XA3ETqhsBPkPv+rWxzq+NAsijkUBo/eF
	Jvxt4Z/9SCd0/b9qk5dU2adzrqKeKeabA1mw0yBZA9Uhbed78vayg69UMdegREKIOLqER7lB6lrO1
	YT7TE7kbFSJodXvZFB7DgY/9mrgfj09HeBgJDAT0wpQu7us+PfWiBCv0wb2KIE15rd7ffZxqE0FnJ
	lZqVH1wLpO7KSh+t2KFADJmhr767oDtt+ec5VWGlmRgDfH32evWZtps21LgKsXqRuy7fH4k9ySRcB
	uj9/bEp6C6kNH0JjXnzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVds-0000000ErUt-2NAY;
	Mon, 27 Oct 2025 22:24:44 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVdq-0000000ErTT-0MSd
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 22:24:43 +0000
Received: by mail-il1-x142.google.com with SMTP id e9e14a558f8ab-430d7638d27so53446365ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 15:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761603881; x=1762208681; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jr15nwP/Ug09JfxnqEKa3Ir4SMHlTRNyD6RAdom2eOw=;
        b=dq/88NafOl1n/GB2sj3mnnu/BDVnx1+x8lBvzlYOgQqU6m5ra23Z7EUQO2QUuR6o7L
         Y52DO6ZNoc4E9l3KCNe8H0ohtmTSg2aCD+rB5TLPUvskO+lIqnkiRmhTBo3vI4toasnN
         ktQtXq5X3dI/rRgNUvxc6/koJbhK1rdkZ007JKkyJ338ACFMeNruOSwfmgHq8PkFe5Xr
         mi60lrQEp8vGJsVTbnIaK8ZSCL5XbTHXth8hliWPXa7qYvMFvJu/nT7XHPpWPsDJ4aAS
         v0HNQnk1sPfSpwp93YDfY8L528nSHqbjHLv9Xe5GcN98meD3r0p6pm66VGArQal+UFAE
         iwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603881; x=1762208681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jr15nwP/Ug09JfxnqEKa3Ir4SMHlTRNyD6RAdom2eOw=;
        b=lR2lhV0J3/XWvoz+BHTz2LQB1ReSSnC3Xk3rETZCVzCsF1fTU5K/osyRoEsK2bTeNn
         mvxzXN3dAgPLIpAkXWEMjq2ajnoxng/vSN+usaSIwL/NX1mEJP+/gm/Q91e6e+uS1m4O
         emu+u5ux5PW3chhyjf/Cbg1Q1LXqvTN9JarsnnEYq8dkHc+4SVyvCxOF2+o5uhmo6C7X
         24+ULnqpuOZWjkqSUdxGNgYujIlPwYqwWUMZ2GZBs2GXTCPfXZp5bDvPKkSHPptPbjnP
         XxGTWADu0Hz0oQGQ0NoNns23qYbS7bMgV1VAC5PGDTs0UPaIUvGAzJdkN2OnxJZLCCWb
         htfw==
X-Forwarded-Encrypted: i=1; AJvYcCWnH86KkGerTsA+E8ESaoNxL19qCAOTgHd0+otOejRFmue+gRcxNngz3siktO+KV9J8/AacPhRRf0fgPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwT61psWv3UT/at1KsqLrWS1vuBWiz2NLpQ0wJwZQuOVU7wLBDX
	K//rTVOmvSkogTg+rt1cILNDApXRtTc1O+87RjwBkRn609D3VWxuNoE5Fo4wNXsk1xI=
X-Gm-Gg: ASbGncvkRgnTG78QvaoYjNjRpJeHwDlrRyGujfUGA4aFruCjotZNU8o6FFZAZEU6J13
	gXJIJEZPmDratnm8WQnq/ihli1u5PBzFriYOA3FYtamUUw8B3Vq5qrTG/Y2/KT5szHs4TGYY1wI
	MimRxSBDAF+4T8u1iNikoMe+S3FHlqQ2R2uXmKjp2idMqBCkOeSztzU9rTR+nvXhPz5w2W7szgy
	dexm1T831KFv77NPzUmUmF/gR6v38cBS4iFL+w22jHiy/Qp7T7z56KGg+kDcobQtv6OBh5XwPKe
	cHNlx0Q4F/yAaojPDOu++5yXX9hWLNrwPKbHqNKSe7eooXi9YsNX9izpARz8ya22lMGK4lRh3rF
	e3A5XMYDDvB8sS2WtKYDS7MBaJEBmRv6mJ/CYh2jeOqIsOn3PZKZDek09G8OLPwNYmhwmpwMzZW
	2y8wATN2cPIKjHDiH/OBDGe2Zr7FhWJ/7LwQPIVxOJIagd5IfAZTxC5ND7KKg63Q==
X-Google-Smtp-Source: AGHT+IHgtCyDRXbXGEeFm3CmneAKxFqw+KSMjGpOPKv2tB2gnKd/EwLFmdu68D+m31X9cGHwBwMEuA==
X-Received: by 2002:a05:6e02:746:b0:430:ab94:4223 with SMTP id e9e14a558f8ab-4320f6ca731mr24125425ab.8.1761603881057;
        Mon, 27 Oct 2025 15:24:41 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-431f67dcb0csm35005605ab.5.2025.10.27.15.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 15:24:40 -0700 (PDT)
Message-ID: <4027609d-6396-44c0-a514-11d7fe8a5b58@riscstar.com>
Date: Mon, 27 Oct 2025 17:24:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] PCI: spacemit: introduce SpacemiT PCIe host driver
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com, shradha.t@samsung.com,
 krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 namcao@linutronix.de, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013153526.2276556-1-elder@riscstar.com>
 <20251013153526.2276556-6-elder@riscstar.com>
 <274772thveml3xq2yc7477b7lywzzwelbjtq3hiy4louc6cqom@o5zq66mqa27h>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <274772thveml3xq2yc7477b7lywzzwelbjtq3hiy4louc6cqom@o5zq66mqa27h>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_152442_204571_D8CF1080 
X-CRM114-Status: GOOD (  30.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 10/26/25 11:55 AM, Manivannan Sadhasivam wrote:
> On Mon, Oct 13, 2025 at 10:35:22AM -0500, Alex Elder wrote:
>> Introduce a driver for the PCIe host controller found in the SpacemiT
>> K1 SoC.  The hardware is derived from the Synopsys DesignWare PCIe IP.
>> The driver supports three PCIe ports that operate at PCIe gen2 transfer
>> rates (5 GT/sec).  The first port uses a combo PHY, which may be
>> configured for use for USB 3 instead.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - Renamed the PCIe driver source file "pcie-spacemit-k1.c"
>>      - Renamed the PCIe driver Kconfig option PCIE_SPACEMIT_K1; it
>>        is now tristate rather than Boolean
>>      - The PCIe host compatible string is now "spacemit,k1-pcie"
>>      - Renamed the PMU syscon property to be "spacemit,apmu"
>>      - Renamed the symbols representing the PCI vendor and device IDs
>>        to align with <linux/pci_ids.h>
>>      - Use PCIE_T_PVPERL_MS rather than 100 to represent a standard
>>        delay period.
>>      - Use platform (not dev) driver-data access functions; assignment
>>        is done only after the private structure is initialized
>>      - Deleted some unneeded includes in the PCIe driver.
>>      - Dropped error checking when operating on MMIO-backed regmaps
>>      - Added a regmap_read() call in two places, to ensure a specified
>>        delay occurs *after* the a MMIO write has reached its target.
>>      - Used ARRAY_SIZE() (not a local variable value) in a few spots
>>      - Now use readl_relaxed()/writel_relaxed() when operating on
>>        the "link" I/O memory space in the PCIe driver
>>      - Updated a few error messages for consistency
>>      - No longer specify suppress_bind_attrs in the PCIe driver
>>      - Now specify PCIe driver probe type as PROBE_PREFER_ASYNCHRONOUS
>>      - No longer use (void) cast to indicate ignored return values
>>
>>   drivers/pci/controller/dwc/Kconfig            |  10 +
>>   drivers/pci/controller/dwc/Makefile           |   1 +
>>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 319 ++++++++++++++++++
>>   3 files changed, 330 insertions(+)
>>   create mode 100644 drivers/pci/controller/dwc/pcie-spacemit-k1.c
>>
>> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
>> index 349d4657393c9..ede59b34c99ba 100644
>> --- a/drivers/pci/controller/dwc/Kconfig
>> +++ b/drivers/pci/controller/dwc/Kconfig
>> @@ -509,6 +509,16 @@ config PCI_KEYSTONE_EP
>>   	  on DesignWare hardware and therefore the driver re-uses the
>>   	  DesignWare core functions to implement the driver.
>>   
>> +config PCIE_SPACEMIT_K1
>> +	tristate "SpacemiT K1 PCIe controller (host mode)"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on PCI && OF && HAS_IOMEM
>> +	select PCIE_DW_HOST
>> +	default ARCH_SPACEMIT
>> +	help
>> +	  Enables support for the PCIe controller in the K1 SoC operating
>> +	  in host mode.
>> +
>>   config PCIE_VISCONTI_HOST
>>   	bool "Toshiba Visconti PCIe controller"
>>   	depends on ARCH_VISCONTI || COMPILE_TEST
>> diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
>> index 7ae28f3b0fb39..662b0a219ddc4 100644
>> --- a/drivers/pci/controller/dwc/Makefile
>> +++ b/drivers/pci/controller/dwc/Makefile
>> @@ -31,6 +31,7 @@ obj-$(CONFIG_PCIE_UNIPHIER) += pcie-uniphier.o
>>   obj-$(CONFIG_PCIE_UNIPHIER_EP) += pcie-uniphier-ep.o
>>   obj-$(CONFIG_PCIE_VISCONTI_HOST) += pcie-visconti.o
>>   obj-$(CONFIG_PCIE_RCAR_GEN4) += pcie-rcar-gen4.o
>> +obj-$(CONFIG_PCIE_SPACEMIT_K1) += pcie-spacemit-k1.o
>>   obj-$(CONFIG_PCIE_STM32_HOST) += pcie-stm32.o
>>   obj-$(CONFIG_PCIE_STM32_EP) += pcie-stm32-ep.o
>>   
>> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
>> new file mode 100644
>> index 0000000000000..d58232cbb8a02
>> --- /dev/null
>> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
>> @@ -0,0 +1,319 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * SpacemiT K1 PCIe host driver
>> + *
>> + * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
>> + * Copyright (c) 2023, spacemit Corporation.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/gfp.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset.h>
>> +#include <linux/types.h>
>> +
>> +#include "pcie-designware.h"
>> +
>> +#define PCI_VENDOR_ID_SPACEMIT		0x201f
>> +#define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
>> +
>> +/* Offsets and field definitions for link management registers */
>> +
> 
> nit: drop the extra newline

OK.

>> +#define K1_PHY_AHB_IRQ_EN			0x0000
>> +#define PCIE_INTERRUPT_EN		BIT(0)
>> +
>> +#define K1_PHY_AHB_LINK_STS			0x0004
>> +#define SMLH_LINK_UP			BIT(1)
>> +#define RDLH_LINK_UP			BIT(12)
>> +
>> +#define INTR_ENABLE				0x0014
>> +#define MSI_CTRL_INT			BIT(11)
>> +
>> +/* Some controls require APMU regmap access */
>> +#define SYSCON_APMU			"spacemit,apmu"
>> +
>> +/* Offsets and field definitions for APMU registers */
>> +
> 
> here also

OK.

>> +#define PCIE_CLK_RESET_CONTROL			0x0000
>> +#define LTSSM_EN			BIT(6)
>> +#define PCIE_AUX_PWR_DET		BIT(9)
>> +#define PCIE_RC_PERST			BIT(12)	/* 1: assert PERST# */
>> +#define APP_HOLD_PHY_RST		BIT(30)
>> +#define DEVICE_TYPE_RC			BIT(31)	/* 0: endpoint; 1: RC */
>> +
>> +#define PCIE_CONTROL_LOGIC			0x0004
>> +#define PCIE_SOFT_RESET			BIT(0)
>> +
>> +struct k1_pcie {
>> +	struct dw_pcie pci;
>> +	struct phy *phy;
>> +	void __iomem *link;
>> +	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
>> +	u32 pmu_off;
>> +};
>> +
>> +#define to_k1_pcie(dw_pcie) \
>> +		platform_get_drvdata(to_platform_device((dw_pcie)->dev))
>> +
>> +static void k1_pcie_toggle_soft_reset(struct k1_pcie *k1)
>> +{
>> +	u32 offset;
>> +	u32 val;
>> +
>> +	/*
>> +	 * Write, then read back to guarantee it has reached the device
>> +	 * before we start the delay.
>> +	 */
>> +	offset = k1->pmu_off + PCIE_CONTROL_LOGIC;
>> +	regmap_set_bits(k1->pmu, offset, PCIE_SOFT_RESET);
>> +	regmap_read(k1->pmu, offset, &val);
>> +
>> +	mdelay(2);
>> +
>> +	regmap_clear_bits(k1->pmu, offset, PCIE_SOFT_RESET);
>> +}
>> +
>> +/* Enable app clocks, deassert resets */
>> +static int k1_pcie_activate(struct k1_pcie *k1)
> 
> k1_pcie_enable_resources()?

OK, I'll use k1_pcie_{enable,disable}_resources().

>> +{
>> +	struct dw_pcie *pci = &k1->pci;
>> +	int ret;
>> +
>> +	ret = clk_bulk_prepare_enable(ARRAY_SIZE(pci->app_clks), pci->app_clks);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = reset_control_bulk_deassert(ARRAY_SIZE(pci->app_rsts),
>> +					  pci->app_rsts);
>> +	if (ret)
>> +		goto err_disable_clks;
>> +
>> +	ret = reset_control_bulk_deassert(ARRAY_SIZE(pci->core_rsts),
>> +					  pci->core_rsts);
>> +	if (ret)
>> +		goto err_assert_resets;
>> +
>> +	return 0;
>> +
>> +err_assert_resets:
>> +	reset_control_bulk_assert(ARRAY_SIZE(pci->app_rsts), pci->app_rsts);
>> +err_disable_clks:
>> +	clk_bulk_disable_unprepare(ARRAY_SIZE(pci->app_clks), pci->app_clks);
>> +
>> +	return ret;
>> +}
>> +
>> +/* Assert resets, disable app clocks */
>> +static void k1_pcie_deactivate(struct k1_pcie *k1)
> 
> k1_pcie_disable_resources()?
> 
>> +{
>> +	struct dw_pcie *pci = &k1->pci;
>> +
>> +	reset_control_bulk_assert(ARRAY_SIZE(pci->core_rsts), pci->core_rsts);
>> +	reset_control_bulk_assert(ARRAY_SIZE(pci->app_rsts), pci->app_rsts);
>> +	clk_bulk_disable_unprepare(ARRAY_SIZE(pci->app_clks), pci->app_clks);
>> +}
>> +
>> +static int k1_pcie_init(struct dw_pcie_rp *pp)
>> +{
>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>> +	struct k1_pcie *k1 = to_k1_pcie(pci);
>> +	u32 offset;
>> +	u32 mask;
>> +	u32 val;
>> +	int ret;
>> +
>> +	k1_pcie_toggle_soft_reset(k1);
>> +
>> +	ret = k1_pcie_activate(k1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = phy_init(k1->phy);
>> +	if (ret) {
>> +		k1_pcie_deactivate(k1);
>> +
>> +		return ret;
>> +	}
>> +
>> +	/* Set the PCI vendor and device ID */
>> +	dw_pcie_dbi_ro_wr_en(pci);
>> +	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
>> +	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
>> +	dw_pcie_dbi_ro_wr_dis(pci);
>> +
>> +	/*
>> +	 * Assert fundamental reset (drive PERST# low).  Put the port in
> 
> s/port/controller

OK.

>> +	 * root complex mode, and indicate that Vaux (3.3v) is present.
>> +	 */
>> +	mask = PCIE_RC_PERST;
>> +	mask |= DEVICE_TYPE_RC | PCIE_AUX_PWR_DET;
>> +
>> +	/*
>> +	 * Write, then read back to guarantee it has reached the device
>> +	 * before we start the delay.
>> +	 */
>> +	offset = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
>> +	regmap_set_bits(k1->pmu, offset, mask);
>> +	regmap_read(k1->pmu, offset, &val);
>> +
>> +	mdelay(PCIE_T_PVPERL_MS);
>> +
>> +	/* Deassert fundamental reset (drive PERST# high) */
>> +	regmap_clear_bits(k1->pmu, offset, PCIE_RC_PERST);
>> +
>> +	return 0;
>> +}
>> +
>> +static void k1_pcie_deinit(struct dw_pcie_rp *pp)
>> +{
>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>> +	struct k1_pcie *k1 = to_k1_pcie(pci);
>> +
>> +	/* Assert fundamental reset (drive PERST# low) */
>> +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
>> +			PCIE_RC_PERST);
> 
> You need assert PERST# here.

I don't understand this comment.

Setting PCIE_RC_PERST in this register drives PERST# low.

>> +	phy_exit(k1->phy);
>> +
>> +	k1_pcie_deactivate(k1);
>> +}
>> +
>> +static const struct dw_pcie_host_ops k1_pcie_host_ops = {
>> +	.init		= k1_pcie_init,
>> +	.deinit		= k1_pcie_deinit,
>> +};
>> +
>> +static bool k1_pcie_link_up(struct dw_pcie *pci)
>> +{
>> +	struct k1_pcie *k1 = to_k1_pcie(pci);
>> +	u32 val;
>> +
>> +	val = readl_relaxed(k1->link + K1_PHY_AHB_LINK_STS);
>> +
>> +	return (val & RDLH_LINK_UP) && (val & SMLH_LINK_UP);
>> +}
>> +
>> +static int k1_pcie_start_link(struct dw_pcie *pci)
>> +{
>> +	struct k1_pcie *k1 = to_k1_pcie(pci);
>> +	u32 val;
>> +
>> +	/* Stop holding the PHY in reset, and enable link training */
>> +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
>> +			   APP_HOLD_PHY_RST | LTSSM_EN, LTSSM_EN);
>> +
>> +	/* Enable the MSI interrupt */
>> +	writel_relaxed(MSI_CTRL_INT, k1->link + INTR_ENABLE);
>> +
>> +	/* Top-level interrupt enable */
>> +	val = readl_relaxed(k1->link + K1_PHY_AHB_IRQ_EN);
>> +	val |= PCIE_INTERRUPT_EN;
>> +	writel_relaxed(val, k1->link + K1_PHY_AHB_IRQ_EN);
>> +
>> +	return 0;
>> +}
>> +
>> +static void k1_pcie_stop_link(struct dw_pcie *pci)
>> +{
>> +	struct k1_pcie *k1 = to_k1_pcie(pci);
>> +	u32 val;
>> +
>> +	/* Disable interrupts */
>> +	val = readl_relaxed(k1->link + K1_PHY_AHB_IRQ_EN);
>> +	val &= ~PCIE_INTERRUPT_EN;
>> +	writel_relaxed(val, k1->link + K1_PHY_AHB_IRQ_EN);
>> +
>> +	writel_relaxed(0, k1->link + INTR_ENABLE);
>> +
>> +	/* Disable the link and hold the PHY in reset */
>> +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
>> +			   APP_HOLD_PHY_RST | LTSSM_EN, APP_HOLD_PHY_RST);
>> +}
>> +
>> +static const struct dw_pcie_ops k1_pcie_ops = {
>> +	.link_up	= k1_pcie_link_up,
>> +	.start_link	= k1_pcie_start_link,
>> +	.stop_link	= k1_pcie_stop_link,
>> +};
>> +
>> +static int k1_pcie_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct k1_pcie *k1;
>> +	int ret;
>> +
>> +	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
>> +	if (!k1)
>> +		return -ENOMEM;
>> +
>> +	k1->pmu = syscon_regmap_lookup_by_phandle_args(dev_of_node(dev),
>> +						       SYSCON_APMU, 1,
>> +						       &k1->pmu_off);
>> +	if (IS_ERR(k1->pmu))
>> +		return dev_err_probe(dev, PTR_ERR(k1->pmu),
>> +				     "failed to lookup PMU registers\n");
>> +
>> +	k1->link = devm_platform_ioremap_resource_byname(pdev, "link");
>> +	if (!k1->link)
>> +		return dev_err_probe(dev, -ENOMEM,
>> +				     "failed to map \"link\" registers\n");
>> +
>> +	ret = devm_regulator_get_enable(dev, "vpcie3v3-supply");
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "failed to get \"vpcie3v3\" supply\n");
> 
> As mentioned in the bindings patch, you should rely on the PWRCTRL_SLOT driver
> to handle the power supplies. It is not yet handling the PERST#, but I have a
> series floating for that:
> https://lore.kernel.org/linux-pci/20250912-pci-pwrctrl-perst-v3-0-3c0ac62b032c@oss.qualcomm.com/

I think that just means that I'll define a DT node compatible with
"pciclass,0604", and in that node I'll specify the vpcie3v3-supply
property.  That will cause that (pwrctrl) device to get and enable
the supply before the "real" PCIe device probes.

And once your PERST work gets merged into the PCI power control
framework, a callback will allow that to assert PERST# as needed
surrounding power transitions.  (But I won't worry about that
for now.)

Is that right?

>> +
>> +	/* Hold the PHY in reset until we start the link */
>> +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
>> +			APP_HOLD_PHY_RST);
>> +
>> +	k1->phy = devm_phy_get(dev, NULL);
>> +	if (IS_ERR(k1->phy))
>> +		return dev_err_probe(dev, PTR_ERR(k1->phy),
>> +				     "failed to get PHY\n");
> 
> Once you move these properties to Root Port binding, you need to have per-Root
> Port parser. Again, you can refer the STM32 driver.

I see getting the PHY in stm32_pcie_parse_port(), but nothing
about the supply (which you mentioned in the other message).

>> +
>> +	k1->pci.dev = dev;
>> +	k1->pci.ops = &k1_pcie_ops;
>> +	dw_pcie_cap_set(&k1->pci, REQ_RES);
>> +
>> +	k1->pci.pp.ops = &k1_pcie_host_ops;
>> +	k1->pci.pp.num_vectors = MAX_MSI_IRQS;
> 
> This driver is just using a single 'msi' vector, which can only support 32 MSIs.
> But MAX_MSI_IRQS is 256. So this looks wrong.

In dw_pcie_host_init(), if unspecified, MSI_DEF_NUM_VECTORS=32 is
used for num_vectors.  If it is specified, only if the value
exceeds MAX_MSI_IRQS=256 is an error returned.

In dw_handle_msi_irq(), "num_ctrls" is computed based on
num_vectors / MAX_MSI_IRQS_PER_CTRL=32.  A loop then
iterates over those "controllers"(?) to handle each bit
set in their corresponding register.

This seems OK.  Can you explain why you think it's wrong?

>> +
>> +	platform_set_drvdata(pdev, k1);
>> +
> 
> For setting the correct runtime PM state of the controller, you should do:
> 
> pm_runtime_set_active()
> pm_runtime_no_callbacks()
> devm_pm_runtime_enable()

OK, that's easy enough.

> This will fix the runtime PM hierarchy of PCIe chain (from host controller to
> client drivers). Otherwise, it will be broken.
Is this documented somewhere?  (It wouldn't surprise me if it
is and I just missed it.)

This driver has as its origins some vendor code, and I simply
removed the runtime PM calls.  I didn't realize something would
be broken without making pm_runtime*() calls.

Thank you for your review Mani.

					-Alex


> - Mani
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

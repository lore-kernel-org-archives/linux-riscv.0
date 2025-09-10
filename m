Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7586CAC582
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 02:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/RZx2U2LWx6fLQSNPbnwAvzega546RNWqH3jVCxtczE=; b=VZ9LEH4XxUaGgC
	TOKw/aRDxvrP/Ia0ERkj6ZIZWbpNgcHn6qBZPDjI2v4kIdrIu2Dba18Hono5ElUu5HZJCMpUOvvr8
	4pgUUqKsuTgynqKfY2wl+MvZH4+m/9A/WYFZ0odvwopdYEC13g5XVfhHkMHLcBznUGWUJhn07/lRK
	khobDjy1pyi0ylxrB4GSjvjTrIyqDCWyJL1wLw8ufiHErmkkA3nbb96L4jRoVq4Ivl1v10JZGSE0x
	IB/Z5JLMs6UEyTpet+Ib2WjIurSj8iRJ1a4CHAQKKMOFmpa5h3abcd0JG9SBMJFP1kXAM6gtWIuOU
	wUm9kw4yKwJsbrcccQLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwB0Y-0000000BlrL-1HaE;
	Wed, 10 Sep 2025 02:56:30 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwB0W-0000000Blqc-2pXC
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 02:56:29 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2445826fd9dso75221315ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 19:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757472987; x=1758077787; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bccMpZ/9BOkjWFOHbeJr/ZW3cHQMAN90oKmu+ORNptc=;
        b=eY5hHJwFUeV/MnkkZbakTwRo8oHcpgeoohpAbAi22IkXBQ+35yOgSOgm1IjnA7d5Me
         NRsN5gulKSCUk5lH7i5/Bk1IG+lW5KzS/Naxv2m+npflpWR6HpbOMi6pGNekJ4o3nPYv
         oPst21OsHQo2Ao3b3mFCWqzMqMSx1x3lyIy11quMul1jgOYd6VmCGZEtTnFk4JHfFb+Y
         3NDVHKIgRooMO8KkUylyDlkaNUllKfjEYySwWr+BPg+2PVI7PrK3rLLzT4TKCujV3+fx
         A+Q/05Rxoag0AxbNCz3qJ+BpBlcOZVDJkI5o4PKDoYM/VPEuKNZt5RLWA2L9WuCq6pnq
         ncCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757472987; x=1758077787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bccMpZ/9BOkjWFOHbeJr/ZW3cHQMAN90oKmu+ORNptc=;
        b=VAdDxMtttk2Yw6LcMtCkxFBHNuVDihgZbcYQ6LP4DQs7JVX29sIKzqZJJT7nWFPgEy
         j42Bd78SK49WDrmeaEUIf/xuYqo2SexIUfGA0VFtpKTa62aVAn/Zkn6sHlk4Kmo7RAfr
         1pUpyPjLpfvLXKfIMGL0cBEqZiHELhBFMISyqBNzeTrjNDjyw33wRNSt92UD3aZJ2cBA
         Ntvap2DKEAKJoh3gUvDuIJuRWf8pi9QZ0jtt/JZj2IAqq4YFU7tFSNIr8tZT8obEWp2k
         d2TXSP7OkJ8LqeNXLeYh0Ypdwd+IQZDntaBGAMVyVCWAquf6VRKbNmIb9EljSCWVq7Aw
         d21A==
X-Forwarded-Encrypted: i=1; AJvYcCX5mh1kjCpgLW+3G9jeFnyVilCx+/HyYrX2LbpBRD92DbPdtqHNuAN8z50UbLVCAB/bsvWqUqceyHV5YA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfx9/70EbUNuhXeQAdAzNL1QGARvIUbEjWqybQxvQE/osk6Rsf
	VpTow2K5+j/1uHT+1465EfuiTpujNMJAfGEH/Ps3tSgXySXRvP61tGra
X-Gm-Gg: ASbGnctd/vow2z7PoJdfTdbaPUEI/FCOxv30kR/HDDFA8MaAWW+J6MgQ4t44f3MtjFT
	ArHKbf7CTCx/U+nHYdoJbDa6mnEvHYkKdQd0Qe9Ymm09FCxY2cHPJvX7J9YhJTTjR/UGx3zjz2z
	UVo+Y4Smu1/q1YxnKdSPVFlTns9yi95qBKtZ7l52ncTQCGYrvO3VDC4gGw2beelRAoKSId3D9ML
	FfuhJcqSPUD8c6mHUrDAg44+v9qPoSYgEQ1wuD5BlZGnTFqGonH55cPEbK6GqpDBOJzDY3IG7g3
	0M2mwYEXopIoLKZdPagDFpViRwOMpoG5NBm9L0eAcHhxBq2O+mQe2n4wP4fBp1+AMOdaKP1AfKS
	y5iJ+BwdgJiA9CMZGM1ovQk7AfryvMHTU
X-Google-Smtp-Source: AGHT+IFNBos7noDUln9W5GM7yi+/GGgz4QmYFcZtpZbyom0FkxzLpYxnYCZbcxZV/hMMSxTnIj0g7Q==
X-Received: by 2002:a17:903:1c2:b0:249:1213:6725 with SMTP id d9443c01a7336-251753d88d0mr190803255ad.50.1757472987403;
        Tue, 09 Sep 2025 19:56:27 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-32dbb5efe7asm650016a91.17.2025.09.09.19.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:56:27 -0700 (PDT)
Date: Wed, 10 Sep 2025 10:56:23 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicornxw@gmail.com>, kwilczynski@kernel.org, 
	u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, alex@ghiti.fr, arnd@arndb.de, 
	bwawrzyn@cisco.com, bhelgaas@google.com, unicorn_wang@outlook.com, 
	conor+dt@kernel.org, 18255117159@163.com, inochiama@gmail.com, kishon@kernel.org, 
	krzk+dt@kernel.org, lpieralisi@kernel.org, mani@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh@kernel.org, s-vadapalli@ti.com, tglx@linutronix.de, 
	thomas.richard@bootlin.com, sycamoremoon376@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, rabenda.cn@gmail.com, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
Subject: Re: [PATCH v2 3/7] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Message-ID: <xmk5uvnw7mcizxpaoarvx2c2sejaz2skaiyyac7oo5y6loyjgp@5v3sldwbqpw5>
References: <cover.1757467895.git.unicorn_wang@outlook.com>
 <162d064228261ccd0bf9313a20288e510912effd.1757467895.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <162d064228261ccd0bf9313a20288e510912effd.1757467895.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_195628_717749_E0B53EEB 
X-CRM114-Status: GOOD (  27.83  )
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

On Wed, Sep 10, 2025 at 10:08:39AM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add support for PCIe controller in SG2042 SoC. The controller
> uses the Cadence PCIe core programmed by pcie-cadence*.c. The
> PCIe controller will work in host mode only, supporting data
> rate(gen4) and lanes(x16 or x8).
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  drivers/pci/controller/cadence/Kconfig       |  10 ++
>  drivers/pci/controller/cadence/Makefile      |   1 +
>  drivers/pci/controller/cadence/pcie-sg2042.c | 104 +++++++++++++++++++
>  3 files changed, 115 insertions(+)
>  create mode 100644 drivers/pci/controller/cadence/pcie-sg2042.c
> 
> diff --git a/drivers/pci/controller/cadence/Kconfig b/drivers/pci/controller/cadence/Kconfig
> index 666e16b6367f..02a639e55fd8 100644
> --- a/drivers/pci/controller/cadence/Kconfig
> +++ b/drivers/pci/controller/cadence/Kconfig
> @@ -42,6 +42,15 @@ config PCIE_CADENCE_PLAT_EP
>  	  endpoint mode. This PCIe controller may be embedded into many
>  	  different vendors SoCs.
>  
> +config PCIE_SG2042_HOST
> +	tristate "Sophgo SG2042 PCIe controller (host mode)"
> +	depends on OF && (ARCH_SOPHGO || COMPILE_TEST)
> +	select PCIE_CADENCE_HOST
> +	help
> +	  Say Y here if you want to support the Sophgo SG2042 PCIe platform
> +	  controller in host mode. Sophgo SG2042 PCIe controller uses Cadence
> +	  PCIe core.
> +
>  config PCI_J721E
>  	tristate
>  	select PCIE_CADENCE_HOST if PCI_J721E_HOST != n
> @@ -67,4 +76,5 @@ config PCI_J721E_EP
>  	  Say Y here if you want to support the TI J721E PCIe platform
>  	  controller in endpoint mode. TI J721E PCIe controller uses Cadence PCIe
>  	  core.
> +
>  endmenu
> diff --git a/drivers/pci/controller/cadence/Makefile b/drivers/pci/controller/cadence/Makefile
> index 9bac5fb2f13d..5e23f8539ecc 100644
> --- a/drivers/pci/controller/cadence/Makefile
> +++ b/drivers/pci/controller/cadence/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_PCIE_CADENCE_HOST) += pcie-cadence-host.o
>  obj-$(CONFIG_PCIE_CADENCE_EP) += pcie-cadence-ep.o
>  obj-$(CONFIG_PCIE_CADENCE_PLAT) += pcie-cadence-plat.o
>  obj-$(CONFIG_PCI_J721E) += pci-j721e.o
> +obj-$(CONFIG_PCIE_SG2042_HOST) += pcie-sg2042.o
> diff --git a/drivers/pci/controller/cadence/pcie-sg2042.c b/drivers/pci/controller/cadence/pcie-sg2042.c
> new file mode 100644
> index 000000000000..c026e1ca5d6e
> --- /dev/null
> +++ b/drivers/pci/controller/cadence/pcie-sg2042.c
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * pcie-sg2042 - PCIe controller driver for Sophgo SG2042 SoC
> + *
> + * Copyright (C) 2025 Sophgo Technology Inc.
> + * Copyright (C) 2025 Chen Wang <unicorn_wang@outlook.com>
> + */
> +
> +#include <linux/mod_devicetable.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "pcie-cadence.h"
> +
> +/*
> + * SG2042 only supports 4-byte aligned access, so for the rootbus (i.e. to
> + * read/write the Root Port itself, read32/write32 is required. For
> + * non-rootbus (i.e. to read/write the PCIe peripheral registers, supports
> + * 1/2/4 byte aligned access, so directly using read/write should be fine.
> + */
> +
> +static struct pci_ops sg2042_pcie_root_ops = {
> +	.map_bus	= cdns_pci_map_bus,
> +	.read		= pci_generic_config_read32,
> +	.write		= pci_generic_config_write32,
> +};
> +
> +static struct pci_ops sg2042_pcie_child_ops = {
> +	.map_bus	= cdns_pci_map_bus,
> +	.read		= pci_generic_config_read,
> +	.write		= pci_generic_config_write,
> +};
> +
> +static int sg2042_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct pci_host_bridge *bridge;
> +	struct cdns_pcie *pcie;
> +	struct cdns_pcie_rc *rc;
> +	int ret;
> +
> +	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*rc));
> +	if (!bridge) {
> +		dev_err_probe(dev, -ENOMEM, "Failed to alloc host bridge!\n");
> +		return -ENOMEM;
> +	}
> +
> +	bridge->ops = &sg2042_pcie_root_ops;
> +	bridge->child_ops = &sg2042_pcie_child_ops;
> +
> +	rc = pci_host_bridge_priv(bridge);
> +	pcie = &rc->pcie;
> +	pcie->dev = dev;
> +
> +	platform_set_drvdata(pdev, pcie);
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_no_callbacks(dev);
> +	devm_pm_runtime_enable(dev);
> +
> +	ret = cdns_pcie_init_phy(dev, pcie);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to init phy!\n");
> +		return ret;
> +	}
> +
> +	ret = cdns_pcie_host_setup(rc);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to setup host!\n");
> +		cdns_pcie_disable_phy(pcie);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +

> +static void sg2042_pcie_remove(struct platform_device *pdev)
> +{
> +	struct cdns_pcie *pcie = platform_get_drvdata(pdev);
> +
> +	cdns_pcie_disable_phy(pcie);
> +}
> +

I think this remove is useless, as it is almost impossible to
remove a pcie at runtime.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

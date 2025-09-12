Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E00BCAC58E
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 02:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sT/2y2Y9eVIG08rHwFBiZAmAmvbjCCzCoPPabdxnnbM=; b=jWePWqmpdWrjsA
	nqdIvNyUaLLXlM7foWQqjR2UjOMM0PmwhGPBvCa7sef4GWio128La127eFADXNN9lyZ7kGgAGLfUR
	mm4cr6aEHanoliTHD1Gerqf1ib8bs6Zd6+Wxrfk+XoJ8wRHLdBlG9JgdKUHMVy/SDMg4eaICeIsUt
	ipjdCmeVFXRrNucCoMsVTw9C5d0C7+2AqhYgSDnf1lMMER4mMrhsE9xYVFq+qrlFMQRav8Q92ShMR
	S8U8RP8AqqFA35cmJMtkW6SHiuWzYhOg2CVS6XDK5NPqcgdkUrI7Mlx/cysAugfEaUkAC+YfHeKCj
	gjl6pp+55hDPYQdWqftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwtpK-00000006bUH-0IJz;
	Fri, 12 Sep 2025 02:47:54 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwtpH-00000006bSr-1Emw
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 02:47:52 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-24457f581aeso14418705ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 19:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757645270; x=1758250070; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kEod2N8uRbvkJvc+UFZ4BZQkPJQ0ifAgQ3mIeVf0CVo=;
        b=W2RzL9IUmnbRC//zutz+hbj7NYHxkDQaI+LvAW18BSB286DnN9l6/DUHZOU38cZFrr
         krHCUlzn7D+ESBtZVpq6aiz4mlhBtAZ5NUD7V6+/YboddTwHb60mrap9hPDQSYnyeSo0
         Y+4Y6LpNYPvgk08zg+kLeUwlK5G9FKhUkbBpgKS+2DyE3LjHGNLLQfQcVyO/knwi5R9t
         nK3Yox/J4xvBfFcoc5gK17bw+6Fnur1WXthSl20kp05QsYhRQfpwthkmqe7Zzs1iwtvm
         3azId1UjoH1J6IhH43RFxENF/td36kKbXOXbj8DXl0Laq9z6eWKC3RH9hk+x/+xuwCLm
         d/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757645270; x=1758250070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEod2N8uRbvkJvc+UFZ4BZQkPJQ0ifAgQ3mIeVf0CVo=;
        b=CjTfVPnUOZpFTjKBk0f5iiorSNhU17kXaKD9xN0By0n/N9kztzxUAcbeB0VAY20Clf
         /xBF8sSjw9Wyl03zNgm7FBgTfwAGhIk7akTCjHv61MHE8mZaAD04bjpfinsQ+clgYf61
         0IXVUXJhhc2xLozel22tKH3eeFaEOU8chCSIzPCm8MuqX6QTb7snrEul823gkrp3+AWQ
         v5I1uxVxWRGeU1jkObL/Yhjvpj8r2LZl/ggHzynDIw7GWohEpBdg6qQ+OKYRwp4XpvN7
         hFvjq3sWl0VofAE6ZebpM8xZ5wnJanBRpsJOqKuSgbVDf/kT4PFDKVRkQPHqvFbnXYM5
         xlZw==
X-Forwarded-Encrypted: i=1; AJvYcCUz7earGYo0kirMmALgQ4xcpp+OQnIsGJVhvmNXyQzhHF76UILuWFRmk60LjPSGOSecRunqawzPrf+Img==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLGrhVrGwN10zgHc1j+pdgQHp/Kz+370dK0YU1n/5tj39cTDeI
	a5Z1Q0GXgoKAaCfxx0qaI0ane/ZKNYhFf99t9GF+43BVm8naE/IsowcE
X-Gm-Gg: ASbGncspDjyGR1NwrEoxgViYsVuBQy0uu06+w2+8xp5X/buJNiRj/71bfmndlOyggRx
	QMfd9/tNLOc7L5OpgjQpaA344/lbpUUAqqmDwa4uZHpmDAstZtxWKql12hTH2vchkxnW90yqx4n
	A9g2iHRk5mt2tsK/xuUJlkrIRNO5NXY5MDufjYvxIF3h1BI+Y6VGayvKBnU4+90L8uqCOFbm9Fg
	74Yf90FMJVAcfATqUSezRvLCYhooobgAabPz+uMf0VEKqnLOgVSs8ZiCZxGI8OBbVPOmZRi0L7b
	Ag7Ap5mym6rAKPPhVHuqGyppJ+Qif8UzMEZME8ElhgIAMoRoCcjHp/MVhoyb44rF9Owhb0PQqeJ
	WPpOf3Q0iiugUHJtNNe0se1ncJDDrvAHk
X-Google-Smtp-Source: AGHT+IHk193yNMltpKeNNARwHZ7rfre7JMx5iLiB6RE3QMb05YheJaq48yb+Ee7d1Mu/dSjamjkpPw==
X-Received: by 2002:a17:902:ea09:b0:24c:829a:ee4a with SMTP id d9443c01a7336-25d247d175emr16495555ad.17.1757645270081;
        Thu, 11 Sep 2025 19:47:50 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-25c36cc53bcsm33542345ad.28.2025.09.11.19.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 19:47:49 -0700 (PDT)
Date: Fri, 12 Sep 2025 10:47:43 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicornxw@gmail.com>, kwilczynski@kernel.org, 
	u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, alex@ghiti.fr, arnd@arndb.de, 
	bwawrzyn@cisco.com, bhelgaas@google.com, unicorn_wang@outlook.com, 
	conor+dt@kernel.org, 18255117159@163.com, kishon@kernel.org, krzk+dt@kernel.org, 
	lpieralisi@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, 
	s-vadapalli@ti.com, tglx@linutronix.de, thomas.richard@bootlin.com, 
	sycamoremoon376@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	rabenda.cn@gmail.com, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
	fengchun.li@sophgo.com
Subject: Re: [PATCH v2 3/7] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Message-ID: <kd3wxvditosgj7rihh2q5iqvl43ljunbxaqbqpcxpmsbdnsbga@f4jm3o33ilkv>
References: <cover.1757467895.git.unicorn_wang@outlook.com>
 <162d064228261ccd0bf9313a20288e510912effd.1757467895.git.unicorn_wang@outlook.com>
 <xmk5uvnw7mcizxpaoarvx2c2sejaz2skaiyyac7oo5y6loyjgp@5v3sldwbqpw5>
 <rarvqtex3vsve3sscaky3rw727hwp5avmxve3lluwoviqbt6m6@h3nlqbi2s3fd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <rarvqtex3vsve3sscaky3rw727hwp5avmxve3lluwoviqbt6m6@h3nlqbi2s3fd>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_194751_343556_46AC0F21 
X-CRM114-Status: GOOD (  36.32  )
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

On Thu, Sep 11, 2025 at 10:33:18PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Sep 10, 2025 at 10:56:23AM GMT, Inochi Amaoto wrote:
> > On Wed, Sep 10, 2025 at 10:08:39AM +0800, Chen Wang wrote:
> > > From: Chen Wang <unicorn_wang@outlook.com>
> > > 
> > > Add support for PCIe controller in SG2042 SoC. The controller
> > > uses the Cadence PCIe core programmed by pcie-cadence*.c. The
> > > PCIe controller will work in host mode only, supporting data
> > > rate(gen4) and lanes(x16 or x8).
> > > 
> > > Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> > > ---
> > >  drivers/pci/controller/cadence/Kconfig       |  10 ++
> > >  drivers/pci/controller/cadence/Makefile      |   1 +
> > >  drivers/pci/controller/cadence/pcie-sg2042.c | 104 +++++++++++++++++++
> > >  3 files changed, 115 insertions(+)
> > >  create mode 100644 drivers/pci/controller/cadence/pcie-sg2042.c
> > > 
> > > diff --git a/drivers/pci/controller/cadence/Kconfig b/drivers/pci/controller/cadence/Kconfig
> > > index 666e16b6367f..02a639e55fd8 100644
> > > --- a/drivers/pci/controller/cadence/Kconfig
> > > +++ b/drivers/pci/controller/cadence/Kconfig
> > > @@ -42,6 +42,15 @@ config PCIE_CADENCE_PLAT_EP
> > >  	  endpoint mode. This PCIe controller may be embedded into many
> > >  	  different vendors SoCs.
> > >  
> > > +config PCIE_SG2042_HOST
> > > +	tristate "Sophgo SG2042 PCIe controller (host mode)"
> > > +	depends on OF && (ARCH_SOPHGO || COMPILE_TEST)
> > > +	select PCIE_CADENCE_HOST
> > > +	help
> > > +	  Say Y here if you want to support the Sophgo SG2042 PCIe platform
> > > +	  controller in host mode. Sophgo SG2042 PCIe controller uses Cadence
> > > +	  PCIe core.
> > > +
> > >  config PCI_J721E
> > >  	tristate
> > >  	select PCIE_CADENCE_HOST if PCI_J721E_HOST != n
> > > @@ -67,4 +76,5 @@ config PCI_J721E_EP
> > >  	  Say Y here if you want to support the TI J721E PCIe platform
> > >  	  controller in endpoint mode. TI J721E PCIe controller uses Cadence PCIe
> > >  	  core.
> > > +
> > >  endmenu
> > > diff --git a/drivers/pci/controller/cadence/Makefile b/drivers/pci/controller/cadence/Makefile
> > > index 9bac5fb2f13d..5e23f8539ecc 100644
> > > --- a/drivers/pci/controller/cadence/Makefile
> > > +++ b/drivers/pci/controller/cadence/Makefile
> > > @@ -4,3 +4,4 @@ obj-$(CONFIG_PCIE_CADENCE_HOST) += pcie-cadence-host.o
> > >  obj-$(CONFIG_PCIE_CADENCE_EP) += pcie-cadence-ep.o
> > >  obj-$(CONFIG_PCIE_CADENCE_PLAT) += pcie-cadence-plat.o
> > >  obj-$(CONFIG_PCI_J721E) += pci-j721e.o
> > > +obj-$(CONFIG_PCIE_SG2042_HOST) += pcie-sg2042.o
> > > diff --git a/drivers/pci/controller/cadence/pcie-sg2042.c b/drivers/pci/controller/cadence/pcie-sg2042.c
> > > new file mode 100644
> > > index 000000000000..c026e1ca5d6e
> > > --- /dev/null
> > > +++ b/drivers/pci/controller/cadence/pcie-sg2042.c
> > > @@ -0,0 +1,104 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * pcie-sg2042 - PCIe controller driver for Sophgo SG2042 SoC
> > > + *
> > > + * Copyright (C) 2025 Sophgo Technology Inc.
> > > + * Copyright (C) 2025 Chen Wang <unicorn_wang@outlook.com>
> > > + */
> > > +
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/pci.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/pm_runtime.h>
> > > +
> > > +#include "pcie-cadence.h"
> > > +
> > > +/*
> > > + * SG2042 only supports 4-byte aligned access, so for the rootbus (i.e. to
> > > + * read/write the Root Port itself, read32/write32 is required. For
> > > + * non-rootbus (i.e. to read/write the PCIe peripheral registers, supports
> > > + * 1/2/4 byte aligned access, so directly using read/write should be fine.
> > > + */
> > > +
> > > +static struct pci_ops sg2042_pcie_root_ops = {
> > > +	.map_bus	= cdns_pci_map_bus,
> > > +	.read		= pci_generic_config_read32,
> > > +	.write		= pci_generic_config_write32,
> > > +};
> > > +
> > > +static struct pci_ops sg2042_pcie_child_ops = {
> > > +	.map_bus	= cdns_pci_map_bus,
> > > +	.read		= pci_generic_config_read,
> > > +	.write		= pci_generic_config_write,
> > > +};
> > > +
> > > +static int sg2042_pcie_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	struct pci_host_bridge *bridge;
> > > +	struct cdns_pcie *pcie;
> > > +	struct cdns_pcie_rc *rc;
> > > +	int ret;
> > > +
> > > +	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*rc));
> > > +	if (!bridge) {
> > > +		dev_err_probe(dev, -ENOMEM, "Failed to alloc host bridge!\n");
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > > +	bridge->ops = &sg2042_pcie_root_ops;
> > > +	bridge->child_ops = &sg2042_pcie_child_ops;
> > > +
> > > +	rc = pci_host_bridge_priv(bridge);
> > > +	pcie = &rc->pcie;
> > > +	pcie->dev = dev;
> > > +
> > > +	platform_set_drvdata(pdev, pcie);
> > > +
> > > +	pm_runtime_set_active(dev);
> > > +	pm_runtime_no_callbacks(dev);
> > > +	devm_pm_runtime_enable(dev);
> > > +
> > > +	ret = cdns_pcie_init_phy(dev, pcie);
> > > +	if (ret) {
> > > +		dev_err_probe(dev, ret, "Failed to init phy!\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = cdns_pcie_host_setup(rc);
> > > +	if (ret) {
> > > +		dev_err_probe(dev, ret, "Failed to setup host!\n");
> > > +		cdns_pcie_disable_phy(pcie);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > 
> > > +static void sg2042_pcie_remove(struct platform_device *pdev)
> > > +{
> > > +	struct cdns_pcie *pcie = platform_get_drvdata(pdev);
> > > +
> > > +	cdns_pcie_disable_phy(pcie);
> > > +}
> > > +
> > 
> > I think this remove is useless, as it is almost impossible to
> > remove a pcie at runtime.
> > 
> 
> Why impossible? We only have concerns with removing PCIe controllers
> implementing irqchip, but this driver is not implementing it and using an
> external irqchip controller.
> 
> So it is safe and possible to remove this driver during runtime.
> 

Good to know this. It is the thing I did not know before.
So it is OK for me to see this code.

Thanks,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

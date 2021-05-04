Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2EBEC433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 13:46:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C32161175
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 13:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C32161175
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=EYc/cR6F7wJPH/+fCXt3TKwtvZkZoDtS71tyY+XnRdE=; b=T9ANWKu36vV74wOj25pnVpLwQ
	tAMfjZUmk/0Iq1SWV1JXg+hNIDPgILhauQ/rYGIdR9Z7A+uuk5lxEhD2iTd9R6yW9dosV3FbJ4mmk
	Qe/SHRZLKJh8Z72d8ClppYn3EDdu+zBabcBRQrEkZIMf5VWGZiWF74f7/TgbXRbFvNmfLmGE9VNco
	zdbRI3muw4VoCGCR5ny9mOO3QBEuTkT0zVSBnCWBYx5/Y6gt+nALIzzxdajqmoLidTyZPdvFcj3j1
	KIOTS3D4E7NKwKqUxLiohxHQsRYm6EX8IZAZEw4acR9+6cU1nVKU76OP40BcYmoGbDo++BVip2CaD
	MkVlCCA7g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldvNo-00GIz6-0X; Tue, 04 May 2021 13:46:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldvNl-00GIyL-OY
 for linux-riscv@desiato.infradead.org; Tue, 04 May 2021 13:46:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:References;
 bh=S2LaczaXJFQhSs6Z9fbtGrfIvkSk397VEDbj344W6Aw=; b=IfEj95GIpYHcKQJ/7SY6ezSP0F
 ANZm/EmdVDnIgSsIWDAU1wj981onsD05a7bJVQujxa7dTtKLWqFImKHw3e8Yl0FkKAvioy83C5Yy2
 el8VLz8bHuBDt3FF00r5KP3mm0bJqc8T53J0/D4a5grgwcPW3vTK/Z8PHCJhWeeggqdX0z6FRWnHy
 ZZQQ4V5ApW58aciBK69MjWUkCCmRlQckD+gTKKDWzrls0KS5GV/QGq5p7c2EntG/sNg23GyWzrOdU
 W7ZcPOp9+tI2AHSev53FTQfXYxwRgIVPiYY3NIXViIgks/+57L4MnDckfApRGRktXNWAFGxlM0kIW
 5PUgb+pQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldvNj-0040r0-0C
 for linux-riscv@lists.infradead.org; Tue, 04 May 2021 13:46:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3AC76610A0;
 Tue,  4 May 2021 13:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620135994;
 bh=GL0ZRSpX/6zSygCXqAdPcV7RkScUHDJZXypjcdpud44=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=fEGMIv0oM+g1r6aVpduh6RFeUVkttvBmB7GiMNAn/QyaGioxZfgKJ3EMMYO5VOvCQ
 GkiuPZ1MT9OwwV33LtSQxM3DwzPdnIZRmcFdMPTU0ylKxNxjp8FNx28xjTOW1z3Ua9
 1Mx6NPHF6jlPiXfOyrJ54ZWDwj4XRDR2aOpJXiNrA7EQx+QMdxTfOW/nJ2WUvWzJjI
 eErgfHuxKaSJbNYxRMnum3MXeHPo4met0f3g/Hun6bNelKccAZpe8cQcFxmTBd9rDQ
 TO6LcN6S3DAIotWHnqcQ3MYJZ4Oe0P8uySJyGdHajR5uKCIJmqsTX3TJgmS3pw/AgR
 JmdG0nLamyLDQ==
Date: Tue, 4 May 2021 08:46:32 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: paul.walmsley@sifive.com, hes@sifive.com, erik.danie@sifive.com,
 zong.li@sifive.com, bhelgaas@google.com, robh+dt@kernel.org,
 aou@eecs.berkeley.edu, mturquette@baylibre.com, sboyd@kernel.org,
 lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
 alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com,
 jh80.chung@samsung.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 5/6] PCI: fu740: Add SiFive FU740 PCIe host controller
 driver
Message-ID: <20210504134632.GA1088165@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210504105940.100004-6-greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_064635_104196_FB62271A 
X-CRM114-Status: GOOD (  21.05  )
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

On Tue, May 04, 2021 at 06:59:39PM +0800, Greentime Hu wrote:
> From: Paul Walmsley <paul.walmsley@sifive.com>
> 
> Add driver for the SiFive FU740 PCIe host controller.
> This controller is based on the DesignWare PCIe core.
> 
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Co-developed-by: Henry Styles <hes@sifive.com>
> Signed-off-by: Henry Styles <hes@sifive.com>
> Co-developed-by: Erik Danie <erik.danie@sifive.com>
> Signed-off-by: Erik Danie <erik.danie@sifive.com>
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  drivers/pci/controller/dwc/Kconfig      |  10 +
>  drivers/pci/controller/dwc/Makefile     |   1 +
>  drivers/pci/controller/dwc/pcie-fu740.c | 309 ++++++++++++++++++++++++
>  3 files changed, 320 insertions(+)
>  create mode 100644 drivers/pci/controller/dwc/pcie-fu740.c
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index 22c5529e9a65..255d43b1661b 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -318,4 +318,14 @@ config PCIE_AL
>  	  required only for DT-based platforms. ACPI platforms with the
>  	  Annapurna Labs PCIe controller don't need to enable this.
>  
> +config PCIE_FU740
> +	bool "SiFive FU740 PCIe host controller"
> +	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on SOC_SIFIVE || COMPILE_TEST
> +	depends on GPIOLIB

1) I'm a little disappointed that I reported the build issue 6 days
   ago when we were already in the merge window, and it's taken until
   now to make some progress.

2) I would prefer not to depend on GPIOLIB because it reduces
   compile-test coverage.  For example, the x86_64 defconfig does not
   enable GPIOLIB, so one must manually enable it to even be able to
   enable PCIE_FU740.

   Many other PCI controller drivers use GPIO, but no others depend on
   GPIOLIB, so I infer that in the !GPIOLIB case, gpio/consumer.h
   provides the stubs required for compile testing.

   We could have a conversation about whether it's better to
   explicitly depend on GPIOLIB here, or whether building a working
   FU740 driver implicitly depends on GPIOLIB being selected
   elsewhere.  That implicit dependency *is* a little obscure, but I
   think that's what other drivers currently do, and I'd like to do
   this consistently unless there's a good reason otherwise.

   Here are some examples of other drivers:

   dwc/pci-dra7xx.c:
     config PCI_DRA7XX_HOST
       depends on SOC_DRA7XX || COMPILE_TEST

     config SOC_DRA7XX
       select ARCH_OMAP2PLUS

     config ARCH_OMAP2PLUS
       select GPIOLIB

   dwc/pci-meson.c:
     config PCI_MESON
       # doesn't, but probably *should* depend on "ARCH_MESON || COMPILE_TEST"

     menuconfig ARCH_MESON
       select GPIOLIB

   dwc/pcie-qcom.c:
     config PCIE_QCOM
       depends on OF && (ARCH_QCOM || COMPILE_TEST)

     config ARCH_QCOM
       select GPIOLIB

   pcie-rockchip.c:
     config PCIE_ROCKCHIP_HOST
       depends on ARCH_ROCKCHIP || COMPILE_TEST

     config ARCH_ROCKCHIP
       select GPIOLIB

> +	select PCIE_DW_HOST
> +	help
> +	  Say Y here if you want PCIe controller support for the SiFive
> +	  FU740.
> +
>  endmenu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

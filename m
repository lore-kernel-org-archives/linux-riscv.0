Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C55F506CF
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 05:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPJcFanN0wFkQhlOI/fetJa+5+lSLmG82KJSWrVx4GM=; b=bUD9d34vV25O7r
	LZi7QAzTD9P/JQgip6nNdcL37j7D3BUXgpgrIbyg74Qedct5SNlyPbDXsBB1x/qe+FkwlLedvt0wg
	Z3w0WtkPlaANB66ClS6IRgqq6KiMdK/N3A/XMNxSeYmHmi5IqjafFejd97JBGyt2fdvTesooHGOEF
	Xekrmc8aWhfG/0/OwO79nECppihzwTWaJN9fPP2Wg77YXjq6n30K65w9GW19dTLCV4lOPPNClWr1q
	HK9UiqXjROIvl5w/F18L6onHIQViK4OJN6yUJhQn7pSZsHA+sMRxKo2VbR250Bz7vcU23Su8qClVp
	P5TVxuDYMGfdyDJlCI0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2N3M-00000005Rcx-2ZNP;
	Tue, 17 Mar 2026 05:33:16 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2N3J-00000005Rc7-21qS
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 05:33:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773725589; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qsmefrqsk7KvHZu9LJfj3ZnxXaXC8oWr1zwkioGNa6MfAlX4sPJtm2L/TmBOkUqd5/dbeG6jSseZtptEB7U7hLPIs5P3xjqn7PUEZAO2RKFXCL8adfrXpVbeaugUzyTMrmIsJ0KEE4/yJ03QUJ22fgqWTUOeswEt7Uaj2doCb0U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773725589; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eyhiSFd7TnnR0Y4KPBjzhgYS3ePqfaic4BGkMyXWNsw=; 
	b=mZP9Fh7ks1MBeclBECCuJouLSVmAo1S3kP+g3XJyaJo4EK9nSYO3mHOHz0ekBs8A0/dHe5Apu8wb1N227eM6sES3ZKWHV3Um+PPTp/Ovpy9qc5Gyj9mrDt3O3gOvj0izJOldmf0ZdA/xQs0knMttMDN2FjDp0WS+9dTUaIwb1oc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773725589;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=eyhiSFd7TnnR0Y4KPBjzhgYS3ePqfaic4BGkMyXWNsw=;
	b=ImJqzBhaykJ7b6/ZZttuDa2mVkhAhgDaSE6bshmKI944v399pbVfoE7pBrw+w0s7
	3jyglFuOx3pr6RFQB9UJV8Nx9sIzKyQ0123yzbCRoTT6QXZhGKYysfsaK2IWwFHCq79
	tuhORvK26dfLgOeQgY0foUHdkkgE5XaiFrZJ3J44=
Received: by mx.zohomail.com with SMTPS id 1773725587000567.8249611127286;
	Mon, 16 Mar 2026 22:33:07 -0700 (PDT)
Date: Tue, 17 Mar 2026 05:32:54 +0000
From: Yao Zi <me@ziyao.cc>
To: wangjia@ultrarisc.com, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] PCI: dwc: Add UltraRISC DP1000 PCIe rc driver
Message-ID: <abjnhn5sqnJv1fYY@pie>
References: <20260316-ultrarisc-pcie-v1-0-ef2946ede698@ultrarisc.com>
 <20260316-ultrarisc-pcie-v1-4-ef2946ede698@ultrarisc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260316-ultrarisc-pcie-v1-4-ef2946ede698@ultrarisc.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_223313_590555_886D11D4 
X-CRM114-Status: GOOD (  18.43  )
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

On Mon, Mar 16, 2026 at 03:07:00PM +0800, Jia Wang via B4 Relay wrote:
> From: Xincheng Zhang <zhangxincheng@ultrarisc.com>
> 
> Add DP1000 soc PCIe rc driver.
> 
> Signed-off-by: Xincheng Zhang <zhangxincheng@ultrarisc.com>
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  drivers/pci/controller/dwc/Kconfig           |  15 ++
>  drivers/pci/controller/dwc/Makefile          |   1 +
>  drivers/pci/controller/dwc/pcie-designware.h |  22 +++
>  drivers/pci/controller/dwc/pcie-ultrarisc.c  | 202 +++++++++++++++++++++++++++
>  4 files changed, 240 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index d0aa031397fa..0a33891bf7ef 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -548,4 +548,19 @@ config PCIE_VISCONTI_HOST
>  	  Say Y here if you want PCIe controller support on Toshiba Visconti SoC.
>  	  This driver supports TMPV7708 SoC.
>  
> +config PCIE_ULTRARISC
> +	bool "UltraRISC PCIe host controller"

Is there any reason preventing the driver being built as a module? If
no, it would be better to change it to "tristate", to allow distribution
to customize the configuration for image sizes, etc.

> +	depends on ARCH_ULTRARISC || COMPILE_TEST
> +	select PCIE_DW_HOST
> +	select PCI_MSI
> +	default y if ARCH_ULTRARISC
> +	help
> +	  Enables support for the PCIe controller in the UltraRISC SoC.
> +	  This driver supports UR-DP1000 SoC. When selected, it automatically
> +	  enables both `PCIE_DW_HOST` and `PCI_MSI`, ensuring proper support
> +	  for MSI-based interrupt handling in the PCIe controller.
> +	  By default, this symbol is enabled when `ARCH_ULTRARISC` is active,
> +	  requiring no further configuration on that platform.
> +
> +
>  endmenu
>  #define PORT_LOGIC_LTSSM_STATE_L0	0x11

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

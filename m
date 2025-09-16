Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A0FCAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 14:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Gw6XVYH3EK3qQdy4tPNhDe20f42CPGaBuQR4ZHBo1Ew=; b=tA7D1Y3iwndSpL
	Osk+5snMb/v7w0J/CPf+6t7xQr2nPsUt/E6HjPhfZqAaFIRwEdE3f1MLLg+Nafx49eEpv8CZ+oWfU
	JvBCtxcCAFGqKjiVWmR2uD7m5k7YSkJTmEx99ztWaKjIlu7apfPgpDetAkmpbVmznUHaJQFc774eG
	YxQNoteiINWSn30E3Gjggr84d0jaVoDqh/Jg1QxfYXMovbmZjTJHeFFS2qwvqMfnymeik3pu7wBEz
	6xdOv53eBgPwSp806j0gBQEyF3inzOU4iWfiG4fDlueMKaOudBHrSYIzjVvU6lH7jv1c5BoEh1VGf
	q+BMngoLF4X7eyYeisFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWxM-00000008Av0-3aLu;
	Tue, 16 Sep 2025 14:46:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWxL-00000008AuU-1knK
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 14:46:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B66EA601E4;
	Tue, 16 Sep 2025 14:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35ACCC4CEEB;
	Tue, 16 Sep 2025 14:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758034014;
	bh=rmokWgu3bgtJV2jhI9peM2VUuHBg9IVE5FtZDhrD/Ec=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=azkm4t/CsnnuRennBkQm0BJYQ+7BWRA9gXx1iKf1V1BM2A0r5nTj6o09x+D14oNem
	 zcrucLRqwjcRlf52eF2MlnmdJo+8ZhX0AQUzKGl8yg1djOC9iIGArAPTWwrwVirkk0
	 64mJjJBVRvX+sUUnX/mbIVKcDFO3Mv/2iJ7OeM+5Dcba29PG/eCSjC5HK5i0qBdQQO
	 9PJCn51wrREU3sd5bMSgfujKq9rrl/rgMHNjk7MGxlPvsA2BkTRT6gh5D7Ye/xKV50
	 NeSP7Tmer3BhPWG6gXUQ3PWm+eWGsjFCri/1aBBi5JuC8Bei47VgmjM1Y+IFNZDr84
	 lDwIq4uG73GPQ==
Date: Tue, 16 Sep 2025 09:46:52 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Randolph Lin <randolph@andestech.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alex@ghiti.fr,
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
	ben717@andestech.com, inochiama@gmail.com,
	thippeswamy.havalige@amd.com, namcao@linutronix.de,
	shradha.t@samsung.com, randolph.sklin@gmail.com,
	tim609@andestech.com
Subject: Re: [PATCH v2 4/5] PCI: andes: Add Andes QiLai SoC PCIe host driver
 support
Message-ID: <20250916144652.GA1795814@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250916100417.3036847-5-randolph@andestech.com>
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

On Tue, Sep 16, 2025 at 06:04:16PM +0800, Randolph Lin wrote:
> Add driver support for DesignWare based PCIe controller in Andes
> QiLai SoC. The driver only supports the Root Complex mode.

> +config PCIE_ANDES_QILAI
> +	bool "ANDES QiLai PCIe controller"
> +	depends on OF && (RISCV || COMPILE_TEST)
> +	depends on PCI_MSI
> +	depends on ARCH_ANDES

This prevents a lot of compile testing.  AFAICT, no other controller
depends directly on the arch.  Most do something like these:

  depends on MACH_ARTPEC6 || COMPILE_TEST
  depends on ARCH_MXC || COMPILE_TEST
  depends on OF && (ARM || ARCH_LAYERSCAPE || COMPILE_TEST)

> +	select PCIE_DW_HOST
> +	help
> +          Say Y here to enable PCIe controller support on Andes QiLai SoCs,
> +	  which operate in Root Complex mode. The Andes QiLai SoCs PCIe
> +	  controller is based on DesignWare IP (5.97a version) and therefore
> +	  the driver re-uses the DesignWare core functions to implement the
> +	  driver. The Andes QiLai SoC has three Root Complexes (RCs): one
> +	  operates on PCIe 4.0 with 4 lanes at 0x80000000, while the other
> +	  two operate on PCIe 4.0 with 2 lanes at 0xA0000000 and 0xC0000000,
> +	  respectively.

I assume these addresses come from devicetree, so I don't think
there's any need to include them here.

Fix space/tab indentation issue on first line of help text.  Do the
indentation the same way as the rest of the file.

> + * Refer to Table A4-5 (Memory type encoding) in the
> + * AMBA AXI and ACE Protocol Specification.
> + * The selected value corresponds to the Memory type field:
> + * "Write-back, Read and Write-allocate".

Add blank line between paragraphs or rewrap into a single paragraph.

> +static
> +bool qilai_pcie_outbound_atu_addr_valid(struct dw_pcie *pci,
> +					const struct dw_pcie_ob_atu_cfg *atu,
> +					u64 *limit_addr)
> +{
> +	u64 parent_bus_addr = atu->parent_bus_addr;
> +
> +	*limit_addr = parent_bus_addr + atu->size - 1;
> +
> +	/*
> +	 * Addresses below 4 GB are not 1:1 mapped; therefore, range checks
> +	 * only need to ensure addresses below 4 GB match pci->region_limit.
> +	 */
> +	if (lower_32_bits(*limit_addr & ~pci->region_limit) !=
> +	    lower_32_bits(parent_bus_addr & ~pci->region_limit) ||
> +	    !IS_ALIGNED(parent_bus_addr, pci->region_align) ||
> +	    !IS_ALIGNED(atu->pci_addr, pci->region_align) || !atu->size)
> +		return false;

Seems a little bit strange.  Is this something that could be expressed
via devicetree?  Or something peculiar about QiLai that's different
from all the other DWC-based controllers?

> + * Setup the Qilai PCIe IOCP (IO Coherence Port) Read/Write Behaviors to the
> + * Write-Back, Read and Write Allocate mode.
> + * The IOCP HW target is SoC last-level cache (L2 Cache), which serves as the
> + * system cache.
> + * The IOCP HW helps maintain cache monitoring, ensuring that the device can
> + * snoop data from/to the cache.

Add blank lines between paragraphs (or rewrap into a single paragraph
if that's what you intend).

> +static struct platform_driver qilai_pcie_driver = {
> +	.probe = qilai_pcie_probe,
> +	.driver = {
> +		.name	= "qilai-pcie",
> +		.of_match_table = qilai_pcie_of_match,
> +		/* only test passed at PROBE_DEFAULT_STRATEGY */
> +		.probe_type = PROBE_DEFAULT_STRATEGY,

This is the only use of PROBE_DEFAULT_STRATEGY in the entire tree, so
I doubt you need it.  If you do, please explain why in more detail.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

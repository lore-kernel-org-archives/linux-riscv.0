Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6990CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 17:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6CZUT6OQ8/wtLIIBBD2HblAhXnXeQpzOtXWL3O1Qdw=; b=veKN+NVHTXupQ/
	AJKkOWMQLx7d6Ct+a45JEQSxOGBFiGP3cMWS0LUEL4nqQZAX1QuXGFq+TEA1xO6wEvB6sBjeXYANz
	BiuA+4OzDUDwmu7lTRCcAoh3xiBmQ/LXu6VP6h74/fHWbPTeBrOMy7iK71WufeZ74WFZzncjUr+bY
	COs5go+JwA5hNtnMCn3hy9fLY/7ZpYCqxJ7gSQQX3sFVjsLLfrvUUwjoaJe1DHzaEHWer+DxXryVs
	eJEUyGQjPMeAUsfDxC3SA2zu39kRtu4jtl4eiRvFghWHp850nmWPEYX2Xw4vgV79O2vfHz/gu53qK
	tJF6xvOpcLa/tvrr4ztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbD9-000000047ph-0dpB;
	Tue, 29 Sep 2026 17:01:47 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbD6-000000047od-3JEJ
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 17:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=7xE0E0ndrr7YByn7ye5GJZRRPPDTwp49LLUupyjojAA=; b=0BpbijLyKgTmLntAjV2uQmlz8L
	a9bB0e4fcKHLtpWduH8mvw27UgdGm5QLZauBk566fYJE7b/VxtRcwcXdp2IgAtG5jqjGTuWY+SRat
	QCbKnRujVA/B4YmxmfIite19nSY/u7x6rrlFPgQpIrrYi93kH57IblEpRDHD17q2aMFtS5QC3Jds3
	SwxSTHqnEa8gXsLpX8LE2Pyruf/cUp8G5FsOwnVcYLLv5tiWW17BKgm1GH4HQcjkimWBMBJpFY9K/
	XTU1bMMAl16tOHcS5BNGgBWUdn0yXVQD1mUH3hNkEY/khxNosAlp8BV2Q+Fx8uFIYViOD1oggNaXA
	iclzn5nQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xBbCN-0000000GLbs-2LrY;
	Tue, 29 Sep 2026 19:00:59 +0200
Date: Tue, 29 Sep 2026 19:00:58 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczyyyski <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <cassel@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Randolph Lin <randolph@andestech.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	"Uwe Kleine-KKKnig (The Capable Hub)" <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 0/6] riscv: spacemit: Add PCIe RC controller support
 for K3
Message-ID: <arvuyt6eD0bwTb9c@aurel32.net>
Mail-Followup-To: Inochi Amaoto <inochiama@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczyyyski <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <cassel@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Randolph Lin <randolph@andestech.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	"Uwe Kleine-KKKnig (The Capable Hub)" <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
References: <20260929083755.458238-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929083755.458238-1-inochiama@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_100144_967000_BACE2048 
X-CRM114-Status: GOOD (  19.40  )
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

Hi,

On 2026-09-29 16:37, Inochi Amaoto wrote:
> The PCIe controller on Spacemit K3 is almost a standard Synopsys
> Designware PCIe IP with extra control and external MSI controller
> (IMSIC).
> 
> Add binding and driver support for PCIe RC controller support on K3.
> 
> Since v5, multiple vendor fix are included in this series, you can find
> in [1]. And this version required [2] for phy bulk data support.
> 
> [1] https://github.com/spacemit-com/linux-6.18/commits/k3-br-v1.0.y/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> [2] https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/
> 
> Changed from v6:
> - https://lore.kernel.org/linux-pci/20260923015016.64069-1-inochiama@gmail.com/
> patch 6:
> 1. Keep PERST# when init failed like the deinit.
> 
> Changed from v5:
> - https://lore.kernel.org/linux-pci/20260907112606.465778-1-inochiama@gmail.com/
> patch 1:
> 1. Return ENODATA for no device data found.
> patch 2:
> 1. Add power_on/power_off suggested in [2].
> 2. Add zero phy check in the driver.
> patch 5:
> 1. Add K3 device description.
> patch 6:
> 1. Update comments.
> 
> Changed from v4:
> - https://lore.kernel.org/linux-pci/20260709040027.958400-1-inochiama@gmail.com/
> patch 1:
> 1. fix comments
> patch 2:
> 1. Use phy bulk data to simplify the code
> patch 3:
> 1. Rebased to latest master
> patch 6:
> 1. Apply several fix from the vendor code
> 2. Use separated init/deinit function for K3.
> 3. Add some error handle for K3 init function
> 
> Changed from v3:
> - https://lore.kernel.org/linux-pci/20260703020003.485436-1-inochiama@gmail.com/
> patch 5:
> 1. Add missing interrupt/interrupt-names check for K1
> 
> Changed from v2:
> - https://lore.kernel.org/linux-pci/20260517014841.254085-1-inochiama@gmail.com/
> patch 2:
> 1. Use unify PCIe phy get/enable/exit function for both K1 and K3.
> patch 3:
> 1. New patch for updating device id for both K1/K3
> patch 5:
> 1. Reuse binding for spacemit,k1-pcie-host
> patch 6:
> 1. Multiple cleanup for the logic already generalized in the previous
>    patches.
> 2. Use generic description for the Kconfig entry.
> 
> Changed from v1:
> patch 1:
> 1. Remove post_init callback.
> patch 2:
> 1. Fix devm_kmalloc_array arguments order and error check.
> patch 3:
> 1. Apply Rob's tag.
> 2. Change check from oneOf to anyOf.
> 3. Fix spelling mistakes in commit message.
> patch 4:
> 1. Add comment about PHY handle.
> 2. Remove interrupt "app".
> 3. Fix spelling mistakes in commit message.
> patch 5:
> 1. Remove all logic related to link up interrupt.
> 2. Clean up all unused macros.
> 3. Fix devm_kmalloc_array arguments order and error check.
> 4. Remove unnecessary start_link logic.
> 5. Make all magic number as a macro.
> 6. Fix spelling mistakes in code and commit message.
> 
> Inochi Amaoto (6):
>   PCI: spacemit-k1: Add device data support
>   PCI: spacemit-k1: Add multiple PHY handles support
>   PCI: spacemit-k1: Add device id update helper
>   dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
>   dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
>   PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support
> 
>  .../devicetree/bindings/pci/snps,dw-pcie.yaml |   7 +-
>  .../bindings/pci/spacemit,k1-pcie-host.yaml   |  55 +++-
>  drivers/pci/controller/dwc/Kconfig            |   4 +-
>  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 237 ++++++++++++++++--
>  4 files changed, 270 insertions(+), 33 deletions(-)

Thanks for this new version. Patches 1, 2, 3, 6 are:

Tested-by: Aurelien Jarno <aurelien@aurel32.net

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

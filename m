Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2A0606A326
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 18:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JUck+gMK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=kG/VHBsd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Fkp6EZ9nbnO9wF4cYBoF80ZepW+TJi72y2kvxRYH4QU=; b=JUck+gMK+Ty8nitREv4oxwMOPN
	TmylL/1AmhbEFDgwkey1ywlK8l87cwexBUwb6iokQEej+ZrNq0dUWhdrjbsfrxeM/lN1RIVI4yqRs
	EsyQLZBOu3xlXGevbgA7r6DvByhtK6vj1ewyauisN2ktdP4OuzcmaELepFvG7WrQxvlNryKLMdnNV
	kjgqgEryzTYNG0g4DuUpF6i7RVunJwEwhJW2U8sOWN8HSz0tsriFLe9HO7lU4RReVGamDDR4alN90
	gpEWwKcjV9cd8mijV+aqUi3oV/NQarb52fDrkI+2jk5xRnizvhlVsNlbgiIXa0nPReAIh5VyH7Ynf
	u6qWYUhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHZP-0000000Ayrs-2dP3;
	Wed, 25 Nov 2026 18:18:15 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHZL-0000000Ayqb-2vDE
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 18:18:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=e9zrcR4+b/kS9Qb1mwVlZGZVo3jDZ/rmDsPjIuq74Z8=; b=kG/VHBsddVEJx97y/LwWQW7+aT
	SPi2PSd0iwDBudf5aAqJGC5uARR+wieLNmdzaVcmVtiHB91IwYHHeZMVwanKqbctsyFwES3MqDrj5
	c/GJedWJRnkyhG23qW54+Aap5eXLrDO3Rg3EFuaUGrite6fBoTvwq9FehSfrKRayCg9gsQJwzRZQS
	zbUZglKHVn1hheZvQoG+5Th5ngdZuWd6kMGA9X+fYlYOmYxckUvSFrzh9wjC+VOyVNmR5iKkOl24v
	NDDWoPTX3MVWun8wOdTYuwYIVIqK7V1FNrllVYH7vNuAUkrHfIXUu9k+ePEhbRh1aB+Z5K74GPLxq
	ebdxqljg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xWHYm-0000000ADku-0F4E;
	Wed, 25 Nov 2026 19:17:36 +0100
Date: Wed, 25 Nov 2026 19:17:35 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>, Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v8 0/6] riscv: spacemit: Add PCIe RC controller support
 for K3
Message-ID: <awcmP-iHD-E8eZRT@aurel32.net>
Mail-Followup-To: Inochi Amaoto <inochiama@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>, Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20261125041523.242588-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261125041523.242588-1-inochiama@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_101812_956359_7B78DBEA 
X-CRM114-Status: GOOD (  22.26  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Inochi,

On 2026-11-25 12:15, Inochi Amaoto wrote:
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
> [2] https://lore.kernel.org/linux-phy/20260923023304.78428-1-inochiama@gmail.com/
> 
> Changed from v7:
> - https://lore.kernel.org/linux-pci/20260929083755.458238-1-inochiama@gmail.com/
> 1. rebased to v7.4-rc1
> 2. Apply Andy, Rob, Aurelien's tags to related patches.
> patch 1:
> 1. The const declaration is reserved, as the it hold the pointer of the
>    static const data.
> patch 6:
> 1. Add comment to the PCIe topology description to the commit message.
> 2. Fix some 80 chars line problem.
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
>  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 235 ++++++++++++++++--
>  4 files changed, 268 insertions(+), 33 deletions(-)
> 
> --
> 2.56.1

Thanks for this new version. I have tested it with the v5 of the "phy: 
core: Add phy bulk helpers support" patchset. It works all fine.

Therefore for patches 1, 2, 3 and 6:

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

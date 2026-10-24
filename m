Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B78E606A31E
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Oct 2026 14:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CzdxlfCg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=DPmSQd9l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UG+KdcGtFskWuR9zEd85x5W4GHSYSlIb47z9JPDhYDI=; b=CzdxlfCg8XmuBHJcrWZhcvMAZy
	HUF6ufPAqfCm7dYxlg736AkeKe6YyzglhQH8SBIBc+ifoiJb6nOze1tYcQO+6ZgBP/i90JE/EUFsJ
	kQFN4qlpDbvfKZUZG2ucQmV9ZiMyizVMNQW0NR7gqeZ4+b6B0soT/2FznevT1WE1tvb1qGto5RG0n
	spA5bpmfNS40yodXUBDMSV/SPQtZ5YilwsvE8qthQRyGFe3XBpAWLNntUVuFgKwnauz1GqWyu7faw
	jT39q9DLqmFRnvnbI4OdHNFdYU8e2ZB72GoRxobVrn8jbFS8f8VeAlbFRSAcrwwBFaVFLuwBu/9ha
	TjzviRqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKd0F-00000000Gdh-0VRh;
	Sat, 24 Oct 2026 14:45:47 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKd08-00000000Gck-1iIK
	for linux-riscv@lists.infradead.org;
	Sat, 24 Oct 2026 14:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1792853110;
	bh=Ht4YxbyeqGa1db/OQDgQujtesPQ8TVSqALdRMTOwsLs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DPmSQd9l1TQiRD/eGQSXusE1uIUEOaoLi4dOC3T3mPp0epM6IqOnZmenHs/4sPj15
	 9DEn/m617tc5hC/qnezROhHiH+HZ8oEy8ezg0Knzo1p26OUzReK4tN4JCEI1UjduQr
	 Sw5sB/1E+CW44zRHCvbaM3f5hVJtlDVW4lyU/lqDPVQI10O2NEGyT8jIaiZsAVI7Lg
	 n0H+IdvD50UgM0DCxbtgpU7yTlxlbfDxs/ADQnMoFPlWS7B8Dw1tCjQRwWHo9ti7Mh
	 34A61b9jXK8juDNzZ6MtkR2qji2yP95+oYTsqcN0knYnWkPBsKYHVbh/70LX9PnoM+
	 l5jTWcKV/harA==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id C54ECB225CF1;
	Sat, 24 Oct 2026 16:45:07 +0200 (CEST)
Message-ID: <813d3f4a-66a9-48df-b9de-6a46b9388d0a@freeshell.de>
Date: Sat, 24 Oct 2026 07:45:00 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes
 bootph-pre-ram
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>, Yixun Lan <dlan@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_074543_868632_3976137F 
X-CRM114-Status: GOOD (  27.39  )
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
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Hung-Chun,

On 10/24/26 02:25, Hung-Chun Tseng wrote:
> On the SpacemiT K1 the BootROM loads the next boot stage into SRAM, and
> that stage sets up DRAM. This series marks the nodes it needs for that
> bootph-pre-ram: the SoC clocks, UART, boot media and the two I2C buses
> in k1.dtsi, and the board EEPROM (which holds the DRAM configuration),
> the PMIC rails and the SPI NOR in the board files.
> 
> The vendor confirmed that the BootROM itself does not access the
> EEPROM [1]. It is tagged because bootph-pre-ram covers the phase that
> sets up SDRAM, and DRAM cannot be trained without it.
> 
> Testing: all K1 DTBs build, and dtbs_check is clean for them with and
> without this series.
> 
> I used Claude to help read the U-Boot SPL and the device trees. I
> checked the changes and ran dtbs_check myself.
> 
> Changes in v3:
> - Reword both commit messages to describe the hardware instead of what
>   an SPL does, and drop the U-Boot paragraph from patch 1 (E)
> - Tag i2c2 in k1.dtsi too, as every K1 board has the EEPROM there
> - Tag eeprom@50 on the OrangePi RV2 and R2S, missed in v2 (Sashiko)
> - Drop the Assisted-by tags, see commit 1e035297ffda
> - Keep E's Reviewed-by on both patches, as the changes are the ones
>   discussed on v2
> - Link to v2: https://lore.kernel.org/all/20261017180141.3477743-1-alan.tseng.cs@gmail.com/
> 
> Changes in v2:
> - Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
> - Rebase onto the spacemit dt-for-next branch
> - Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/
> 
> [1] https://lore.kernel.org/all/20261021083425-GKA125937@kernel.org/
> 
> Hung-Chun Tseng (2):
>   riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
>   riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
> 
>  arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  5 +++++
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  5 +++++
>  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  6 ++++++
>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  6 ++++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  5 +++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  6 ++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi              | 14 ++++++++++++++
>  7 files changed, 47 insertions(+)
> 
> 
> base-commit: d05c6236496071916e19012cda7149465f15e66e

The series is looking good although I now have a nitpick about patch
organization since it is acknowledged that BootROM does not setup or
access DRAM. BootROM may load code that does not setup or access DRAM.
At the moment the patches are strictly split on "K1 SoC" and "Per-board"
while the one stated intention is DRAM initialization after some of the
peripherals BootROM may have configured also; that makes sense not
knowing the split between BootROM and other things and so I ask to
change this.

Split the patches in this series so we have a clearly defined initial
changeset that does "Extend the BootROM configured peripherals to device
tree bootph-pre-ram hints for any SPL loaded by that BootROM in SD,
eMMC, and SPI NOR boot modes". Capture all the BootROM SPL loader flows
that we can understand (USB missing currently? please add this) from
documentation, and with active participation from the vendor for any
questions. If that is an excessive burden then please let me know I will
look more closely at and give specific suggestions to be more helpful.

If you choose to keep patches for anything else that you want to add
(e.g. DRAM setup) extra beyond the basis of "BootROM" extension, defer
to the maintainer preference if they want it or not. I'm okay with "DRAM
setup" being an add-on with this series, but just as well for my
interest it certainly belongs in U-Boot if not in Linux. There may be
different requirements for linuxboot, oreboot, etc.

Aside, if the add-on patch is rejected by the maintainer here, it will
be then the basis for import to U-Boot (this is a different discussion)
and we can refer to the mailing list archive link; for the accepted
patches anyways these can be imported early to U-Boot and dropped there
when devicetree-rebasing will receive the changes.

I do not wish to delay anything but it seems to me to be important that
there is a distinction between describing the environment in which we
find ourselves subsequent to hardware BootROM, and any other extra
additions that we have for the most likely use (U-Boot SPL, linuxboot,
oreboot, whatever it is that wants DRAM initialized).

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

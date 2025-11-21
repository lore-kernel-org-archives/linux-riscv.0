Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D992ACFC296
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 18:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZwJ/mfGkIBnfMTOUPT86mU6vTGkgfk2S5oi8pTvcl0=; b=k5TmFY0XdFNUnw
	nkHpkkjnarGv7vfWj1zH74qopUtVidOtafm1u7nUbKR5xo+agRAMYWp2PEvW22K51bz6Sk9udKx3z
	tkBJrgMa5foXzOkWq7Gx1Tn5EGQ6pi1eu77uwz68qQf7ANwBvEBO3P9hYJywg5pC+5L+TE9q+qMPP
	XfAg+mn4dXQ79bChFjzWLQGmpoqXcpLPm7WHDl7WV1I1F3fAR6pgx6S+OW98PeTmqdeLs69GaXqmH
	qEmo6DOqCbgixGsjM5zghTeDARbvMBZsDcmBV5bT4aQDZDAXiUua85CLwBIB7MEIOLGgpzm0Viotn
	qz+xU6K0rxOFB4qBDOug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVmz-00000008qfR-28Wx;
	Fri, 21 Nov 2025 18:23:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVmy-00000008qfL-1yW7
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 18:23:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9289E60139;
	Fri, 21 Nov 2025 18:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCE3C4CEF1;
	Fri, 21 Nov 2025 18:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763749399;
	bh=Tn8d1sQwIoOGDV7RJWQSeoi9vVETWpTgHD0F6HgQ/GE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UzP2uVKl+OdmK3Ca+M7KnMoutuy/g8dKKOTuL4Kwkf/ft6+nVbcZSOZ2K5lYKlPl3
	 JGARAYdiPUeTDqLH4URlt0wUKWeCkNXFdxrbZRJE+Z2yPyvLD9jQq9KdbfZjMClAjn
	 7Xwux1OFDBhcDsysiRX97shXIzrJ2SN0e+ddDTQdpyRxhIx81E3dvrtph4EPaAeL3j
	 +FY88P3A7tHVlVGWfmNz4EVsVGTiZz8avpr4bD0AteB8lXfyQegOAj8ffOOlj5jkUv
	 mKLXbeEP/HAmN46twAAXM32vreq07thlbqHDcVf196CRW6nqqyyOqYPkpt0NrIpCL5
	 vLclLldV9pN+g==
Date: Fri, 21 Nov 2025 19:23:12 +0100
From: Matthias Brugger <matthias.bgg@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Add support for StarFive VisionFive 2 Lite board
Message-ID: <aSCuEJ_Y6gNNpB5M@ziggy.stardust>
References: <20251120082946.109378-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251120082946.109378-1-hal.feng@starfivetech.com>
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

On Thu, Nov 20, 2025 at 04:29:41PM +0800, Hal Feng wrote:
> VisionFive 2 Lite is a mini SBC based on the StarFive JH7110S industrial
> SoC which can run at -40~85 degrees centigrade and up to 1.25GHz.
> 
> Board features:
> - JH7110S SoC
> - 4/8 GiB LPDDR4 DRAM
> - AXP15060 PMIC
> - 40 pin GPIO header
> - 1x USB 3.0 host port
> - 3x USB 2.0 host port
> - 1x M.2 M-Key (size: 2242)
> - 1x MicroSD slot (optional non-removable 64GiB eMMC)
> - 1x QSPI Flash
> - 1x I2C EEPROM
> - 1x 1Gbps Ethernet port
> - SDIO-based Wi-Fi & UART-based Bluetooth
> - 1x HDMI port
> - 1x 2-lane DSI
> - 1x 2-lane CSI
> 
> VisionFive 2 Lite schematics: https://doc-en.rvspace.org/VisionFive2Lite/PDF/VF2_LITE_V1.10_TF_20250818_SCH.pdf
> VisionFive 2 Lite Quick Start Guide: https://doc-en.rvspace.org/VisionFive2Lite/VisionFive2LiteQSG/index.html
> More documents: https://doc-en.rvspace.org/Doc_Center/visionfive_2_lite.html
> 
> Changes since v2:
> - Drop patch 3, 4, 5.
> patch 6:
> - jh7110s-starfive-visionfive-2-lite.dtsi directly includes "jh7110.dtsi"
>   instead of "jh7110s-common.dtsi".
> 
> Changes since v1:
> - Drop patch 1 because it is applied.
> - Rename jh7110.dtsi to jh711x.dtsi.
> - Move the content of jh7110-common.dtsi to the new file
>   jh711x-common.dtsi and move opp table to jh7110-common.dtsi.
> patch 4:
> - Move the uncommon nodes to jh7110-common.dtsi instead of board dts.
> patch 5:
> - Add jh7110s-common.dtsi and include it in jh7110s-starfive-visionfive-2-lite.dtsi.
> 
> Changes since RFC:
> - Add jh7110s compatible to the generic cpufreq driver.
> - Fix the dtbs_check error by adding the missing "enable-gpios" property
>   in jh7110 pcie dt-bindings.
> - Rebase on the latest mainline.
> - Add VisionFive 2 Lite eMMC board device tree and add a common board dtsi
>   for VisionFive 2 Lite variants.
> - Add usb switch pin configuration (GPIO62).
> - Improve the commit messages.
> 
> History:
> v2: https://lore.kernel.org/all/20251107095530.114775-1-hal.feng@starfivetech.com/
> v1: https://lore.kernel.org/all/20251016080054.12484-1-hal.feng@starfivetech.com/
> RFC: https://lore.kernel.org/all/20250821100930.71404-1-hal.feng@starfivetech.com/
> 
> Hal Feng (5):
>   dt-bindings: PCI: starfive,jh7110-pcie: Add enable-gpios property
>   dt-bindings: riscv: Add StarFive JH7110S SoC and VisionFive 2 Lite
>     board
>   riscv: dts: starfive: Add common board dtsi for VisionFive 2 Lite
>     variants
>   riscv: dts: starfive: Add VisionFive 2 Lite board device tree
>   riscv: dts: starfive: Add VisionFive 2 Lite eMMC board device tree
> 
>  .../bindings/pci/starfive,jh7110-pcie.yaml    |   4 +
>  .../devicetree/bindings/riscv/starfive.yaml   |   6 +
>  arch/riscv/boot/dts/starfive/Makefile         |   3 +
>  ...h7110s-starfive-visionfive-2-lite-emmc.dts |  22 +
>  .../jh7110s-starfive-visionfive-2-lite.dts    |  20 +
>  .../jh7110s-starfive-visionfive-2-lite.dtsi   | 691 ++++++++++++++++++
>  6 files changed, 746 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite-emmc.dts
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dts
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dtsi
> 
> 
> base-commit: fe4d0dea039f2befb93f27569593ec209843b0f5
> -- 

Tested against v6.18-rc6 together with
fa939a287224d ("dts: starfive: jh7110-common: split out mmc0 reset pins from common into boards")

Tested-by: Matthias Brugger <mbrugger@suse.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

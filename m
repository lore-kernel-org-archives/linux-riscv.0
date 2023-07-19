Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8064BEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 15:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=q/7Yi4yITs+VR2ZzdBrRp46uuikyKu/ZstVkzLSM4hc=; b=dFfWVEhe5V9RCH
	dKnLc5uedBQnT/mbIrOQz5eoX+ZkcHHAdXeHJ1ajARsfhjLR9awYmDL17Q584o0oVlFjd4X/EwzTD
	OaTdDV/IcVgHNZBjNqHZnZgkTgzoHNzka5u/24bA/NLGyHjym3jpKFJPMqvxATfJgAjIHNvPerX27
	XPzvU0N5yIdQ3V4pyhqSKJuXHN0N0OioUZ09OE/hfDs+YQeUrpr91OK56NUeo7Cm1eLDhRez5K1li
	loBN0Pm/Xw5aXWM2Hp5l1bW5THO/h8PVOLL5TaPckbyqeXlVM9rDW7iSyLZ1E5JC5BWtlGdpbe4zJ
	13vOnuswveCnjuxWPd/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM94T-007vdA-1H;
	Wed, 19 Jul 2023 15:26:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM94Q-007vc3-0B
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 15:26:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2BC856175A;
	Wed, 19 Jul 2023 15:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE34C433CA;
	Wed, 19 Jul 2023 15:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689780388;
	bh=ns5KGRSm1qCUcwtmraI8e2J0uq3O7YGwgmpNhsjeKO8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VuJDe3s41aLEcac9qwpGYMw6sUAUSCHpi0OK958F/zb6K3iJ/TpwKmKOd4coAUtWL
	 uN7N//0+c8CKRqvPfN2zSRHQReSGQvk16uioiHK0LjDTaHpSTmjT32kSvDOGlpQrg/
	 +0L/ASu3edgI4rgYBzetyJyYnFl0fLWpMPCRfsYgAymYBtVOCTuTHkEdRdyoAtTXpC
	 xWd4g3Yg2olteJ4zEbU6AjYI33BQ+uNmlpnO+lKG+tOfHseWKPy1ZsfH456n/veSn0
	 ij16qm258qtfw1T2VgDrXzfImzM5pI2Nm2/bTtmxJloYVgDYtTuPizBBej0yqHl/lH
	 8guSi4DjkHnTw==
Date: Wed, 19 Jul 2023 10:26:26 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v1 0/9] Refactoring Microchip PolarFire PCIe driver
Message-ID: <20230719152626.GA502469@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719102057.22329-1-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_082630_198463_8F60BEDA 
X-CRM114-Status: GOOD (  12.06  )
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

On Wed, Jul 19, 2023 at 06:20:48PM +0800, Minda Chen wrote:
> This patchset final purpose is add PCIe driver for StarFive JH7110 SoC.
>   dt-bindings: PCI: Add PLDA XpressRICH PCIe host common properties
> JH7110 using PLDA XpressRICH PCIe IP. Microchip PolarFire Using the
> same IP and have commit their codes, which are mixed with PLDA
> controller codes and Microchip platform codes.

I guess this actually adds TWO drivers: PCIE_PLDA_PLAT_HOST (claims
"plda,xpressrich-pcie-host" devices) and PCIE_STARFIVE_HOST (claims
"starfive,jh7110-pcie" devices), right?

> For re-use the PLDA controller codes, I request refactoring microchip
> codes, move PLDA common codes to PLDA files.
> Desigware and Cadence is good example for refactoring codes.
> 
> So first step is extract the PLDA common codes from microchip, and
> refactoring the microchip codes.(patch1 - 4)
> Then add the PLDA platform codes. (patch5, 6)
> At last, add Starfive codes. (patch7 - 9)
> 
> This patchset is base on v6.5-rc1

Doesn't quite apply cleanly for me:

  10:10:15 ~/linux (main)$ git checkout -b wip/minda-starfive-v1 v6.5-rc1
  Switched to a new branch 'wip/minda-starfive-v1'
  10:10:33 ~/linux (wip/minda-starfive-v1)$ git am m/20230719_minda_chen_refactoring_microchip_polarfire_pcie_driver.mbx
  Applying: dt-bindings: PCI: Add PLDA XpressRICH PCIe host common properties
  Applying: dt-bindings: PCI: microchip: Remove the PLDA common properties
  Applying: PCI: PLDA: Get PLDA common codes from Microchip PolarFire host
  Applying: PCI: microchip: Move PCIe driver to PLDA directory
  Applying: dt-bindings: PLDA: Add PLDA XpressRICH PCIe host controller
  Applying: PCI: PLDA: Add host conroller platform driver
  Applying: dt-bindings: PCI: Add StarFive JH7110 PCIe controller
  Applying: PCI: PLDA: starfive: Add JH7110 PCIe controller
  Applying: riscv: dts: starfive: add PCIe dts configuration for JH7110
  error: patch failed: arch/riscv/boot/dts/starfive/jh7110.dtsi:629
  error: arch/riscv/boot/dts/starfive/jh7110.dtsi: patch does not apply
  Patch failed at 0009 riscv: dts: starfive: add PCIe dts configuration for JH7110

>   dt-bindings: PCI: Add PLDA XpressRICH PCIe host common properties
>   dt-bindings: PCI: microchip: Remove the PLDA common properties
>   PCI: PLDA: Get PLDA common codes from Microchip PolarFire host
>   PCI: microchip: Move PCIe driver to PLDA directory
>   dt-bindings: PLDA: Add PLDA XpressRICH PCIe host controller
>   PCI: PLDA: Add host conroller platform driver

"controller"

>   dt-bindings: PCI: Add StarFive JH7110 PCIe controller
>   PCI: PLDA: starfive: Add JH7110 PCIe controller
>   riscv: dts: starfive: add PCIe dts configuration for JH7110

Use "PCI: plda: " prefix for PLDA things that are shared across
multiple drivers.

Use "PCI: starfive: " prefix for starfive-specific things.

This is the same as how drivers/pci/controller/dwc/* looks.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

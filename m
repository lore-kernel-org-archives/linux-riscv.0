Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E25606A324
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 02:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lMQpMRAi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OUkfcBtg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WqlHCEhxINo+YaGrwaO8LbkYXbnoWQXYOveLG8Xcqps=; b=lMQpMRAiQ8SVylhbAv338f94In
	ropuEYExDjAE7/q4TScu2ZseZbCUUSztoNqGLxCg4YLJFiNeG4Bx50QNWYUEEyjep+sW1IjDSg5Eo
	SyQ7IIuH4UY4vQwQBnwKA4oMEhgknV2/b1jXaxCc7j88G8YGI9ZTeYQrzkXSoRlPaBgNek7xl8pDC
	jTaw0k8bCmn95MSzL0iqQ30amXITnRkRe2gcj3zETsLT09alsc6JsHSox5jU7xNGDwNMTjck/meI/
	elb7cCIRFXO2UdlVrCMimTJYV5qnuYHWoAiC8/mu9qMjvE+KvrW2/njYTf17x3CI9dqeT69wTUyG8
	JUsTk8XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRK7u-00000008T16-0oSp;
	Thu, 12 Nov 2026 02:01:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRK7l-00000008SzN-2MHa
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 02:01:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5047141A72;
	Thu, 12 Nov 2026 02:01:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794448873;
	b=xqXuf+NflqLpZjBlCsZmlFS6aSK0T8VMUXWsqFBbTQwxKGo3hD/NXaw30eO75vXm6cED
	 22lDXylUnuX3O4PqtGk0fGxOFQcwBewuaYYadWkBUomopJYZcgeIi4OJVZn3h0xp2Nglq
	 YzW5RjlfpTJBbiBpg80jd5NnIazr4Pt4MvWj/K7M47x1sf20FanDmFFrl3BQg7Gi/dYh4
	 ptn8WBXm9lgGADkZqPFcJnc05ZYE0+bhbX/KL0gUMcnu2dvmTXblZAU4OAmj9CixWzCs8
	 C85D7XrWDLjm+UQCQ25svX7qX4ouJVJhaQfIMqwpfVrSkCXO6Jd4mH/csHcvS8NVGkA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794448873;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=UjyXIuPnZDBbSnUfaZIiZgU7UTOHmQHCOubv+BY6WsE=;
	b=2mZWiv+aOGDdbbmes43RnvU/L5ltTSfEEjNjYFOlHs8u9x+OSMNyYWmtZL4DB31mc8Nw
	 6fRsztjN4xF1mrNUF0C0MwuJMi4OlBwHs90F98QYrKNB7Zof78uo2HznGfIWodyUweO0p
	 9ixEV4QlF/kVj5N8NtokxXJPERL6bxpAWMNvGTW/8MKXFAVJyW0bLmJq9MCcQWh1+a6Pw
	 e/ywrm5zGzKa6Ozvra7DGMlahcLDqDPJoWKJ54FEDpo0N2AEp6cqe27H75C5+wPx3z5hc
	 8uWhbQAEcA+FZswEFyXP/qaWNb9TZBZvSaC0GfDLGqOBso3GAQz3t3rMdgGMi6xb+9A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32B6B1F00A06;
	Thu, 12 Nov 2026 02:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794448873;
	bh=UjyXIuPnZDBbSnUfaZIiZgU7UTOHmQHCOubv+BY6WsE=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=OUkfcBtg0Cg0dukPFC7Myc3pbpa2ClG4kO9fW+HEmhrPRUGZgnKW9kKiwPfxFiH2p
	 B9fSV9IAnfFA4dMmcz5IS1R8OoYIqzh+n9dRtLYDMgGiIHfLf1f9K6HMSkFK6uuts4
	 uUJij6CdP4XWJivnwBTWrv92bC49VxFLLVBdXASOcLfae4t5m4BkKAszwb9l9rp7nM
	 Uqg8gz0fs7jXfoJaQL+nv+C3QVfbf0iagTCaOSoTK1AceA2/jry5i6P1Drn7Cawou+
	 /ekzH7eoxVd9kD3dZuTgjacmKKjE+l2vaBl7pBWwj3wXIWAwdhF94qQi4oRZ+0HmaN
	 cxXj8rTattbZQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8676D491E6;
	Thu, 12 Nov 2026 02:01:10 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Subject: [PATCH v8 0/8] riscv: Add device tree support for UltraRISC DP1000
Date: Thu, 12 Nov 2026 10:00:59 +0800
Message-Id: <20261112-ultrarisc-dts-v8-0-14fa0834cac4@ultrarisc.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANsd9WoC/23S247UMAwG4FcZ9ZqixDl6hRDvgbiwE4cpYnag6
 RTQat6dtIuWbreXVuPP8Z8+dVXGQWr3cHrqRpmHOlwfWxHfnbp0psev0g+51R0o8MoB9Lfv00j
 jUFOfp9pjJjYERnv2Xev5MUoZfq/e5y/Pdb3xN0nTgvw7McrPWxs0PR/rLlIrrYMeTh/WOahCn
 39dKG2mzdCrHskgl5jZaPPp5dv7dL18XG2a0nl1igOfjRdNljJ7hxQ1lGy1dTkRiEfWaJ153RW
 yEw0qOuvbDDJ2UVDZkDywcaHEYAtqWbqYqvRt8GWYWqOyxqqiU1Y5SYmAwh6KYxtJ0BEk0YFz6
 ZZMzkOdruOfNfJZrxGsW0ewu3Rn3Xb2mjiQsKC41zuv2gz/hSW3nbCk5oRtwmBDSIeCeRG00mY
 vmEUoxQgzEKp8JNitgHvBNsFgWG6Qcgv/SHAbAd7cwTWBSsDM2ack6UjwW+FNkr4J7RURbY6kt
 T0SwlZweyEsbwFa2u/DMaDaC/f7/S/06o2bTgMAAA==
X-Change-ID: 20260522-ultrarisc-dts-9dab3a2316b6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794448869; l=8528;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=dFPgiqsiICzZkoCp1622eoNf1dZ/j22J7ZEdsjg8NdQ=;
 b=mxHvunJ0Wxpof0+Y10l9/z6GO8lFSR2UM9P0+Zd+xbNgSODJW3oUl8kxd64vtnR6JUmnyaUR0
 USNMedNEvlkAcbaVc7SwRqQ0IF4Qfb2a5Nisi9t8i7EyhBAvhkCWtAL
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: jixincheng@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add Devicetree support for the UltraRISC DP1000 RISC-V SoC and two
DP1000-based motherboards: Shenzhen Rongda M0 and Milk-V Titan.

DP1000 integrates eight UltraRISC CP100 CPU cores.  The SoC description
includes the CPU and cache topology, CLINT, PLIC, clock controller,
pinctrl, GPIO, four UARTs, two SPI controllers, four I2C controllers,
three PCIe root complexes, GMAC, and the DMA controller.

The Shenzhen Rongda M0 and Milk-V Titan device trees add their
board-specific pin multiplexing, RTC devices, and Ethernet PHY
configuration.  Both boards enable the three PCIe root complexes and
the GMAC described as disabled by default in the SoC DTS.  The Titan
description also provides its GPIO wakeup keys.

The binding patches add the vendor, CPU, board, and peripheral compatible
strings consumed by the new device trees.  The SPI, I2C, and AXI DMA nodes
use their respective generic DesignWare compatible strings as fallbacks.

An earlier version of the DP1000 SoC and board Devicetree support was
posted as part of a combined Devicetree and pinctrl series. The pinctrl
binding and driver were subsequently split out and merged separately.
This series carries the updated Devicetree portion.

The final patch updates the UltraRISC platform maintainer to Xincheng Ji
and temporarily points the MAINTAINERS tree entry at Conor Dooley's tree,
as requested by Conor during the platform maintenance handover.

Link: https://lore.kernel.org/all/20261110-amused-strobe-d6cf2bf24861@spud/

Link: https://lore.kernel.org/all/20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com/

The following prerequisites have been applied to their respective
subsystem trees but are not yet included in the base:

- net: stmmac: Add common internal RGMII delay handling and DP1000 support
  https://lore.kernel.org/netdev/20260907-dwmac-ultrarisc-v2-0-9a39bf8db313@ultrarisc.com/

- dt-bindings: i2c: dw: Add compatible for UltraRISC DP1000 SoC
  https://patch.msgid.link/20260907-ultrarisc-dts-v2-6-5eb4c97477c5@ultrarisc.com

- dt-bindings: dma: snps,dw-axi-dmac: Add UltraRISC DP1000 compatible
  https://patch.msgid.link/20260907-ultrarisc-dts-v2-7-5eb4c97477c5@ultrarisc.com

Testing:
- Built dp1000-shenrongda-m0.dtb and dp1000-milkv-titan.dtb with
  ARCH=riscv and W=1.
- Ran dt_binding_check for the modified and prerequisite bindings.
- Validated both DTBs against the relevant Devicetree schemas with
  CHECK_DTBS=y and all prerequisite changes applied.
- Boot-tested both DTBs on Shenzhen Rongda M0 and Milk-V Titan. Verified
  the CPU topology and CBO selftests, UART, SPI, I2C/RTC, system memory,
  and all three PCIe root complexes. The expected PCIe endpoints were
  enumerated on both boards.
- With the prerequisite GMAC series applied, ultrarisc-dwmac established
  1000 Mb/s full-duplex links with the YT8531S PHY on M0 and the RTL8211F
  PHY on Titan.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Signed-off-by: Xincheng Ji <jixincheng@ultrarisc.com>
---
Changes in v8:
- Add a MAINTAINERS patch replacing Jia Wang with Xincheng Ji as the
  UltraRISC platform maintainer and using Conor Dooley's Git tree for now.
- No changes to the Devicetree or binding patches.
- Link to v7: https://patch.msgid.link/20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com

Changes in v7:
- Fix the duplicated unit address in the PLIC node name.
- Move the M0 PHY node rename into the M0 board patch.
- Link to v6: https://patch.msgid.link/20261024-ultrarisc-dts-v6-0-c62994d8a114@ultrarisc.com

Changes in v6:
- Rename the PLIC node to interrupt-controller@9000000 and the CLINT
  node to timer@8000000 to follow generic node naming conventions.
- Rename the PHY nodes to ethernet-phy@0 on both boards to match the
  Ethernet PHY binding.
- Link to v5: https://patch.msgid.link/20261023-ultrarisc-dts-v5-0-af79dbd6ccec@ultrarisc.com

Changes in v5:
- Drop the deprecated label properties from the Milk-V Titan PHY LED
  nodes so that LED names are composed from color and function
- Replace the deprecated snps,nr-gpios property with ngpios for all four
  DP1000 GPIO ports, preserving the existing GPIO counts.
- Link to v4: https://patch.msgid.link/20261019-ultrarisc-dts-v4-0-3979747cda2e@ultrarisc.com

Changes in v4:
- Move L2 cache nodes out of the CPU nodes and reference them using
  next-level-cache, following the standard Devicetree cache topology.
- Link to v3: https://patch.msgid.link/20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com

Changes in v3:
- Drop the DP1000 SPI binding patch, which has been merged, and the I2C
  and DMA binding patches, which have been applied.
- Correct the reg property address ranges and sizes for DMA and I2C nodes in the DP1000 base device tree.
- Link to v2: https://patch.msgid.link/20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com

Changes in v2:
- Remove the dependency on the DP1000 clock series, which has since
  been merged.
- Drop the generic DWMAC compatible patch; DP1000 GMAC support is handled
  by a separate prerequisite series.
- Drop the RISC-V CPU binding yamllint fix, which has been applied.
- Add DP1000-specific resource constraints and hardware descriptions to
  the SPI, I2C and DMA bindings.
- Correct the native chip-select count of SPI1 from three to four.
- Describe all eight per-channel DMA interrupts.
- Update the DP1000 GMAC nodes for the separate GMAC support series:
  remove the generic DWMAC fallback, use "rgmii-id" for both boards, and
  clarify the fixed MAC-side RGMII delays.
- Link to v1: https://patch.msgid.link/20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Jia Wang <wangjia@ultrarisc.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
To: Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org

---
Jia Wang (7):
      dt-bindings: vendor-prefixes: Add shenrongda
      dt-bindings: riscv: cpus: Add UltraRISC CP100 compatible
      dt-bindings: riscv: Add UltraRISC DP1000 board compatibles
      dt-bindings: timer: Add UltraRISC DP1000 CLINT
      riscv: dts: ultrarisc: Add initial device tree for UltraRISC DP1000
      riscv: dts: ultrarisc: Add Shenzhen Rongda M0 board device tree
      riscv: dts: ultrarisc: Add Milk-V Titan board device tree

Xincheng Ji (1):
      MAINTAINERS: Update UltraRISC platform maintainer and tree

 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/ultrarisc.yaml       |  27 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   8 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/ultrarisc/Makefile             |   3 +
 .../dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi  | 108 +++
 .../boot/dts/ultrarisc/dp1000-milkv-titan.dts      | 201 +++++
 arch/riscv/boot/dts/ultrarisc/dp1000-pinctrl.h     |  63 ++
 .../ultrarisc/dp1000-shenrongda-m0-pinctrl.dtsi    |  79 ++
 .../boot/dts/ultrarisc/dp1000-shenrongda-m0.dts    | 113 +++
 arch/riscv/boot/dts/ultrarisc/dp1000.dtsi          | 865 +++++++++++++++++++++
 13 files changed, 1472 insertions(+)
---
base-commit: 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
change-id: 20260522-ultrarisc-dts-9dab3a2316b6
prerequisite-message-id: <20260907-dwmac-ultrarisc-v2-0-9a39bf8db313@ultrarisc.com>
prerequisite-patch-id: 92e6cf1352d54e283d7721dc1542b580b8a41be1
prerequisite-patch-id: 875c2058e9d8a983d785d7447374758f994dc847
prerequisite-patch-id: 060a9b129c32c623a52ab1ba66f7a357e54575ff
prerequisite-patch-id: 9aafbac6d2531a378b2057bf57787c814523f9d3
prerequisite-patch-id: d75120a112276bd966d37441bd4d631e1539d0e8
prerequisite-patch-id: f526d36e1a4adb659a812fd4145dca2e69b19453
prerequisite-patch-id: 7d5e12085468dba34526d9047c62b357f874f91e

Best regards,
--  
Xincheng Ji <jixincheng@ultrarisc.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

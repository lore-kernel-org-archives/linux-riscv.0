Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B83CD37BE
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 02:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y28HkmYdyj71Ugh6wTbXl/Lj3NSZd+q01Ffs5mvqR2E=; b=lVSARiMlj+fXtc
	85dLf69p/4a/oXj9j9r8RXFmgX/mWgZo5RJ+vpE6cKSZdmbt2v5qeMF2yu8WdcaTUXpLKXquFIrqH
	LoE2MZkXNeUCBQJbmatXnujw4jAl907g/1v8qdy9jN6MPBx180RCgroKEltHHga6rIXgeg7qVGqd8
	uWEJbkEDZWQa61rNDVxmiTF46b+/vEU+1WN2GAtSfv3MB6dN13Z6+0x3JHWBv9pQMAT5VYFp/G1QM
	+zbL4NYC/kq5O8m5ZSslFFjAYSP7BDe1yVq9EQfzC11/px+WhA3kH9QRuAuGZB3C2mdISKhopkq0V
	wmp/VKUQgj16Yobpe07g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGrx-0000000C5zD-2VW1;
	Mon, 11 May 2026 02:59:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGrw-0000000C5z3-1M5Z
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 02:59:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C39216001A;
	Mon, 11 May 2026 02:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF1AC2BCB8;
	Mon, 11 May 2026 02:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778468383;
	bh=jgdy/jxzdPVjOoV+NbNcw3Zjs55tIwNpIANgic7Sor0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PJMBhsXqizB+MSRjPMd+BpVcrQc++1BQAdqu9gs7LYn+DgWWUIufU+mVhzO7dC8sz
	 hPhJFSiye0hBRYc0sMKvxTlQEWdSCrRaY2y3datpSawY+yn3oK17xGbHU1fvqCMVGB
	 MnnAxCIy7jYCkkOOQXJY3dFwMZtDGPFQ2ewg3Q7B+dkvKGXc90WaXfRnhcqbR+jnSd
	 0nH+EKGZkRf6O38SHkk++UHO9EIUBrpBZux0alonov8Z1XAKzAadudPSDby9xoPt09
	 7ZcCoqfKfTMXBFdEqh4EUuCFKGgSho7kP76IoiQxgLpSjUHYKoUwjkhIwSqOs3kZku
	 wjXDvWG3Bay2A==
From: Yixun Lan <dlan@kernel.org>
Date: Mon, 11 May 2026 02:59:12 +0000
Subject: [PATCH v2 4/4] clk: spacemit: k3: Add PCIe DBI clock
MIME-Version: 1.0
Message-Id: <20260511-06-pci-clk-fix-v2-4-c9a5e563bab3@kernel.org>
References: <20260511-06-pci-clk-fix-v2-0-c9a5e563bab3@kernel.org>
In-Reply-To: <20260511-06-pci-clk-fix-v2-0-c9a5e563bab3@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3271; i=dlan@kernel.org;
 h=from:subject:message-id; bh=jgdy/jxzdPVjOoV+NbNcw3Zjs55tIwNpIANgic7Sor0=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqAUYMqo+7/jagNeN7iNDGB7wp4NxGK9LqLPebq
 mr60xsvC4+JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCagFGDBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3Sdg/+Kp0iBNY0rO/rvafO+ZuKdqxpIPaNW7joWiu1n+kwvQmc4nAzV3hEV
 JJ8Xd/mU9+r25e28ztCwNBXheICHbSt167PPxiGEyy1n55qPBbs4wzp1VoLDVtRxnGN24LtMYYG
 bCOIBdO3TN0b30WuMimX/FEIoypom/FOCf5bCoMBI7eJzvOyocnAAZMZO06GWaLpMzcv6RmYyF/
 hh5thtmbHh+M8Xr90tRj9xiq+JJkS2/y5la3f4rQcdcPTtY/G/GrJd32yYaPgAnjtDgNjgrh0y3
 cnCG231Oynq0BlPUwfQXC90yQiIHkeIsrmheIC1yn98pzM5PQeBifYAlGm1Fnj/OCwDrcNmVhch
 iUwNGRJS2Ek2Q9QOUUDuMc//CgVwb0D3tB3JUCPHra+9nDjI338XLaXt4sS20t63WILc9feHZg3
 WBy+0WEVeWFn8ZBVukDEPfdBEUuIO4WpIFSUONWtMEgFbx+SIsZz/LtgSyqCweHU8xZkDXspYwb
 sPG8NWmbmIM162IE/9i+6c+f28knBLKABTvG0Pt+AV08VR4JZEDwtKv078Jx0LoH7Q3FKxjPFKw
 /ae6cIJYwgA1tKLonmIrbIV7rwtYkm67HAmYi/MW/hCXn4JyZjFqopzaN74yE2mAmi3kA+a33bi
 GsPjcEdokORcPmXC0padKuMrrIaTno=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

Add PCIe DBI (Data Bus Interface) clock which was missing, This will
support PCIe driver to explicitly request and enable all clocks that
needed.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/clk/spacemit/ccu-k3.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index 8f0b743046ab..196d32194125 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -949,14 +949,19 @@ CCU_MUX_GATE_DEFINE(edp1_pxclk, edp1_pclk_parents, APMU_LCD_EDP_CTRL, 18, 1, BIT
 
 CCU_GATE_DEFINE(pciea_mstr_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_A, BIT(2), 0);
 CCU_GATE_DEFINE(pciea_slv_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_A, BIT(1), 0);
+CCU_GATE_DEFINE(pciea_dbi_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_A, BIT(0), 0);
 CCU_GATE_DEFINE(pcieb_mstr_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_B, BIT(2), 0);
 CCU_GATE_DEFINE(pcieb_slv_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_B, BIT(1), 0);
+CCU_GATE_DEFINE(pcieb_dbi_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_B, BIT(0), 0);
 CCU_GATE_DEFINE(pciec_mstr_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_C, BIT(2), 0);
 CCU_GATE_DEFINE(pciec_slv_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_C, BIT(1), 0);
+CCU_GATE_DEFINE(pciec_dbi_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_C, BIT(0), 0);
 CCU_GATE_DEFINE(pcied_mstr_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_D, BIT(2), 0);
 CCU_GATE_DEFINE(pcied_slv_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_D, BIT(1), 0);
+CCU_GATE_DEFINE(pcied_dbi_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_D, BIT(0), 0);
 CCU_GATE_DEFINE(pciee_mstr_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_E, BIT(2), 0);
 CCU_GATE_DEFINE(pciee_slv_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_E, BIT(1), 0);
+CCU_GATE_DEFINE(pciee_dbi_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_E, BIT(0), 0);
 
 static const struct clk_parent_data emac_1588_parents[] = {
 	CCU_PARENT_NAME(vctcxo_24m),
@@ -1391,14 +1396,19 @@ static struct clk_hw *k3_ccu_apmu_hws[] = {
 	[CLK_APMU_EDP1_PXCLK]		= &edp1_pxclk.common.hw,
 	[CLK_APMU_PCIE_PORTA_MSTE]	= &pciea_mstr_clk.common.hw,
 	[CLK_APMU_PCIE_PORTA_SLV]	= &pciea_slv_clk.common.hw,
+	[CLK_APMU_PCIE_PORTA_DBI]	= &pciea_dbi_clk.common.hw,
 	[CLK_APMU_PCIE_PORTB_MSTE]	= &pcieb_mstr_clk.common.hw,
 	[CLK_APMU_PCIE_PORTB_SLV]	= &pcieb_slv_clk.common.hw,
+	[CLK_APMU_PCIE_PORTB_DBI]	= &pcieb_dbi_clk.common.hw,
 	[CLK_APMU_PCIE_PORTC_MSTE]	= &pciec_mstr_clk.common.hw,
 	[CLK_APMU_PCIE_PORTC_SLV]	= &pciec_slv_clk.common.hw,
+	[CLK_APMU_PCIE_PORTC_DBI]	= &pciec_dbi_clk.common.hw,
 	[CLK_APMU_PCIE_PORTD_MSTE]	= &pcied_mstr_clk.common.hw,
 	[CLK_APMU_PCIE_PORTD_SLV]	= &pcied_slv_clk.common.hw,
+	[CLK_APMU_PCIE_PORTD_DBI]	= &pcied_dbi_clk.common.hw,
 	[CLK_APMU_PCIE_PORTE_MSTE]	= &pciee_mstr_clk.common.hw,
 	[CLK_APMU_PCIE_PORTE_SLV]	= &pciee_slv_clk.common.hw,
+	[CLK_APMU_PCIE_PORTE_DBI]	= &pciee_dbi_clk.common.hw,
 	[CLK_APMU_EMAC0_BUS]		= &emac0_bus_clk.common.hw,
 	[CLK_APMU_EMAC0_REF]		= &emac0_ref_clk.common.hw,
 	[CLK_APMU_EMAC0_1588]		= &emac0_1588_clk.common.hw,

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

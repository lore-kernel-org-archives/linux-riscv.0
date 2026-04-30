Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6D9CCFA13
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 10:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lsrJvGLWCoGqirBFOh5o/OIIRwavArKtt/3Iqh8OB0w=; b=1RmlcrVVWgW/ke
	ntBe7yjXhW8mMLHYCOcudK3XmK7RWV1e3JiRMbEZPCpKhnWiJfWoEEQYJFrScWT1KE7gN6fjNex1j
	qDoP/B0DGzNsaxKhpr/CYiWAahtjAnQg19ptv3gmJUViiojbrzgQtgRvRaRjvfEru3GPwCT7B7Um5
	oHGdhierJ3BAdmWdEoTmkMz2pcMtlhYubkyCQmalv+FrRtihO3dP2RvUIeATHcZI3DvUTdkLludmi
	c5zc7f8DjZtXX15LLluGvOHueFHr6Eom1SBzdOUJXq9wnNJZfP3gVJvjkdSf/7c6z3DEDaQWgNDun
	PFs/7UjXlQi9J7XD+5JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOfq-00000005CQs-32BK;
	Thu, 30 Apr 2026 10:31:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOfp-00000005CQU-0JAQ
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 10:31:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CF8160180;
	Thu, 30 Apr 2026 10:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D73C2BCC4;
	Thu, 30 Apr 2026 10:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777545072;
	bh=IpiL+RBz1lSzMr/JnmJS8SeVm2TVfTS8BYtTohl5w98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KEKdrlDGtaguhU3e9fRgZySaUtO6E6il83MyyA3lCmKKQ+CgDeSn0xB1W35/OyTxA
	 Jj4lJE2j1zyqgkvVqxd69avVGK0QLwKcbxHy3LLoH2LF4cuDKauhXa8PFDH/XJN/P+
	 6O44Yr78vHsseSOsUHZvAilRbOhA5NYbzFpa6jHx8nQiDNWQVw0zOa99063wjTrARK
	 t4XPqZtGx6yJT/U/5er83kVLGr2jODtLfkAvVbQjQGI6XmJDOTQq+W0+RfegJZY1Yq
	 1r8sY6PpQyBzNnT87kTVRIZuvlnbB2ck4/3bOH0a10R9QRhsln3K29c9q4ZVIOGtXW
	 LklVkBj8Gcpvg==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 30 Apr 2026 10:30:27 +0000
Subject: [PATCH 2/4] clk: spacemit: k3: Add PCIe DBI clock
MIME-Version: 1.0
Message-Id: <20260430-06-pci-clk-fix-v1-2-32fdc77c02ab@kernel.org>
References: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
In-Reply-To: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3245; i=dlan@kernel.org;
 h=from:subject:message-id; bh=IpiL+RBz1lSzMr/JnmJS8SeVm2TVfTS8BYtTohl5w98=;
 b=owEB6AIX/ZANAwAKATGq6kdZTbvtAcsmYgBp8y9W4tjslaqQWKo0VLk22lTFGGPnVzG4a1Kbr
 XrkhnSSpvGJAq4EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCafMvVhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2cww/410ftVHlIPv/3hC8bUZOVC+fddhyL9Jjqfckpoh1x59BOYjNyFvHOU
 qUXDfoKPXvmnAIHtHT+MrX8o7RfX1mF85cNEhiW5R3WnLquVNSrJ6R7DCX1/8zdykwDp+xT+6E+
 YNJT6f5+6wnldI107HLVi1PCCgRw+W7CoXyk97O99O72QHArBC/oxcg4lJOyJlXBYA4WNvLRpHr
 C2ZRiKMURX660AjyHIoAIMYwkCMCas7vbEyN3IeFN5kzmzPTP5mFyUkk6JOS6NekyUvAZyo1pIR
 Sapmlgka4/MPk7bIXqEDUFcN3Cu58OQV2k+Ea971SHTSNnboVoAQIl8OaTsrI6UnJlCk15v1U4U
 s97JS+tpzeHBrOnAgQLei83p+kkcxrIWO2mtPLHJmZKrMEEEHgq1ysLGB8vvBNzC7zR25+5goxg
 I9cXp5MpuI+ymtHJZp4r7+5F0sk18/L3cV5uecMblBe7DLNm1SmRzDzeu61uy3dIEzrM0us9ego
 ejWm4cgbIqiNvZqngTspnWwXHrsAAnQBHOKty9V0xY5B+zkJ1VQ/YOlKcZGV5bS+fa5v4m5yqZS
 fLUy9Qtjx+ex1oK5tAQiCsWtC22FuFdAtgjZakDoTGCuOrpyItYDN3oyN0hA1EnGpyv3ENO9opi
 CQfmg9T8esiZjk1kAul2D4xVNlSOQ==
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

Add PCIe DBI (Data Bus Interface) clock which was missing.

Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/clk/spacemit/ccu-k3.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index e98afd59f05c..bd60c0d776b4 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -949,14 +949,19 @@ CCU_MUX_GATE_DEFINE(edp1_pxclk, edp1_pclk_parents, APMU_LCD_EDP_CTRL, 18, 1, BIT
 
 CCU_GATE_DEFINE(pciea_mstr_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_A, BIT(2), 0);
 CCU_GATE_DEFINE(pciea_slv_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_A, BIT(1), 0);
+CCU_GATE_DEFINE(pciea_dbi_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_A, BIT(0), 0);
 CCU_GATE_DEFINE(pcieb_mstr_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_B, BIT(2), 0);
 CCU_GATE_DEFINE(pcieb_slv_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_B, BIT(1), 0);
+CCU_GATE_DEFINE(pcieb_dbi_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_B, BIT(0), 0);
 CCU_GATE_DEFINE(pciec_mstr_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_C, BIT(2), 0);
 CCU_GATE_DEFINE(pciec_slv_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_C, BIT(1), 0);
+CCU_GATE_DEFINE(pciec_dbi_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_C, BIT(0), 0);
 CCU_GATE_DEFINE(pcied_mstr_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_D, BIT(2), 0);
 CCU_GATE_DEFINE(pcied_slv_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_D, BIT(1), 0);
+CCU_GATE_DEFINE(pcied_dbi_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_D, BIT(0), 0);
 CCU_GATE_DEFINE(pciee_mstr_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_E, BIT(2), 0);
 CCU_GATE_DEFINE(pciee_slv_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_E, BIT(1), 0);
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
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

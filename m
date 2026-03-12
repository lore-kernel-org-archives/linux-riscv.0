Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ECC103E301
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 10:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxuSUpEic+Y+3wmNJHWttVNfFaUNERmRTDLM1cpvLHU=; b=Uvksle13kKeUsX
	YGhLvTl/7DbW/zxL1s9SrNEhSJAV6IVpNNHyt8IdY+koOfrHnTHvCzaTX++Dilau7AJMCZij+JWXF
	N1EkDB91P0mdayVx0eadWgjlC1J737I+/6hkKiiMtbknhUuKxhluNgx6uv8rlVdR6jWwkrUub/Vls
	1xVPuUFmVt2Tki55CMn6CV8FtF4PI1z2aBdMc6ybR6QkqM3P5KZbMECfszQmtbdnb0iArgWNy7UKd
	fzQTADh5M/t6srR9z8Tz7HGTBKuyBZPv2G9XE271mXG5gaZ70T19pyt7CVJIaN/FRgdhYWfYl03CL
	ODAgunbjuWa0YgqT8ofA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dNK-0000000DsCJ-3mMo;
	Thu, 12 Mar 2026 10:34:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dNI-0000000DsBw-3Eao
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 10:34:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FEAB443E6;
	Thu, 12 Mar 2026 10:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359DDC4CEF7;
	Thu, 12 Mar 2026 10:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773311680;
	bh=4vJ6d7QV3xPwTiykwfhRJzRwAyeVmoWsLoGPFgfmzm8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FMiq6hNu2fSPkZAoChA+OY3rsaeClBJUNjaGrA4OoxLhg19MOS96dCTbyvEiCK52+
	 3o3Sz7O1hxxZShzlfuTGBRV+G4REkXSBzLoWWqk+5olXaCx7Wssh4rql0Uj7R5TLCF
	 L6XPs+OGAkkM6lAKeGdFcExvL55rdr4D5IlCyCbeHBCTdUkM9pICKTU9ub0FjgXc+2
	 8FEKAP+xbRWjkYDllEhUMRaUVUPvEXnlfmXM1wRvXLVDBVZ3speZLlXtrFa7n0xbJk
	 62ZZtTFClbn2cLobTWHH5ibaei+7PdV737TTkTM3gMUOJxH9UyzNTNGm8TIz1L03h1
	 lWYz+j+M4D4GQ==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 12 Mar 2026 10:34:20 +0000
Subject: [PATCH 2/2] reset: spacemit: k3: Add individual reset lines for
 USB, PCIe
MIME-Version: 1.0
Message-Id: <20260312-01-k3-reset-usb-pci-v1-2-022b24b7340f@kernel.org>
References: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
In-Reply-To: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Junzhong Pan <junzhong.pan@spacemit.com>, 
 Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4967; i=dlan@kernel.org;
 h=from:subject:message-id; bh=4vJ6d7QV3xPwTiykwfhRJzRwAyeVmoWsLoGPFgfmzm8=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpspaz/pVzM7e18puyPKELV6xMhE3HoSQ8uC9B+
 Nwrv+1mIFCJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabKWsxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1ZrA//RzGpjGigz45qGwFV2To8lsLhZ64SokRG5vKKj1vwOKA5eXHCbQlwW
 t2HLAeIABB6ic2Iug2CRXyQrDy6V+gX1oN6GfGDZnSQTQZqlIuJmYD1YILMiB0naqt5i7hUQqPU
 /fouQamRSwrgsZQtghRiSo1x6QVWezC1n0epVY2Esxd8A9A2yQ9iiGfUjZ/rUzz76Tqbx6G/6b+
 y3Aa8rAB8076KpMqzwe6Z+2ae/uy/J1XmR19+Pq9Eu69x0a2EQ/g+OwDbbDt9K8mJZ/BdJIAjcF
 tQA4jehxhhMDrRd6esOdYwxfIvZs+XIra3HvAMiJJ57PQMLI1SiCMeVykkaQmQG700waeuPUP9u
 403YrOPm8sRRRvLAAN3uQRAg++hEWuEtC4l8/EMmJQ32/wwy+6lu1oXespixWsxB57JzhKkPrqT
 SL/lUzHfENqqDTLn/gBrALlRYl5ONGLYZidLZF8T8vVTdmtwGipYNIq092V+sIv1nWOkpn0d7+l
 Yv7zyaFzAT2Cq6DcLK5ANT238aNc7gDhkn6/YKXtJhnSJd1UiNNU7gayrl4ybb2Yakm48BOBQqM
 YTaSgcQ1xxGKBsII+bKCDrVzFO9Fj0YsFfaB4Vv7G8k+6Ppm0Rj8PF2fYIUpJILoNnx4B4E+zP/
 fQTcFGOjotbGOfgVCcGP0BNzxwSXzg=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_033440_897045_1E7FFA97 
X-CRM114-Status: UNSURE (   7.80  )
X-CRM114-Notice: Please train this message.
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

The DWC3 USB host controller in K3 SoC has three reset lines - AHB,
VCC, PHY. The PCIe controller also has three reset lines - DBI, Slave,
Master. So, decouple USB and PCIe reset line to individual ones.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/reset/spacemit/reset-spacemit-k3.c | 50 ++++++++++++++++++------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/reset/spacemit/reset-spacemit-k3.c b/drivers/reset/spacemit/reset-spacemit-k3.c
index e9e32e4c1ba5..9f58526b0119 100644
--- a/drivers/reset/spacemit/reset-spacemit-k3.c
+++ b/drivers/reset/spacemit/reset-spacemit-k3.c
@@ -112,16 +112,21 @@ static const struct ccu_reset_data k3_apmu_resets[] = {
 	[RESET_APMU_SDH0]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
 	[RESET_APMU_SDH1]	= RESET_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
 	[RESET_APMU_SDH2]	= RESET_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
-	[RESET_APMU_USB2]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
-				BIT(1)|BIT(2)|BIT(3)),
-	[RESET_APMU_USB3_PORTA]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
-				BIT(5)|BIT(6)|BIT(7)),
-	[RESET_APMU_USB3_PORTB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
-				BIT(9)|BIT(10)|BIT(11)),
-	[RESET_APMU_USB3_PORTC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
-				BIT(13)|BIT(14)|BIT(15)),
-	[RESET_APMU_USB3_PORTD]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
-				BIT(17)|BIT(18)|BIT(19)),
+	[RESET_APMU_USB2_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_USB2_VCC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(2)),
+	[RESET_APMU_USB2_PHY]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(3)),
+	[RESET_APMU_USB3_A_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(5)),
+	[RESET_APMU_USB3_A_VCC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(6)),
+	[RESET_APMU_USB3_A_PHY]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(7)),
+	[RESET_APMU_USB3_B_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(9)),
+	[RESET_APMU_USB3_B_VCC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(10)),
+	[RESET_APMU_USB3_B_PHY]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(11)),
+	[RESET_APMU_USB3_C_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(13)),
+	[RESET_APMU_USB3_C_VCC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(14)),
+	[RESET_APMU_USB3_C_PHY]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(15)),
+	[RESET_APMU_USB3_D_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(17)),
+	[RESET_APMU_USB3_D_VCC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(18)),
+	[RESET_APMU_USB3_D_PHY]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(19)),
 	[RESET_APMU_QSPI]	= RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(1)),
 	[RESET_APMU_QSPI_BUS]	= RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(0)),
 	[RESET_APMU_DMA]	= RESET_DATA(APMU_DMA_CLK_RES_CTRL,	0, BIT(0)),
@@ -164,16 +169,21 @@ static const struct ccu_reset_data k3_apmu_resets[] = {
 	[RESET_APMU_UFS_ACLK]	= RESET_DATA(APMU_UFS_CLK_RES_CTRL,	0, BIT(0)),
 	[RESET_APMU_EDP0]	= RESET_DATA(APMU_LCD_EDP_CTRL,		0, BIT(0)),
 	[RESET_APMU_EDP1]	= RESET_DATA(APMU_LCD_EDP_CTRL,		0, BIT(16)),
-	[RESET_APMU_PCIE_PORTA]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_A,	0,
-				BIT(5) | BIT(4) | BIT(3)),
-	[RESET_APMU_PCIE_PORTB]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_B,	0,
-				BIT(5) | BIT(4) | BIT(3)),
-	[RESET_APMU_PCIE_PORTC]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_C,	0,
-				BIT(5) | BIT(4) | BIT(3)),
-	[RESET_APMU_PCIE_PORTD]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_D,	0,
-				BIT(5) | BIT(4) | BIT(3)),
-	[RESET_APMU_PCIE_PORTE]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_E,	0,
-				BIT(5) | BIT(4) | BIT(3)),
+	[RESET_APMU_PCIE_A_DBI]		= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_A,	0, BIT(3)),
+	[RESET_APMU_PCIE_A_SLAVE]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_A,	0, BIT(4)),
+	[RESET_APMU_PCIE_A_MASTER]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_A,	0, BIT(5)),
+	[RESET_APMU_PCIE_B_DBI]		= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_B,	0, BIT(3)),
+	[RESET_APMU_PCIE_B_SLAVE]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_B,	0, BIT(4)),
+	[RESET_APMU_PCIE_B_MASTER]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_B,	0, BIT(5)),
+	[RESET_APMU_PCIE_C_DBI]		= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_C,	0, BIT(3)),
+	[RESET_APMU_PCIE_C_SLAVE]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_C,	0, BIT(4)),
+	[RESET_APMU_PCIE_C_MASTER]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_C,	0, BIT(5)),
+	[RESET_APMU_PCIE_D_DBI]		= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_D,	0, BIT(3)),
+	[RESET_APMU_PCIE_D_SLAVE]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_D,	0, BIT(4)),
+	[RESET_APMU_PCIE_D_MASTER]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_D,	0, BIT(5)),
+	[RESET_APMU_PCIE_E_DBI]		= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_E,	0, BIT(3)),
+	[RESET_APMU_PCIE_E_SLAVE]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_E,	0, BIT(4)),
+	[RESET_APMU_PCIE_E_MASTER]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_E,	0, BIT(5)),
 	[RESET_APMU_EMAC0]	= RESET_DATA(APMU_EMAC0_CLK_RES_CTRL,	0, BIT(1)),
 	[RESET_APMU_EMAC1]	= RESET_DATA(APMU_EMAC1_CLK_RES_CTRL,	0, BIT(1)),
 	[RESET_APMU_EMAC2]	= RESET_DATA(APMU_EMAC2_CLK_RES_CTRL,	0, BIT(1)),

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

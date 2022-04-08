Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F413BC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 13:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRn+WPaQ7oz4bTja4TbuYPngPV4vL1QjQc4GiDyTKNQ=; b=bpKx4NCRHnSpT8
	1gYNdY1no13A/fyUbmPzT1p90TF8paGNtBqp6UbwOFjuZGL3QWNj/D+moGmB+2FIt0FX1XZiLniBs
	2D/TAPPWdXwFOX7PPCpoVmKpDIYZ1HJUCQGQun2Ule5ZNpMWWAWCp8udvmhqEyYPn3skKTp/gjgQp
	gj1CxJV3vWc/8cu2IPXLnIyZuVqgOhqDdnuCuywbwm0PE3oLf2DPy5yHA9/NxlNL73Zn6bZaxSj0S
	MCseuYLSGdqp3TqUUzGyeLVzNi4trlIjAZK+IPWIYqFmlpn6L31hhJdl70y/KNrBz4X6eHkhgV03b
	8nNMaOJ8ZxTFuNY05gKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncomx-00HOKH-NU; Fri, 08 Apr 2022 13:36:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncoml-00HOCT-Pt
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 13:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649424983; x=1680960983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZE/cIBg2Sdnpqycyh4VnV3YYtximyDUjNsk8ktF/LLk=;
 b=LeNC1Xz6RscKYkluIfeajR7VEoJfo8871PBoKYKNCLrF5r9W3LvcyIfC
 EMEFwYG6h62jTY/ETKRvVBPSnU3KfLaxtQ45CkQGW8Z+Vc/+2HY+fqpjD
 vKZdylubDt3hEczpjO6b8l33lSNk6DtQAVGBmAoTs835JJWOJr4B6z9Kc
 q8PC1S54RCiksHjR2Orl+Gd3Uk9hju+IAaKhsKF7AVPmNdW5qs5ou0amU
 Bq7H1Mh8wGvTxNZ+Q8S3MsHAtY5RXMV9zaPb4Fwe3fSjnvWYEIucG+pix
 U1Dq9+5CO0gsIlmvEQe3hLbIPi/YmJHgBp3FejkHmtdVe9FQQGxmIGTSk Q==;
X-IronPort-AV: E=Sophos;i="5.90,245,1643698800"; d="scan'208";a="91766885"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Apr 2022 06:36:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Apr 2022 06:36:22 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 8 Apr 2022 06:36:20 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>
CC: <daire.mcnamara@microchip.com>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 2/3] clk: microchip: mpfs: mark CLK_ATHENA as critical
Date: Fri, 8 Apr 2022 13:35:43 +0000
Message-ID: <20220408133543.3537118-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408133543.3537118-1-conor.dooley@microchip.com>
References: <20220408133543.3537118-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_063623_967647_A99A013E 
X-CRM114-Status: GOOD (  10.26  )
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

CLK_ATHENA is another fabric interconnect and should be marked as critical
as with FIC0-3, since disabling it will cause part of the fabric to go
into reset.

Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index bf2fd855cc58..c82a79a5979f 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -237,8 +237,10 @@ static const struct clk_ops mpfs_periph_clk_ops = {
  *   trap handler
  * - CLK_MMUART0: reserved by the hss
  * - CLK_DDRC: provides clock to the ddr subsystem
- * - CLK_FICx: these provide clocks for sections of the fpga fabric, disabling them would
- *   cause the fabric to go into reset
+ * - CLK_FICx: these provide the processor side clocks to the "FIC" (Fabric InterConnect)
+ *   clock domain crossers which provide the interface to the FPGA fabric. Disabling them
+ *   causes the FPGA fabric to go into reset.
+ * - CLK_ATHENA: The athena clock is FIC4, which is reserved for the Athena TeraFire.
  */
 
 static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
@@ -269,7 +271,7 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
 	CLK_PERIPH(CLK_FIC1, "clk_periph_fic1", PARENT_CLK(AXI), 25, CLK_IS_CRITICAL),
 	CLK_PERIPH(CLK_FIC2, "clk_periph_fic2", PARENT_CLK(AXI), 26, CLK_IS_CRITICAL),
 	CLK_PERIPH(CLK_FIC3, "clk_periph_fic3", PARENT_CLK(AXI), 27, CLK_IS_CRITICAL),
-	CLK_PERIPH(CLK_ATHENA, "clk_periph_athena", PARENT_CLK(AXI), 28, 0),
+	CLK_PERIPH(CLK_ATHENA, "clk_periph_athena", PARENT_CLK(AXI), 28, CLK_IS_CRITICAL),
 	CLK_PERIPH(CLK_CFM, "clk_periph_cfm", PARENT_CLK(AHB), 29, 0),
 };
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

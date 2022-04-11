Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72429C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 09:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QS91waLG8GJn2Z2eIYOxx+VgisuOziKZzIgTYfF9we0=; b=4i6VWkYtUJq6iL
	TGAMk1+FcBMV1u7LTu9Jz7rpAi/2dFK52Dl8KMXCH+2g/rRY3Yyp3cM/jFSg58+tuQU+p856pcvDG
	pwrexZ1hpy90vV/LkuufqMjLZXkRzo2bcJCw4yBQlmrXHcoiD7NEO2G5vo35FggOUC0/Cyy4i+/Gt
	JmKOE6icSg6jT7updAM+JU1Mb8ctL/QFAJIirg7e50vXQ/lEBJiVV4fgjU5rJuUzj2E71M+9/z9Te
	//P3OInloK21fZvFwlqNDCjxW0g58p4bO1HvscL8aQoALhuZUDLeCMrix0yg1AlCLg6KYrYBzBp5+
	U56y1N58GOfKziWXQDaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndpuc-007hhg-LO; Mon, 11 Apr 2022 09:00:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpuL-007hUH-2T
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 09:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649667625; x=1681203625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EWytXuYekgoEisOZ0234lmOJ3vcDaaP1r/uaU+xZy7s=;
 b=0bsieISWGoCX9T70oluw8VoPohUBSWIO6wNVcSLNlaOVK5Vxqrh+TSAT
 HNVHfnQw/6Afdq6oSjFdl51GmAr8lI6WN48qBm2G4cCwsOUwzAX1dFENV
 AnR0zjnBRoiWvuN2UaEj0HQHL0C2JzxtUUZiRuQvd89erHNV9gwZ99Q3O
 jsJt4idR91HU2W9pu++CjycsnpS+G43VqDOdye9vhKlcL3GVRXhQfESt0
 /JDg8HS0tru7s/wLLgJnR6egJWR8QFTbpWpxc9Kz133uTO8s2RbpQ6hQI
 Is0keRbtd+QcIwry+DRrdz0c/JZfvNI5WGidYgUwfw3f88aHx78Pgae1l g==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; d="scan'208";a="152206716"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2022 02:00:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 02:00:23 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 11 Apr 2022 02:00:19 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/9] clk: microchip: mpfs: mark CLK_ATHENA as critical
Date: Mon, 11 Apr 2022 09:59:10 +0100
Message-ID: <20220411085916.941433-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411085916.941433-1-conor.dooley@microchip.com>
References: <20220411085916.941433-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_020025_208674_70627E03 
X-CRM114-Status: GOOD (  10.85  )
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
index 7485a5eeb5c0..a361b8743a32 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -249,8 +249,10 @@ static const struct clk_ops mpfs_periph_clk_ops = {
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
@@ -281,7 +283,7 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
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

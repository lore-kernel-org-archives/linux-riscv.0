Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9332FC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 09:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWZqMTvf0ddCRjKuN41woWh1rX5yqNqyQDeFNHQE7ms=; b=UNj0st1/fNk7rg
	Le13yl57dQ+ORo8Xdiu8k6RuH/dIRa94vALcg6vgiFW8vwXr2Ad+3IR+S+mlRV2Mg5bXjDR9DjW8E
	Lx79rtcV+0C5Q90xmGZjeTS9j0ePTKQPQotsI7HAJwDplwiFzoqTiB1Q13qG87eAMG+CooRG+kGfY
	0+rQ+uiIuk2i3O+gREJ1E6+HkdCFKRzGtjVbgtLDm7QHbLDrb8T91N+2m0uQnLF15lyTBcNyM2omF
	0R7roJ3sGJpUX0Lafo8qkxNmH064W63G9HfzUkYBaMx4tVqCG+sQ6Fdvj+6K9qoiLRhQapMCC4U3w
	EcaFWNS40X+Ld1ea3tbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndpuz-007hz4-OO; Mon, 11 Apr 2022 09:01:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpuT-007har-Ga
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 09:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649667633; x=1681203633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lxe+6YYnQOFRMxYyv3uPO62UdmsWV3nnAQEdb9zRcIU=;
 b=sgdKZ2n/WiE9tPjtfmYxLpV7KXZY8aty6kEha2ZLZkw+Z8WQdfHfRu6V
 caBwIdUfD1UmXYnPr4CGmAm+tcctCsH0CCzDf4IUQ/HPTbA4uW+l07pbX
 MR+BoeDWwD/d7mAElUg1fTejZpdCt+QUeM21dGS5seMRc51EE4RxzprtA
 4JvfwzbQwH/q1wMLQEJuW4/c6Tl6UrTA5kmnR6DwGpaTGkeefrQBx8xgp
 NCMd3ITZ9VKpOO0JS/bgUiyqIgU63f2MApwHwtneZz9rCsPNsdzB6zrgm
 6ZDF+GQ9NGUunvnisONhul41b5Aug3GlE65CyLMhEKsMulCIuFWeL0Ekd w==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; d="scan'208";a="155112892"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2022 02:00:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 02:00:30 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 11 Apr 2022 02:00:27 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 4/9] dt-bindings: clk: mpfs document msspll dri registers
Date: Mon, 11 Apr 2022 09:59:12 +0100
Message-ID: <20220411085916.941433-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411085916.941433-1-conor.dooley@microchip.com>
References: <20220411085916.941433-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_020033_651581_829E44EB 
X-CRM114-Status: UNSURE (   8.44  )
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

As there are two sections of registers that are responsible for clock
configuration on the PolarFire SoC: add the dynamic reconfiguration
interface section to the binding & describe what each of the sections
are used for.

Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFire host binding")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/clock/microchip,mpfs.yaml     | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
index 0c15afa2214c..42919df322ab 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
@@ -22,7 +22,14 @@ properties:
     const: microchip,mpfs-clkcfg
 
   reg:
-    maxItems: 1
+    items:
+      - description: |
+          clock config registers:
+          These registers contain enable, reset & divider tables for the, cpu, axi, ahb and
+          rtc/mtimer reference clocks as well as enable and reset for the peripheral clocks.
+      - description: |
+          mss pll dri registers:
+          Block of registers responsible for dynamic reconfiguration of the mss pll
 
   clocks:
     maxItems: 1
@@ -51,7 +58,7 @@ examples:
             #size-cells = <2>;
             clkcfg: clock-controller@20002000 {
                 compatible = "microchip,mpfs-clkcfg";
-                reg = <0x0 0x20002000 0x0 0x1000>;
+                reg = <0x0 0x20002000 0x0 0x1000>, <0x0 0x3E001000 0x0 0x1000>;
                 clocks = <&ref>;
                 #clock-cells = <1>;
         };
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

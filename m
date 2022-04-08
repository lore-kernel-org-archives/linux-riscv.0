Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3D1C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 14:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Ilcsbj9e3hbBJK9XIOIsnPm11TZ2KgYzQpBdPcMdE0=; b=eHohWsCKQH1olA
	4VYRATwPuzek3A15dKgtwGEIvEcPC9rVVtjRVhSEmYX6C3MpKlUhPqU0+o+BKzTo0wG+E6xWcLGKI
	G4F7jCJe5VYf4MmXZNU3PkaloBfJLRC1f+GQlX974fwCWsxQreEdXEkob13lz3fwHX4QqpJQS9WGx
	rFIg5HqstonHnYmhycMjN1LAKVistfSSU/bDgsiFMH8DfpnjB8ZV7O1L2k7vtekUCJPz/BgdRhycU
	RMrNqLY0vh5DJE3f817MFGqK+IPb7VXj4eyRJZ7IG8UBlF1gtQdY7UcCORFNKUz1ZN053AKRBRvej
	IqTduAOZ+Uy1tOOR2HSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncpkG-0000dh-CR; Fri, 08 Apr 2022 14:37:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncpkD-0000bY-09
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 14:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649428669; x=1680964669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BVZx33NKupiZCfwz779hCCkPFx236F041juK4+XrqfM=;
 b=pWPX84O5PBjo5WMLTv1Dr2IwgQWmrSj5138Paqjzz2zxaaBKcMiN5eD5
 HVxlWRKTLvaqZR5gz5eKTL7OF5KKZ16tj62W9BfBZVzWcAnKNGq/aUues
 gk+rbXC/GA2/31BgSdNmDpBp5yJDflybhlDWJdODdm0e1conXFCvCsZKK
 HvVZure2PDYE15wzGM4MrAp+56uDpD7RlSzJTFOeb7DDE60mlT3iUEUlM
 aQbRN+pAb1i5S13OoFfnLP4EwuSecYYoKXV6ZnekJ/gVqCv/OZE/9nzdM
 gIIg/46iyhcVICyxf+uF/JjJbNNsqv0zqlsf+Ci8TWc9H7BLapAv8oTnc g==;
X-IronPort-AV: E=Sophos;i="5.90,245,1643698800"; d="scan'208";a="152027968"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Apr 2022 07:37:45 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Apr 2022 07:37:45 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 8 Apr 2022 07:37:41 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 1/7] dt-bindings: clk: mpfs document msspll dri registers
Date: Fri, 8 Apr 2022 14:36:41 +0000
Message-ID: <20220408143646.3693104-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408143646.3693104-1-conor.dooley@microchip.com>
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_073749_127525_B2BCF2E7 
X-CRM114-Status: UNSURE (   7.92  )
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

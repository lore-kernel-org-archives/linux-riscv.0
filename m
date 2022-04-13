Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC8CC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 08:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvkTtp3mL79krFn35Eh/Q0lJgqxmiTwcHQ8Cc4XM2xA=; b=BTph4o7R2Cyyq9
	QenDLheR2mY+Zrnu7KC20BakYyz7CeBiJn8pk38ccxA6phBLY/44MfuqkXybpf+D0Bn6sOHL0ZFlU
	Yhg7LFBF1/aE/iUrLgix94tLcP+xP1e4q9K8JQSKablM+LnWKCNgfeAw6F2upuSEZN9Fpm4F9dMsL
	IJmYMJNm1M7ikWFtb7CbS8qpKTfgf1LFLMp5+L7/IVGWBVJG/ijXn7h8forSd88yIufVFZPw9zMsR
	gicBiTGFn42YZwUIu4cEFZuXXTafo66Vt3HT/bNu1TaJag8JnijW7H8bdwnttNuslkyOG5LtWmddi
	MsAXpWZozKv/W3bmlNsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neXx9-00HW5r-8I; Wed, 13 Apr 2022 08:02:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neXx6-00HW4U-8Z
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 08:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649836932; x=1681372932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F5JKJ+sKckh/Yv3PJH0Wx7ATRoah+9bM8XitYjEZqzE=;
 b=zqx7/u+nHKt+IhbyAg/JXJgOPpry8OrAbOd/ziMSAibYZSFxZcbBfcMm
 1P6tihbZCtscW3AGT5dEn9PRBTM3kI/V3fztY65qR9oYgXEJn3n1Gi0WE
 Wnu+3Uiu9+Fl75pIbvBCd0NngA+HmWSMFZ7mFQKkwmuu5z1HboQzD47Zq
 AH3afOENTZuP5ZO4dWjKiJPt7fcdX+ITUKG6JShuDWIMfEFAESPJvnccG
 +fWzn0QJKKVY9MFnjdRms0hRG323GnOD96Glf3TY3Y6Z+KL7wLj7X/V4n
 /u/fp3Z6HZOzIz1ZJW4gTf7THGVWBCW8z2WouSlgXJo4qroboE+SyEBHv g==;
X-IronPort-AV: E=Sophos;i="5.90,256,1643698800"; d="scan'208";a="159940058"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Apr 2022 01:02:11 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Apr 2022 01:02:10 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 13 Apr 2022 01:02:07 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 4/9] dt-bindings: clk: mpfs document msspll dri registers
Date: Wed, 13 Apr 2022 08:58:31 +0100
Message-ID: <20220413075835.3354193-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413075835.3354193-1-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_010212_355161_83D66409 
X-CRM114-Status: GOOD (  10.52  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/clock/microchip,mpfs.yaml   | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
index 0c15afa2214c..016a4f378b9b 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
@@ -22,7 +22,16 @@ properties:
     const: microchip,mpfs-clkcfg
 
   reg:
-    maxItems: 1
+    items:
+      - description: |
+          clock config registers:
+          These registers contain enable, reset & divider tables for the, cpu,
+          axi, ahb and rtc/mtimer reference clocks as well as enable and reset
+          for the peripheral clocks.
+      - description: |
+          mss pll dri registers:
+          Block of registers responsible for dynamic reconfiguration of the mss
+          pll
 
   clocks:
     maxItems: 1
@@ -51,7 +60,7 @@ examples:
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

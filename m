Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9CEC4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 14:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AVpGiSiTIyXfurp1c+K6Rxt5g4rck3juR9tNnhkULnA=; b=neeXTRf+0SvCHH
	DoHUgTpEKEG7gGfuokGWWMn3kf4kmgx7S7Ug9ncWu0kTAmFVhUnEiL1nbeFubU3GWEOLd/gYoUxWZ
	bZO2ewOM+cOgRg6mGcxQRzTCSMOtqAu/7Tw6hJgJMN2CFloSNwV/WbMeHs43PotkqX80KreofcQSn
	wEdUh5/cv6+OKyP2bbmrb8/TsWQH0J+JLBB32qxy0iLy5oUDe1qkwVnBpDk8aX9xVZXKctNGhSkDe
	kYXG5fts9XaRTBW8pVOUyLjAe+nQH6/Sw8XAvQ/W0nYnNN3YblFjpFFcvO79qA+CIiCDbQ9lszGMj
	d0CKNKyo3vR/ikpQ+gqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2XX7-0000000Cw7s-2XS3;
	Thu, 02 May 2024 14:35:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2XX4-0000000Cw6B-2OU0
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 14:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1714660534; x=1746196534;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=srvRpnt+6CmvKsyLXphEyCpMECe+q0Va3JX9d0EkVVw=;
  b=ZM7KHw94u4uOuQAB+H32LLYnWphpiBwZhSZZs4Nv4zQA9A3ytJckb8vF
   1ZQhAyyAl2vstnMNbfqJxHREdYkUtCfBER/m1ffheZq6JEj4pQ5e1Oi/b
   9/5JRn1LYEE9Fh1lRreGmstwTlCASjRcYDVUijmqnNzdwFZuKZhJzTzM3
   rKZDht8i90cq+VwRoekaNNCtnWMy6UiZJTGbt4TFBC/JEsHWf/RIpfGWM
   fzv8M2j5FwDZ4LOP6B2gMutMkQgLa5R7zM6B/0harVmjgfTumDEiRGb94
   V1JxpZThOoJwYH8LWWc000rw24ipQjWS0Id76TR3AE8l6TNmeOpLfoUH6
   g==;
X-CSE-ConnectionGUID: F9keJgHaQq6ZBD0kgjKFCA==
X-CSE-MsgGUID: 2p2e97gBSBSzumW7E9JOdA==
X-IronPort-AV: E=Sophos;i="6.07,247,1708412400"; 
   d="scan'208";a="190725994"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 May 2024 07:35:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 07:34:52 -0700
Received: from Lily.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 2 May 2024 07:34:50 -0700
From: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, Prajna Rajendra Kumar
	<prajna.rajendrakumar@microchip.com>
Subject: [PATCH 2/3] spi: dt-bindings: Add num-cs property for mpfs-spi
Date: Thu, 2 May 2024 15:34:09 +0100
Message-ID: <20240502143410.12629-3-prajna.rajendrakumar@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240502143410.12629-1-prajna.rajendrakumar@microchip.com>
References: <20240502143410.12629-1-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_073534_794353_CCB832D9 
X-CRM114-Status: UNSURE (   8.74  )
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

The PolarFire SoC SPI controller supports multiple chip selects,but in
the MSS, only one CS line is physically wired. To reflect this hardware
limitation in the device tree, the binding enforces that the 'num-cs'
property defaults to 1 and cannot exceed 1 unless additional
chip select lines are explicitly defined using GPIO descriptors.

Fixes: 2da187304e55 ("spi: add bindings for microchip mpfs spi")
Signed-off-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
---
 .../bindings/spi/microchip,mpfs-spi.yaml      | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
index 74a817cc7d94..19951951fdd6 100644
--- a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
@@ -13,9 +13,6 @@ description:
 maintainers:
   - Conor Dooley <conor.dooley@microchip.com>
 
-allOf:
-  - $ref: spi-controller.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -43,6 +40,22 @@ required:
   - interrupts
   - clocks
 
+allOf:
+  - $ref: spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,mpfs-spi
+      not:
+        required:
+          - cs-gpios
+    then:
+      properties:
+        num-cs:
+          default: 1
+          maximum: 1
+
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

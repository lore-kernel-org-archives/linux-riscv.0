Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513B8C32793
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 07:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7zyGlKSolwXsDTSk0dA+7hxKuT6ICDS6QuR3Io37mQ=; b=XTkTutUtPHps5w
	7hPKHVq8XJKeQKhzO373Ats9pyMv8ku1TCspPezDw7cjEgaVrW/W+O960WyERjqgv5r5QK2cdVBd2
	wbJrCdbo5iHCbd2nQsgO633USyYichbgiXTLmSSglB16WOCbTDJGNnFAGrRX6fjMVdo3tx8RWdsKr
	6P3lHSiMyap1dMPBtYju1OrZJv5oVWq6pTt6toNoSw+10hdGxiSWd8OYjybJC9rNa1w2Dt9GRTEK5
	Dv2nLJeHHW/DCokEwUeToAUUYRFghlLKsKJ/s0v/Jphxmpgn3vGDuBN1h/14uvroIZAUcpQRO7lLk
	J+peLaJdE7F2S0l3gNdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQkVJ-00B3u4-83; Wed, 24 Aug 2022 07:08:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQkVG-00B3sl-HE
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 07:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661324922; x=1692860922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=81PIQ4oU2nHHaT+a+f2peD1/PAaHzqplOIRgk1gmyjA=;
  b=RidzpIP+pl5YeM0lKk4M04yH4JZZbjMtHAehpRvRuCEeWTeJtTD8P5Bk
   PSxG5FQp5Z6rrk1vlB7jQgKCqTljznnT0ajLMyhKByvql6dF2QxcFE3Rn
   AkIx69GgXJbByAFqBS3RNckTqlZwnhiXYt4aQtNISPSGj4bYXYOdkz4F/
   7wsSOfVzKulNM5Ci5sk/zvQ4FtOHZCwde70MQDNbRUdbeFBSS2LkuEtUg
   OYG5gq9NiAni44KYLNxLDv6w+a4QQzknfrIZhA23h+YUasxCqwy2ZpRHn
   Y/BH+RXnDMKaHfcCbyru8haJtr86MibV2R4n9wEOq1yoveCrMa0kPEG0T
   A==;
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="173867262"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Aug 2022 00:08:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 24 Aug 2022 00:08:41 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Wed, 24 Aug 2022 00:08:39 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: mailbox: fix the mpfs' reg property
Date: Wed, 24 Aug 2022 08:08:10 +0100
Message-ID: <20220824070810.52219-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220824070810.52219-1-conor.dooley@microchip.com>
References: <20220824070810.52219-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_000842_678717_2A4A22FA 
X-CRM114-Status: UNSURE (   8.46  )
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

The "data" region of the PolarFire SoC's system controller mailbox is
not one continuous register space - the system controller's QSPI sits
between the control and data registers. Split the "data" reg into two
parts: "data" & "control".

Fixes: 213556235526 ("dt-bindings: soc/microchip: update syscontroller compatibles")
Fixes: ed9543d6f2c4 ("dt-bindings: add bindings for polarfire soc mailbox")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/mailbox/microchip,mpfs-mailbox.yaml  | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
index 082d397d3e89..935937c67133 100644
--- a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
@@ -14,9 +14,15 @@ properties:
     const: microchip,mpfs-mailbox
 
   reg:
-    items:
-      - description: mailbox data registers
-      - description: mailbox interrupt registers
+    oneOf:
+      - items:
+          - description: mailbox control & data registers
+          - description: mailbox interrupt registers
+        deprecated: true
+      - items:
+          - description: mailbox control registers
+          - description: mailbox interrupt registers
+          - description: mailbox data registers
 
   interrupts:
     maxItems: 1
@@ -39,7 +45,8 @@ examples:
       #size-cells = <2>;
       mbox: mailbox@37020000 {
         compatible = "microchip,mpfs-mailbox";
-        reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318c 0x0 0x40>;
+        reg = <0x0 0x37020000 0x0 0x58>, <0x0 0x2000318C 0x0 0x40>,
+              <0x0 0x37020800 0x0 0x100>;
         interrupt-parent = <&L1>;
         interrupts = <96>;
         #mbox-cells = <1>;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E902DC00140
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 12:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0fQNcdiy+sw6TwaWiklHI058APcFe3IrFuARngZZLw=; b=Yq8inYQG2t44oy
	reKo/KT2GE/qP5IKijERTFPn7FUnFeN4pyMjT+ZlGUV+ui37u1uDWB3VkudT3ln2BGw5W6azULdUU
	uz+uK07DHyPDRN8Hy1MikYtItF5YUBnGLEEqotDXoHMTPbgxEmptYbgN0JKjn3dmg7x5AOTYOSoow
	U3dozs8gWh7k9b36dgtORs3yQWU8V4iykNmJLoXTYSn8l9VUD/I3dt8YBx6fveaLdGwzEKr/e89qX
	JN6LHNCiHHs2VHcIHkwE56o25wUcV3T2re6ryvAk4vPqpEcGXep1FDsGhBiPaVySsEC5OsR9/bPZ8
	gJjn6FphSDzsz14koqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJwtD-00FBy2-0k; Fri, 05 Aug 2022 12:57:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJwrv-00FB0a-O3
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 12:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659704159; x=1691240159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1bVplGfcpRSCACZ3qKsPFsudC5vt7I+hPtcbEhpUdZ4=;
  b=Gmcc92Q4pK0zEmjUmOQwKTjbpaAHlwgXDGcoOtxC44BzkgBYw7ZDMZjD
   xpHquCcHkc988cmK2/3aNLtuCLCK1nUb0GpSi0mvzpxfcjRoyTL192h+W
   A7kChVKF375S0WIHD+nUFRa5Xuh8Ftnsfesi6jdY0g9Y88r3LZ0MlSBJn
   WreUO+NrDwkl5XObuAgixVuJqtDWy2PNjYF3nM5KKxkhn5Al8V/h3Y5Ui
   dT3tTx1R+nxdh07s6PZguX3uoGKI2YpALp1SyNvYssqz8VdjhTUB3ujat
   2/1rYNd0t0pM3UghvzuTuhlLDr/WlTVNQt/kXbAlSRLb4Ye5lOgon5EtW
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="175226473"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Aug 2022 05:55:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 5 Aug 2022 05:55:53 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 5 Aug 2022 05:55:52 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH 1/3] dt-bindings: mailbox: fix the mpfs' reg property
Date: Fri, 5 Aug 2022 13:56:17 +0100
Message-ID: <20220805125618.733628-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805125618.733628-1-conor.dooley@microchip.com>
References: <20220805125618.733628-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_055559_855194_EA1A6EA9 
X-CRM114-Status: UNSURE (   7.37  )
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

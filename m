Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F70C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 06:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lm6ZtaT7Zgg8VriZWMFhs9UdkBdWnmHtLiU91lKWohs=; b=0IoGZ+XI2B6/i2
	v3k51Ix4bzuv8njZ8wVhA/Uj93b1Laq7r/VxmYwK6aVXZwdGgkZoxG/MQN6Ihsglhi5/iwminF1gF
	VUuZqZZiUQB7FleMVNjgshhTTsIxyGBPhd+s5IkjhWCtZ4OF9MDlOLmizixJcPUGdHmZnKu7pE/FU
	O4BG1HqdOzgCVYeRyF1TolrjeB+dO/xAMpniQz+VWVBntdKgCABYQ0Q8lnk11nlWCBMu3oq1XF6Uz
	cv1+MSqLYzPTx5wm8U5Fl1DxsExfiYb7wc778/FQqxGrjusxw+4DTU46G+5jUrI5YbeTWm87uOMgs
	j4VdhiSsU2SHKdBHHJSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyTBW-005GWF-1Q; Tue, 07 Jun 2022 06:59:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyT9B-005FL1-6w
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 06:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654585020; x=1686121020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hlo1WukUYxzK83xoEPYlRos2jIXat8SOHdXU82yGAEc=;
  b=xZ/ORtwa9P/eU5Kl9P0RnF2tNmLGrp20/tu8TbUrDJthPFpMZHizhF4J
   5L9cIEtSv9H70RlTI8LMwQZkHIw127dKOJiK/S1KLDOqchENBlWLRIfZR
   fztjXwOa4+IWPkSzOcS4nCynWYrvUWxUsju2FdU7UBbIM7/EFyBX9qR2z
   rK+lovFsZzDOAOJVr0y3/r7kIWTJuPvCRnwppHy3aA/EXquqbA2itipCT
   qDq8RTH1Y7xBne0o4IV5hqczteQjx/qaKTDcHf8+NaB9C+cXKM+XbgJ4m
   w8qELpxRt6Sp3rIizNK4bF1WhqTZp5d9M5RNkq7ZLS9A3ubVqKzqUrPZF
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="162177021"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jun 2022 23:56:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 6 Jun 2022 23:56:56 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 6 Jun 2022 23:56:53 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde
	<mkl@pengutronix.de>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-can@vger.kernel.org>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH net-next 1/2] dt-bindings: can: mpfs: document the mpfs can controller
Date: Tue, 7 Jun 2022 07:54:59 +0100
Message-ID: <20220607065459.2035746-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607065459.2035746-1-conor.dooley@microchip.com>
References: <20220607065459.2035746-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_235701_395972_953C4045 
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

Add a binding for the can controller on PolarFire SoC (MPFS).

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/net/can/microchip,mpfs-can.yaml  | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml

diff --git a/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
new file mode 100644
index 000000000000..45aa3de7cf01
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/can/microchip,mpfs-can.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title:
+  Microchip PolarFire SoC (MPFS) can controller
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+allOf:
+  - $ref: can-controller.yaml#
+
+properties:
+  compatible:
+    const: microchip,mpfs-can
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    can@2010c000 {
+        compatible = "microchip,mpfs-can";
+        reg = <0x2010c000 0x1000>;
+        clocks = <&clkcfg 17>;
+        interrupt-parent = <&plic>;
+        interrupts = <56>;
+    };
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

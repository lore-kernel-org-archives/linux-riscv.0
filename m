Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6F0E77188
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 21:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rozuhix1r9bGdedgJcOrdw7xgAykcMDB0vhW0w7/EOg=; b=WdHXfW/HmclYId
	6GrFwDgd6pTSPXHqIN2hec95kLf0JQ2iQWU3Aqy9GDa4gmTuI13D4dhXt06trXmrmZIqR8isLk77e
	enx8rQclFWht6ZlfyRcjXIwaF7hD29oJya6IjdKtbvOhDorDIB5c43hH/CkC+uU6KUc1jntswwsmO
	SKzKvgTSfV93vk8VBIV9o+lC/xG0ZoOyaW4WI4Sw47RZnAg28LI+jWTAWE9I5xJ6yfmZZhZRDx+c6
	VvflUa5Zbsro1j3ThP/3r3MIBvXvGUdFVwMsy4wI+rLrP1JFiuibWR3dqlx5wwEsOIbxDEQOaO9EV
	CqZmeTKAX9slvqYT8gWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTpgu-0000000E4sr-2xEI;
	Fri, 03 Jan 2025 21:58:48 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTpgr-0000000E4rg-1ZgE
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jan 2025 21:58:47 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id E8814122FE21;
	Fri, 03 Jan 2025 13:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1735941523; bh=hJzM8qO6q7S6F2fbpuG06hDNs2vS5ySY/p5zd4IHpzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PXv1HsgFq1xrAPUuzRqtRkmevPu0oS1b5x3Zt4mXEIIdiMzRqZNk0USXwyp7F8Hw+
	 wRhYVf3Ab0dELZ/uBlljr4Vdf5qWVRJDmvrSr0lGkUbo8Wubf8783ylhN1Za03IDAm
	 aNY9bo+RWvBU4UkKlwUuW2rBQSRQKDlgZQ8STJNMNid8FreYikaj1YUZF291eN+XON
	 OPK+pgqj3f92ylCJ6VOyHBs4j5ogvehjC8cfm2LjIX0FptOsNwjT/GQIQUY+BTsn4L
	 bBwxv55rjkTvKKY9zhPwTCLksArAUXuTFNibr70vECvbxDTLWUHwLz3ghlnxYw868R
	 t0yBHhMUsVCtQ==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8e3M9s62nOrr; Fri,  3 Jan 2025 13:58:43 -0800 (PST)
Received: from localhost.localdomain (unknown [183.217.81.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 2CA90122FE22;
	Fri, 03 Jan 2025 13:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1735941523; bh=hJzM8qO6q7S6F2fbpuG06hDNs2vS5ySY/p5zd4IHpzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PXv1HsgFq1xrAPUuzRqtRkmevPu0oS1b5x3Zt4mXEIIdiMzRqZNk0USXwyp7F8Hw+
	 wRhYVf3Ab0dELZ/uBlljr4Vdf5qWVRJDmvrSr0lGkUbo8Wubf8783ylhN1Za03IDAm
	 aNY9bo+RWvBU4UkKlwUuW2rBQSRQKDlgZQ8STJNMNid8FreYikaj1YUZF291eN+XON
	 OPK+pgqj3f92ylCJ6VOyHBs4j5ogvehjC8cfm2LjIX0FptOsNwjT/GQIQUY+BTsn4L
	 bBwxv55rjkTvKKY9zhPwTCLksArAUXuTFNibr70vECvbxDTLWUHwLz3ghlnxYw868R
	 t0yBHhMUsVCtQ==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>
Subject: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add spacemit,k1-syscon
Date: Fri,  3 Jan 2025 21:56:35 +0000
Message-ID: <20250103215636.19967-4-heylenay@4d2.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250103215636.19967-2-heylenay@4d2.org>
References: <20250103215636.19967-2-heylenay@4d2.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_135845_595950_6C075E57 
X-CRM114-Status: GOOD (  11.19  )
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

Add documentation to describe Spacemit K1 system controller registers.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
---
 .../soc/spacemit/spacemit,k1-syscon.yaml      | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
new file mode 100644
index 000000000000..79c4a74ff30e
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/spacemit/spacemit,k1-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spacemit K1 SoC System Controller
+
+maintainers:
+  - Haylen Chu <heylenay@4d2.org>
+
+description:
+  The Spacemit K1 SoC system controller provides access to shared register files
+  for related SoC modules, such as clock controller and reset controller.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - spacemit,k1-apbc-syscon
+          - spacemit,k1-apbs-syscon
+          - spacemit,k1-apmu-syscon
+          - spacemit,k1-mpmu-syscon
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  clock-controller:
+    $ref: /schemas/clock/spacemit,k1-ccu.yaml#
+    type: object
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    system-controller@d4050000 {
+        compatible = "spacemit,k1-mpmu-syscon", "syscon", "simple-mfd";
+        reg = <0xd4050000 0x209c>;
+
+        clock-controller {
+            compatible = "spacemit,k1-ccu-mpmu";
+            clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>, <&vctcxo_24m>;
+            clock-names = "osc", "vctcxo_1m", "vctcxo_3m", "vctcxo_24m";
+            #clock-cells = <1>;
+        };
+    };
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

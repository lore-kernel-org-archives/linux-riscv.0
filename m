Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39BFCA5FD6
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 03:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r574OJpr/HKZkYdB4Wh31hDnzWL+r76Og5CpHmPN/uY=; b=CGAamfftUwM9YQ
	1mLmD4g9I6pcZEZZ+uFcfhEE1bIFX7wsQRMZLoV79rXCnGVs+3agbG/bvQHFR67DN6YR34X1qOQEc
	VeMrSC8DT/6cW4vmQaz25CxoMxCwzEy8o3vzKEPBx4ZO6k+uMm9h0gVtfqc6aLzmo1rPxSqxFWnRo
	LCRFonkgU4iXQ1FP3oFN9uEmwZObV83jgaWlRhTpZIlPzE3hZQNA0iEVb8sEUOzRTVtKadRxFgmLl
	sybNrOi7HD5eoBkI+Ojc+iXMVLepWjEIeAsApANPNy+MqpyC4BUNQM7f0SO5fFhqTm8XBf76lzWSw
	LWQMbLlZAKSjLJ1vHAlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCTfV-0000000AXex-0Jbm;
	Fri, 02 Oct 2026 03:10:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCTfU-0000000AXen-1e36
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 03:10:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE693602C2;
	Fri,  2 Oct 2026 03:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05051F00893;
	Fri,  2 Oct 2026 03:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790910639;
	bh=eGVtnl9rHcaVyP0WXLdw6Whp5FwoIKCCMgtfGiFRDTE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=S2/HDqKC/ZvaEPtJwZ0Nr7NX41EuybBX4P0T3m3UdOHBaLBTMYSiWoqTJWJrLPkIC
	 ftuKvkSyETnuz2ji0lJhAjChWG5GeVgqcBQMm/eSamEjxDHcg0SURjKiSVBBs1COAV
	 RObfUW23imyUvQ/0nHVleMhdR6uMEOY9pbTp/djrLTsfYFKmMhECUmp/yv7MbE3DFS
	 tNRWbZgRUTthMYRf+v4c5uGqY8n8ySwHtOWL4lgv4997G2advOJQCG1ffbFk/PgHr0
	 iEQrjuyb4eTII0eVjcSgJfN82o6CbpOPzI2XzeSMGY/nBHUUIXaXat1TFOlyQFZc70
	 nBcF+b1c6TU9w==
From: Yixun Lan <dlan@kernel.org>
Date: Fri, 02 Oct 2026 03:10:10 +0000
Subject: [PATCH v7 1/2] scsi: ufs: spacemit: dt-bindings: Add UFS
 controller for K3 SoC
MIME-Version: 1.0
Message-Id: <20261002-08-k3-ufs-support-v7-1-bb39007ff9ae@kernel.org>
References: <20261002-08-k3-ufs-support-v7-0-bb39007ff9ae@kernel.org>
In-Reply-To: <20261002-08-k3-ufs-support-v7-0-bb39007ff9ae@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, "Martin K. Petersen" <mkp@kernel.org>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, 
 Jennifer Berringer <jberring@redhat.com>, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2268; i=dlan@kernel.org;
 h=from:subject:message-id; bh=hvByUueNj20DGLTScoJeXKAVWVNuLukJbf0xo7hBB5M=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqvyCeOIwoLZJjMZOjkrtagBt/YRy/XHdcwy6NI
 5E62vEeGQmJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCar8gnhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3nqRAAksBATAwXGSGunaPArd10BrVOoqWAPeEtdnTvyT/KFAZkj48jHMvCt
 1fOUb0eZCUIpJe520339+TU4MkhGRgUps4EHNIsKPd4Wvr7NhvBppm9AYQ9gjXkSPt5QsP8n2zS
 VIaBP7cxF23E+TQ5PqGTrIIQepZMpGLfvbJQbdoI060I4w3zu4h8tbZaQ5oshMBm6e1IlLu7JT8
 dJ5sizRJCncB+6Y3sXpDNllD8r8qn4CzsToyCKg6zhvhHUPgFscwsmX3OFwkC82aqtDTC7bmFuV
 Ylk+ptVCR0EuUDaGHwUdG2eTITxbgYl5oGUVhffQDk15wJWS7Sok351o2bquf2JNw2BViatFjEf
 MO8irVdx//gYj5IOSbSsTkHfNj3nAavDa+Xg5wfJ6Iae7rdpnNs7QwMqKLvSdqazkT/Gy/vB6iI
 W5LJOAUi1OwQyWGEvmgPgwbYbg/pWGBPP6BY8M7sKEyf8SnP+mvxZAtDJsR28V3E87pSECKRgUX
 h4SwGqGoDhIcr2VCBG4zYePurz4QjPkRifarQ9COZ1F5EhmPi+ar5RFkTinyPMt6kCLw2lBdWhu
 X5JneIx7PBOvmlv6aNX0AkFYCX/9kD1fP1awobkD8O713ND4TvsKU6sPnnBJU+zyt3LbwP12KCA
 9AgMc3yMk0efsOG/J/aUJbr963pHu8=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

Document the compatible for UFS (Universal Flash Storage) Host Controller
which found in SpacemiT K3 SoC chip. Its features are listed below:

- Compliant with MIPI UniPro v1.61 specification.
- Compliant with M-PHY v3.0 specification.
- Compliant with UFS HCI v2.1 specification.
- Supports up to 2 Tx and 2 Rx lanes, up to HS-GEAR3 5.8 Gbps per lane.
- Supports standard low-power hibernate to reduce power consumption.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.yaml b/Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.yaml
new file mode 100644
index 000000000000..8512a81f1cc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/spacemit,k3-ufshc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 SoC UFS Host Controller
+
+maintainers:
+  - Yixun Lan <dlan@kernel.org>
+
+properties:
+  compatible:
+    const: spacemit,k3-ufshc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: axi
+      - const: ref
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+
+allOf:
+  - $ref: ufs-common.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k3-clocks.h>
+    #include <dt-bindings/reset/spacemit,k3-resets.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    ufs@c0e00000 {
+        compatible = "spacemit,k3-ufshc";
+        reg = <0xc0e00000 0x40000>;
+        clocks = <&syscon_apmu CLK_APMU_UFS_ACLK>,
+                 <&syscon_apmu CLK_APMU_UFS_REFCLK>;
+        clock-names = "axi", "ref";
+        resets = <&syscon_apmu RESET_APMU_UFS_ACLK>;
+        interrupts = <135 IRQ_TYPE_LEVEL_HIGH>;
+        lanes-per-direction = <2>;
+    };

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

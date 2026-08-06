Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB602C55ABA
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 02:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=621+tXwU+Kf3siJi9LeuX0YgGcc2csPZmoMY0G85C+g=; b=zMG+rk39DxqJaV
	/OM0gc9xjGhdp1b1oaNxO638SWo2I+X3i0GearSEWBEFWzMIrEJOk8+ZzV4vkVRfWLH06+S6mRVqZ
	/bMyDa85n7sEepEboZZLuxGoVAkxrM6GkBNrZkI3qd7ZautqCT5Xmtt56Kx0S+I5M9Y1snh3/3hpS
	Tnxrgb6a4QI0v4f+EsGcAf+DgX5r1ZkXI/arcOwwwlNfVZC/VEsURKM4Li99lLUCNkUDym/gSoYHd
	BYBDboXrZM74nqraUTn9Fig48tWIfqr1enn2GZfowaaZDrry8j7t0Yy/l0Xq7tGKoWIudYfF38uVb
	2OY7xRLLsNano9X3n7+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wroHv-00000004qX3-203s;
	Thu, 06 Aug 2026 02:56:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wroHt-00000004qWf-3SWk
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 02:56:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F5F343882;
	Thu,  6 Aug 2026 02:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0411F00A3A;
	Thu,  6 Aug 2026 02:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785985013;
	bh=tV9IUwoo59NJmLmcHHMkUhsXWOY7J5vyTiJOpbYBP9Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XDj0gAuLeC7MWqW0c2SPca4DFPqtpXvoT6kiBqmELVYSiyTl26bLuDtjnl2ENpAhp
	 4koH9qxhY0nFlJW89y1J4C1yoQH2TidTqrlTiQIAxHOF5QYguO1IWjQFeFZO7gfAIj
	 lHRgNa37wJCqI0xlbn2F1JjCoNPGEpxGJAAVBNRuEY5bR85ezwnFOgZQKJzBnMf8F6
	 ZyvQ2ToRLi4JqFaltpKi/MUQMRm57+Ziu4V8WCp2UysHi58i6FDT4LPr/vr5+GZK4L
	 ig7JxbuBMjkyQq0FtBjG/9oLXvRsYaFfgVK4Q44eJhaH+bQ4ndQRwLqPMPvEgGw1z8
	 gEmK+8FfpoQRA==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 06 Aug 2026 02:56:18 +0000
Subject: [PATCH v3 1/3] scsi: ufs: spacemit: dt-bindings: Add UFS
 controller for K3 SoC
MIME-Version: 1.0
Message-Id: <20260806-08-k3-ufs-support-v3-1-037fb322acdb@kernel.org>
References: <20260806-08-k3-ufs-support-v3-0-037fb322acdb@kernel.org>
In-Reply-To: <20260806-08-k3-ufs-support-v3-0-037fb322acdb@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, 
 Jennifer Berringer <jberring@redhat.com>, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2205; i=dlan@kernel.org;
 h=from:subject:message-id; bh=rk95kKGG/SkoEMHzqicwZcRd7bMRmZDFgL6+fZ2Pbbc=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqc/fgPHVxzfEDiS3x9/JzjpYht0L6ZNUIuFsUp
 njnGrXusRqJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCanP34BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0FcA//X/edkMvgnBJ9mmIDmNZRE6x1/7phE7/KKhVlb1iWHZm1Ukg8Olf6x
 RI/0q5d/hXtIy3X/fcA6Cgfc/4fADVq23JkTRkPIHbuGF842tzIlHoejejnJToT9eUS3jEjtjFx
 77L69uC766l6a1R30I+7nulgnkntrBzc7TynMuDYXrT7XQ1DG2Pzj0IcYmP2+bm+UdEQ0SKQg8k
 2aJH5K8mylqC1R7SIf9sPgkldXmVrjNju7JL8ynUe4ta1tjM/bZ2A7GL5kUT5pi2gLGGe3ka1SB
 T/wlWfprSXIH+2PpUly0+1BE+X7OdPN4uVtYVL2FRBPuFDitAp86yBVOTbkn7UhcK3U4FN0B1z2
 APnkj4eYxG2ejcoM+iTFXEPQ4/lY1XSB38GYo5GJ1w7vssM2/i/oIWjsnXSvACWRKmdrmIbiK32
 ZxUmA93hHrRMbv0xo1WJz8S9tNCEEKPN2yI+rU9qcksL/FF4OGuhbvMbHWsiwQVEwn17ae7bHGt
 sh5st7a4Xl4tWd4kXDj3VqCuAs5lTzsFW9YobsFwOExSEiTRPJJPzfspzKiM+Il5HIIu4vlaYWc
 LsmovfFab9hLMM4N0NZbc+2aONOnV05sPADnAzGWx5KI9FYyVjtCxV5fdccxM527+pZ7rNVbO8l
 XOZcQBkJ1brXoWE0XE7NnRytVI9oug=
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

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.yaml b/Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.yaml
new file mode 100644
index 000000000000..dda533c852e8
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
+      - const: aclk
+      - const: ref_clk
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
+        clock-names = "aclk", "ref_clk";
+        resets = <&syscon_apmu RESET_APMU_UFS_ACLK>;
+        interrupts = <135 IRQ_TYPE_LEVEL_HIGH>;
+        lanes-per-direction = <2>;
+    };

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

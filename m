Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21D4C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 02:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P83v4+pUL6Dx0SNI4qB8fYzUNJByoDhlLjzmeJ/8ZEM=; b=oDvRUiQOqyhkXE
	RJqLKKqkLrCFCrNgOA34fT0P10Oj97yMBMcjneBF9dXf2qx1T4w8YJLzrz3J53bpJZfgTZoWNAVX5
	zvZf4gy+kad+2dBLjLZ824YqpiqrNEZqj028mgm5tSPfWC/2jWEYvNKmIb+MH2KZIv+JMoU7B2Tc6
	XhoqqokFxzcl40GAB4E29jLh6IT+JMapt08XrN4kRQWFkb4etjX3fBp/Q+Ls5E31yYlG+B4/rzDnU
	hJPiqE4JsFECi8XJyk4YhMiYhLWLV5YzHjUEV/2mwVzE/gELPMcGam12Rq5Vqj4JCpvrJDtKFxC3i
	zxzqQS36eeLkbxhG2NHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7Dk-00000003QSP-3uiI;
	Thu, 02 Jul 2026 02:32:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7Dj-00000003QS7-3sXN
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 02:32:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D0AB41081;
	Thu,  2 Jul 2026 02:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34FDD1F00A3A;
	Thu,  2 Jul 2026 02:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782959527;
	bh=sb/AhCIO26GuC3Uw19TdrTEQzdISj6y/ZzHjKhcogZI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KAgTIJFtWQcV2pX7SIsYmlqrUrngEY1eRY8JlDEpoRL3PXTzKjqrNNmj/CDWbny+I
	 t4EO7Ez/pjCILmoVdfxn9Fc6Cr0+xSDl/m1F7T57P8nB/q3EAX9J+8nHDlRn4C0t3o
	 GD3XfMUEaw0eJtjFzrnQtCDXBY9ttdV4P+kZyVv0uxR5IwPpu05ZyVcyaILdjFD2Ns
	 r6oh4US//37Al93Xv1Cyc3H1xVWfgCnDYj9alhGmzAnBEVg3dEaPd4I6PzkeIIdM2w
	 UnRk7b6pWeDwlj9eRGg0cWTN/jxndPXKP8Tu8MOTClboSxhSAe4GYRKN055NeJoTJm
	 Vulu5S6jOLEbw==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 02 Jul 2026 02:31:35 +0000
Subject: [PATCH 1/3] scsi: ufs: spacemit: dt-bindings: Add UFS controller
 for K3 SoC
MIME-Version: 1.0
Message-Id: <20260702-08-k3-ufs-support-v1-1-1a64a3ab128f@kernel.org>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
In-Reply-To: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2140; i=dlan@kernel.org;
 h=from:subject:message-id; bh=0DzLo9kHtCEbIpdfvRxJ5ac/4r14M0Je4bo1/GIYVLA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqRc2TH4Ck36sb3GRMfq03yztUSfJqX2AvqJ8Gu
 9bTSZndsLmJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCakXNkxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0dxw//fyiur2eAIQj69Agy5fKb6dT0gIdaXdpXgYpikCxfBpM10XUxQJ5wh
 FsIFTdBVIu6ZDCQe7Qc7/W3pEd7O4pd3OivsRfK1KQT2S3Rem0GkqNzS9oH0I4WS/w4BhxehWaf
 3ZoY+TBSPBTv57gcfFozHECiGuDM6QIK9qdZGoYQJx7VQ7EW/7oIUR76wSdlslKNnG0cPzFEaiM
 NPun2NKrwPjSVOZVYbYGio0lsdTy3iRiWa8rpKqg3j5dElRNlJy47RU3WoaeaR9jwW1IuZFy1AU
 V4uw96kww0c+3RBfG57n5V6n+QhY4Z/0sJYK7tp1FVybV7bon7I/fdTkR+9fD6zHFGLcm8BxgIV
 +gfyM5wfBYyIHtbuUvTZc02cQp/Fgts76Ad5bHAxskSsV9YO8TNLipuEETrYV54+dVlQbKHXQoB
 URJIziqoRCR16Z7IWZfrZm/Ngd6FypuCFHAuJHMSBInkRQVKTZT0jCJIhBy+2b8bWSvEm8rg+Kf
 R1uSCfCaorHJ0csOz/I0M1WrefaVTtqfR542HCG9FrWSLXH6e9l2598khFJgnB2eptYGjw9CR8g
 ptdfUNNLWvO8sW68HEmGlcV6RKDpU1gVlSxnEB0gYVfw8x57TcHgFrxwG6TfLLfma9rSz4UF81m
 S9LWNbyITj4dpAGjRAMN97HrR+ujOc=
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
 .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.yaml b/Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.yaml
new file mode 100644
index 000000000000..e6cb6fb2496c
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.yaml
@@ -0,0 +1,54 @@
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
+    ufs@c0e00000 {
+        compatible = "spacemit,k3-ufshc";
+        reg = <0xc0e00000 0x40000>;
+        clocks = <&syscon_apmu CLK_APMU_UFS_ACLK>,
+        <&syscon_apmu CLK_APMU_UFS_REFCLK>;
+        clock-names = "aclk", "ref_clk";
+        resets = <&syscon_apmu RESET_APMU_UFS_ACLK>;
+        freq-table-hz = <491520000 491520000 19200000 19200000>;
+        lanes-per-direction = <2>;
+    };

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BA0C79FA0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 07:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=621+tXwU+Kf3siJi9LeuX0YgGcc2csPZmoMY0G85C+g=; b=jB0DlhsrV028aa
	u63O++oQ6WwTQ3GjeErf4oD/pK/7TI1ZOMOg2uF2Y2pUu9d+bT72lCw5g1rJpKrEY3PvfoVyhjDrO
	GVLIK5qDcy4v6EZVgeofQc6hkmuBhbqLuoLzCLTvR5hSGA6HbtWVsN+8ZMtpcERB6ekTUVcc0o1dJ
	hWOBvc+bMPMhd2SoFkMwp9sjYcqeExRHHq2AEkj10cYXrdzfce2pfrmMOo/NO+D3ANp1AREM4EHX+
	bYQVd+BBAtXiJUk+mx7LW+SunontFDB8AtIFEbaX73o7SCDBaoWyF+Hy2LQk80B8Psrsv6tojIki0
	6pCJVYRK4TorpgVYVXUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qTO-00000008Iqz-3igs;
	Tue, 08 Sep 2026 07:42:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qTN-00000008IqU-1UkJ
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 07:42:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2080443F6D;
	Tue,  8 Sep 2026 07:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9567B1F00A3D;
	Tue,  8 Sep 2026 07:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788853349;
	bh=tV9IUwoo59NJmLmcHHMkUhsXWOY7J5vyTiJOpbYBP9Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=e6um0j6ESrucysFwkf5r6HNWPzsTc0+Gd93YE8eQkDV0O5ssn78IWL99LdE7Lj/vZ
	 AHWFpovcNjiZJhO8dfW8UzVJ6bgv1U+zlq4t9kgCn5HsE5ZrcbYE24InaIXEWBfvZz
	 2rWidil0WTTqxbmU8KrvMfWhrgGhqnH1edKo8n3+7ipLW9xCoHnOfVwQvSgJhRNzQn
	 tRnQuk4K2XFFvtn2KeGgZ9altvoovhbdIYSmKHULsC+URcWcXuiVMZryg6Wi8aeRAH
	 W0aCMb8ME7XL6+6OWX0dYkGL3TxUpGe37TGFp28t/wuht9lgp93RS7K2cxa3NV5J9Q
	 ll3C5m+AL6RJg==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 08 Sep 2026 07:42:03 +0000
Subject: [PATCH v4 1/3] scsi: ufs: spacemit: dt-bindings: Add UFS
 controller for K3 SoC
MIME-Version: 1.0
Message-Id: <20260908-08-k3-ufs-support-v4-1-22aa2bd97d3b@kernel.org>
References: <20260908-08-k3-ufs-support-v4-0-22aa2bd97d3b@kernel.org>
In-Reply-To: <20260908-08-k3-ufs-support-v4-0-22aa2bd97d3b@kernel.org>
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
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2205; i=dlan@kernel.org;
 h=from:subject:message-id; bh=rk95kKGG/SkoEMHzqicwZcRd7bMRmZDFgL6+fZ2Pbbc=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqn7xR5wtNpffnuxRFGP1wvMK84k0sxnS1iCz8q
 o8c4X4MiRWJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCap+8URsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1zbQ/6Aq+/pye8H0hu9O5u1yZRP39vD1lsFvltjrRqjX6kcGov/2fIGVAUO
 rfEqQRIsvy2aYsYk/L8qynu4+dEjBr0f1mJlJrQP6c/8hGoyETROQSDIYlR4tNq4aF6sjsu9Pzt
 +lCt8vs+X9p64Ap1UfviF5/73t1e0wvLg4v/E2YRFPJ6sAvzqOgPN18u4wO/FdE9rS61ppwzdfu
 kvuQ1IkXmmYKgK5xZiR15cMEH0RVVNFqXBrs/D+wDWf3RaA0Qy8vlgNo75Fb39ILLA5piDpCDFY
 g2sRw++KrXCp1ULNU/0uIbtzEvGDsdnlF220SlULNzVYkiiF4ChPKNuGVoDM3gi9SJLOFEmmr2A
 zI7kYYfWqm1vfqSn9rktTdMFtbPTkF5tlhMuJDtO370fOuyNB7/PuGIxrK4GZ+zfCox9AXXcq68
 su9H13StUaDlb3AplqsgPxLINMpAxnyx25Nxsn5PynFpFSPIwqaX0aheEYTEpUy19iZZQrj3NRC
 70+3RcjFfKnqmHJZaAJZAu1BxKEonLwcCj41/q4Jkox8M/PgVBQFM3cmBtBJSg/gMWPp9L3OHYn
 DvWZKHATf282ZJW4uOxcnUYvc92m3pulDqRi8EGv350OTof8+kbFy9rLqnRTo+P6ZuE+k5/Gq2f
 yaSezlEZCgwTGq5hq1tUTBDBqclruI=
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

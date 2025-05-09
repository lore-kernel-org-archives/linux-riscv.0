Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C150C3ABBC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 14:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCG/K3arPaBAIrbQZKmisE30zkELMEv3hAyHLc80C0s=; b=YYi4oXfjRjKjjM
	YErh+o0p8oujM74E3UahLjd/A12sxlW/dxOLCiZNR6C3l7JaE8cnjBl+n1yqWHwGCPTFbQgoNpSgt
	ciyj8V+Id8ZHHV2ULBjVKWgpphVxNwr2mMTJde1pGaGvo74X59Iicf+fZq087zQkRGnKgSH2ZB8UP
	Lb7rduKuPB+6j30T7fTyZXl46hl8ixl201oaJF5C6Mo/HpfjG4ralLpStMTfMfa18FNd7ogL7b8dU
	ZWMP6HUPbW9RGhhLaKrYYNXTAE2sl04tQfW/j8I70coZwSBDNbvKwBl8AVK0cLkEk38VZ+82ymAAA
	oJ5KtcEuKJ8A5BXi+g7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDP6s-0000000409s-3G1k;
	Fri, 09 May 2025 14:53:58 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNgp-00000003kIm-2bTV
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 13:23:00 +0000
Received: from [127.0.0.1] (unknown [116.232.147.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C2FAA33BEED;
	Fri, 09 May 2025 13:22:44 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Fri, 09 May 2025 21:22:11 +0800
Subject: [PATCH v3 1/2] dt-bindings: mmc: spacemit,sdhci: add support for
 K1 SoC
MIME-Version: 1.0
Message-Id: <20250509-20-k1-sdhci-v3-1-526c35feaa20@gentoo.org>
References: <20250509-20-k1-sdhci-v3-0-526c35feaa20@gentoo.org>
In-Reply-To: <20250509-20-k1-sdhci-v3-0-526c35feaa20@gentoo.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=2iC0S3nNd+mUxS2wD1OXShi88nihnVwChgARpJPrfL4=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoHgGVemjycRD798EDLIseMN4UlE0vM+2DSlz82
 I0cybB3QmCJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaB4BlV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277ddgD/9pAMo/d2xYyKXMYN
 kDwzbfsVs0znb4ntQyiMt+w6koLArY7ejzMbkzL5C6v7AxHKlowrAVV9fBTLqmQwhT8B1I4Ko10
 FGnA0lLhHHBVEyJS/iGtpMuXulUzkw8qEX/GfKfU66Y2JYZ1Z48tRzvoMe+ZaJbeI5JTbBzyPrz
 v/E3rlM9Hdx7LQIYy9MNS6ExWNkSbJWRhRu9WC///Elx5xe2sKe1wGTNbuHXkhdxPSaLaXGslW0
 qdE6oVJk3Ty06B/qPZC+W3+JRfUeD9Pu+BqK44eGE2hcz1h5dTE8KaspwaoU8FlFFrwnT8QT8LK
 q01Wpjj8Bxejz2EKovQJhYAGk8Jv9LRfNaV1YsW+SqwB9jv4KkWVC+rgms0EtcwnDiistPZ06Au
 CChcGKqrohiu1PL7ow0YSGl+ExeLx9aMLYKNohpyicGyCyoJhC9EAYVh6pIZUSIQc95ECWv162r
 TRLp2MM06U9CbzN8mYfVCEBW60eKgRkNUEK9J0S46Zk3UG43MKYXAJPqaed8voRdVKuO+zRF028
 8/StnbKvMpO83AWUqHHBPIFDGm41yUrjlgxeAp2pwXOlczlQNBHFpsyvDyzmZPpVk10U0BIkh/q
 YIL2MpffJx2YwhuHOb4j6TeWQz0B/AynfwXP1sph1CtYNQzrWO3o7X+2SPRxOal7QpQA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_062259_688597_93E9BA89 
X-CRM114-Status: GOOD (  10.56  )
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

Add support for the SD/eMMC Host Controller found in SpacemiT K1 SoC,
The controller supports data transmission of MMC, SDIO, SD protocol.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/mmc/spacemit,sdhci.yaml    | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..13d9382058fbc1c12be1024d1c550f04a825673c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/spacemit,sdhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT SDHCI Controller
+
+maintainers:
+  - Yixun Lan <dlan@gentoo.org>
+
+allOf:
+  - $ref: mmc-controller.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-sdhci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: core clock, used by internal controller
+      - description: io clock, output for SD, SDIO, eMMC device
+
+  clock-names:
+    items:
+      - const: core
+      - const: io
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mmc@d4281000 {
+      compatible = "spacemit,k1-sdhci";
+      reg = <0xd4281000 0x200>;
+      interrupts = <101>;
+      interrupt-parent = <&plic>;
+      clocks = <&clk_apmu 10>, <&clk_apmu 13>;
+      clock-names = "core", "io";
+    };

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

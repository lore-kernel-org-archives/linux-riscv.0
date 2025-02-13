Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1796C0219D
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 10:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+UoQXu1ZR5G4P3gObXseJvW7WOFLoNGA8cf6RdQA5A=; b=SKeRgoDnq0tzh+
	icYX9hivvj+L64VvtcAuhmznDnkLF0o3ev5Wl8cPsWMQkbdPFUN1N6DoOlWfSt8v98DVdZZVP3h8s
	dc+jC60Bf3+Altc8nzPXer7AR287Hk0xN+5Otn6p5xvmyRnye5L41N3rEr8G7YsyWiS28Kuo/y7/4
	4UVwGDMzqatJkfc4NwMHGjHr8FyUsRwBphrSCGB72O+tneR5i5w5Wr54PQTR3IOBQ6gagZ/JKnF3G
	SZdJlLiPoCZ3hSoKv9h38UjPKoghJb4yjgaBitJYqaWsnG17Y8zib0FzPLCBPtaQ/ISaHrTCV+kAG
	8W5WiUyS9Pp3odNGmy9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWwD-0000000AkFC-1XkG;
	Thu, 13 Feb 2025 10:59:21 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWwB-0000000AkEN-1CfQ
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 10:59:20 +0000
Received: from [127.0.0.1] (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 62467342FDD;
	Thu, 13 Feb 2025 10:59:15 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 13 Feb 2025 18:58:24 +0800
Subject: [PATCH RFC 1/2] dt-bindings: mmc: spacemit,sdhci: add support for
 K1 SoC
MIME-Version: 1.0
Message-Id: <20250213-20-k1-sdhci-v1-1-1f4362a980cd@gentoo.org>
References: <20250213-20-k1-sdhci-v1-0-1f4362a980cd@gentoo.org>
In-Reply-To: <20250213-20-k1-sdhci-v1-0-1f4362a980cd@gentoo.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=egbAKOn8wm4RHq9b1iC6xWk9F3swpvX7oZ6TfTqCnRQ=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnrdB4AZt7G8OD8FJOGOpwPmgt1Y9hFr+BLnupP
 Xe1j1KdkKeJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ63QeF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277a5eD/9pV8qh7pr3c71VkM
 nviNR3UgrXDSTSTU3BHz794uCz7+kUDVmutQHUQsUrOLd3SZGfq5Y4uCbzLmRCnutwkJfxtd+ss
 fi7bgS/sklEhN5MWLMg6VKuqAObUgWJnK07JVrqpIY3yZOpmf5hjLV4/6yimNCAL8HN2WIEypOs
 slMsolFu+wSGt17/wCwMh84MmcDDplxYMNPsaLYVBPb5vK2HfU5Tesvza5zxgi9x059amXqE86Q
 anLzy2i0eSUl5bK1sbQV//puwzAkSMumOghtWxe7GvHAWXT0V41mKlCf5Ycd6fm9r3QRzUH4Bfn
 BEn/zTOELKqzx6hmx3MpUHvETviLbj2pyvMrGoxPwq2hVUUJ3qGfO+uNYxEYpO8WRWWrc/39NYF
 mE/H2zIdjR7U+9iXr9yV9uSLZ5AofJdUk3tFAIofNr1TbC4rcB22Bgmow6NQ9eg3PRVkKsxKLCu
 ebcUbTFvjfjyOHcchVfVlpA2qzUQtxCH9coGPOsGCLfCP4R1TIOHY10VZ1zqjv+NE+C2CUQe8eh
 MNadzGsuWvcIEPjLwmMPwymOZ7vA62goAPlkLEKtptL58s0t9agzuA/pQo/Tgb0L4TFdoKRuleF
 nAdQLyKBFBAXhXTSjtO6mQ/THk8YORjz6pRPPfI/agt0reAG7TAPhR+bb84nKWP9VZag==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_025919_354608_6B0ECC7E 
X-CRM114-Status: UNSURE (   9.44  )
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

Add support for the SD/eMMC Host Controller found in SpacemiT K1 SoC,
The controller supports data transmission of MMC, SDIO, SD protocol.

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
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

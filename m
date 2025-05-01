Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317E6C3ABA3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 May 2025 08:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCG/K3arPaBAIrbQZKmisE30zkELMEv3hAyHLc80C0s=; b=Vs+Uar+hAFtAOk
	mFqEGFKRZi3XVFdhA1yeiBHytNgjqClKiMv5JcmzA6xP5JzKhd6o15sx2pRyqZ6Tdap3XyTw+j+Lz
	NoOKNOnUvGnreuJJiWiczoBvsSxvs0vZJISfDJTKSHzh+AinLGk00yBfTw91MiOlDlJy8oQUGkLtf
	ajbspqU9X/Rfil0vKwn0Me15sLaGXLlCspN84yda3AP6V6LN2NsD/435a+lGWXh423gSlBcKEiBPf
	ZJ2EzGmJtN9QtglUF8Y1sD+7c9lpONl9iVv/NLdMlJaaKFVAj9OhmkFXLJ1cclPMHa7ztPhj3dvxK
	kjK57xSZdJsVBnKeY7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAPdD-0000000F47q-3xcp;
	Thu, 01 May 2025 08:50:59 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAPdB-0000000F46w-3nVB
	for linux-riscv@lists.infradead.org;
	Thu, 01 May 2025 08:50:59 +0000
Received: from [127.0.0.1] (unknown [116.232.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 9A481340C3C;
	Thu, 01 May 2025 08:50:53 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 01 May 2025 16:50:21 +0800
Subject: [PATCH v2 1/2] dt-bindings: mmc: spacemit,sdhci: add support for
 K1 SoC
MIME-Version: 1.0
Message-Id: <20250501-20-k1-sdhci-v2-1-3e7005fae29b@gentoo.org>
References: <20250501-20-k1-sdhci-v2-0-3e7005fae29b@gentoo.org>
In-Reply-To: <20250501-20-k1-sdhci-v2-0-3e7005fae29b@gentoo.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Alex Elder <elder@riscstar.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=2iC0S3nNd+mUxS2wD1OXShi88nihnVwChgARpJPrfL4=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoEzXiuB0ELTpd5KRo4ZYc3gHUYBPUWI1gWZiSh
 E0pyU+rQWyJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaBM14l8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277a7dEACTjn9pJJadovd5+Q
 rwW+FN/GXE5c+FD9XZdTooCbh2UWFqYTnLn5JLV8AMNC7Vyu8WfxAwZrUYljh5R3BfX9mbPi1PH
 2xF547ZuZ866Xyl7vvz52MrbomqqitTWYAQRpeXAu3feV1MLfR+n9cmKpyI+ZXz/Jiiu8M87BbZ
 GZo9MOyBWvZ17wIYWZKb8htp9pDbZDlbHasWfVUSbTdWNrRpKp4HG1AtD/nVVOQZt1880RHtLaQ
 s0pXq2O6bIGiKO377a30Kza2VsoL5HDzKSJbWPdpLAtoy+Ec19owaFM0CYD7Lb2OKdY0gW0XRA8
 TU/tZuU18overqzQfvqe0BFT3SKZlwbfSMVQaHODgNC7oRpPIKfjJoHvVmY8LDFBrzX9Jf5GhPe
 IHl00YLoIm8hbSUdyGa0LIjVfF3gqtf3ZSfhUP/l7xjBDVH6OPWnX6KKo5tmEADeOtBWVdcE9gK
 RexZ9kIIecwrgvZEmHHRmelgsDLfe2Um2KWWcG7FliBr2R4nO582keIMn5kHZDSk0Wpz5v/7p55
 gyb2OFh1sQOIwjik9/zAi+i30cMAQUCg/7PAWYnEwz7RqZrcATNnoZlX8315mZ5pncYoZ2RkHuZ
 SY+p7jq2xA128dIRoMPeLfn+PDSTvQ0NbpY7qRNOFdsn2P78glJ0gXdBN/0NHgajDynQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_015057_972814_6D6A122B 
X-CRM114-Status: GOOD (  10.13  )
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

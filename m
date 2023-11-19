Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385F3C54E76
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Nov 2023 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHH7Czy/146Qd5G2AfqtNM0n6IH1Xtz27TVLpOWth9w=; b=BPdFKX9j81Y6gO
	itdjUsoBVF+8XEV0HPmROxTgJ43sIX7XOEjhNGlDZOjLVAooZpviiCkFqxDd9eJthqiRowElcFVRW
	+VMrFfLfg2bvbPUfdJZ4UJjBffRYM7+cVOtWk5jH+rfZYplUCFRzK2lxjyoY7V3qqd4c8FCL9xLLc
	+KaA4JwuEd1Z0RXG2SrkmCOXaSVqkTxBVn4t1D+RmPzAA6vXcog/tjQyqLMBNzwm3qM+IlsiI5xxh
	lCYOahtmtfQd1ibQiYQGA21MfTu3nkKpFfG8v+mn8htT+7sjD5guLCdibfi1BkgIBD7FIW51fpwTx
	TZiLLZg6/FNV9CKMxo3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4hoS-00ADhJ-07;
	Sun, 19 Nov 2023 13:26:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4hoO-00ADe1-1i
	for linux-riscv@lists.infradead.org;
	Sun, 19 Nov 2023 13:26:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B2A260C07;
	Sun, 19 Nov 2023 13:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B534C433C9;
	Sun, 19 Nov 2023 13:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700400357;
	bh=EAoI1oPVY8eW/ZcDNqHuO5UMxZXaN5+c4qTncpj4H+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UFFfua7e9Mb5DN9dWT4E5HE4L3nheij1HYoo6gzkEEGODsAmMsK1TbnTR/xwe1NFl
	 q88cK0bU3qLLGYlP3fcE5ob0rTvm7IWzlJpdu9mA6qQQ+nrpk/teL4F/EZqDSQ15Ut
	 nx5CMSChPY7E6cZkYW5k/NO4T5TjRj82VOsxUOVlZynpl9vwexAjctqef815jghD62
	 Jv1KrffsfGR195TNCZbR/sOFd6C+FuJ/KqeejGG2eAjlQZVqG/DqPjNLW1cNtZiBH0
	 w8pHEyHZ2CHVtRQ+VN7oDIYIVlT1RIcpvGsuJ+FOwm1sgD4GM45yblUByAK7mj6pJF
	 ahW/wTrbz487w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH 1/2] dt-bindings: nvmem: Add sophgo,efuses
Date: Sun, 19 Nov 2023 21:13:31 +0800
Message-Id: <20231119131332.999-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231119131332.999-1-jszhang@kernel.org>
References: <20231119131332.999-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_052608_612019_57975526 
X-CRM114-Status: GOOD (  11.51  )
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

Sophgo SoCs such as CV1800B come with eFuses used to store
factory-programmed data such as calibration settings for the built-in
ethernet PHY.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../bindings/nvmem/sophgo,efuse.yaml          | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
new file mode 100644
index 000000000000..e4ae81a1742a
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/sophgo,efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SoC eFuse-based NVMEM
+
+description: |
+  Sophgo SoCs such as the CV1800B contain factory-programmed eFuses used to e.g. store
+  calibration data for the built-in ethernet PHY.
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+allOf:
+  - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sophgo,cv1800b-efuse
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description:
+      eFuse clock id.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    efuse@3050000 {
+        compatible = "sophgo,cv1800b-efuse";
+        reg = <0x3050000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        clocks = <&clk 1>;
+
+        ephy_txitune: ephy-txitune@24 {
+            reg = <0x24 0x4>;
+        };
+    };
+
+...
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

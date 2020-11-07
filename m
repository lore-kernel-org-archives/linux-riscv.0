Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90FFAC4741F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:16:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3774320704
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:16:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cooszHs9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="cB6Ufqj+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3774320704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Sz6YmJd3YINQeF8JmTTEwfwrhwV+PP+Q0yowK8/fcOI=; b=cooszHs9r1fPBXosmj8H27JwZ
	VqdDXgcN9j8eEW/Dp9s0byELHtT/iV0fw1MiBGzbglVOL1X8A/9gsAQQBSQPazfzjMgMiZhGyvY1V
	HA9RvvhkwGNF2MSjuJazZxMgYmaIIkAOsP3zlWfxJpHwMsW9j715uklHDAxwxUMoWtrE2fQv8A6H8
	aUHjnx+1ZZW8XdPGwFdorFyXa8gJi6ba+7Z/miNeydL2p3QRVAKgfRC8XzC2oUUIRLlF+yqYjHO/U
	1zILX5hBzLHfeVqt5bzG5t9xR3GKW7MsoPj3mPVQycF/MYcBQ7plhKjRoOjHzh5q4eDmRAnowFhme
	BgapBkW8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJNx-0001Bc-QJ; Sat, 07 Nov 2020 08:15:45 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJNj-00011Y-Cm
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736931; x=1636272931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VhB8WEnLoq7dAyllPLVCuTHZzGrie11gmx4BWMw3mkw=;
 b=cB6Ufqj+VYnduFQ0PpNmMaH3jvU0Bl9JNt/caX5wLinnUD4zNV+0TgJ+
 1OIdSMiLklPmAP8L1jYXgwez9eiERLSQVHsQgLRfez0AU0W1G2Xpe/hxM
 LpRXYUuQnK33jCwysOruwUuP8W4OeueOPu27rP5O8BOyyDTF/ZmZ/NVVM
 x/LAuDiry8oOuT20e5pCV9enRFZQ90VmYpJu3UNkz/edchYQA3iHzwD1y
 xqiMD6xqntQWYUyDPN7MzWGmvMppqgos3hvrgmV2yxary8t9fsJsGQ0BM
 rHE8NGZ7j0chju8ukWlwSg8rZo9ABIBGySQsFt5f989bG5YRhGVIbVkDB A==;
IronPort-SDR: OIK2KD6jFTSMA3GAUnkhEr3YtxctYZp6PNFz7Kw1pLYBOI1FH3Jbzkd8v7o2N7QPC1Knbc34RE
 JAr9ilzeTeUsn61Omam19UdhKAIXBpSQZccfvSfLaYxwjjPTqX4yoHo2//6AjsJoyxKpHGGpFy
 rwzi8BAIcnuGEJnE7HDyTeMrRRLHYGdgItDRSBw6cZnEPMysG2jl+SOM/bUXnZ5qAKeL6N+lLS
 oqLQqx4iK/wB/grwM/gzMZB4BN/tvU5ahQYKEucrkQaUuwhioE0PV2N2i3vvrpTHI+q8VlNQ+B
 tqE=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079344"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:15:30 +0800
IronPort-SDR: NgPCa/2RVfga+cagVaQTXP1RGD+SAvsQnRDdVb4o1Z373n/rwZ97Du9+PbE56FmfmZrp535WBU
 77ynJDKhtXZF/yZReTQegVqL8VvrSEAljoXt8NPsGf0gHWSrvIcaWdJNGp1fkN6tez3WkoZofP
 mY8SO5QSEGz93z7wPNfYAiGjiPwGtK4IS3KPrh5Q+H0mWEm5FzTfkVE8sclvS4AJSU7Nucxe3M
 WILr3NoOtLRICpJLWVrnyyW1di+1UFV/1tRuGBhRwdV+YNfgtLqJibQZPCaFDU/N+s5RtSkiqU
 9WQbwLRbnwSTJKU14+gX7dP7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:01:34 -0800
IronPort-SDR: g1LXRXd+/vgJ9IQncw2auwsajYAcwYINfKzbezBRCv21wTeb+4TC2P+2Vj/iBQmxJBB45LBQj0
 l5q85yU7Y5IxQPC6YDL8wJ6s2yw5ifSfcS4uEur59uOiiZhSIq2KyjS/xOTtDFFGUpogNmVNgh
 W3bV8pgfvT6gMtYfw4feEgZ12ceRVUKYQTICyrggf4ECaNlz3vG2J6Tykawi01JX/qECgpllK1
 ENVmP1kUckKQArkTkryMA/cYdKiL102RvqWUbmmXG23V3tmB5HD6CuaF4lgqjvspuD7UGI8iIL
 0Dk=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:15:28 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 25/32] dt-bindings: Document kendryte,k210-rst bindings
Date: Sat,  7 Nov 2020 17:14:13 +0900
Message-Id: <20201107081420.60325-26-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031531_632826_9690E55A 
X-CRM114-Status: GOOD (  13.96  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Document the device tree bindings for the Kendryte K210 SoC reset
controller driver in
Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../bindings/reset/kendryte,k210-rst.yaml     | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml

diff --git a/Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml b/Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml
new file mode 100644
index 000000000000..bdd0bf37bdfb
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/kendryte,k210-rst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kendryte K210 Reset Controller Device Tree Bindings
+
+maintainers:
+  - Damien Le Moal <damien.lemoal@wdc.com>
+
+description: |
+  Kendryte K210 reset controller driver which support the system controller
+  subsystem supplied reset registers for the various peripherals within
+  the SoC.
+
+  See also:
+  - dt-bindings/reset/k210-rst.h
+
+properties:
+  compatible:
+    allOf:
+      - items:
+        - const: kendryte,k210-rst
+        - const: syscon-reset
+
+  regmap:
+    maxItems: 1
+    description: phandle of the system controller (sysctl) node
+
+  offset:
+    maxItems: 1
+    description: peripheral reset register offset in the system controller
+      controller register map
+
+  mask:
+    maxItems: 1
+    description: bit-mask indicating valid reset bits in the reset register
+
+  assert-high:
+    maxItems: 1
+    description: bit value to write when asserting a reset
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - '#reset-cells'
+  - compatible
+  - regmap
+  - offset
+  - mask
+  - assert-high
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/mfd/k210-sysctl.h>
+    #include <dt-bindings/reset/k210-rst.h>
+
+    sysctl: system-controller@50440000 {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      compatible = "kendryte,k210-sysctl",
+                   "syscon", "simple-mfd";
+      reg = <0x50440000 0x1000>;
+      /* ... */
+      sysrst: reset-controller {
+        compatible = "kendryte,k210-rst",
+                      "syscon-reset";
+        #reset-cells = <1>;
+        regmap = <&sysctl>;
+        offset = <K210_SYSCTL_PERI_RESET>;
+        mask = <0x27FFFFFF>;
+        assert-high = <1>;
+      };
+    };
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

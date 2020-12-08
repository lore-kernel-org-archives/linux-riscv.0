Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8556CC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:34:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 486C923A69
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 486C923A69
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L7pKDQ8FNdDGTP9LZZNKNFtlZNdyRJ1pPg1A5hebDYI=; b=sHF8Ntu8D9MAPZ8B14AXjRqWy
	41gdQiUcsovguRKCyoRn2dN6mZafL9INZKWisRd28qjGdgO2Ii3JSi5VMyorC73A0qScWNTwrnVza
	sZaCtRBZrdeznxdRuEohRJCPbEriOEISVN0Yw/hYyDdNvsXHPBq8j8xrqEIGx/uB/HFibhgMZmcjf
	YQoj65rsElbagysfKxMS+oI3uGluR+/Y+H6B4GL0h6+YcKX+a3Nveaqkc5IczcPpRaZmxOJhSQHSC
	/yKsDMJ0x6H6G1zfcDz1OC215hze+Qys+G6fc47OtXAVAkVytp429N0k8Hz5f+ZJM9fnNTejxbZlf
	u/vD/UYbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmXW1-0000M1-00; Tue, 08 Dec 2020 07:34:29 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmXVt-0000Hn-G1
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 07:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607412861; x=1638948861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=irTVIQIcf04Qv4d6ntB8ZOD8tnnSkj9g+ksFRT5I7iY=;
 b=YnsIuj8q+ANoiYIrqWBghtPOIe6C15OwnYF8BRmjshbP0ovfwV+CyjQ3
 JevI+n7Jnyyc58Brl/x9f8uC77cAzAafnOIijvl/VXjMF8Ll0Xtn6gwrE
 wllWXBDRxpqZXOA3bzs2rjS6zg1IYPebTrARjwEmJ61A1MeafgC+usQAx
 PmtkO8KFnZXDZ4/IvREq2sX5OQhJ+e0zd5YRHy8htFqO/wDXkx5TU9pTK
 fqCMuMnEdtAxZbe02ldzbDA570/nptZ2HLvKPMVfD+Ai6rs4cOzGhZzMf
 rZVVT966wVZ6TWNOkLTY4WRnuqrdvDMSZgkjXje05gEoFIHDZhdPlA38M g==;
IronPort-SDR: G+49Dvt/VulRWymm7vtBCEApmkCBf1qfSNhBn6+vbw6S7y7FOaDujld43QgOBYbz4KqhR7jpBF
 NY/V4ZFCCpN6huBxqzDeMnqhhvtMsBRc14s35fSXwUtIywbmdeHz+YbSxh81rUeOBV52xuVfBC
 Qm6xvbX1BZZhptFXrxCWPbNRZVvkxt4DEgxZJUlYjF6H+3sTkmoQ6MboKb807+rSuvFQFGAvPH
 brw1mnC3oOue6ns5q39QmmNozdquxDUqymsZT62kv//Py5jkeTgNC7/SBR/lsW/251sBsqsQbF
 cXQ=
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; d="scan'208";a="154714903"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2020 15:34:20 +0800
IronPort-SDR: 7P5F3w13iV6TM0zkMD6SiW8hQNtfATe+v14NYNEsU1iuIfBIvbCUCLFV/XhBk8y5jo4fSl582I
 V0Hbwyy7ozKeByD+9TY/XFWftJutTlxj0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 23:19:48 -0800
IronPort-SDR: /2e545MaPDjNVm8VmK2AMS85SSn7t098lYKbaF8mEWlWb7AEGsPXNBZ4VWSgeC9vQm1SnS2Mc9
 gmvcoblWAW+w==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Dec 2020 23:34:19 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v5 10/21] dt-binding: mfd: Document canaan,
 k210-sysctl bindings
Date: Tue,  8 Dec 2020 16:33:44 +0900
Message-Id: <20201208073355.40828-11-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208073355.40828-1-damien.lemoal@wdc.com>
References: <20201208073355.40828-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_023421_790496_5C80A861 
X-CRM114-Status: GOOD (  13.58  )
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

Document the device tree bindings of the Canaan Kendryte K210 SoC
system controller driver in
Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../bindings/mfd/canaan,k210-sysctl.yaml      | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml b/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
new file mode 100644
index 000000000000..a61d8ea4fbec
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/canaan,k210-sysctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan Kendryte K210 System Controller Device Tree Bindings
+
+maintainers:
+  - Damien Le Moal <damien.lemoal@wdc.com>
+
+description:
+  Canaan Inc. Kendryte K210 SoC system controller which provides a
+  register map for controlling the clocks, reset signals and pin power
+  domains of the SoC.
+
+properties:
+  compatible:
+    allOf:
+      - items:
+          - const: canaan,k210-sysctl
+          - const: syscon
+          - const: simple-mfd
+
+  clocks:
+    description:
+      System controller Advanced Power Bus (APB) interface clock source.
+
+  clock-names:
+    maxItems: 1
+    items:
+      - const: pclk
+
+  reg:
+    maxItems: 1
+    description:
+      Offset and length of the system controller register space.
+
+  reg-io-width:
+    const: 4
+
+  clock-controller:
+    # Child node
+    type: object
+    $ref: "../clock/canaan,k210-clk.yaml"
+    description:
+      Clock controller for the SoC clocks. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml.
+
+  reset-controller:
+    # Child node
+    type: object
+    $ref: "../reset/canaan,k210-rst.yaml"
+    description:
+      Reset controller for the SoC. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml.
+
+  syscon-reboot:
+    # Child node
+    type: object
+    $ref: "../power/reset/syscon-reboot.yaml"
+    description:
+      Reboot method for the SoC. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml.
+
+required:
+  - compatible
+  - clocks
+  - reg
+  - clock-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/k210-clk.h>
+    #include <dt-bindings/reset/k210-rst.h>
+
+    clocks {
+      in0: oscllator {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <26000000>;
+      };
+    };
+
+    sysctl: syscon@50440000 {
+      compatible = "canaan,k210-sysctl",
+                   "syscon", "simple-mfd";
+      reg = <0x50440000 0x100>;
+      reg-io-width = <4>;
+      clocks = <&sysclk K210_CLK_APB1>;
+      clock-names = "pclk";
+
+      sysclk: clock-controller {
+        #clock-cells = <1>;
+        compatible = "canaan,k210-clk";
+        clocks = <&in0>;
+      };
+
+      sysrst: reset-controller {
+        compatible = "canaan,k210-rst";
+        #reset-cells = <1>;
+      };
+
+      reboot: syscon-reboot {
+        compatible = "syscon-reboot";
+        regmap = <&sysctl>;
+        offset = <48>;
+        mask = <1>;
+        value = <1>;
+      };
+    };
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

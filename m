Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594EFC55ABD
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02BDB20872
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jJ0b5eGJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="hrloexh+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02BDB20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kFVpqKafevlfkG+ao9r1+nNAmA1v6XnPn1DbH0jejXs=; b=jJ0b5eGJ/K7iEQA2YstgyE224
	3TCDMzCsVZ4PnQw6CJ0P0lLUqQNTZkF9DARoMYtiaNDqTvDZ8XuKBqex6hyiF2CRtYozsCSKGCGhq
	BVqew4jZOrkyP5+D8n24Vw7FbMkh/WBmv+++YzS5XmUGzfq8ngOpxErSmGk3DvVm3etiW+j172CqC
	U5lQU5fP14lFwqVCAvwTDn9JlB1MD2mGVHPyVLr9IV6BrTzty11ENbUKnzj3jGLlU193K0a6rJ05R
	ePwTIyJoBPOa9yUW9sXsAwxoYC+bAGS3BPeGvTPNMNpjOJEoNRFZuQDSYEbHveIoPQss4zyt3LhjJ
	/yH2foC8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJNu-00019T-K7; Sat, 07 Nov 2020 08:15:42 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJNg-0000zm-Sz
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736928; x=1636272928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d5rwU0EwD6rCM5AMg/4mXhiVHhmpdDtX2NbRPwnuBXI=;
 b=hrloexh+KSU0TPwxrd0ZD9Qg/bOYVgr1Fk3EnH7vgmLsG/ga37kO33pF
 9cxKeVyBCP+kfMgHnr6bj/Linznug6dLYC3yjoah271OhC0aREncdESPc
 Fq/T3CPDY1uct1rBmrh7xqBkNS7K85dPjSRUcYcBfL04/nTwE364bCpwW
 KL9LVnec+ajv+TSEtLm9lZeosPG0VM9FHl1vn7GzUBO2kJ8RUZPpixPlL
 a6nWgjpsXLxcgEZvzqiiUYH/E1CQJdGWk/kygRfxMc8joWameopdEnWit
 p5nn3bFhr5iYmwFIT+Q1PKDRAeoBooxl9+L/jcIOs87WON6sJ85UGW/Oa w==;
IronPort-SDR: ynn9GroisGvhnUo0ioEZ3q2cX92aF5dppjdUrwHPvheUBkKAufHosUZORaWrKgxomWDxmHuDip
 jRp40ysrvY83NqaIGTaILdz64eVMvShUWG0YQNzj+qfBKZ+pPzMXXNP7C6//eE3oP4zZYv4KPf
 AhxcWZ2yDmtgdwqLyjdYBr2j5u6NrihS4sZ6FQjNk+DJE0lKJlZ4suevTuVSTnpPqZFEKQMY7T
 MiLkCcK19sm2+6KR+9+kcY12ki4W3teVXp0ZBniiWPizsvq/yNMVOgKJ2k/luQw7KeG7ybbN5v
 n5o=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079342"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:15:27 +0800
IronPort-SDR: fct5tuSQqXfT96FHGWqJuceQVEzlYwu3Q0Gr/yLWzMMIenY8BBtaUYymXrrKOGseE/qHg9TwkG
 7bjP9U7HY00f23rAVBTtiqW1vfm0+Vm1H38QYEAIRwjOGPZYFDey44qmKxYdMnnoOLV1sHu31C
 M43qy272ECarcu8XGxFSdElm9fEKG138HgjydWGnGOvW3eRvAExqF/21bUFm0nVfC6eyUcOf/n
 4SoKjgzZ/TkzCgx+qEWsJZhdTcTfhWZuQz6ZiWOBc1oLx/Zf+dqVibImfzbgRhTq+TY6suHlD5
 I5s/T8PWtzL8fDtS5pXvfUuM
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:01:32 -0800
IronPort-SDR: lC38bnsFdGbEDhiXXBwS2FuK3LUBKTJG9/sIdS/BmLHzQq47Lq7wiPIe/n0+Pa4G5zKX/9obAs
 MW6ZnTIe/mef/fQtJtygQQqUkGr4ROa+MFR4745KE8fs1xWpf/l042WWaSRr31opWGu1ODAdRh
 8Kzs63FzBD1uJm7tfHGzzbcVCWWI2/iSkCf2jvAjo/2sNRYOVt73cd2/59931z+EyEZcE5lnvP
 kA5H2BV50bAfZFhNESNcs3Ymyt5ELv1KNRp1vxy6l5rgkD2jEDmbd7mDqZ2pqCS6Xjwe0K8PRv
 HcI=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:15:25 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 24/32] dt-bindings: Document kendryte,k210-fpioa bindings
Date: Sat,  7 Nov 2020 17:14:12 +0900
Message-Id: <20201107081420.60325-25-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031529_238213_240DD0FD 
X-CRM114-Status: GOOD (  15.54  )
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

Document the device tree bindings for the Kendryte K210 SoC Fully
Programmable IO Array (FPIOA) pinctrl driver in
Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../bindings/pinctrl/kendryte,k210-fpioa.yaml | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml b/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
new file mode 100644
index 000000000000..8730add88ee0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/kendryte,k210-fpioa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kendryte K210 FPIOA (Fully Programmable IO Array) Device Tree Bindings
+
+maintainers:
+  - Damien Le Moal <damien.lemoal@wdc.com>
+
+description:
+  The Kendryte K210 SoC Fully Programmable IO Array controller allows assiging
+  any of 256 possible functions to any of 48 IO pins. Pin function configuration
+  is performed on a per-pin basis.
+
+properties:
+  compatible:
+    const: kendryte,k210-fpioa
+
+  reg:
+    description: FPIOA controller register space base address and size
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+    items:
+      - description: Controller reference clock source
+      - description: APB interface clock source
+
+  clock-names:
+    minItems: 2
+    maxItems: 2
+    items:
+      - const: ref
+      - const: pclk
+
+  resets:
+    maxItems: 1
+
+  kendryte,sysctl:
+    minItems: 1
+    maxItems: 1
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      phandle to the system controller node
+
+  kendryte,power-offset:
+    minItems: 1
+    maxItems: 1
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Offset of the power domain control register of the system controller.
+      The value should be the macro K210_SYSCTL_POWER_SEL defined in
+      dt-bindings/mfd/k210-sysctl.h.
+
+patternProperties:
+  '^.*$':
+    if:
+      type: object
+    then:
+      patternProperties:
+        "^pinmux$":
+          $ref: /schemas/pinctrl/pincfg-node.yaml
+          description:
+            An array of IO pins alternate functions. The values for each
+            IO pin is a combination of an IO pin number (0 to 47) with the
+            desired function for the IO pin. Functions are defined as macros in
+            dt-bindings/pinctrl/k210-pinctrl.h. The K210_FPIOA(IO pin, function)
+            is provided to facilitate the combination of IO pin numbers and
+            functions.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - kendryte,sysctl
+  - kendryte,power-offset
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/k210-pinctrl.h>
+    #include <dt-bindings/mfd/k210-sysctl.h>
+    #include <dt-bindings/clock/k210-sysctl.h>
+    #include <dt-bindings/reset/k210-sysctl.h>
+
+    fpioa: pinmux@502B0000 {
+      compatible = "kendryte,k210-fpioa";
+      reg = <0x502B0000 0x100>;
+      clocks = <&sysclk K210_CLK_FPIOA>;
+      resets = <&sysrst K210_RST_FPIOA>;
+      kendryte,sysctl = <&sysctl>;
+      kendryte,power-offset = <K210_SYSCTL_POWER_SEL>;
+      pinctrl-0 = <&fpioa_jtag>;
+      pinctrl-names = "default";
+
+      fpioa_jtag: jtag {
+        pinmux = <K210_FPIOA(0, K210_PCF_JTAG_TCLK)>,
+                 <K210_FPIOA(1, K210_PCF_JTAG_TDI)>,
+                 <K210_FPIOA(2, K210_PCF_JTAG_TMS)>,
+                 <K210_FPIOA(3, K210_PCF_JTAG_TDO)>;
+      };
+    };
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5463BEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 11:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S84dOFFdNMX0GkJODPnsFE37luwt/UtSQADQYXuaL3c=; b=vXq+hcNhhSraX+
	6eUpdqu3GxPIn180GZp3K+5WJn2DCH0JRG70ze7/qNSL3E/h2JZRSpAHTL9wUllh6E5WnJk/lqQTO
	cYuu4hv5gKbGOcT3XaxhGNGLuGLPcYrj1k2DHY5iFVREXAYGsgNju7gnz+X374vEEY/X3NfE+g+Ml
	NLGEpPXOAXe+h3yA2+HGpGcQ8wHPwLZBYEqKqrTHxR7gBx1uZhPjrsrVjd6EoPuiUB2mNR3GQbPwF
	dOgiKhP9gkuiIn1HiTfl3cB3s9a1PHzLMT88Q0+ZAilUs1AVnr3RuqGJ2XvmU00u7/Kgyh4Yd8479
	VLk5CW6dxF1mu6XKQt9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDk6X-00A2LW-1p;
	Mon, 26 Jun 2023 11:09:57 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDk6R-00A2E3-31
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 11:09:54 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id B713324E26A;
	Mon, 26 Jun 2023 19:09:13 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 26 Jun
 2023 19:09:13 +0800
Received: from ubuntu.localdomain (113.72.146.167) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 26 Jun
 2023 19:09:12 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Walker
 Chen" <walker.chen@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Hal Feng
	<hal.feng@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 3/5] ASoC: dt-bindings: Add StarFive JH7110 PWM-DAC controller
Date: Mon, 26 Jun 2023 19:09:07 +0800
Message-ID: <20230626110909.38718-4-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230626110909.38718-1-hal.feng@starfivetech.com>
References: <20230626110909.38718-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.146.167]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_040952_293130_ACA88719 
X-CRM114-Status: GOOD (  11.85  )
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

Add bindings for the PWM-DAC controller on the JH7110
RISC-V SoC by StarFive Ltd.

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../sound/starfive,jh7110-pwmdac.yaml         | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml

diff --git a/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml b/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
new file mode 100644
index 000000000000..91a4213f2bd8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/starfive,jh7110-pwmdac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 PWM-DAC Controller
+
+description: |
+  The PWM-DAC Controller uses PWM square wave generators plus RC filters to
+  form a DAC for audio play in StarFive JH7110 SoC. This audio play controller
+  supports 16 bit audio format, up to 48K sampling frequency , up to left
+  and right dual channels.
+
+maintainers:
+  - Hal Feng <hal.feng@starfivetech.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: starfive,jh7110-pwmdac
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PWMDAC APB
+      - description: PWMDAC CORE
+
+  clock-names:
+    items:
+      - const: apb
+      - const: core
+
+  resets:
+    maxItems: 1
+    description: PWMDAC APB
+
+  dmas:
+    maxItems: 1
+    description: TX DMA Channel
+
+  dma-names:
+    const: tx
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - dmas
+  - dma-names
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    pwmdac@100b0000 {
+        compatible = "starfive,jh7110-pwmdac";
+        reg = <0x100b0000 0x1000>;
+        clocks = <&syscrg 157>,
+                 <&syscrg 158>;
+        clock-names = "apb", "core";
+        resets = <&syscrg 96>;
+        dmas = <&dma 22>;
+        dma-names = "tx";
+        #sound-dai-cells = <0>;
+    };
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

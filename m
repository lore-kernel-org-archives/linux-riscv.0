Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F406C7EE2C
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 08:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNNCFo0j6Mf/1ZnSWFWtSqLY8vAgqojTQOFhbLo3iCg=; b=3wwOp3wTzpxMCJ
	5OAxSew0TEGPDxHy7/hys+/ktZ3uY77r32xJ8JCrWfgKSwUa9+QGZ/608+pH/BF9dT1oPwC/BoW+G
	++0FyxON/ZyHcRshTu3J4M93z7ksDizTU9sEz/+53tqR/R5kzLT0RPlcAAJn6gZaHBHqrosryERqH
	eCSo9WJA/2XzaLBY2DHVr4elUGCIpzzLj23HE0INA28HG+z1O+cMjf1VayZSALHxK7DpmIxC0NtAQ
	F538k/cCjRw1ARZtTE8foQmX/BI83ZBnSwEp25ocvvxqbRdHF2kDCb/IxlVQs06WBk5evFBEaklrz
	D4u70aJ1jCd0Kp7fIiCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRxa-004btN-0z;
	Fri, 25 Aug 2023 08:14:26 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRxV-004blW-0K
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 08:14:22 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id CCAFB81F6;
	Fri, 25 Aug 2023 16:13:30 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 25 Aug
 2023 16:13:30 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 25 Aug 2023 16:13:29 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pwm@vger.kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Thierry Reding
	<thierry.reding@gmail.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Paul Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng
	<hal.feng@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>
Subject: [RFC v4 1/4] dt-bindings: pwm: Add StarFive PWM module
Date: Fri, 25 Aug 2023 16:13:25 +0800
Message-ID: <20230825081328.204442-2-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825081328.204442-1-william.qiu@starfivetech.com>
References: <20230825081328.204442-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_011421_380378_D863F77B 
X-CRM114-Status: GOOD (  11.45  )
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

Add documentation to describe StarFive Pulse Width Modulation
controller driver.

Signed-off-by: William Qiu <william.qiu@starfivetech.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../bindings/pwm/starfive,jh7100-pwm.yaml     | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/starfive,jh7100-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/starfive,jh7100-pwm.yaml b/Documentation/devicetree/bindings/pwm/starfive,jh7100-pwm.yaml
new file mode 100644
index 000000000000..6f1937beb962
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/starfive,jh7100-pwm.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/starfive,jh7100-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7100 and JH7110 PWM controller
+
+maintainers:
+  - William Qiu <william.qiu@starfivetech.com>
+
+description:
+  StarFive SoCs contain PWM and when operating in PWM mode, the PTC core generates
+  binary signal with user-programmable low and high periods. Clock source for the
+  PWM can be either system clock or external clock. Each PWM timer block provides 8
+  PWM channels.
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    enum:
+      - starfive,jh7100-pwm
+      - starfive,jh7110-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    pwm@12490000 {
+        compatible = "starfive,jh7100-pwm";
+        reg = <0x12490000 0x10000>;
+        clocks = <&clkgen 181>;
+        resets = <&rstgen 109>;
+        #pwm-cells = <3>;
+    };
--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED920D3B996
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 14:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IqgdeAcZZ4V0Ei3lZXpEO1wW7dPn+UgRiPp9BiVKcME=; b=u/rNfVaBnCqzNk
	4XwWPQwbXnadQRwvy9LS3JJZmvVJgFd32jK5RYIpBw6uVm+38ARQsb82AXCi/AWEmV3ecAZtSE+ky
	lY3zg6wsI+tBlmwsvzj4pQT8Tmlm8DRY9Wa1V/5d2NM7GO4I6NjCwFOjw/ZcusJZ7rVF8Xl0LNh77
	4jp4Jr4naMHm5K+LHANSc3GfHFfyO0T4Z3H71E1AEUeA0IjMZ2I0YPiDtx/34XI4YuiStjZ7WkGXS
	HAgT+XmkAum98zbfF0orcOx9uL0rVIowVma0r+eVpQfxwvVv1FUnmu4UEdlwKCbET7+8NjY1M8UW+
	P3pdYtTfIBVvM6AG62MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwcD-0000000As8r-3IGT;
	Tue, 26 Nov 2024 14:32:33 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwcB-0000000As7U-1MIN
	for linux-riscv@lists.infradead.org;
	Tue, 26 Nov 2024 14:32:32 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id CBD58122FE1E;
	Tue, 26 Nov 2024 06:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1732631550; bh=JB8BIxTGaTGfUU+m6SG+ie3h9piBzLjzt7E2HoV/2QM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QgTS445NT5R9V7CnaiiVSSUiQTVt6dUeAd9O8Bc3WiM7Rl0tPFrocWqGcQXsrpG9t
	 jrcY5YipcG3TKeCu/BVyk60WzHAs3IzL6Ao/VtwKeOKW91bCK0Hzm2m66Q7a28uD0+
	 /UmIz7aDNLgzqDFEzt/ZemJrs8e0ZK1Bc9nYS8SEQt+vsBLejahRqt0X1pEk5icOV/
	 GvrlyWjZvWtwqA++Q8kbft+fFeA38X3zEVXaWBhdp/dFZMQhXhSkb05zBhBjymIkhl
	 eNqNZ9tdiJViSflWDxF1DiRX9Jehm4Ov+ZYDsxxqCsn4JJSE69tj9jZtzjKiRxkQlz
	 GTpmVfN/1EunQ==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HR3BbJp9UQEc; Tue, 26 Nov 2024 06:32:28 -0800 (PST)
Received: from localhost.localdomain (unknown [119.39.112.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 47C68122FE26;
	Tue, 26 Nov 2024 06:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1732631548; bh=JB8BIxTGaTGfUU+m6SG+ie3h9piBzLjzt7E2HoV/2QM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o0D0QpBLDM2V15bF/Uv/NCTR9kr2ZdMEJ+YpjrgKMWQfTzkoPBNpz1fW0o/ARNZHU
	 fyTSLPoA0EEA2BbvvakSDdIFIMA2eKpdiXwNpqA8iQjLnB+mN7993C2CYWDil7HhHS
	 AaDy62MTsKk/erLdivhTsV1Z2xbajNrT6pIRe2zhafl5/NUhiDcwSMVz9KmAArwUaM
	 KsKrWIEy3mJoP4KprleVkc+MdIkofq3zIwhZfFano3t1REtXKP2a8T5LUkeZ345UTn
	 pk5QVtWZVrf+0Ba5eWXuo0s6W3hNpNa08JDEcNNu+ulYrsdlnaVseorfUo6kbFKz1D
	 fn6Bd5E/d6fVg==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@4d2.org>
Subject: [PATCH v3 2/3] dt-bindings: soc: spacemit: Add spacemit,k1-syscon
Date: Tue, 26 Nov 2024 14:31:26 +0000
Message-ID: <20241126143125.9980-5-heylenay@4d2.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241126143125.9980-2-heylenay@4d2.org>
References: <20241126143125.9980-2-heylenay@4d2.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_063231_391146_CBD34A9E 
X-CRM114-Status: GOOD (  11.56  )
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

Add documentation to describe Spacemit K1 system controller registers.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
---
 .../soc/spacemit/spacemit,k1-syscon.yaml      | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
new file mode 100644
index 000000000000..b9f20190a70a
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/spacemit/spacemit,k1-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spacemit K1 SoC System Controller
+
+maintainers:
+  - Haylen Chu <heylenay@4d2.org>
+
+description:
+  The Spacemit K1 SoC system controller provides access to shared register files
+  for related SoC modules, such as clock controller and reset controller.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - spacemit,k1-apbc-syscon
+          - spacemit,k1-apbs-syscon
+          - spacemit,k1-apmu-syscon
+          - spacemit,k1-mpmu-syscon
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  clock-controller:
+    $ref: /schemas/clock/spacemit,k1-ccu.yaml#
+    type: object
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    osc_32k: clock-32k {
+        compatible = "fixed-clock";
+        clock-frequency = <32000>;
+        clock-output-names = "osc_32k";
+        #clock-cells = <0>;
+    };
+
+    vctcxo_1m: clock-1m {
+        compatible = "fixed-clock";
+        clock-frequency = <1000000>;
+        clock-output-names = "vctcxo_1m";
+        #clock-cells = <0>;
+    };
+
+    vctcxo_3m: clock-3m {
+        compatible = "fixed-clock";
+        clock-frequency = <3000000>;
+        clock-output-names = "vctcxo_3m";
+        #clock-cells = <0>;
+    };
+
+    vctcxo_24m: clock-24m {
+        compatible = "fixed-clock";
+        clock-frequency = <24000000>;
+        clock-output-names = "vctcxo_24m";
+        #clock-cells = <0>;
+    };
+
+    system-controller@d4050000 {
+        compatible = "spacemit,k1-mpmu-syscon", "syscon", "simple-mfd";
+        reg = <0xd4050000 0x209c>;
+
+        clock-controller {
+            compatible = "spacemit,k1-ccu-mpmu";
+            clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>, <&vctcxo_24m>;
+            clock-names = "osc_32k", "vctcxo_1m", "vctcxo_3m", "vctcxo_24m";
+            #clock-cells = <1>;
+        };
+    };
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

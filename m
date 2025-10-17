Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987BACCD195
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 19:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AM48TJ/3803L0EF0z0PUaqynJxo9cZ8ZaHvDrVpLTks=; b=WC1MbZ4MjG1S68
	L56oTU7WMwFXRCpZD5wc/s1MvjhS56CJIPLGhR17ZjC9RTvP6TmRDVlGlHlq0HOKRBJieNHuxhKvP
	Enhp+OdKQwECQ93o/RS2R9K7MNIpjRi8Vm3xXW37yyc6ANLFnLMCuQEJ56Wy0h7G/gNhJiAnLb0Up
	K3cHE+diqgit9KmVCgnGPkfmDpgsbRl04l1HzbRiXcUqvayk2vIZX2Dxec1cqIrqq8MCHrq5oovSU
	TNTPVVTIQMgLFIu3+JMaqBunCOps9tYaorloQswyK9yqOqwwS24IjqHERABsEiow+4BT2oV3P9Wdl
	T92iBaYg+AHlcYcHTd0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pns-00000008nx2-0Hz3;
	Fri, 17 Oct 2025 19:07:52 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pno-00000008ntE-0sBb
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 19:07:49 +0000
Received: by mail-il1-x141.google.com with SMTP id e9e14a558f8ab-430b621ec08so19158785ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 12:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760728067; x=1761332867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/3BQdd3vn0d3oIHDdjobMfykMV90YiIp5S1jVARxr8=;
        b=NwjtQAvc27cS4D71DFiMlVu9JNgsJfNKFZ74mYfkciN3k3SmVZAUQi5OjRWjac+tyJ
         /jDNhTOiFfjh+E1kDIr6VNX/Y0JkRefAzBsHNC4f42BMwN7yeUWn15cNBqvMGAVM8NIX
         a6QiHgCBZqQw+VaM+914ohTZFv/5mA12RRYvRkyeMfQhlTVkVRIcqDoWCq/i59lWT++Q
         IPnGz/cvRFkQU1nYe2mo1Px2LvvW2jlRwJ1QPKuN+YCP7UHwam1XwjxvSmX5jTLFL5bo
         EFYYpeZ6oq26xNrSnjzQ6hvN9XWmuiqz9Io96b4pGPyg1g+bK8S6Cxs/WMk7T3E0AsAS
         NvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760728067; x=1761332867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/3BQdd3vn0d3oIHDdjobMfykMV90YiIp5S1jVARxr8=;
        b=jm3Dv/uZyJtZgFS5xWOTYJd/McLhtiPsy//TxSdGIoNxSJwdFFmxSuxyqtdn8jJhtV
         MDw1eI0rnZ2uaJEYyBQtNCQ/tsc1vMutQOgXCi48v5V7EGp+E7FFCswd4SIMRdOyLkkJ
         yzPckYMcMXWYJ3ojY2xEjXwgCP20br432GjtmUujzZOwgKt++VgW+Ut2NUIkp88xL9qY
         kkd2j+VJCPrenspf1nFpoxDOED4RlbPJojv22on9GxwVgVjtsV2KmmV/2gvR2JqWsnD/
         xlt8t58hhGaJTnL8XWhQWO2Hsy773AIy0pixDCa6HsPTLG0ZELggYMJFCSZqWVmQMxWy
         Tzyg==
X-Forwarded-Encrypted: i=1; AJvYcCWqXWe3PRzQyY6891osD9ah1I1DRTy90EPH0wp0++pcSAyg69uxDUNZWaDCkqTovHjcexwbBF0x39pDiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw93QWdhC90lAIZ5GMjbrc4yikZNNqK1cuu6qCTfQzTDX8dMwqB
	ALMte6PO+FVRL+t6Nf+MyK29IaRXCc5XQsGDuCGKqz8jXT+mQCEHxfxTq3mW3Y0WbVo=
X-Gm-Gg: ASbGnctfB19KciBPl775Dp5UH2GgHljJ1UwTEygL3DFrQ9n5virjbIPF2LavnSEwdZx
	HzCatK5MHagOMk/rvXmfKodvC1U9HINfO2FKE+5CLYbONs/dAPXujUB+X1yOQGH+aBVmQ3huOAx
	2JNYuThlljxK34/Bh1jNH/FXpgx18A5UYdTUyN01sB6Ng3igVDvIyAcv2ZHTPApm3N3E3SyAeP9
	rqwP7maYjuuxTpOKWG0IM2FjXQvPSuotCPbliMdjZ/UbZL8g8gpk66zhsZUV7k472xJODbQ9IFV
	tao46lhoiqPYo+8Wa6JzTFHR2WbC/JeFJrdT3jdRfSBGRAmGu+ICRhkLZNVvvj53Tr6TzEuTwgQ
	ealP5KoU8XQY0Ko7sgoW2wRON4ik61YK9N8X2/yJs0hN+ie6jzsfRI2SJThLQspZRy/gfAz1wPI
	DBLP+Xv8cltW55+q30/+vDt5GxfEDsRj1ilHmtAYRizyyt4HNz6c+QVQ==
X-Google-Smtp-Source: AGHT+IHRtsRSfhWCT9BQG3DcVkrpn6NA7ODycaChUBpFYwB1ZdnsTh8SKsqwMx76IAkXTipom5mlHA==
X-Received: by 2002:a05:6e02:148d:b0:430:b167:3604 with SMTP id e9e14a558f8ab-430c5209bafmr76757915ab.4.1760728067217;
        Fri, 17 Oct 2025 12:07:47 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9768b98sm153462173.46.2025.10.17.12.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 12:07:46 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ziyao@disroot.org,
	dlan@gentoo.org,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/7] dt-bindings: phy: spacemit: introduce PCIe PHY
Date: Fri, 17 Oct 2025 14:07:34 -0500
Message-ID: <20251017190740.306780-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251017190740.306780-1-elder@riscstar.com>
References: <20251017190740.306780-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_120748_255608_8C157194 
X-CRM114-Status: GOOD (  14.32  )
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

Add the Device Tree binding for two PCIe PHYs present on the SpacemiT
K1 SoC.  These PHYs are dependent on a separate combo PHY, which
determines at probe time the calibration values used by the PCIe-only
PHYs.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Added Reviewed-by from Rob Herring
    - A "phy" reset is now required

 .../bindings/phy/spacemit,k1-pcie-phy.yaml    | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
new file mode 100644
index 0000000000000..019b28349be75
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k1-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PCIe PHY
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+
+description: >
+  Two PHYs on the SpacemiT K1 SoC used for only for PCIe.  These
+  PHYs must be configured using calibration values that are
+  determined by a third "combo PHY".  The combo PHY determines
+  these calibration values during probe so they can be used for
+  the two PCIe-only PHYs.
+
+  The PHY uses an external oscillator as a reference clock.  During
+  normal operation, the PCIe host driver is responsible for ensuring
+  all other clocks needed by a PHY are enabled, and all resets
+  affecting the PHY are deasserted.
+
+properties:
+  compatible:
+    const: spacemit,k1-pcie-phy
+
+  reg:
+    items:
+      - description: PHY control registers
+
+  clocks:
+    items:
+      - description: External oscillator used by the PHY PLL
+
+  clock-names:
+    const: refclk
+
+  resets:
+    items:
+      - description: PHY reset; remains deasserted after initialization
+
+  reset-names:
+    const: phy
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    phy@c0c10000 {
+        compatible = "spacemit,k1-pcie-phy";
+        reg = <0xc0c10000 0x1000>;
+        clocks = <&vctcxo_24m>;
+        clock-names = "refclk";
+        resets = <&syscon_apmu RESET_PCIE1_GLOBAL>;
+        reset-names = "phy";
+        #phy-cells = <0>;
+    };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

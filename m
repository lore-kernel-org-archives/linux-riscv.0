Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9273CD98E3
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 21:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OI8jp3cY3z1WzNKY3BB0ZYwvbAMTxUAAxb60odUFnV8=; b=chXnmx6YR0T4JB
	MXbcsWFuH1dYQgJaKgzl+ZHhn0ZOvD6QXRHBTnwLxuB1ckxvWxPYC5yw7KzsIbDi0X5cmWVcEvqa7
	s03fuQFyQKN0VSgz7ERkJeF8kDOtEJv68kPGNAQ2KxLaU5+mQJTX2CKicJnDumxeuFGc3lOPOhBYX
	/ghHvRwyrKEF08aip4B5VGtcSeuqv1MaMaqSEUKG5gWh5i5ILbYMwn2EBc3fA7pCEGG7YMxlPhTgP
	xlPpQs3l41zKbIVr33htThXGjJloxtqbgvRs7qyj6N6fNFqK9gOzWLiZg34U5H0G8NWt8GTccBIKd
	gJBFpCI/h2AsMN4LEdaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJf8a-0000000B9CT-0Di9;
	Thu, 13 Nov 2025 21:45:52 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJf8V-0000000B999-37WZ
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 21:45:49 +0000
Received: by mail-il1-x143.google.com with SMTP id e9e14a558f8ab-43476cba770so5916415ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 13:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763070347; x=1763675147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLTdLkz5qoTZ4VZft5RozafvHivyKGwCA/saZ7bnL/c=;
        b=uWE7bHifWEWKuuewCZ8tBPVloM95jN6tipTA0gZJ81PHtK8ntmyZK4sz/YHgFFwjvG
         9bgKsKfLFnnJ6VX0UyqkOXXkdQ68/XP4Vwwnw8EFuBrRvMI3QX2y69p8jVHiLyU3/MMK
         bmo9nv0OUlZz77czpliF7HUo6VG4xm+t9Vf1/AZX9EW5Uy1TigqV7UKlvynY1BoN7pzH
         0n3U5c9wZE+WOnL6JwIGeKRjwnIL8gVg5k5DypONckSVTAxf5hU/m8L840KaxW7ehVRT
         fsGwqvUoR9EwUmW4jDh/Hmrj3xlNfdWsfcdzMkJXGEvfFHAtBuZKhfbNR95Zp7MtRb3o
         R3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070347; x=1763675147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gLTdLkz5qoTZ4VZft5RozafvHivyKGwCA/saZ7bnL/c=;
        b=q9OnDGUX4NpcrOfn5apvyxPR2rWK1hL7RCQ1xI7TQXWVaMSe77403olozas5ygrB4w
         HZzb4EsYOJAJfgKykzYiOB6OJJmd1TeUCMFwDiWVuJargA2nojQNJFzvTeNU5gKrALz+
         zvfyZ2RWuPXaxFnHPzKJvCyYPsXWrwddYfLH2DoMOquZJJTajdivIAVdgMZ1srHj+08Z
         iSQYMxcASvL4obN+t3OxDBzh4GyJDQKZe2g7GgBmbtdRElS2ATqQzlbfLwz1HTDqTqYU
         p1NgMkSCvxg+tjQOnglpgXqo8n7Ze3EuuQg8D88mzTReLXA5UXlUxlRHopgLW0exrgYn
         fvMA==
X-Forwarded-Encrypted: i=1; AJvYcCU7JDkguakqZzlwnCUDQGxdDkUIXj9oScopxO4g8dBSH/Msa+ctOUIyoVhX1Gjjjpl7ZAOiHeJ3Ud71vQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz6FzDHO//Fy1UZldQNnM+9/6PsuZ96g8kYuONUYFq3hhWlAts
	GFDxAMVUPz5yvaJWwnna0xBY0A/zUxWqkHlS8QpnUxi6xM3YtRChSmEFo64apWWx5xE=
X-Gm-Gg: ASbGncvpuA0yKVY84nxhVW3bq+iQPjhbOs3hpMQtQkrTl9RAm9z2kBmxC2BK5d1DISn
	6uCY4iBnFZwRnUQdzLirZAQC+3uY73VFG3mrVOEVkyU4N0yes/CNi+nGLUnRAwkkMCWwzW9ONzL
	1j3P8bjtc++ZhiMgEDtjkImJgOrbBgLtPrPVxDxhicrEXzh94WbOZW9SL1I+/LfZd0fIYe2bndX
	7WQSlHWdbz5j6Dv2kbV63FvDzQ1C8sEAiQyevDzpBBoDtqCqtlEMJzew5iYLYW6ayhJpOa3pDjm
	lPNCsU0bsIqu9/OB4NNglgOaKCyLG5xsed0Hgibr8sLwYIgGR2j8OYGb+NK3HiNXpnKOT4+bRkP
	3fBKhjdy7b5EukcZ9a9DU4TzrntAXAHkWn7itW4IeNHWqizBcS/ikgq0iGRjTbtjj/KY0tkCQcv
	LTwwpokELhVAr0+WZltXE6fImtjqSXRhwKyhR4Fwpgn8SBAWaBfwDf4YJLaOt00IOP
X-Google-Smtp-Source: AGHT+IH0iaOFvKkFoSvyh+E7QrJE8ooJ0JLk+JkYQy9a2bR8btw1mCKtxexcV6NZgeMvAElxAUOLHA==
X-Received: by 2002:a05:6e02:c8d:b0:433:786a:5203 with SMTP id e9e14a558f8ab-4347c4c87d1mr64708185ab.10.1763070346997;
        Thu, 13 Nov 2025 13:45:46 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839a4ac7sm10877115ab.25.2025.11.13.13.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:45:46 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/7] dt-bindings: phy: spacemit: Add SpacemiT PCIe/combo PHY
Date: Thu, 13 Nov 2025 15:45:33 -0600
Message-ID: <20251113214540.2623070-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251113214540.2623070-1-elder@riscstar.com>
References: <20251113214540.2623070-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_134547_793167_AEEF5B17 
X-CRM114-Status: GOOD (  17.27  )
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

Add the Device Tree binding for the PCIe/USB 3.0 combo PHY found in
the SpacemiT K1 SoC.  This is one of three PCIe PHYs, and is unusual
in that only the combo PHY can perform a calibration step needed to
determine settings used by the other two PCIe PHYs.

Calibration must be done with the combo PHY in PCIe mode, and to allow
this to occur independent of the eventual use for the PHY (PCIe or USB)
some PCIe-related properties must be supplied: clocks; resets; and a
syscon phandle.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/phy/spacemit,k1-combo-phy.yaml   | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
new file mode 100644
index 0000000000000..b59476cd78b57
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k1-combo-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PCIe/USB3 Combo PHY
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+
+description: >
+  Of the three PHYs on the SpacemiT K1 SoC capable of being used for
+  PCIe, one is a combo PHY that can also be configured for use by a
+  USB 3 controller.  Using PCIe or USB 3 is a board design decision.
+
+  The combo PHY is also the only PCIe PHY that is able to determine
+  PCIe calibration values to use, and this must be determined before
+  the other two PCIe PHYs can be used.  This calibration must be
+  performed with the combo PHY in PCIe mode, and is this is done
+  when the combo PHY is probed.
+
+  The combo PHY uses an external oscillator as a reference clock.
+  During normal operation, the PCIe or USB port driver is responsible
+  for ensuring all other clocks needed by a PHY are enabled, and all
+  resets affecting the PHY are deasserted.  However, for the combo
+  PHY to perform calibration independent of whether it's later used
+  for PCIe or USB, all PCIe mode clocks and resets must be defined.
+
+properties:
+  compatible:
+    const: spacemit,k1-combo-phy
+
+  reg:
+    items:
+      - description: PHY control registers
+
+  clocks:
+    items:
+      - description: External oscillator used by the PHY PLL
+      - description: DWC PCIe Data Bus Interface (DBI) clock
+      - description: DWC PCIe application AXI-bus Master interface clock
+      - description: DWC PCIe application AXI-bus slave interface clock
+
+  clock-names:
+    items:
+      - const: refclk
+      - const: dbi
+      - const: mstr
+      - const: slv
+
+  resets:
+    items:
+      - description: PHY reset; remains deasserted after initialization
+      - description: DWC PCIe Data Bus Interface (DBI) reset
+      - description: DWC PCIe application AXI-bus Master interface reset
+      - description: DWC PCIe application AXI-bus slave interface reset
+
+  reset-names:
+    items:
+      - const: phy
+      - const: dbi
+      - const: mstr
+      - const: slv
+
+  spacemit,apmu:
+    description:
+      A phandle that refers to the APMU system controller, whose
+      regmap is used in setting the mode
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  "#phy-cells":
+    const: 1
+    description:
+      The argument value (PHY_TYPE_PCIE or PHY_TYPE_USB3) determines
+      whether the PHY operates in PCIe or USB3 mode.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - spacemit,apmu
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    phy@c0b10000 {
+        compatible = "spacemit,k1-combo-phy";
+        reg = <0xc0b10000 0x1000>;
+        clocks = <&vctcxo_24m>,
+                 <&syscon_apmu CLK_PCIE0_DBI>,
+                 <&syscon_apmu CLK_PCIE0_MASTER>,
+                 <&syscon_apmu CLK_PCIE0_SLAVE>;
+        clock-names = "refclk",
+                      "dbi",
+                      "mstr",
+                      "slv";
+        resets = <&syscon_apmu RESET_PCIE0_GLOBAL>,
+                 <&syscon_apmu RESET_PCIE0_DBI>,
+                 <&syscon_apmu RESET_PCIE0_MASTER>,
+                 <&syscon_apmu RESET_PCIE0_SLAVE>;
+        reset-names = "phy",
+                      "dbi",
+                      "mstr",
+                      "slv";
+        spacemit,apmu = <&syscon_apmu>;
+        #phy-cells = <1>;
+    };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

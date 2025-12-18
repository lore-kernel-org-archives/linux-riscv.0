Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D0FD6D22E
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 15:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OI8jp3cY3z1WzNKY3BB0ZYwvbAMTxUAAxb60odUFnV8=; b=hX0Z7c8FbfY2Kh
	ddC5ifQ4Gpfq94gzANCPNxietYG3KlV4P8syZVbC70npHzfJBFlvZg7pJrHES9j7MzGiBUSpyGXnd
	n+9nLfS5Zqvh392K0yohkxLDGHLGpszHE+GDquW2xrmJOZpNvnNdKpH6MEBrPy5XPGVDEagZ5GXwF
	DzOk4Kp/YVlFqAHJpzuZwImiBFsbFYJgmUFvoMtmHH2o2t6sWxgo4eZRczsQJqyNnCGLMrPAMrXrX
	3WGt9OszR1M6iaFDBtZkcHLZJeRBwTarfV5dGCON98YEVrTO6z9ipHzHi6Oz4GBrFeQwAVHVePskp
	NkaauaDhozSvx3F1iwgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFgK-00000008fBp-42Tz;
	Thu, 18 Dec 2025 15:12:44 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFgI-00000008fA4-3au4
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 15:12:44 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8b5ed9e7500so57065685a.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 07:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766070761; x=1766675561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLTdLkz5qoTZ4VZft5RozafvHivyKGwCA/saZ7bnL/c=;
        b=gftSd7T0slzrtHsM2rPEUKi7jC6svsKfPkODZbxsQ4/JzVBH1i90HIG3mjIiFJtMdA
         yMg20j2bUq6Njt+HHLQyt2a1JY16WpU9y2Q1sSDEWE7lTfyZXwsVQ9pKEpFcXPr07+gq
         G80K/l77TZj/gtkMIjdrkjQNlhDhAmR+w7R2FcvpXRTgc0roY8E6VKONExQWQmV/EMWQ
         SRvVpKlG5REk66mQi5oYDxbOsiHN81hKSXneIR4/BvFoZZiTSovlKuIiWNp8b1Zklpul
         4Et+QXZf+7Qt0Eu06WkzNBsC9NV9sZhvW5KumjXJjGj2CWO2R2bMWmTJDuYSuehzh3e+
         Jfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766070761; x=1766675561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gLTdLkz5qoTZ4VZft5RozafvHivyKGwCA/saZ7bnL/c=;
        b=G3gp8H8oGjiwZsxwyHSlRhqMxBZmoaMxk8Qr2EaZCFzAklWJJtfUBEMXVdlJNo6c3H
         9uCZ0c9q0Vo++QMmwx4mtyl9f4EgRKO0zizHyubGg/HuB6hsX0Uqp46+huxsIZUnOT9u
         7EW4zuZtgPTUWzPmPiKoDIJookspMJU1bLa0LG/PBxZAvh6ngNVOcR0+cTwQk7hQ2vib
         nAskG8QnXyhLNjpscX7UA8IbZQcp/4H6BKR+lCrZXM2wTApKHGq5G5xeGcTksx6j4aUd
         RfbQZ7vLyXy35iXkibcn79ScdU/tSvUp+7QrvpPhL45voxh4wa+eaz5jT66ZgVTEBThb
         9zHA==
X-Forwarded-Encrypted: i=1; AJvYcCWSq1/BHXRbP0KbJgUC7cdrLlJRtlxW2BJB4EQ5RiogZ9ABAHxcF8EisFJecCw3QcQ4XB0yOR5KrU/7og==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2Fh1g7i3kkS+ezwwhjD9z7uv/Pgzh1vpk/w3L04UAlhaEfck9
	xsSfSZjGIXQJViyaf5jDRs//+b60iHfzXlLuruVl65FAAxfIzkXCpRt+B9O8+PG2YGE=
X-Gm-Gg: AY/fxX5t99kID8kZ7acYrbboz7xC+xlLEgJRyXg1fAFf3hzQ1+K0j8cSpDAnZr9rcoV
	o/LHt2UQTyxXhtKVmn0IV107wboxCIDPpRyVHQ7WT7MIx6Gws3fMaPYdv9X+i984HopCxkK1LY4
	O5u8Jx0x3zOm+/Fy0ctQlB1SFEWOIkWBRXDkQLpvvI7TUpIxsRgyseNYicZ8Uziicbbw6uKSYsa
	FBgUmYxxx/9BCITs9mqh3jNNhxrSZSJJb420oUgHOtQtyZI1PkE0/k0z9V3FQisMuZ/omH0x0nw
	0Xaos+IHwu52+5zZy4nPhLt6jrKqDUaiWvjwekq8QeGyjCwyLyyKyIjN+rAPAo55l+wwDrqBpP/
	pD3PM1N6tVXAET9Ld3gUf2teqSbQP1JncCdwqscuF1GMhXHMHVFLyNW5QaKeGHGhHgkmBP05Y+N
	N0GqMNovTc3tLimCyeCqD7se9dGfn8ScdTJVhwYEYb7cc2NpbNlOlRaw==
X-Google-Smtp-Source: AGHT+IHSKbVF665YqEXD6O7jBmj3jVOl2qS/oc2FAj0GURakfZVq9yDRUofhfwxuBkxQ2pFqUC7fSw==
X-Received: by 2002:a05:620a:6919:b0:8b2:e88e:a518 with SMTP id af79cd13be357-8bb3a384dafmr3194221685a.68.1766070761282;
        Thu, 18 Dec 2025 07:12:41 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8beeb5d6952sm186866985a.3.2025.12.18.07.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:12:41 -0800 (PST)
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
Subject: [PATCH v7 1/5] dt-bindings: phy: spacemit: Add SpacemiT PCIe/combo PHY
Date: Thu, 18 Dec 2025 09:12:27 -0600
Message-ID: <20251218151235.454997-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251218151235.454997-1-elder@riscstar.com>
References: <20251218151235.454997-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_071242_912635_C39DA440 
X-CRM114-Status: GOOD (  17.31  )
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48831CCFA19
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 19:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z14hvWTW13llKGfRVFMsU5Y4lbNNaTuh02BtNOV7RVg=; b=gmB0pgbMgPCrI8
	tFFgwESLmfwSM07n0Khx5V3RanJF1ujPHEkQgFdWZTiEQmOnFW5jRmQ0uH4qwTb9F7ZqS+rSOz7oc
	aDFp3+vgq25UNMOblVq1+PdFKGxzH5aPGqC9aRRZRJghQzFNyZlA50npbpJESzAVNfDwtXZbQP8Ub
	4y6fka90GgU1UmLILX9fle3XyhYitB+Wx1ZABWHlTo1DkGnGCrgy7XW3J56JBoo+qHE0gxSh1XfRl
	REpvrtJDF5XpALeX3YCBX9QfSUkk76JNEJtpeaHItZcKsA6mHrAeP6694x4o52DJaKIHFM8Nq7xSQ
	l3niNFStMDxVOvO5vfsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRwU-00000000ffV-0pXh;
	Fri, 07 Nov 2025 19:16:14 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRwM-00000000fYx-0AYw
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 19:16:12 +0000
Received: by mail-io1-xd44.google.com with SMTP id ca18e2360f4ac-940d25b807bso38441239f.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 11:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762542965; x=1763147765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ay3vJcZn8gR8uhIOX8xdTsiqp7cEn/zrhd4VkngAbaw=;
        b=0kF3NFmh7MNBkUYnnHwxRe54a17sEmUb/Dc7wWGCG5DP5+sw582DEZ/m+gzNpwHEFl
         AuKbfTjVRTHLFCoUqpcQFNFDtQPVV6nnb7Cjwo3n26s0T1v95kI/DkyMF5hiUGmAzZ2r
         kzpy/qTYxzI/j38ritF9cJ9L9wkeOnt4MnYwRS8+cxI44R+z+eLz2QVWYX7k2vW9zJlH
         I6dLJYMtBWx5iDLePeWuG2NDJ4WaCrE+MEkS8EtVo5JQAB8Yzn/x+zFI5p9VgqE5h1pt
         PJaKJDlrzOWx5wdunP4xzhtS3OZAv0+uo7n2yDXReTC0PCH9X1mDTd25iSpAD/1m0GwZ
         QQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762542965; x=1763147765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ay3vJcZn8gR8uhIOX8xdTsiqp7cEn/zrhd4VkngAbaw=;
        b=HDJU6PuyXLqBLSYZk9qmDJqvDvA0EaycS8e8unusKX5ofq8F9o78EsTzvi3jR5HXE5
         ijEZnPBY/XjooTypz+neWX0FDTir24ZuWamKDkOjSiG6yJRibV6t5fh1dInBErMpvaXx
         /Unnaao3zrocV1B/fsWPmqwDQ9buzaDaJmyTEbUTVnchtaXPe716Aeb7j7WiA2wYvB+s
         Dtr8HcoRGv9Y2/0W5qr8FKR723PV/7q38cMJJVdxBrf1+dC537caRmYZDxRtoITEbN3q
         CNLWwRBOFBDY0dBy2zrl8CD6/RowN0M/f9Xl8SiznouUfMzssxNIQG8c0Gg5Td2GHnAO
         z4Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWMxEeBTBGp90hX+Z+jXkL8cbv/1+ZxzSTY8eog1sjfaGsXOkNmwkEU1IxqICY05OLQRJDpnMQdsE2jtg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGefOrilh4OFgPwU0kE1UnJ58/BZRiAQWKA/9WJC59NHyDz9ML
	BdYE2Vl5D7K81Hm39R/VAFRFL8yzN+uffpLItYBiAXP3hPzrsLTjM5PZjCp2iE7gTAc=
X-Gm-Gg: ASbGncu1+p2UXvj0uY0B2d1J6bQitUpX5i9Ft+VVbYLdWQo3RcB3YSUYAXTFZyvFppG
	FSJXz0Bpbvl5mhcwDrmrbww3EA+O8qRDVuJyzVhDAlS7F3/x6hV6AapeSYE/fwVmg+bmfJ9m2X3
	4sjvJ6rqbS1uIDOka0fkKpY/0GGCQt8maxi6Vm8jcHgnJpLM6CEEuB7fjYjMrqyfI4Y+XIxW1yI
	9qBFG1cFMMVJ+0wSLijjraSYfTLAZwUDqHOJdXEu0kCYw93pGIrx3H8akk9VaZ55ZhyazFJE5ij
	va64P1MS2lkUzZmj6dqR4EZqTcY6bTSlOQRnx7dGVa66zBeY6wPSQWCP+BwD+o5PIO0q83SCWkx
	wgnWhv7Ko9X7Sq/d7KpCSWvmmW3ds1Dut+i3C977ZlAJhzm0m2+NEbykB9bRuNG4S3WiPcfv3oJ
	x/yRZnj+Z0V4UhzcVbac9/0+x/8c7xVqDOzAru9pzEjqg=
X-Google-Smtp-Source: AGHT+IHCQMw8gkgpun15fOExG5Sy7WYN+BCNzSaipPURAOzJ4FqM/yDv4HIDN8wPjwaYW4Sy0gZ/Fw==
X-Received: by 2002:a05:6602:15cf:b0:948:7c51:1977 with SMTP id ca18e2360f4ac-94895f83afemr60413039f.4.1762542965062;
        Fri, 07 Nov 2025 11:16:05 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94888c34c6asm118772939f.10.2025.11.07.11.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 11:16:04 -0800 (PST)
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
Subject: [PATCH v5 1/7] dt-bindings: phy: spacemit: Add SpacemiT PCIe/combo PHY
Date: Fri,  7 Nov 2025 13:15:50 -0600
Message-ID: <20251107191557.1827677-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251107191557.1827677-1-elder@riscstar.com>
References: <20251107191557.1827677-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_111606_078608_2E7ADFF7 
X-CRM114-Status: GOOD (  17.25  )
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
v5: - Wrap lines at 80 columns

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

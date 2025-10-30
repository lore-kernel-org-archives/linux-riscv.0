Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F78CCF9FA
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 22:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJDCK66wwuwGK7pB5a1W3tyataKqmCrrpkdwGsRMiFU=; b=VbmAPeeYyDSd3L
	i7j1g/1qU8oVJTgKYtpbDXMUDjODeZjMWuv/Ycvm8cnnwcbiIESO3LTvG0myPJDIyKEBlnbKyMIm7
	CQl3MO4rlwTh2qRm/sZTGawGNipEdDA8+/qxpGmBmUgw+4rg35hfIOA35qbgXqlmqTzHVQCj0eRlH
	JAtpj1HzaP6dFJhjnbyijDAB1NADMlwePZCM76zKIB+Oy/LuqoJSOWKSURpzNhG2cp5GxLpfS5N97
	jq1wZeWedeLdmuxB7qfPcak+XKU+tW+nbIsugkS0p63e32XcUhaXMfVyxxNvXGnO4chicq2ZzLd+w
	QvFMblTiC+kdgvML3kMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEajy-000000051Ld-10sS;
	Thu, 30 Oct 2025 22:03:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEajk-000000051FC-1zBy
	for linux-riscv@bombadil.infradead.org;
	Thu, 30 Oct 2025 22:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oxyyAVz+sgzum76hhNZkaYgPP0OtOtVsykA+Y1mmKUg=; b=KJEDYl4tpDem8LbHLUQw3dkH/v
	+2Ir3s3pQyYy5PsdvcrKiB1pA8NWxECUKTTBcsaD2WgijeWxL0vEL5pFXYx28hRwsvIM06luBkDWa
	sueS3Xj5nOrVwyfTqAYb+8ml6DEbm1Ht/xtPCUIquIX0GXWYwgn2DyDMd42NJigTR4q5wYNuNU3eU
	ke7LoOTkUVE0nrlX53EKcm1GIv680zMrAzeNXKNpGDVlx4swso+JTBABXn01EcKeQMxofDTI13uju
	15/uleUOQv+7bTSHz98aGBx04G+NdjI2jYhU1WYI9/wcnvLlKbjNhnVgG/6hgkxfK7wmLpoRoABjg
	bM1c54Jg==;
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZru-0000000A5fn-3b1P
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 21:07:42 +0000
Received: by mail-io1-xd44.google.com with SMTP id ca18e2360f4ac-94822ad1baeso36433539f.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 15:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761861788; x=1762466588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxyyAVz+sgzum76hhNZkaYgPP0OtOtVsykA+Y1mmKUg=;
        b=fG0WKSt6NlqJMfZIcKg9ueIsgdieVvmraNwNI5cLsPSBi1BLIxuysJz7CDZe2bJJrA
         jTAajNd6IJ0dfvwYNDWaV3P1mzRORPQ9LuqJe3PE+z53bYB/oskxoH8qvZhYdQ78PZJC
         /ERF540GSkvgh29OC8vfJI/CFscI+OwbpexbD3xhKSe6dptKYCQECibj9zLMKj24z8z3
         3vMHTy+NFO3GB6gVbNrjUF+4HBJmmsrib1SI2LkikFCYziRTGiQg2QOWcK6GBBZxW++9
         c6mo+e5W/DJx+ydEHCjdsaO4JzKlp9DW3lPhAv1fou825evA/6/17NQV3Urez8vaYgl4
         MatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761861788; x=1762466588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxyyAVz+sgzum76hhNZkaYgPP0OtOtVsykA+Y1mmKUg=;
        b=lNKPWkPdd9a5nyNPniIo5r2XRgnCU/7DIkT5ncGc33eFdNkW/FIg91zMPKJN93+v7i
         mKXUroRoVJZy2T/8fXttVFAZ1JI8+/SwVOKz7Icf8DT3xhTdA6wuBWwE+X/bG1e9xbt0
         m/2y+5RgbkHfg/xZZqIUE++T4lknIu0WtUMGoAC17y2g0mOWmgvi9L4XBifu+sX0IRhC
         DAARUcFCdocEor7WkznCC/qv2veGPlf60AGczqOZcWMkDWhlBYDStz7TBdTqOmKL+ulI
         6txYEiy5Uz6DG9MHxJM3IW+kLwD+9rVy55Mp5XIjYUHIRNg7ohy4G1CbxglT67u1xt6A
         KduQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxEw2IFucUQzqV/e8XMNTDKPsnQ4oEex14fVBIWxAljr8t+23PrLyGcCo/ybTNb33vsck17LygVGLtuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDovxB8Mv2saITHVuCgy+pNtgD5GL4lIMOucWdhe51e2FpvBml
	gfFNQ0V9aBTzeEhE/6Vf8Iw2ZN0y5acWdgKRXR+7oqll9MUbuXgMW4NL5cuZenII9tA=
X-Gm-Gg: ASbGncvQXiLR2lWg0ge5Pth/G/bdZjogM+1otiDH+OBmKDtg+G01DdEaSVSP2q0lvZ+
	S2e8SEopGtKylefHUdp37/sgqKi7M9ePwzOuuB5Issfbr5auc3XKi8PzjWO7wwfZ2ihTmWBugyQ
	eVA0xSrAwpbKFmO3D8K+0pfz/MGiiEn118O9HxdHLdsdC5nVBq2YVphNcSQKpzdndzKGtwUt2tB
	h/7JrA9ay3qtzjIr4ZM+FvudsaSV3KnnHNw72PC1ZSJCUAAm6BbjpEgtfuAD28W2bM2+FgyHcIU
	mZMl3JXHxp23ol+ARb/ZaY2PsreDBkcBOxzGETrP/a/GfSO0HZ7CULB0Qi/Gs1mkr+A/E/WppTX
	tGkoQJ0Jha8mGBHvdzjILfTEOu62V4jLJgmBiLZWZq5laaC27depRvOQVVDzHKCICuY7l7lgDMW
	UhJU+FdzDNYXW5XaFx4pjHXSGqWDU2XSQZo0IHaeLlRmA=
X-Google-Smtp-Source: AGHT+IGz6tkmi1cHmh6ulh0zCDoSzwGc5CJvBHc1MrsOfeBEWn+5+KxyIgdxU5iCd47VdKbfJn2utw==
X-Received: by 2002:a05:6602:2c92:b0:945:a58e:ba03 with SMTP id ca18e2360f4ac-948229a4807mr241086939f.8.1761861788149;
        Thu, 30 Oct 2025 15:03:08 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94359efe149sm604118039f.13.2025.10.30.15.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 15:03:07 -0700 (PDT)
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
Subject: [PATCH v4 2/7] dt-bindings: phy: spacemit: introduce PCIe PHY
Date: Thu, 30 Oct 2025 17:02:53 -0500
Message-ID: <20251030220259.1063792-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251030220259.1063792-1-elder@riscstar.com>
References: <20251030220259.1063792-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_210739_115981_B12803BE 
X-CRM114-Status: GOOD (  13.89  )
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

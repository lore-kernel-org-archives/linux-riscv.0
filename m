Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4C3CCD18E
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 15:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDJYBjEVo90HBWWQ4XTZZuuaVZhvIbOVxIdkl1Sm28s=; b=ptAsyWRJMxsz/Z
	hJil98ykPcmKPYsemVemr5muEy+96bChdeOxha7XKSNnLGzYNt25K34UtIQFADi9VXl0NqnHWU43s
	sSw8lC1roe4Gv6qDKYYv+KiVnm9OmD08Xo9xXkYprXMnVW9IDmACXWGnk95VHWE+RTsJDBS90s8/O
	by58A3nNS4X09JvBh2qNyK+RmI3qc4pzsiV6nazfvI4fyEc5TT1HHTVf+s90oAZbSCRWtW4DjwTSi
	SeMTeyCmWIwTTFhXAwT2yf7GDgpLx/XoNET5OFfoEJ4NuV3SDG9KcXihsBdSNdGpo053m2aFw6ZGN
	vrNOjou9LddHaUr+Ftcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KaI-0000000Di6m-1jPf;
	Mon, 13 Oct 2025 15:35:38 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KaF-0000000Di2p-1TUn
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 15:35:36 +0000
Received: by mail-io1-xd42.google.com with SMTP id ca18e2360f4ac-938de0df471so415473239f.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 08:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760369734; x=1760974534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItZ4QqP7CdgD+87y0OCgM795Wvqv9yPDWR/uT7250ws=;
        b=DGURoEUESi546sj3gKKOdd18OIPXcupN6aBnFxBH8hHrPFwAXb/3t+zATwcWfEVLxT
         1D3iVlQgsMPPAPvSgzVrQCgBzUjgQAGsAyTtXOpoSjj9475cKyK1pIcHrporUG6UM/5I
         bGQ1BOnqKdy2wbwE1KdUmKAJHPrZLHaWQmCuV0ZjjLcjcaj6kSfi1pyL2NezukI4vR6S
         xIsjkCR3bvht9TuWGNifUdiHEsyMBU2OWumYURpwz54zajiBFRhunGVArHfhYlIdQNve
         fD75SeZ/2fk5LEukRgGmR3CGadZ++v+dsl+gsC6vTdDQ5bPueHFnpIXg3WvemoL+S9Qu
         KWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369734; x=1760974534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItZ4QqP7CdgD+87y0OCgM795Wvqv9yPDWR/uT7250ws=;
        b=W11FqfR+U0wpHEXqx3dGGp8LZxQk/3uzO7H3LlcLX1wbZlAD0X0VeQrZn4pWJqcDxr
         2IbNSMD3t1l54PLhXw9vOJCPiCwM/UdUop2aGU9xuYwIeoSXfRoa+8G5jIrvBmuszw9f
         metuLwslsmKSYRdmUZl6YItT0WhMoRm7Ps80VurrQVGR2OpIL3swEtXqoUwDanBKvxqm
         9E4UDNft7v3rr+dh1zwzrhN/ak2m4vwIbdfvRsKImnrBXYsyGRHfryuRJMqp3CjXJ4WI
         G9+0H5S5fAlCPXJhMbyRHmcCeUAWOLOy+prG42QYVP9c0o/adWH+Avi51/ufPsvCwUn0
         +TIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi0X/18pAGT+U1ptdxGD28b8T0mt6BL4RdykRZ23AW7C+6rkXOQPZ0XNdp1RZ7nXdnqMa6HAbB1xA4cQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw24HmnhIOigqivd4RIClx4DoPrnXiQPw99MSxzFo0LC7mndbWo
	/qwj2xCSJfy2O3JvLZHk+7dwuZPUWLebMxq9WBO7uVlEaJ1YGWPWwYULcdO4HyMb1hQ=
X-Gm-Gg: ASbGnctP/W5dePEV7FoVcTY6vzhkaK5xnujXe0U8lzwIZHnFFoy8QykD+XbyOmRzS4i
	0d/U6LJRZAHDPhARkSjCivJYGrQcMwj9FRhVFDLlMCDW+Qj7z8Dwu8GQxAEx+pt5qwtZ+0G+Hkg
	GhgMrewNJDo2fta/jiMkGKLw7+A8Wb8Kt7Ejt7ANE9glhCrhdhN8qPrFuV21ZHySxh5P5eYPjiB
	c2lMoH6N6bLM8vpXDBZl6Bx49qNHMcUB0CpRhsRqnBG7VPsaU8LvO43Z1bIHOG/AuwR9W58JAz6
	C2k3QtiLH6pBavFAJxTAiyWqZHdaEDZPAur5coWcnZLKJcXcoXM0Ui12E1QO7ABJ6HsJw7n7aVV
	PgLhQxUtbZtdrTuUxdoj5IrJ4fnFvaBgk4hnb2MTRtiMSL1NmutmZnRcBvcJ4gw5xSExjXkhjUc
	eYtAEPfjJif5ggHPbSE3M=
X-Google-Smtp-Source: AGHT+IFmberiHinW0psgBSVXvfzyFWo7xiMin2ObR4QgSx+XvFz7VLt0jdPRSfZZaq11AbbGpmoe2w==
X-Received: by 2002:a05:6e02:1808:b0:42f:a6cf:8afa with SMTP id e9e14a558f8ab-42fa6cf8cc8mr116550035ab.19.1760369734595;
        Mon, 13 Oct 2025 08:35:34 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-58f6c49b522sm3910266173.1.2025.10.13.08.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:35:34 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	christian.bruel@foss.st.com,
	shradha.t@samsung.com,
	krishna.chundru@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com,
	namcao@linutronix.de,
	thippeswamy.havalige@amd.com,
	inochiama@gmail.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] dt-bindings: phy: spacemit: introduce PCIe PHY
Date: Mon, 13 Oct 2025 10:35:19 -0500
Message-ID: <20251013153526.2276556-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013153526.2276556-1-elder@riscstar.com>
References: <20251013153526.2276556-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_083535_394917_37DA407A 
X-CRM114-Status: GOOD (  14.37  )
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

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Added '>' to the description, and reworded it a bit
    - Added clocks and clock-names properties
    - Dropped the label and status property from the example

 .../bindings/phy/spacemit,k1-pcie-phy.yaml    | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
new file mode 100644
index 0000000000000..c821f6cafcdae
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
@@ -0,0 +1,59 @@
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
+  There are two PHYs on the SpacemiT K1 SoC used for PCIe (only).
+  These PHYs must be configured using calibration values that are
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
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@c0c10000 {
+        compatible = "spacemit,k1-pcie-phy";
+        reg = <0xc0c10000 0x1000>;
+        clocks = <&vctcxo_24m>;
+        clock-names = "refclk";
+        #phy-cells = <0>;
+    };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

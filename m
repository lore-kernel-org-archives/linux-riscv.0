Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A9CCA0EE0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 22:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=POVgnwKSghNh+XHa01027vwLdHkafjbCkpnNdKL8BRM=; b=gcKKVBV/igKSXy
	4dhLhcyJjozjbe/uyO1M7zhIoh+eC7LiggPjSl7IQJ80x4LErVNvikKzKwdPx5WPb6qO7DlmXsLsS
	W3J+kdKUioR/G3VJuz0J3yahgOg7oSC72f1/7GcfcMZxr+UsBA3TYSJvKkDa5rYm0+S0D1Ezycjha
	p4JeFuWm97P4Obw4uCYgDYx4cy7qc0yjzZp1TPIMO9d3jzgsqIAXt8ExenpQkyi9GV/43toyL87Qb
	/XoDmywPXmvWUh4nI5NzmbmoWnWBa4FREvJ8ADEJTxYB3CAWwsx5Sgpa67fqEVPkYLl5cku6E+5iE
	mqunkwW8uRIBURkE16qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umKEp-0000000FBdu-2YZp;
	Wed, 13 Aug 2025 22:46:31 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umGVF-0000000EjLe-3u0s
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 18:47:15 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-435de702f1fso130193b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 11:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755110833; x=1755715633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/fqC4nALQVMBj7bFUL2jEw1OtiREN8C4zl+rZu4SV8=;
        b=1Q7fI1klIdGdYYN3JvVnIOewnsCsDoUi5YIFF50lY2rt5Y6xjAHCIjpJkMHgkj4Zzj
         X2WIq+hI/qTV2eLUO0JuC4b47fIhUZPV6XuEmKUYRTY0aj9Zyc8A6pAg2WPeM28vQJ37
         XptN5YUix1VYE885ZQVxDMD10LbhsQIo2WDogMIVrt0GLrC90LzUirj6wuWsfSSqxjf1
         yG87YRYxrVy5K387ebCx0A4Est9x2x/wXngFOVzotHtm3xLwT5XdVY5VT32dSSIWqG0i
         memxFe5RBQM2bsQifeqsbuEIWhgwuXRTce0O+A8zEZ8tRJ48C7CHJqElAOZAv3YdJdEs
         U6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755110833; x=1755715633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/fqC4nALQVMBj7bFUL2jEw1OtiREN8C4zl+rZu4SV8=;
        b=dIi+W2et90iyVH8YIeg0ig5KEEKUZE2g8E/mVuWJZK93xy7YvAgiKbLbj7gLzKqcOE
         QJorXDb7LY32P9QMsLMTrE/0Jn+iP5Kb8QN/yDn1xebOuY6zstkuGMQFVTk8jk2SEO7F
         +FBJ8XV6pjROIJtPX5Dusde6IsVGG6pcahRKK/CMuW6G9WkLFdVD+rC1DZR+ENp4y8HG
         3+ibbWw+gVl8pqstuPM9xz9e1d9T+LBCTGqPmb9r7tXg4cu2nmqVQnj45ZEz2hVWMnHu
         ghxrCnsit4sw8ho+GhIE2Mnn/5NppoCVbaKy/Bqml6gIQhVs205xUw8cDepgiig8XWXN
         WLUA==
X-Forwarded-Encrypted: i=1; AJvYcCUnYiSFyURA1uL8UQDA66AmVe/Wp+XHHLkmIVjgECVCqd/ml9mzKASweFDXE9pScbA2WvXtZrU+clzYlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAnGSEa9PKuWKQVVFyqHuRRhP9G0DavBRIBs9n+KntNpAmhNB3
	wyKSeNjyznwuKUxQBR2OsdJfqq70oIgZyWi2OcQtKksa/whUoo86LeAAjWJOafwyMRI=
X-Gm-Gg: ASbGnctJ4xryGFy3niEE0tFy9qx/Bt2QCSCO/at2fZIW507oWJYeuL8ad1WxkE1KUh2
	hMRdUj9SF2+CQf0dSORIMtarTXw5TieroOdDdoxOElBlSBrmG1DcnS1xeBZtHcgJetxyXfEhD17
	KUsJyBbAUK36lkQi8H/glh1WW4OIMV3GmKrUC+i7kNHW5X99fIVrkzC2OmgmpO87SRUKFBo4y2L
	hO/rDzRvLaWrx0k8gS47iJnd9DtdBQu3/lgphGytT7iOcq7Oy3yaOK7NKZjzPR+mp8Yhe2JennT
	F/11Bp2gR/sAdZzygUEYPfTPxtEhU3vTYloXiIvqjNyCEBXfGkDcJZvQyJiHEdF/onZCK5yY5f6
	NuhHHQF2KvwGI56b9YVfWnb7YjbmCq4TXfbp1wJv/Z7kBLbnywcTQ7mbTrTYBg0vp/VwAU78nnJ
	l9
X-Google-Smtp-Source: AGHT+IHF1n+ZhqP61SwoH204sSXJGnu+o0AKgjp6BGFXm/PCtUV8R3O/mmBermEKt/vAX0VIMTfJcg==
X-Received: by 2002:a05:6808:7004:b0:435:6c1a:f3b with SMTP id 5614622812f47-435df6f2ce2mr177943b6e.14.1755110832896;
        Wed, 13 Aug 2025 11:47:12 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bd89d7sm3933104173.59.2025.08.13.11.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 11:47:12 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	tglx@linutronix.de,
	johan+linaro@kernel.org,
	thippeswamy.havalige@amd.com,
	namcao@linutronix.de,
	mayank.rana@oss.qualcomm.com,
	shradha.t@samsung.com,
	inochiama@gmail.com,
	quic_schintav@quicinc.com,
	fan.ni@samsung.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] dt-bindings: phy: spacemit: introduce PCIe root complex
Date: Wed, 13 Aug 2025 13:46:57 -0500
Message-ID: <20250813184701.2444372-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813184701.2444372-1-elder@riscstar.com>
References: <20250813184701.2444372-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_114713_977588_E97B3A58 
X-CRM114-Status: GOOD (  13.50  )
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

Add the Device Tree binding for the PCIe root complex found on the
SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
typically used to support a USB 3 port.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/pci/spacemit,k1-pcie-rc.yaml     | 141 ++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml
new file mode 100644
index 0000000000000..6bcca2f91a6fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-rc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PCI Express Root Complex
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+
+description:
+  The SpacemiT K1 SoC PCIe root complex controller is based on the
+  Synopsys DesignWare PCIe IP.
+
+properties:
+  compatible:
+    const: spacemit,k1-pcie-rc.yaml
+
+  reg:
+    items:
+      - description: DesignWare PCIe registers
+      - description: ATU address space
+      - description: PCIe configuration space
+      - description: Link control registers
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: atu
+      - const: config
+      - const: link
+
+  clocks:
+    items:
+      - description: DWC PCIe Data Bus Interface (DBI) clock
+      - description: DWC PCIe application AXI-bus Master interface clock
+      - description: DWC PCIe application AXI-bus Slave interface clock.
+
+  clock-names:
+    items:
+      - const: dbi
+      - const: mstr
+      - const: slv
+
+  resets:
+    items:
+      - description: DWC PCIe Data Bus Interface (DBI) reset
+      - description: DWC PCIe application AXI-bus Master interface reset
+      - description: DWC PCIe application AXI-bus Slave interface reset.
+      - description: Global reset; must be deasserted for PHY to function
+
+  reset-names:
+    items:
+      - const: dbi
+      - const: mstr
+      - const: slv
+      - const: global
+
+  interrupts-extended:
+    maxItems: 1
+
+  spacemit,syscon-pmu:
+    description:
+      PHandle that refers to the APMU system controller, whose
+      regmap is used in managing resets and link state.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  device_type:
+    const: pci
+
+  max-link-speed:
+    const: 2
+
+  num-viewport:
+    const: 8
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - spacemit,syscon-pmu
+  - "#address-cells"
+  - "#size-cells"
+  - device_type
+  - max-link-speed
+  - bus-range
+  - num-viewport
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    pcie0: pcie@ca000000 {
+        compatible = "spacemit,k1-pcie-rc";
+        reg = <0x0 0xca000000 0x0 0x00001000>,
+              <0x0 0xca300000 0x0 0x0001ff24>,
+              <0x0 0x8f000000 0x0 0x00002000>,
+              <0x0 0xc0b20000 0x0 0x00001000>;
+        reg-names = "dbi",
+                    "atu",
+                    "config",
+                    "link";
+
+        ranges = <0x01000000 0x8f002000 0x0 0x8f002000 0x0 0x100000>,
+                 <0x02000000 0x80000000 0x0 0x80000000 0x0 0x0f000000>;
+
+        clocks = <&syscon_apmu CLK_PCIE0_DBI>,
+                 <&syscon_apmu CLK_PCIE0_MASTER>,
+                 <&syscon_apmu CLK_PCIE0_SLAVE>;
+        clock-names = "dbi",
+                      "mstr",
+                      "slv";
+
+        resets = <&syscon_apmu RESET_PCIE0_DBI>,
+                 <&syscon_apmu RESET_PCIE0_MASTER>,
+                 <&syscon_apmu RESET_PCIE0_SLAVE>,
+                 <&syscon_apmu RESET_PCIE0_GLOBAL>;
+        reset-names = "dbi",
+                      "mstr",
+                      "slv",
+                      "global";
+
+        interrupts-extended = <&plic 141>;
+
+        spacemit,syscon-pmu = <&syscon_apmu 0x03cc>;
+
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        device_type = "pci";
+        max-link-speed = <2>;
+        bus-range = <0x00 0xff>;
+        num-viewport = <8>;
+
+        status = "disabled";
+    };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

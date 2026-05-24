Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A772CD5BB1
	for <linux-riscv@archiver.kernel.org>; Sun, 24 May 2026 13:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2z0z6X3HkzecpDt4gZrTxtz+r7VNmi3Ciitkqei3XN8=; b=tHHIqXV6VHoft/
	VE+1icuNeZB11/+Q1TLzYVE9pWMdL2Gg+RIMWsx0XrUC8Iaweero8pbqq4DESdAPG2AcGr+4AOYd6
	KJq4uXHy4qkGMFoE1gZmzgxZdzpTkB1jXNfSHBdP7+We9hU0fj0dYOjzqfcrGxTiGQ3Hv+rYZSSMk
	hMp4FCgX4wiE0+PIbZ5iS4sPJoD8YLy6dKVosIvC+RhzDMibfuSJqpBbdvaX3UvA1u2FgAxWNAVpT
	nTt35heRR95ynWwLoWa6qWSR1dZXh2JRupuACwn+pjqs27dyxjNDAyES7sqeVPzrchfI+V8I56zvq
	tMLdduHB4oVw1JX818Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR8en-0000000F00S-2WY1;
	Sun, 24 May 2026 13:14:17 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR8el-0000000EzzP-0G50
	for linux-riscv@lists.infradead.org;
	Sun, 24 May 2026 13:14:16 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c7980c060cfso3660080a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 24 May 2026 06:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779628454; x=1780233254; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TE8wJ3jlNRIEeJNM4GCaChXdFFOYYazZzeu2MkBYm4Q=;
        b=WrADNsJZ/EHoLWzJrPb791qnd3Iaa+mg9T0HsjBAn9wavC7bBhHmbfnmOTmO4VKhJQ
         rS21zkAEeypmeFuxLBCox1UCS/ps1FIeTV5CApprIREDVaQEH984CaUmE8c3PAuogCO7
         YAJJC1c2LHUtPObWVb/HnHdSvu7ur303fRqyoblBKgArnYuikdzRkc+f/8cvoP42lU+A
         4Cb+J+wGsDpUulBZWKEThgKbI6Xaw4SodDeL0Ykd9gxzHRd1VLusigzvwRZAQ29HGstt
         GzXIHwf9OKfjxRAAruSjsBMMcsozcWU15F4DUsC2Lwt1ipNpUb3Y9IGDKDu1AVk7FHLt
         l8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779628454; x=1780233254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TE8wJ3jlNRIEeJNM4GCaChXdFFOYYazZzeu2MkBYm4Q=;
        b=GeR6XdqkJ6oqzREX51nEoiaYjo1ylsJZWyajCv15NFIO5OGGsfIPqDUqHuguQ0sp/z
         0D8Pd80kt64lyQxQ8uThyI3bdtSyVN/HuV74Y3j0Pp83q8HIfpbJQV8gvXELWKdEdy6x
         v+AkUdvZA6r1K3p8SaGr/K1bas3BzXt4FxpGS+RDszrcpEdGwZDnH9Y3Da8YwaU70IxJ
         Ptspj1pB4M4SWDLuYbIZOG9rsF/zHYh94GA+gbLobtkfgYs9nPuqwQR30OW4Ce7JnduH
         j+w30VxBcglNbBnrWJ3XnsF46RnBcGp2fVN/8vSUsJN12gNCuVu9FIuAwLpw2urysjsT
         HiGw==
X-Gm-Message-State: AOJu0YwNvy/KVzOkIzmjBunOZFxs3g05RcK+tFbDvZkprby2glNYHdjn
	ws6TyizNWHNms6o5Ur79puz4vNgmYYUBMc+PKMlHKIBDhc9zbU+9osij
X-Gm-Gg: Acq92OHXPj126EW6RoJoqpys6hr+LNuWC3ipxFOfucnXvKTE2pOsa2s78WyKNunsmRT
	GE7Yx5qhhPjHk/ghYKHXthbEKymu1cIoc8qbQ1xpKsPL0Mqr1EfeQ3XYbZXqwthsKM1dWZhaKN8
	wmXbdTrxlGoF7LXZR3oDQQxiuOMakFlmgkIArX8u6dclkd2JQ6C0F1LtMbOz/3J42kBrn60KH9K
	DlIKzaISACaGMzt3tvr1ZYkYDRiApHKqxJayBwuP87C7XIg3dNZGgKpRMnipYskpH0SKPh+BLlw
	JDg/4EqPUXefwt7JAs+mDK96l7J5H94JRKAe+XqaKQuo6jovEcsDeqmEQrJM72W9lHJdZ4XB4zw
	O4fUK7x932RuEAm5xiBIPZ+aEVH3V36TTXXwVZN1ztZD5oKqVQTuW9vov/dHkoYqi2f0JutDeO/
	ujy6dcXvTP+QBXNNmV4Y+FabskLNA=
X-Received: by 2002:a05:6a00:10c9:b0:82f:70a7:4a25 with SMTP id d2e1a72fcca58-8415f3640d3mr9954766b3a.35.1779628453867;
        Sun, 24 May 2026 06:14:13 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.159.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb28d5sm7163128b3a.41.2026.05.24.06.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 06:14:13 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 24 May 2026 21:13:07 +0800
Subject: [PATCH v2 2/3] dt-bindings: clock: add header/doc for Siflower
 sf21-topcrm
MIME-Version: 1.0
Message-Id: <20260524-sf21-topcrm-v2-2-4527aae05c3d@gmail.com>
References: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
In-Reply-To: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Yao Zi <me@ziyao.cc>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_061415_113416_2680F56C 
X-CRM114-Status: GOOD (  11.46  )
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

Add the device tree binding header and binding doc for
Siflower SF21A6826/SF21H8898 toplevel clock and reset module.

CLK_ETH_REF_P is a clock name that exists in the vendor datasheet.
This clock connects directly to CLK_PCIEPLL_FOUT2 and there's no
clock gate/mux in between. An alias is created for this clock
to make available clock names align with the datasheet.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 .../bindings/clock/siflower,sf21-topcrm.yaml       | 60 ++++++++++++++++++++++
 include/dt-bindings/clock/siflower,sf21-topcrm.h   | 42 +++++++++++++++
 include/dt-bindings/reset/siflower,sf21-topcrm.h   | 25 +++++++++
 3 files changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml b/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml
new file mode 100644
index 000000000000..3782d9c32370
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/siflower,sf21-topcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Siflower SF21 toplevel clock and reset module
+
+maintainers:
+  - Chuanhong Guo <gch981213@gmail.com>
+
+description: |
+  The toplevel clock and reset module on Siflower SF21 SoCs manages
+  the main PLLs, high-level clock muxes/dividers/gates, and some
+  reset lines.
+  Available clocks are defined in:
+  include/dt-bindings/clock/siflower,sf21-topcrm.h
+  Available resets are defined in:
+  include/dt-bindings/reset/siflower,sf21-topcrm.h
+
+properties:
+  compatible:
+    const: siflower,sf21-topcrm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/siflower,sf21-topcrm.h>
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        clock-controller@ce00400 {
+            compatible = "siflower,sf21-topcrm";
+            reg = <0x0ce00400 0x400>;
+            clocks = <&refclk>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+        };
+    };
diff --git a/include/dt-bindings/clock/siflower,sf21-topcrm.h b/include/dt-bindings/clock/siflower,sf21-topcrm.h
new file mode 100644
index 000000000000..1b2e3cde931a
--- /dev/null
+++ b/include/dt-bindings/clock/siflower,sf21-topcrm.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+
+#ifndef _DT_BINDINGS_CLK_SIFLOWER_SF21_TOPCRM_H
+#define _DT_BINDINGS_CLK_SIFLOWER_SF21_TOPCRM_H
+
+#define SF21_CLK_CMNPLL_VCO		0
+#define SF21_CLK_CMNPLL_POSTDIV		1
+
+#define SF21_CLK_DDRPLL_POSTDIV		2
+
+#define SF21_CLK_PCIEPLL_VCO		3
+#define SF21_CLK_PCIEPLL_FOUT0		4
+#define SF21_CLK_PCIEPLL_FOUT1		5
+#define SF21_CLK_PCIEPLL_FOUT2		6
+#define SF21_CLK_ETH_REF_P		SF21_CLK_PCIEPLL_FOUT2
+#define SF21_CLK_PCIEPLL_FOUT3		7
+
+#define SF21_CLK_CPU			8
+#define SF21_CLK_PIC			9
+#define SF21_CLK_AXI			10
+#define SF21_CLK_AHB			11
+#define SF21_CLK_APB			12
+#define SF21_CLK_UART			13
+#define SF21_CLK_IRAM			14
+#define SF21_CLK_NPU			15
+#define SF21_CLK_DDRPHY_REF		16
+#define SF21_CLK_DDR_BYPASS		17
+#define SF21_CLK_ETHTSU			18
+#define SF21_CLK_GMAC_BYP_REF		19
+#define SF21_CLK_USB			20
+#define SF21_CLK_USBPHY			21
+#define SF21_CLK_SERDES_CSR		22
+#define SF21_CLK_CRYPT_CSR		23
+#define SF21_CLK_CRYPT_APP		24
+#define SF21_CLK_IROM			25
+#define SF21_CLK_BOOT			26
+#define SF21_CLK_PVT			27
+#define SF21_CLK_PLL_TEST		28
+#define SF21_CLK_PCIE_REFN		29
+#define SF21_CLK_PCIE_REFP		30
+
+#endif
diff --git a/include/dt-bindings/reset/siflower,sf21-topcrm.h b/include/dt-bindings/reset/siflower,sf21-topcrm.h
new file mode 100644
index 000000000000..fa700accff54
--- /dev/null
+++ b/include/dt-bindings/reset/siflower,sf21-topcrm.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+
+#ifndef _DT_BINDINGS_RESET_SIFLOWER_SF21_TOPCRM_H
+#define _DT_BINDINGS_RESET_SIFLOWER_SF21_TOPCRM_H
+
+#define SF21_RESET_GIC			0
+#define SF21_RESET_AXI			1
+#define SF21_RESET_AHB			2
+#define SF21_RESET_APB			3
+#define SF21_RESET_IRAM			4
+#define SF21_RESET_NPU			5
+#define SF21_RESET_DDR_CTL		6
+#define SF21_RESET_DDR_PHY		7
+#define SF21_RESET_DDR_PWR_OK_IN	8
+#define SF21_RESET_DDR_CTL_APB		9
+#define SF21_RESET_DDR_PHY_APB		10
+#define SF21_RESET_USB			11
+#define SF21_RESET_PVT			12
+#define SF21_RESET_SERDES_CSR		13
+#define SF21_RESET_CRYPT_CSR		14
+#define SF21_RESET_CRYPT_APP		15
+#define SF21_RESET_NPU2DDR_ASYNCBRIDGE	16
+#define SF21_RESET_IROM			17
+
+#endif

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

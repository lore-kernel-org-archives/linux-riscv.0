Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E6DC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 22:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M2LJCggcds8WDv+xJeB0GUdqzyQSiXY92WXsuW2mjhw=; b=Juq0RTnlZu0itU
	699Ml8L5qHmdDy0cDPeGdpx/CQVSBBWbP4FcZPgt6Vn76f49o425Pz/7IA2vjyiOgTbbsSiKdzdth
	n0caHfQTEtIh7Vd9e53PShfxKoNH9ZOFMU0ExM/YjJkk6A+xeYaVgmMM87C7zfgwYMXeMTTO7y01N
	h0JSQ8RJUFvvlRwkEK6iTZqreHyX7v8YFS+lBawuOmJyZ8jA8a8SPt8hJZp5157Zz5gwFG8Y3Bkxu
	HOlnHkFiSXUqcl/QE/gmVdfq5WMTlyHIiCqK9zXgum831Pz/PpkMncVltsOhJNST305E/D3UBYGmD
	hK6KKWhe3uJuhIxticPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofTzY-007vdE-P3; Mon, 03 Oct 2022 22:32:52 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofTzU-007vbx-3v
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 22:32:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id z13-20020a7bc7cd000000b003b5054c6f9bso9825702wmk.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Oct 2022 15:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XSXor89wvMD5IbxoY6sxhht7eSGoSZ1Ew/JcVOWsAPg=;
        b=Pvz8y4NKbKjMNfIDOpelT+9qJ3evjx9PctMQZkAVVk0/0mLz9A4jDMpyiuuwENsoxq
         wB2AFMgZkXJR4whgW5h02M/8UK9yCTo5vsqAmpNYC2rZU5TZm223cKdfBjp2lWIFXsP5
         9fB9qseBJ76wAMB8+/UqXV71Sfkyz2DBUbx2u/DsB5JLlRtjwUB0H6RZ7i5i4OicNkwq
         +ZoSpMhfa/QktYQrqJGhvTH+FwAvThsIvRH52NMHcFFNdYjynIrCT2fXvll6OPed/PLE
         EmS1n9fs9rAMK23s0GpVQBNKeBi3CgIOp2HnbSTsc2xRQkOlrgSoXefcbB3zG9s22hUx
         w4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XSXor89wvMD5IbxoY6sxhht7eSGoSZ1Ew/JcVOWsAPg=;
        b=UEt8xQQilq3a7g/KVS+hFc5UDdzwFS7bw9yo0Hyn69B30DgGwII19iIZtpCJ4q+MGK
         tI37xPY0CwkBDsn34zPlpGLVcflAMpb/4MZK2rVUaIhYMDi1S+RnEqjufF8bwz5sreTe
         uvww1o2Eh3cTvC/v1uUbLHuUV6grrduODJwC7toK4vToyA2z+FKqfvT6Dc+NTZSjlqA2
         zcW8RFj2jWCiC7P3L+51NHsYvdynjOJPfJvC2I5818QMKQ5XhirDg5DmIgYYE4JwwBZi
         VDhaAOAmn1hN4K6Qq/Frggqi6SYOa+PtFDds6yVB0Esk8qxm0k+fEOrGO6U4ejyhjZ96
         cqgA==
X-Gm-Message-State: ACrzQf3LuN8oemBSNhqeB3NDYpFPfmTajyrAxjv6eP1LLNwDhvxlauvD
	zKTZY69Rxlk9JwMVDiIYpEw=
X-Google-Smtp-Source: AMsMyM68z2gks/2+M/TnH4uz8efG41m2sGfpfTsoKgKttrqNcEXtubTr+3hO2kD3AuW0+n7czVZJCA==
X-Received: by 2002:a05:600c:1990:b0:3b4:c326:d099 with SMTP id t16-20020a05600c199000b003b4c326d099mr7888667wmq.19.1664836364460;
        Mon, 03 Oct 2022 15:32:44 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c8:2501:c701:34b9:36fa:3827:d20])
        by smtp.gmail.com with ESMTPSA id m64-20020a1ca343000000b003a6125562e1sm12884871wme.46.2022.10.03.15.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 15:32:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH v2 1/2] dt-bindings: soc: renesas: r9a07g043f-l2-cache: Add DT binding documentation for L2 cache controller
Date: Mon,  3 Oct 2022 23:32:21 +0100
Message-Id: <20221003223222.448551-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_153248_181271_B86BB428 
X-CRM114-Status: GOOD (  15.04  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add DT binding documentation for L2 cache controller found on RZ/Five SoC.

The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
Single) from Andes. The AX45MP core has an L2 cache controller, this patch
describes the L2 cache block.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../soc/renesas/r9a07g043f-l2-cache.yaml      | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml

diff --git a/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml b/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
new file mode 100644
index 000000000000..f96eeffa58ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) 2022 Renesas Electronics Corp.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/renesas/r9a07g043f-l2-cache.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive L2 Cache Controller
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+
+description:
+  A level-2 cache (L2C) is used to improve the system performance by providing
+  a larger amount of cache line entries and reasonable access delays. The L2C
+  is shared between cores, and a non-inclusive non-exclusive policy is used.
+
+properties:
+  compatible:
+    items:
+      - const: andestech,ax45mp-cache
+      - const: cache
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  cache-line-size:
+    const: 64
+
+  cache-level:
+    const: 2
+
+  cache-sets:
+    const: 1024
+
+  cache-size:
+    enum: [131072, 262144, 524288, 1048576, 2097152]
+
+  cache-unified: true
+
+  next-level-cache: true
+
+  pma-regions:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    minItems: 1
+    maxItems: 16
+    description: Optional array of memory regions to be set as non-cacheable
+                 bufferable regions which will be setup in the PMA.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - cache-line-size
+  - cache-level
+  - cache-sets
+  - cache-size
+  - cache-unified
+  - interrupts
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    cache-controller@2010000 {
+        reg = <0x13400000 0x100000>;
+        compatible = "andestech,ax45mp-cache", "cache";
+        interrupts = <508 IRQ_TYPE_LEVEL_HIGH>;
+        cache-line-size = <64>;
+        cache-level = <2>;
+        cache-sets = <1024>;
+        cache-size = <262144>;
+        cache-unified;
+        pma-regions = <0x00000000 0x10000000>,
+                      <0x10000000 0x04000000>,
+                      <0x20000000 0x10000000>,
+                      <0x58000000 0x08000000>;
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

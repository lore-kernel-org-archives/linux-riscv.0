Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22ECFC8303C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 02:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+Yoy2i3+rNJH4ouHxA6Y3HpXTpyBxvjTs/tQyr5bG3M=; b=1hdla8LkxJDJ91
	gyHaooSk0+eUUesKH/nQdmGplxDX2TZYl1f2pnporpOoGLdiSf7ibSIEZPHrEHl2Rq51gP5KNhB1w
	TB2OBVFogB0Ndz+HojLjvQ1Q2bwkqrMyhgdEA6LWDQOzNfPmQ1nwxM6/pUtariHccWrL360e/LjAu
	u99GzKDoUhI/Hz1hbkrGq/2jsGoNLFh0iP6uahlMF/LN7GT1QLh+WoVGziqe1zLj7vYG9ixdpwTUu
	CXrlPbcMMCsEuTig7BPocBbXXfeZWU6w5iY0FMozq3nGWpOFrKHi/RZFaRmO4zY/uISNPZusnDi07
	hvev7cGzLWc+PCMA2fcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9RM-00000009zvH-3m8A;
	Thu, 03 Jul 2025 02:12:44 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9RK-00000009zus-0yW5
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 02:12:43 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-235e1d710d8so89657905ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 19:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751508761; x=1752113561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S16+Wo1JY0zCcQqq1dcPzIA9NOiw0i4loy9qh5wd/pc=;
        b=lygSKd+12pvI8M49AIZt6mUm96Fbg9g4/Dv+/R7WuxfWUISsvsLfNIh8wiyEyvGx3x
         QoNkDw711AR1bDZx43BU/k+vX0u4vinJOYQ55BiKglZOAZ1BS/ouXCzUUFoFRp/GLqvL
         ALdnOGBsWwmrwYR0QhH0GhE2I7P1bx1pGdMlk1fLe1XDFzI2kPONlNZRxsPKTZjQobs5
         /ST4FymFcoH+5Wd9gsfjg76vD5XTxspL0iB+M3OT6Wt+Nxo0ihguVrG852L+r+pETzFg
         qR5Gk0edwCn/Rrc9MU+Ow9rVfTk01XnUCuudp4LBkQL9wChYXklCFUDZwI9bi2NEbhl/
         xFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751508761; x=1752113561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S16+Wo1JY0zCcQqq1dcPzIA9NOiw0i4loy9qh5wd/pc=;
        b=YazJYXSSdof2LrvbjEV+S3vDaneAh/JrD3xI0pj3qlrWWVyHD6td1aNJefDtqscezq
         ARNR/3s2okJ/BmhtiNQH4jp4azHRn60y/s8Pzc4eYS+dtsjGEyjIKmofxxJEXHeR8Bdb
         P098sYycAm/DPbS22GKu58hb0G4eVMOBuC83siKtCLGXpCr+l237DhCVFimPOl/g0kz8
         Gzx6io9olASAlJ1WR1yF3vOlqlfSPmC3qJvxsuns08R8R0Zmp91052qJ4UsDeokeW46Y
         eJnA5YugQtu1YMvlBaXZoP3pj/Hxowm40POwYgK4hYCy/tiFYJXJh7YqSUxHj49bCicD
         lx4g==
X-Forwarded-Encrypted: i=1; AJvYcCVIM4xE2fWYH4XUR11G9jSREF8hn6FIqCGym5mcu7jRvKwY9K0I/RfojgfkSXJuA/d7DUZQcvskr9aUbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSXGjADyKnakidNsOxJD3SIkffWKVLDcnPFvuJwZ8aX5zBVihW
	JXEQGg+CIZLBwvLb9ZOgNLhfK5+HcH1E1uDKAUQZEwH7diaL44s2wR36
X-Gm-Gg: ASbGncup+WI/TvCNMK/EN4+7ELmdlePyGKUVFbCYvuergntbMQqmUaGRx6pMXzqn8IJ
	ZF+73n/1PdycrBFYSl8xu/3UUxC1bQXXd6wBuIckuudzZ9wUHI274n/LwdNBuJ1DN4byIt3QlOg
	Rl4FMM2qidCr5kR6HoGdDOI6J/TROr8YtQhRc0iS/GKhvtBjJSzMNdqQcfKplbYXcV4O/Im3lDw
	iahFI+aAF4s/y9XponSCe59EEMJR8t+JaepZiRJGXMZkoznikLCtUObb9u2AaacysqkBkVIyLTE
	II/k+8z4qu/3xXUXUqQ0t8MA7xSh9juA6IPKJV5oMYNQGnf5c7NncN+k4ORU4w==
X-Google-Smtp-Source: AGHT+IFnmlwLaBLaGwc+N19c2w52c0k4AcjFAlDtZ/2XEfLCT2lg1jaNUPZxftwxJdpBB1iqrVZDJA==
X-Received: by 2002:a17:902:d492:b0:236:8df9:ab38 with SMTP id d9443c01a7336-23c6e591cd5mr88563685ad.34.1751508761218;
        Wed, 02 Jul 2025 19:12:41 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb2f1b31sm140649065ad.69.2025.07.02.19.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 19:12:40 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH net-next] dt-bindings: net: Add support for Sophgo CV1800 dwmac
Date: Thu,  3 Jul 2025 10:12:19 +0800
Message-ID: <20250703021220.124195-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_191242_273021_040D6551 
X-CRM114-Status: GOOD (  14.13  )
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

The GMAC IP on CV1800 series SoC is a standard Synopsys
DesignWare MAC (version 3.70a).

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
The binding patch is split from the origianl series
"[PATCH net-next RFC v4 0/4] riscv: dts: sophgo: Add ethernet support
for cv18xx".

Change from origianl RFC v4:
- https://lore.kernel.org/all/20250701011730.136002-1-inochiama@gmail.com
2. remove status, add "phy-handle" and "phy-mode" for binding test.
---
 .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
new file mode 100644
index 000000000000..b89456f0ef83
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/sophgo,cv1800b-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B DWMAC glue layer
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - sophgo,cv1800b-dwmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: sophgo,cv1800b-dwmac
+      - const: snps,dwmac-3.70a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: PTP clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: stmmaceth
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ethernet@4070000 {
+      compatible = "sophgo,cv1800b-dwmac", "snps,dwmac-3.70a";
+      reg = <0x04070000 0x10000>;
+      clocks = <&clk 35>, <&clk 36>;
+      clock-names = "stmmaceth", "ptp_ref";
+      interrupts = <31 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "macirq";
+      phy-handle = <&internal_ephy>;
+      phy-mode = "internal";
+      resets = <&rst 12>;
+      reset-names = "stmmaceth";
+      rx-fifo-depth = <8192>;
+      tx-fifo-depth = <8192>;
+      snps,multicast-filter-bins = <0>;
+      snps,perfect-filter-entries = <1>;
+      snps,aal;
+      snps,txpbl = <8>;
+      snps,rxpbl = <8>;
+      snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
+      snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
+      snps,axi-config = <&gmac0_stmmac_axi_setup>;
+
+      mdio {
+        compatible = "snps,dwmac-mdio";
+        #address-cells = <1>;
+        #size-cells = <0>;
+      };
+
+      gmac0_mtl_rx_setup: rx-queues-config {
+        snps,rx-queues-to-use = <1>;
+        queue0 {};
+      };
+
+      gmac0_mtl_tx_setup: tx-queues-config {
+        snps,tx-queues-to-use = <1>;
+        queue0 {};
+      };
+
+      gmac0_stmmac_axi_setup: stmmac-axi-config {
+        snps,blen = <16 8 4 0 0 0 0>;
+        snps,rd_osr_lmt = <2>;
+        snps,wr_osr_lmt = <1>;
+      };
+    };
--
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

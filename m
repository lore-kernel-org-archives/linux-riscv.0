Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCF4C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 18:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yc5QEpmAFO5z/lNq9uC+i0JXC0qcf3TjGDmtPc4oKG8=; b=Ha9qhiMEMERXxR
	HgxObgHA0hDT4Pksg/CxnIYkPakFP3xGT5Y2+Nb5ByoJOgFs8+raGSQo4K/bSuPJgqbj0s1IKfN3I
	dkTzrCdgpCmz/K9cUbGo9he7k5u6nVndfU2mGoCorL4AgwEGQKS5nbAXDlvWi94ZNmmMd5kAeV8DQ
	WmvkkiSb2A4jyzYQfkwoX4TjsjI4fLRsaAsAJx3gCdsZEEJpRG2Nr3jeDmGW7GADU+HMQwc+bYXZp
	2aTSCLGn6nym0mDbd8XwwX5bLbK4R+w2N6sxGFyjUGNM6Bx6zncVa21H8PO+gehEn5jm17BFf4fFX
	9cEoYLUhkn7ekd4FBFSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzioF-00DsxD-3B;
	Thu, 18 May 2023 18:57:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzioD-00DsvW-2F
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 18:57:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 34E69651AD;
	Thu, 18 May 2023 18:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7685C4339B;
	Thu, 18 May 2023 18:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684436224;
	bh=Nt5XnCpe1ezvh1ILRVySirsoVP1f3952Ou9DF76XFOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hVM9QbkTan5hxlgEYa3QeGODzjLKHMp6w/OAt9LlH6FCGSltcldDO0BUtI3oF8UFm
	 taDbaDlW+RNfTO7NitSBmHqK2wkbjgvosrUL1y3C2jB7u1ilVrMoRLixfBR2hnO2Mp
	 /mUC6OVpYa0Me9zmuh9bT+2tVSe8JWiMesvZdVwv26q6K2m+xstiPeQtherWnNU8h2
	 UoMncU6IRtgNfNJRqm4X+y2uhNhcNneHsN6Ya4WY+HCICFGs45E3zI2alqvhHfG7DJ
	 +b/6CWh6Sa6bZGjzNx3rySyjUjIh8UabaISQkizjpxFtTNv4MOtzlNLLAYoSqg+eMC
	 puwni+5V6oMyQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v2 4/9] dt-binding: riscv: add T-HEAD CPU reset
Date: Fri, 19 May 2023 02:45:36 +0800
Message-Id: <20230518184541.2627-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230518184541.2627-1-jszhang@kernel.org>
References: <20230518184541.2627-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_115705_810165_EA70250D 
X-CRM114-Status: GOOD (  15.75  )
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
Cc: devicetree@vger.kernel.org, Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The secondary CPUs in T-HEAD SMP capable platforms need some special
handling. The first one is to write the warm reset entry to entry
register. The second one is write a SoC specific control value to
a SoC specific control reg. The last one is to clone some CSRs for
secondary CPUs to ensure these CSRs' values are the same as the
main boot CPU. This DT node is mainly used by opensbi firmware.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../bindings/riscv/thead,cpu-reset.yaml       | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/thead,cpu-reset.yaml

diff --git a/Documentation/devicetree/bindings/riscv/thead,cpu-reset.yaml b/Documentation/devicetree/bindings/riscv/thead,cpu-reset.yaml
new file mode 100644
index 000000000000..ba8c87583b6b
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/thead,cpu-reset.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/thead,cpu-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD cpu reset controller
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+description: |
+  The secondary CPUs in T-HEAD SMP capable platforms need some special
+  handling. The first one is to write the warm reset entry to entry
+  register. The second one is write a SoC specific control value to
+  a SoC specific control reg. The last one is to clone some CSRs for
+  secondary CPUs to ensure these CSRs' values are the same as the
+  main boot CPU.
+
+properties:
+  $nodename:
+    pattern: "^cpurst"
+
+  compatible:
+    oneOf:
+      - description: CPU reset on T-HEAD TH1520 SoC
+        items:
+          - const: thead,reset-th1520
+
+  entry-reg:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description: |
+      The entry reg address.
+
+  entry-cnt:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The entry reg count.
+
+  control-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The control reg address.
+
+  control-val:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The value to be set into the control reg.
+
+  csr-copy:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      The CSR registers to be cloned during CPU warm reset.
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    cpurst: cpurst@ffff019050 {
+      compatible = "thead,reset-th1520";
+      entry-reg = <0xff 0xff019050>;
+      entry-cnt = <4>;
+      control-reg = <0xff 0xff015004>;
+      control-val = <0x1c>;
+      csr-copy = <0x7f3 0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc>;
+    };
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64B8C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 09:36:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AA0961359
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 09:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AA0961359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FnectHBOSCGhe6ewJb3FcsZRNLqonKMc0CCqAc7B19s=; b=XNEaCGo2Z4Mnpi
	BT0XEDVvglzrITZ1THLOg2Dn9dG5vkbI9bav9ohVYPZ5valMvIHlMK+jXH5JgzPzoA0XvF3Sd6w7B
	LyfNBZAUUbltrygbPIJYqM9UWu/GEG7onyNsTv0JA+pxZIKqSavfZCL/Fud2mUyd0gyARrbt2VCdR
	rIKBNm+UY38pTa4kAQQ7ZA8LPR3g2QdY3CX4HO9mo45iby6LkGxlO3OaDfil5AIotDaFYyJDOyPH0
	DQfAHb7CgUH3NT9U/dLm9G8a3wlgo1zhLGRglCb1sf1qNSjuXObXHuQlAwcGHGQwal/WGNGfwjyCI
	z4u8GTBKw5P56VcJ9CSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md81G-0041fp-Uu; Wed, 20 Oct 2021 09:36:22 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md81D-0041eV-Ol; Wed, 20 Oct 2021 09:36:21 +0000
Received: from workstation5.fritz.box
 (ip-88-152-144-157.hsi03.unitymediagroup.de [88.152.144.157])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 2E7F03FFE4; 
 Wed, 20 Oct 2021 09:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634722572;
 bh=bAoP1FRiCuy1+/FURCUdf01qjwFj5kNYA9taKaOAcu4=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=XnzyDxewYJGTGBxlg71DeHB66UWnfd82EVEm/zwRbcfvTQysIL70WtTnPhXBZzMwI
 UDbN5qUjEbN4FRJymfUrT9bN4oNycc5qA+tbo1SAiQUaMYfMFYwesMXDilH33Sz0hA
 nuTt07ydy5wJaXnTTyAFaVX6ftqtf2SqiUskyQuGKUHGk1zuP4V+g4FVQHLtfk+X5n
 AJJm4UCK9LbC0oQwF8z0t3df34VGmCR4W/ezI1/xQNFkJR9+3q5SI7ZanUEOnkrS/K
 7HoJ/ryvjMNmVjbjCv3SUMq2HKgdF6U1JBKYVX1VUuhLkqGY71Yc1yjhAnCSPh4EBG
 Ci+JwbFxeRTCA==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Guo Ren <guoren@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>,
 Xiang W <wxjstz@126.com>, Samuel Holland <samuel@sholland.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, opensbi@lists.infradead.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] dt-bindings: T-HEAD CLINT
Date: Wed, 20 Oct 2021 11:36:03 +0200
Message-Id: <20211020093603.28653-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_023619_964077_B8CF45C8 
X-CRM114-Status: GOOD (  16.53  )
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

The CLINT in the T-HEAD 9xx CPUs is similar to the SiFive CLINT but does
not support 64bit mmio access to the MTIMER device.

OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
restriction and the "sifive,cling0" compatible string. An OpenSBI
patch suggested to use "reg-io-width = <4>;" as the reg-io-width property
is generally used in the devicetree schema for such a condition.

As the design is not SiFive based it is preferable to apply a compatible
string identifying T-HEAD instead.

Add a new yaml file describing the T-HEAD CLINT.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
@Palmer, @Anup
I copied you as maintainers from sifive,clint.yaml. Please, indicate if
this should be changed.

For the prior discussion see:
https://lore.kernel.org/all/20211015100941.17621-1-heinrich.schuchardt@canonical.com/
https://lore.kernel.org/all/20211015120735.27972-1-heinrich.schuchardt@canonical.com/

A release candidate of the ACLINT specification is available at
https://github.com/riscv/riscv-aclint/releases
---
 .../bindings/timer/thead,clint.yaml           | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/thead,clint.yaml

diff --git a/Documentation/devicetree/bindings/timer/thead,clint.yaml b/Documentation/devicetree/bindings/timer/thead,clint.yaml
new file mode 100644
index 000000000000..02463fb2043a
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/thead,clint.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/thead,clint.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive Core Local Interruptor
+
+maintainers:
+  - Palmer Dabbelt <palmer@dabbelt.com>
+  - Anup Patel <anup.patel@wdc.com>
+
+description:
+  T-HEAD (and other RISC-V) SOCs include an implementation of the T-HEAD
+  Core Local Interruptor (CLINT) for M-mode timer and M-mode inter-processor
+  interrupts. It directly connects to the timer and inter-processor interrupt
+  lines of various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local
+  interrupt controller is the parent interrupt controller for CLINT device.
+  The clock frequency of the CLINT is specified via "timebase-frequency" DT
+  property of "/cpus" DT node. The "timebase-frequency" DT property is
+  described in Documentation/devicetree/bindings/riscv/cpus.yaml
+
+properties:
+  compatible:
+    items:
+      - const:
+          - allwinner,sun20i-d1-clint
+      - const:
+          - thead,clint0
+
+    description:
+      Should be "<vendor>,<chip>-clint" and "thead,clint<version>" for
+      the T-HEAD derived CLINTs.
+      Supported compatible strings are -
+      "allwinner,sun20i-d1-clint" for the CLINT in the Allwinner D1 SoC
+      and "thead,clint0" for the T-HEAD IP block with no chip
+      integration tweaks.
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    minItems: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+
+examples:
+  - |
+    timer@2000000 {
+      compatible = "allwinner,sun20i-d1-clint", "thead,clint0";
+      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
+                             &cpu2intc 3 &cpu2intc 7
+                             &cpu3intc 3 &cpu3intc 7
+                             &cpu4intc 3 &cpu4intc 7>;
+       reg = <0x2000000 0x10000>;
+    };
+...
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

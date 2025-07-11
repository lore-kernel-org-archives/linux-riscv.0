Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09012C83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 22:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4D+JmHADRy/LNZMTpriIuTyfXEGIEUO0L+R2e+zuej4=; b=t1UQg0fIOwMqSR
	byp+8hQhejFaO5AUiz3zJh96YllxGKugSRddKXC9MThwck/9k5+eN3xXPlZe8ccaRL23K4yhb+gHl
	eZErRe4AlBxwFTK/gFdQxkw2LBgayvzOQiE6/z6b3uSxQx/H5rj9fO0sm0O/IOykBlckEHFebSVaN
	6rWQ1yl9W7PxWlUv6E6i5svDuRTzyZPgWjO+7ZmjY7Qtg03CRSJE7Ma/YcRF7ephllrEmyPLdoomQ
	D/YJxLa6LsTuhSGtNopsVHBGMOX990+EM1A5bYk08d8LT+5JDNMK3soi49x7S8+1P98ztBXakplHw
	8vni8mXkal3HrGyHMAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaMi7-0000000Fz85-29k9;
	Fri, 11 Jul 2025 22:59:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLkC-0000000FvB3-0m3b
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 21:57:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6CB815C5B58;
	Fri, 11 Jul 2025 21:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 092F0C4CEF4;
	Fri, 11 Jul 2025 21:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752271042;
	bh=q5Owo6hsBlGPBSb5fRPgpzE0VZYnU59Bln6pEWHCh2A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LWT0ZP648ikP6750gFCRD10iyw87Nhwyd1SSolL7hz3gkg8eNhiRvT/xzw2UeaC3Z
	 gXJ+UVeaVDgQxgVTbBc1UU2v75zV8Nx2CKAmZKJYCYDiSKlcExWDzIbMM16aYHA8Ws
	 jJLOJ4AHNe3j9eHLl+XGNt+fuL7Z1UNYhlmFk5uCHb5Ea9W4bqWn96nYznNN0im/3M
	 yKULm9CoiLRjc4S2RqaisCib9B8SLnK6ppk0mEC0tdKs++QPaH1Nex0VdHI3VRvmUE
	 xAPeT2/OEZLDfPfXaRuQwxMhDVe0x6uAiHDo9YJVXlK4xV/dmG6+JG4KSb1ivVsSlx
	 qkU5BUhJ6bAjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BEAC83F1B;
	Fri, 11 Jul 2025 21:57:21 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Fri, 11 Jul 2025 23:56:45 +0200
Subject: [PATCH v5 1/2] dt-bindings: timer: mti,gcru
MIME-Version: 1.0
Message-Id: <20250711-riscv-time-mmio-v5-1-9ed1f825ad5e@htecgroup.com>
References: <20250711-riscv-time-mmio-v5-0-9ed1f825ad5e@htecgroup.com>
In-Reply-To: <20250711-riscv-time-mmio-v5-0-9ed1f825ad5e@htecgroup.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752271040; l=1784;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=/RHTs/dV8mK/r/ATCMy9xGEu8RznHBlNizMjaxes10Y=;
 b=oI3VZOfvBk9iNRCP9pJILM0FDdGES1Zpw+I5p/t4/+vK/OLwUC9L6nIK4WxhmEhnYP6j6Z/7J
 RomrV/dRnyPCm87Fei9SDZn7Ne70mYLU6Yj+FVhd6baabG0pO6qyC7w
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_145724_313158_699B63D0 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Add dt-bindings for the GCR.U memory mapped timer device for RISC-V
platforms. The GCR.U memory region contains shadow copies of the RISC-V
mtime register and the hrtime Global Configuration Register.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/timer/mti,gcru.yaml        | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/mti,gcru.yaml b/Documentation/devicetree/bindings/timer/mti,gcru.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ceaf90bad5332b64f3c1f28bebdc28d78443898a
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/mti,gcru.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/mti,gcru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GCR.U timer device for RISC-V platforms
+
+maintainers:
+  - Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
+
+description:
+  The GCR.U memory region contains memory mapped shadow copies of
+  mtime and hrtime Global Configuration Registers,
+  which software can choose to make accessible from user mode.
+
+properties:
+  compatible:
+    const: mti,gcru
+
+  reg:
+    items:
+      - description: Read-only shadow copy of the RISC-V mtime register.
+      - description: Read-only shadow copy of the high resolution timer register.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@1617f000 {
+        compatible = "mti,gcru";
+        reg = <0x1617f050 0x8>,
+              <0x1617f090 0x8>;
+    };

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

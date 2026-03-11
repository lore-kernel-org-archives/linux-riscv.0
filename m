Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B3A1062875
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 13:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hd48MgndzqAE2gFacjxdU84tlJARGKW15PcTJ/VNojY=; b=NbsiGgJIp8uNnA
	IJC8sUOMrblUaiQ6tMbyQ5sKw7j0TWbLgaAiOORg6AzRfK2zPwkSL6Iq5s6yH/LUb2jEDPIUQhyNK
	5zmTFXCtzY3WMgjKzsPmbD3U5kd/CIlN0XJPQ8XxtfiX7sVD4oTRkRkxC0hxqaBkGP99XSNDr5xYy
	GGRBal7ZGss4T6CvGrfGDXfjJrQXasb048RnNljX3/mRj8zENzj/AMjYFNOVRKRhuHkN2HN72ihzy
	XLFsq75Ct2vY8cUuEsK0votl9cov6g/vgUeuC7Y7ijGvGq+DIomEzt9sMhFjD4dXR5/lGMYtXm0Zu
	gGGgvHyp7yhHi5xKTwGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Jan-0000000BdiN-33bj;
	Wed, 11 Mar 2026 13:27:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Jal-0000000BdhP-3bVO
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 13:27:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D2506013E;
	Wed, 11 Mar 2026 13:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A504C2BC9E;
	Wed, 11 Mar 2026 13:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773235634;
	bh=vMA/TDrL6pX/37cIVwe+uCWPjNEkgQmBnrmcW+A7gxA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rf27pbZ34+j3kG9NcUHKvgga+r6vxTo4JxVSuWJ135F1q4yLfwkePdSIFNN4W4kGs
	 J4wI0Ga+4+DDLqikNg3LiGWPyFNViBQIYTcfivC1zoZusDsIILxEpmf3K1EPB1w9N3
	 e+hAsQiqAve/+ZMiJ03uvAKYxANc6WY/xKk09GqXczAAPvVR+B2Y4wRhP96REfEkcI
	 5HyQzwK48h9lWmY3ZmZlHScar4sb5bIM37AZf+BbbwDqlUEbXHLI73RZIKPKB/ns2f
	 6Psw3gGZKcBkDhqZtFRLuotoCyeUAPysq18tnUoNLq7wDf85GXSwYXpTqGcfZGOElJ
	 1j6NcYvn8Xeuw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6881125809;
	Wed, 11 Mar 2026 13:27:14 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 11 Mar 2026 14:26:55 +0100
Subject: [PATCH v7 1/3] dt-bindings: timer: mips,p8700-gcru
MIME-Version: 1.0
Message-Id: <20260311-riscv-time-mmio-v7-1-016845a0f808@htecgroup.com>
References: <20260311-riscv-time-mmio-v7-0-016845a0f808@htecgroup.com>
In-Reply-To: <20260311-riscv-time-mmio-v7-0-016845a0f808@htecgroup.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <pjw@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Chao-ying Fu <cfu@mips.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773235633; l=1839;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=qlCmLDBO1Y2Dd5pfYZ/Ggi2QMtMAGxo3h0341eF3VPk=;
 b=U4M3KAsGzL2iGmEylw5kFQRQqxOoijFTGZzePXyl2kKy4iv9SCwrk+Gig4NjUET9fNWjVbJo6
 Pf5eiGGyYSyCLHIqHmJoKJOpoog/t+2tBexrtuBhYJp97YMse1WzeKQ
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
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
 .../devicetree/bindings/timer/mips,p8700-gcru.yaml | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/mips,p8700-gcru.yaml b/Documentation/devicetree/bindings/timer/mips,p8700-gcru.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3498255762cce6b3f491292d340d9639bb573e6d
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/mips,p8700-gcru.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/mips,p8700-gcru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GCR.U timer device for the MIPS P8700 platform
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
+    const: mips,p8700-gcru
+
+  reg:
+    items:
+      - description: Read-only shadow copy of the RISC-V mtime register.
+      - description: Read-only shadow copy of the P8700 high resolution timer register.
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
+        compatible = "mips,p8700-gcru";
+        reg = <0x1617f050 0x8>,
+              <0x1617f090 0x8>;
+    };

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

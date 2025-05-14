Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4EEC3ABD9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 12:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMMj/r2J6D7VvENuPadgXWY3M1J1+eLMYz/+8wyGUg8=; b=2wE+uwE2NNlCRr
	K1mQiOHwgNk2VlNbBczoF/SI3M72BZYPJ0qNdpBizubJUOz5scU4X2MyKc5ruBCYgWxQz7N3YIF8/
	0Z5fRPxoMSebHgFoxcb8MSUx5QnunqlMQp7ru9wYZugmGM/Xk4dcknEhRiWle4DurDDLPlLt8eF1u
	5HTi8cj2LUipphcUOndE74G7296Qn37I8QadtrIIJCr8yjHFwtwHvMi3wJVNcdzvLs8X9sCAeqPJa
	6i/Wis2pcs5GBt/l5BaOXUhZIOhfgZmbzbONySABdpW7lAwuFAUk/zbVLRSPqmikJ0uWp9RkMCO3D
	ZYAdH5Goc5toI47VXExQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB3X-0000000EzvQ-3TE1;
	Wed, 14 May 2025 12:17:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7qi-0000000EZap-1c2h
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 08:52:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 814BF4A3E1;
	Wed, 14 May 2025 08:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B826C4CEF0;
	Wed, 14 May 2025 08:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747212743;
	bh=lvH4KVUWdDq9a9MwZjjMb15JvVXgbgvQwr6KF7wllzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GNT2ter8uV5dQI1NAeeKP0ngsy6iBeJcdaVJ/gNftQxT3oTBVG1VvrQ+faxJXpYuN
	 Ir1kAtJlnKwsspjtJLxPhVadt5KWjxP991O7nNBOx8HLtT0st7eUJA6A9toV+JoNB8
	 Gw4tTcEWMIKWC5Y/tpC/TPqNYYjPkSM7jkNHGduRIIKEpsRneDHLKhZLlCBBZa75Ua
	 NGPGBU08+RCOeQGsNhRax6xOQKuP6SO0uipZ4mTS2frDzbMIGmNhaXVMMg+zSm3sdz
	 LROtq8JlMQkpby/rLDOLCKg2ECsX0+83e6kvu67Ufhxs4m5C6GvY24FjRPqGoqSPEA
	 iXEvMw9af3Y0w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1A2C3ABDA;
	Wed, 14 May 2025 08:52:23 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 14 May 2025 10:51:50 +0200
Subject: [PATCH v4 1/2] dt-bindings: timer: mti,gcru
MIME-Version: 1.0
Message-Id: <20250514-riscv-time-mmio-v4-1-cb0cf2922d66@htecgroup.com>
References: <20250514-riscv-time-mmio-v4-0-cb0cf2922d66@htecgroup.com>
In-Reply-To: <20250514-riscv-time-mmio-v4-0-cb0cf2922d66@htecgroup.com>
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
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747212741; l=1731;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=bavSLGIvQI52iBpPwSEEg1jcYvhis52EMItmcd2/Qlo=;
 b=g89qj4IiCI3QUes9/qSdtJSGECHU1IQBnqo4tR1iKJGDCUEP+o96M4G01g92qOz4ZjiH3qmBX
 gnd8g3ieVr/BCvXawkU3WUt4LtIP7G3gjQca6sfVPJOMUCkKaMPFu2H
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_015224_466820_B6972C3C 
X-CRM114-Status: UNSURE (   9.47  )
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

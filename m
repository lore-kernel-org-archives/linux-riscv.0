Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B65C87FD3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 12:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hd48MgndzqAE2gFacjxdU84tlJARGKW15PcTJ/VNojY=; b=rFM2U+lzz2cGMo
	28MB/BVY5dPf2/kZIvD9Y/lt5l3HXz4uQH5DFsauzwF0IJnvdcnO9Prvz1Nm7YWPoue+VJDadrwL6
	BPE19v/c7oksmnqfbROVbwyaMe6jJ+UNLOQ7M6G26QJi+iosbQ2i87ndDSQhzpX5SKBslhdO9okdf
	1kgXcF3UCi7nrwMOyY+gtYgjx5Kqd6WiSArORSsyO9iCsYvb4hbIOlKo+N1+CR/W7pYQV3mMFjGTt
	SPAbtKn6wpxXKfR2IdQjcdyqqx8AFw0r+oliVJJBisRP3xY3Y2RUhJ2kzMArY92GPwzcnDE/EGo9+
	FR0ohg8hgk86XiDAIG/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujdEr-0000000F8S8-2YPK;
	Wed, 06 Aug 2025 12:27:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujdEn-0000000F8Qz-2xsa
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 12:27:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1D5745E3F;
	Wed,  6 Aug 2025 12:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1092C4CEF6;
	Wed,  6 Aug 2025 12:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754483240;
	bh=vMA/TDrL6pX/37cIVwe+uCWPjNEkgQmBnrmcW+A7gxA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MDM3rkOL3lQukUAj90i6fS3TMJ4qN8aLdyE48OE6W/0DyUQIsx8f5uKwudY4hc7iD
	 YJr0KdcCYzGpzQkVvzNSuIqqm6Go+mWqf+nXFsIFgLqSWmn9ILifyQV7HbzoUHIUi8
	 ykw35mDBg37LozA/YT1WlNGGh5XEPLj4uRQ1hLTEE4ddoIGwjJSctWFaQBzmJYrk+k
	 Sbc/jag+/veaBJlisToBr6Cf1JXuz7WvxfYcsDJN1pcsIotZyuSHAHC/e9DYdTsPhn
	 L9QjqiSD4S5RNGpWVP+wZmz2ZT8TwEYHZQZ6hYhXYTMyATCyDAbx20lVuqWv7e1NVk
	 q5qmfb3WMybwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903B2C87FD3;
	Wed,  6 Aug 2025 12:27:20 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 06 Aug 2025 14:26:39 +0200
Subject: [PATCH v6 1/2] dt-bindings: timer: mips,p8700-gcru
MIME-Version: 1.0
Message-Id: <20250806-riscv-time-mmio-v6-1-2df0e8219998@htecgroup.com>
References: <20250806-riscv-time-mmio-v6-0-2df0e8219998@htecgroup.com>
In-Reply-To: <20250806-riscv-time-mmio-v6-0-2df0e8219998@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754483238; l=1839;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=qlCmLDBO1Y2Dd5pfYZ/Ggi2QMtMAGxo3h0341eF3VPk=;
 b=56m9JHl4s+2niceVarV1ds9YTUDNqZYPSY0MKzOiiWT6b+U4cVwZajDZSWDVvSepqWQmUbqq5
 UefHGtyZpD9CshfqOwaN3w94Ov49XPBmPLiLOqmhlt8k+DNNvMMIa2A
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_052721_796984_507CACE5 
X-CRM114-Status: GOOD (  10.23  )
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

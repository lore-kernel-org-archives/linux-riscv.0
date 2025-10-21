Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEE0CCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 09:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Iglr0Q7L6HT6oc2H07FO5cm6lDZmbw4zCJ+ky4PC6g=; b=vR1xa/AZpEMjN/
	6eey4nryJ9pFvxmrTdA4y2RyJRIbBL5eum5YyRtVDi3e0QpcQTb+mLcdwXlP7CHMLwFRT2a1spTVg
	N+uTVvp4qwPS31WkHCIoeAg77HbhBdAP5F+S+fIEoYvGVpx8r7YtHjmRVlZ/OXU/bd3sWGmCh6yu1
	BZtoPM3+2pO6Mm5kIlafpZyo5oKKY8ymoPW/QOYedeuoBKylGiPh71BI6PfrL/nuLC2RLIq/2vj+V
	twoi0fM7JI/JCttYaw+mJRnb8WuGlPlfGsXjJDC38u05qa50zn4zg07JgCTlLuQrEe9Xyp2BVBc1s
	6iYQfxHM5/YGs8dYCD0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8vR-0000000GVB3-1YZQ;
	Tue, 21 Oct 2025 09:45:05 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8vO-0000000GV9N-0aNZ
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 09:45:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761039888; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WwdNE0A1RP2GNDOoiFxcsLVwdk8CoXbfkPoACP2eI/j8LEHHkNVe/73phFb7tTzdTHU1zNxhtY0JWT0b7Ac0LtwyvrieKmB4D49M2Rk8BSxgVss3hjv6h6Fg5JOF2sY2NnIROlqNNTX516ih/mpFLGTsqXqSYo6IIRTjVa7ViEo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761039888; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rtsskF6c5DC86jEekt9nZlFyfhaYJsIni6zqONkPHYY=; 
	b=OZM89R0uBREEjEcyUJthr4nszqg/uANypoBjNmvDYlM3W6IYASPfWy9MgN/DH1/XFxp55ePvw8SBDLEss5HThgOqE4SMf8wxylGRgjEN40AspLpOUaenCLpQdVs0RQp2Nj+wW4u6CDsJoVeFAWQV/0zCCEQI4LyfUcLwLuNjW3c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761039888;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=rtsskF6c5DC86jEekt9nZlFyfhaYJsIni6zqONkPHYY=;
	b=aw1KgOYv/r7kXcjZUvKCj20Dhva7nyRepmiCk1pxgHqRuzNglr6SyqyIVUX09N1I
	cQLXjGUVjLZ7tgQ1k41HaQ4lqj2ZzQAupXg1sBvyIvtrb101JuwM5lYHGFMjNPZ4srg
	CcpGRYt/d2XGW57VULAnLoJbev40Wj6vcnf6PjeM=
Received: by mx.zohomail.com with SMTPS id 1761039886235640.5853675555333;
	Tue, 21 Oct 2025 02:44:46 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 21 Oct 2025 17:41:38 +0800
Subject: [PATCH v3 03/13] dt-bindings: riscv: Add Anlogic DR1V90
MIME-Version: 1.0
Message-Id: <20251021-dr1v90-basic-dt-v3-3-5478db4f664a@pigmoral.tech>
References: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
In-Reply-To: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Junhui Liu <junhui.liu@pigmoral.tech>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>, 
 sophgo@lists.linux.dev, linux-serial@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761039846; l=1464;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=kMjp/kMNwAzs4+SvkT7OReYTebC9hxzfdjMFblWEIw4=;
 b=bYRbzYnEHFe6MhjyoY/eNClq/fC+GEaiJd/B4YhB4CqHk+v2/Aft/8UUtqtA0lsN4xlCfT9jb
 Z+VRO1KgjDeCWWUdk3M03On13pX7k8U6TKKAloiz7xaLZe4HF59kuS6
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_024502_249196_6098522E 
X-CRM114-Status: UNSURE (   9.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add Anlogic DR1V90 FPSoC, featuring a UX900 RISC-V core as the
processing system (PS) and 94,464 LUTs programmable logic (PL). It is
used by the Milianke MLKPAI-FS01 board, a SBC equipped with 512MB DDR3
memory, USB-C UART, 1GbE RJ45 Ethernet, USB-A 2.0 port, TF card slot,
and 256Mbit Quad-SPI flash.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../devicetree/bindings/riscv/anlogic.yaml         | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/anlogic.yaml b/Documentation/devicetree/bindings/riscv/anlogic.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..91b1526c99aa3ca9cc7b0e7978861408bd017049
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/anlogic.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/anlogic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Anlogic SoC-based boards
+
+maintainers:
+  - Junhui Liu <junhui.liu@pigmoral.tech>
+
+description:
+  Anlogic SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - milianke,mlkpai-fs01
+          - const: anlogic,dr1v90
+
+additionalProperties: true
+
+...

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

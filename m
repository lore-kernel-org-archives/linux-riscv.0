Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96919CAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 12:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DhZkq158f7Z3bUK3GfTQHA54PiPUv7yrQUjWiX6yxpo=; b=oVZjmViRWzKAt+
	2kPQxGqlOeXasLgs533/y1soEHk3h/23QyBUIDrr7N3SpbQpjFUuco76dN5Z8OBh57W1Pjfe2Avox
	YLnn4qFjdW58s83+1k7heRf0EAvRQEfvYs/ekOh/0Rm2dZVdzsj600ggx0LW7Y+eYovkZqqAVNL53
	sCwtENY5l54al5DXVcx5/GGWjMgJwdSzriOQq7leNH+0oCX480e9S+g2oboCDEK91te1NZUHSooC5
	HHAE6A5lqx00/VmVuF+JHjD1IfYVay4rghOFjQ1RkqFKOdW1aZMVUjzCmnvRYwSqwO8k3EOhT0yZO
	eu5lHkIYqOnT1qpRa4Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0fz3-0000000AMb4-16SK;
	Mon, 22 Sep 2025 12:49:33 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0fz0-0000000AMa7-3eGT
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 12:49:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758545363; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gBfKp/CNK725rwZIX+IL8xPk9oE0Z/uR43yulufoYEAZUSDgSUNJMYnrn4pmRnz+E49KA//csbWEao+JJ4NHQxjDFoEekyJdvIbIACqVCNftumqTH96hSbEcppwBUY5PYVhdViddTttLCL72pxGcr1x7C6ET1lBh1bbpQt1N5SA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758545363; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IUHDgCRXW0IqDg0DNbopl6mwgcRTun+qATQ3IyBlDak=; 
	b=IiMI8pUUqGRr/WcgsO94/fsTBwe4/5S3FWKpQJVmUsU+qTT7JVYdQiz2X410ySLnLifl7E92+Gd7lv65RmEmmOOf9UgFSwn+jpjvd1m5mYExkYep9SApe70Sh6OyP1TN4iyWiU2EPAYr3IBK0hhf9/1DOYfIhTKOd0tWr0JzpQ4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758545363;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=IUHDgCRXW0IqDg0DNbopl6mwgcRTun+qATQ3IyBlDak=;
	b=b4tmmYCz6NawXiuk4kc8aR5ESqc79PthCk09ov/GRbl+C/bu0XfiHvnQDCjaI8Jk
	TirnZ5dSjL5YuJuX3e/PviYKRXer4V8AU7HX/mbpIyiQxTDt3elqGMXdyf7xOpO0y5B
	TNpyHJJM5uc0xBCIvqjYRi2bDtWISNx62glwQF3U=
Received: by mx.zohomail.com with SMTPS id 1758545360378219.78509476798922;
	Mon, 22 Sep 2025 05:49:20 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 22 Sep 2025 20:46:33 +0800
Subject: [PATCH v2 03/11] dt-bindings: riscv: Add Anlogic DR1V90
MIME-Version: 1.0
Message-Id: <20250922-dr1v90-basic-dt-v2-3-64d28500cb37@pigmoral.tech>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
In-Reply-To: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758545232; l=1464;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=eej46v3VY93/jaGVN6rjK4WaNsafUbyFHJXdCK5YHsk=;
 b=H59QMB9055wZSaLsKmAcClP/c1LYRAX5b/c+0yNMndSdnE1lmzzdZQ1ciR/mv7BT8FGwCcXql
 39iJymsVtXgAcFfumYPtvUcxYBy9f33JUXbFvJD4GchPJ9ZCLIEkxoO
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_054930_970350_897BB1C8 
X-CRM114-Status: UNSURE (   9.98  )
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

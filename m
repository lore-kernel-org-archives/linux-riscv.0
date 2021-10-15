Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36EFC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 12:07:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 930006044F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 12:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 930006044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xpupT95VZpnNrc6OslpmrtedIy1DahqAVdeKFEF3h+g=; b=az1voO9Ccchm+g
	SjsK3GFqaleWyxZU6oa8NyRQWKYUiTIhDolztdrml9gB0ycvi5dexbMgI+IOho8uDIlFes2rSVsPc
	1bxL+nmhykfjoVNnIjEpE5AWBiUBTFg8rzXDkgb7V7WlguqtIWo3pCd9cjnJIZV6m4vjLz/Zvp3It
	6w0a+PDLAY1wdoCa/AL+hNbB8PjcG6Mb/Q400V3z44YGF+pc0FDsroEXFIeGXyQ/Y9S9D7yhN6YC+
	Ktw6LmhVfzidWmnyRcyH3kLe1h3kzr7OjQCcknXeBzyJgzbmnntO3TGaF1cbf+zzzBdc3tuCKzf6x
	fD4nN22YzR/5lKT3BP3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbM02-006plI-Ku; Fri, 15 Oct 2021 12:07:46 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbLzz-006pjL-0i; Fri, 15 Oct 2021 12:07:44 +0000
Received: from workstation5.fritz.box
 (ip-88-152-144-157.hsi03.unitymediagroup.de [88.152.144.157])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 62B103F10B; 
 Fri, 15 Oct 2021 12:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634299659;
 bh=2e9Gjwt5Cjo6AC9tkBVaY/EImJ9+xhZBLuu1MnFPT5Y=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=CSXsmqSPfeMtKRwmUskuONONORt5Yuo54jB2C/q6oseS9zDNprREI8hshq8SmhgvZ
 87MWTVnvSJUuZJK47kx8rTxiKAzLY17nEnMykdhS4y6yiGFvgrfwizXwi7sXp46yPS
 W2MXlW17oqrV/lt5Go4CIlCF4bMJtY1wBVT3N51Cwj52CW28WDrkEBvbUCq19O93+f
 06/hp9ih58OZn2ISgdemSzxhbFmqBORpfRD9bZfhaQxj2yedyJpjwxDkI2pIdhMYTC
 2uJ9ZzreVEbfaAMk6hNGGGghdBZpQL59szl0/f7VSuXOEoz+Mya+5K2q5dfJCeVFZ/
 P/co+9iqmL4Qw==
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
Subject: [PATCH v2 1/1] dt-bindings: reg-io-width for SiFive CLINT
Date: Fri, 15 Oct 2021 14:07:35 +0200
Message-Id: <20211015120735.27972-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_050743_214540_8530C25A 
X-CRM114-Status: GOOD (  12.75  )
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

The CLINT in the T-HEAD 9xx processors do not support 64bit mmio access to
the MTIMER device. The current schema does not allow to specify this.

OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
restriction. Samuael Holland suggested in
lib: utils/timer: Use standard property to specify 32-bit I/O
https://github.com/smaeul/opensbi/commit/b95e9cf7cf93b0af16fc89204378bc59ff30008e
to use "reg-io-width = <4>;" as the reg-io-width property is generally used
in the devicetree schema for such a condition.

A release candidate of the ACLINT specification is available at
https://github.com/riscv/riscv-aclint/releases

Add reg-io-width as optional property to the SiFive Core Local Interruptor.
Add a new compatible string "allwinner,sun20i-d1-clint" for the CLINT of
the Allwinner D1 SoC.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 .../devicetree/bindings/timer/sifive,clint.yaml     | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index a35952f48742..d3b4c6844e2f 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -26,6 +26,7 @@ properties:
       - enum:
           - sifive,fu540-c000-clint
           - canaan,k210-clint
+          - allwinner,sun20i-d1-clint
       - const: sifive,clint0
 
     description:
@@ -33,14 +34,22 @@ properties:
       Supported compatible strings are -
       "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
       onto the SiFive FU540 chip, "canaan,k210-clint" for the SiFive
-      CLINT v0 as integrated onto the Canaan Kendryte K210 chip, and
-      "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
+      CLINT v0 as integrated onto the Canaan Kendryte K210 chip,
+      "allwinner,sun20i-d1-clint" for the CLINT in the Allwinner D1 SoC,
+      and "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
       integration tweaks.
       Please refer to sifive-blocks-ip-versioning.txt for details
 
   reg:
     maxItems: 1
 
+  reg-io-width:
+    description: |
+      Some CLINT implementations, e.g. on the T-HEAD 9xx, only support
+      32bit access for MTIMER.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 4
+
   interrupts-extended:
     minItems: 1
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=WjcT=PM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B048FC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 01:33:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C10F60F35
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 01:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C10F60F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f/D1shVMlGepsT5BM7uq2mFHncowVmlw4m/dxGeQ3SI=; b=W4bZPrg9kEFgkL
	nJf6FnK6yl0/+QjF0dTdpqxVj0jOc6+ePDMVTTa2wryDJqGsO6I+ui9u0axxCCySLQVh7FPE31yK6
	TVouiZA8ibBCjI78LFTXzw8kIwRrfbOTVroKq9nMQQT5zagLEuLkIVy4ssqMF/95J6extpUd47D1q
	Fx3VqYqUA2gfO8IM+rPO8qh8hvztuQ6h1LwfJHYRbdufJ4vIdv/fAXGj3s4mWe9i+iS5oeVmjBg4E
	qZH3OeqhEnUYIbXfe8/3FPwtJP7AG9AKDXPSPGNjqCE3Yo87xFhHwCmtXDghY6t8BRlDpRqVlMSkh
	NbtuQwsMppCnMn6wHiqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meSO2-00DbZ4-IH; Sun, 24 Oct 2021 01:33:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meSNz-00DbYU-L2
 for linux-riscv@lists.infradead.org; Sun, 24 Oct 2021 01:33:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21EAD60F36;
 Sun, 24 Oct 2021 01:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635039199;
 bh=mbXBgfm2vZH7xDcmcMmYbJZmmdRHiEC5rQ00XeKK6Ag=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OlXNCYN5C9eOCJCHBlcD9PSVm56iMEyyUH1eYCvo2E37mzySG0XtyAa/1pWv757Ji
 arfo+RjrEU5A5s45BUoGytllRYOJ3bZv/IHu6eJaJPocfxw4JJGmJr7DDqkXT8BnUZ
 /f/JLRbInV/1AEoFtwo9XY+ndnyCcS8qQnihp0/cBJ6IjhRQc9zPkiMqm3zFJdfKsu
 6bqfyOywo8SF36C1pM73hSpYZPl28AuIwbvzRd3WwQtPtOM6e7nu4HvMnLl4RiZzmO
 xcnb2yCNw+qx4RmA5wC4pWvx5IvMIeVf8393nPgtYOxLzJ+kKgoDOcEFnskCmGgnHD
 ZIb87NBmshxKQ==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 maz@kernel.org, tglx@linutronix.de, palmer@dabbelt.com, heiko@sntech.de,
 robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH V5 2/3] dt-bindings: update riscv plic compatible string
Date: Sun, 24 Oct 2021 09:33:02 +0800
Message-Id: <20211024013303.3499461-3-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211024013303.3499461-1-guoren@kernel.org>
References: <20211024013303.3499461-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_183319_751020_BCB186CD 
X-CRM114-Status: UNSURE (   8.46  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Add the compatible string "thead,c900-plic" to the riscv plic
bindings to support allwinner d1 SOC which contains c906 core.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>

---

Changes since V5:
 - Add DT list
 - Fixup compatible string
 - Remove allwinner-d1 compatible
 - make dt_binding_check

Changes since V4:
 - Update description in errata style
 - Update enum suggested by Anup, Heiko, Samuel

Changes since V3:
 - Rename "c9xx" to "c900"
 - Add thead,c900-plic in the description section
---
 .../interrupt-controller/sifive,plic-1.0.0.yaml   | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 08d5a57ce00f..18b97bfd7954 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -35,6 +35,10 @@ description:
   contains a specific memory layout, which is documented in chapter 8 of the
   SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
 
+  The thead,c900-plic couldn't complete masked irq source which has been disabled in
+  enable register. Add thead_plic_chip which fix up c906-plic irq source completion
+  problem by unmask/mask wrapper.
+
 maintainers:
   - Sagar Kadam <sagar.kadam@sifive.com>
   - Paul Walmsley  <paul.walmsley@sifive.com>
@@ -42,11 +46,16 @@ maintainers:
 
 properties:
   compatible:
-    items:
+   oneOf:
+    - items:
       - enum:
-          - sifive,fu540-c000-plic
-          - canaan,k210-plic
+        - sifive,fu540-c000-plic
+        - canaan,k210-plic
       - const: sifive,plic-1.0.0
+    - items:
+      - enum:
+        - allwinner,sun20i-d1-plic
+      - const: thead,c900-plic
 
   reg:
     maxItems: 1
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=v6lb=PE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4623AC433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Oct 2021 03:22:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02A4E60F48
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Oct 2021 03:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02A4E60F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gk8JCxLJXWr4Lto4F5ySQWSX30BWqwZVMqPYI6u1AHc=; b=NpBnVqOXO2/DZF
	ngdTp7fQ9qL9AEloaaToUOqqFNkzRpDv4PDxvbVNN9TzMZohweucWxQS+D6oVwTRcONrldrxXyr98
	4VX8QAQBuoMvoZGkslghrLGJkrbALjLorkmlvuFCJdsM7cj4F+O48gxxwzZJB5xZf37NhMlPjJcju
	GOvOi+601s5fr0rUsrpssgxmm/U6jUvWJZIVc8V8ZxPRh2NFTbPwnV6jm1Zb4j9AnUCKskm8p9s3H
	Y/Nbo4fdxEbal4TsZkPVPEfkzE7DZkTNLOIkX/mfxEzpdzRilXmMbi67+zU072GONWeYPr1IpXrEB
	pxpauQbhbWb0ncZn69AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbaHA-009dfw-Ez; Sat, 16 Oct 2021 03:22:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbaH7-009dfA-Cm
 for linux-riscv@lists.infradead.org; Sat, 16 Oct 2021 03:22:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F4EB60F48;
 Sat, 16 Oct 2021 03:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634354541;
 bh=+1DBBbaQVSby7WUGxXC3pmVab5QowIju69Lvqfx+p7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=os2ilB8BD7U/YPjDVc3Q89ZEm3puACHFLnh52nJBRWHkWs9+oy7S+BL8hs3nnUXQt
 uGXBG894Sj0JWaAw8mgybZ3Sft7qg2G/sPcLAXJxr2GXiw8Oe+/n1wYG52r/W64Wx+
 odMewlbEeMvBUrlydruZgzjp5QQnjjPvlolmeBMqhsI3cdRXbIG8Oiw60e8n0RarKv
 2n1KRo5DQr0acKBwK3CDCQFuYovm11vxpRPZtDpEgUQYyQuOaiQQyv0CLAvgP3nC5S
 55opWGAn3+Or23GHaL1EuYdGeUoZyrezr56jpb/3hgbyJf/43qWDjA7BJJoScW9s6i
 PuDWGCpKetvdQ==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 maz@kernel.org, tglx@linutronix.de, palmer@dabbelt.com, heiko@sntech.de,
 robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH V4 2/3] dt-bindings: update riscv plic compatible string
Date: Sat, 16 Oct 2021 11:21:59 +0800
Message-Id: <20211016032200.2869998-3-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016032200.2869998-1-guoren@kernel.org>
References: <20211016032200.2869998-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_202221_479238_4CF6FD91 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Add the compatible string "thead,c900-plic" to the riscv plic
bindings to support allwinner d1 SOC which contains c906 core.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@wdc.com>

---

Changes since V4:
 - Update description in errata style
 - Update enum suggested by Anup, Heiko, Samuel

Changes since V3:
 - Rename "c9xx" to "c900"
 - Add thead,c900-plic in the description section
---
 .../interrupt-controller/sifive,plic-1.0.0.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 08d5a57ce00f..272f29540135 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -35,6 +35,12 @@ description:
   contains a specific memory layout, which is documented in chapter 8 of the
   SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
 
+  The C9xx PLIC does not comply with the interrupt claim/completion process defined
+  by the RISC-V PLIC specification because C9xx PLIC will mask an IRQ when it is
+  claimed by PLIC driver (i.e. readl(claim) and the IRQ will be unmasked upon
+  completion by PLIC driver (i.e. writel(claim). This behaviour breaks the handling
+  of IRQS_ONESHOT by the generic handle_fasteoi_irq() used in the PLIC driver.
+
 maintainers:
   - Sagar Kadam <sagar.kadam@sifive.com>
   - Paul Walmsley  <paul.walmsley@sifive.com>
@@ -46,7 +52,10 @@ properties:
       - enum:
           - sifive,fu540-c000-plic
           - canaan,k210-plic
-      - const: sifive,plic-1.0.0
+      - enmu:
+          - sifive,plic-1.0.0
+          - thead,c900-plic
+          - allwinner,sun20i-d1-plic
 
   reg:
     maxItems: 1
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

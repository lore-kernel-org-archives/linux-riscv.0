Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F818C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 01:22:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 539D660F21
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 01:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 539D660F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uPXjbTSnZXGq1abd7kHaiRFI8ZdKgSDT8KwG4ep/6lE=; b=lq2w2apnZIwvvA
	3ieGulPOFw7ctOxr5b9b/ZwMz3g9tYQ84THLcJ2AtaXxhVlY8NWZxJArw4NnI3r/y8VNdtOkuKcim
	ePsntLWOzsXzG+bet40fcgcNOhsVbZLkAlRack4cwYBUYGgLggqejkYvG3b8T2NJpuPcPYbPsACrN
	em1oWaLUFjSaxhICWgLTHWQSXUx0ob3s4buEO9pZqt37CPqMgeVPLxl1knU2LJFjOrFS6kpXXagAe
	ZT5DvgM3Ncl86a88R6+cqGyd1/ygHWCJbrUoUGs/g2uwUSdlJrza5SOdrv6I7D15+jJrlu2wLq70/
	tD+0eZgH3I2LBXVlQJSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maSyI-00EZPo-GE; Wed, 13 Oct 2021 01:22:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maSyF-00EZOx-2E
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 01:22:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C89E9604D2;
 Wed, 13 Oct 2021 01:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634088134;
 bh=468WHYFwB6WFDhp8ouf1HntwGAoFETGsz8CZghL0FKA=;
 h=From:To:Cc:Subject:Date:From;
 b=RipuErGRqkVoqnXnfk2l6WgyfFMaVtMuXqOttmm6D+0kKavAT52ABC0etQyzNjgyj
 JSxsnhtFdw1+hhaZ4bymhMhOCm6f9UTF0usrkdWXRIK4apJqIOmoTAgcCXAS6Yq26l
 PSBCYz4lkApVimpSVFjTfzfxyxaO9x9kp4eIOvM8Q7yewxah0C9+D1oVEMsd+5IjRt
 NmFF4/Ls5tFKlwuuaHepTgzLOdJJkIa6+mKyOR0ajiFPhqHfICP61mxRt5eDuLiD8k
 LsztBiHuHLwQv6oC/d2u1YPM6ONg+QLTAu3Q0D2BSTxkDPtGQhILppNv22gdFxGTSj
 b17srNpQqGwqA==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 maz@kernel.org, tglx@linutronix.de, palmer@dabbelt.com, heiko@sntech.de
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>, Rob Herring <robh@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH V3 1/2] dt-bindings: update riscv plic compatible string
Date: Wed, 13 Oct 2021 09:21:48 +0800
Message-Id: <20211013012149.2834212-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_182215_143673_C848D1D6 
X-CRM114-Status: UNSURE (   7.90  )
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
bindings to support SOCs with thead,c9xx processor cores.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@wdc.com>

---

Changes since V3:
 - Rename "c9xx" to "c900"
 - Add thead,c900-plic in the description section
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml    | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 08d5a57ce00f..82629832e5a5 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -35,6 +35,11 @@ description:
   contains a specific memory layout, which is documented in chapter 8 of the
   SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
 
+  While the "thead,c900-plic" would mask IRQ with readl(claim), so it needn't
+  mask/unmask which needed in RISC-V PLIC. When in IRQS_ONESHOT & IRQCHIP_EOI_THREADED
+  path, unnecessary mask operation would cause a blocking irq bug in thead,c900-plic.
+  Because when IRQ is disabled in c900, writel(hwirq, claim) would be invalid.
+
 maintainers:
   - Sagar Kadam <sagar.kadam@sifive.com>
   - Paul Walmsley  <paul.walmsley@sifive.com>
@@ -46,6 +51,7 @@ properties:
       - enum:
           - sifive,fu540-c000-plic
           - canaan,k210-plic
+          - thead,c900-plic
       - const: sifive,plic-1.0.0
 
   reg:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

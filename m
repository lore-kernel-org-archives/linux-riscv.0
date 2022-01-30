Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E3EC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 13:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hme8U0kjmtk/NoWbHX1+f4ouo6/1QqlLAkDO937gM/c=; b=lQiKrON8UYAiBr
	oKku3/aVFgceYbd0o1c4OR7thGQomuNXHjRz00KkNID4dIu2wNJ+dft2sEwGtVUNtoI15k5RHlm9D
	YZdXvnvTmeQj35kPiSx52ofF8AxRPu3QnttTn0HdHgkwrANx4gBPY6AWggdHKGTp8fwO0WRF+3kff
	mvmKP1PnsUqrljfbQ4zeYu//Mbp75OLwvvjAcuVgpCfvpc2R3afReX33IrrBYBmB3+fTdhq1HyHCS
	yUJ/k46UYwVBPwp887Em/KgeOFdOVm5Ns8FEkT9hvQ0xKaJ9HDGx+p13LrlsDI0Aqs7r0L9TZ4lrc
	xMKAg0uYdXadT45MTt4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEAhP-006cJZ-Bh; Sun, 30 Jan 2022 13:56:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEAhL-006cIT-PO
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 13:56:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EEB7F611B7;
 Sun, 30 Jan 2022 13:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4CFEC340EB;
 Sun, 30 Jan 2022 13:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643551014;
 bh=mtArtRxdfzyYRARE8Hm/YmQshbmLOFqK8TABaYcosT4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dI3Xl5BSUthtIvycI3fPzWvSaJxLenQTli/9DMmN1fjOgB5XHwFyHwTaQF/e0fCPH
 hF1mqP7UELHSJBfYPMmbEzF3SM2ty7l34ckjXiMM4Gn0B6ORt89YDIJdhCrTNgiD7X
 xVwGOei/tJbSYL9MPYY2SOuZAZd985NMhtz0VjicDyTY/4JYZY9FagzYPRkOCzzGxS
 fcHhqeJmRNzTO2klk3HUJc1AUd97FJHq0gZLaSIK81uDwcPAq6NeuJsbA/QZqWhVc+
 RWe4bnW4fXTOhvx/1Zac1NXO7eRWj2v5pGSCRQMDV3r41Ugd+ylEy2cuheef2gRocs
 JQbddqAT+EPNw==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, maz@kernel.org, tglx@linutronix.de,
 palmer@dabbelt.com, samuel@sholland.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH V7 1/2] dt-bindings: update riscv plic compatible string
Date: Sun, 30 Jan 2022 21:56:33 +0800
Message-Id: <20220130135634.1213301-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220130135634.1213301-1-guoren@kernel.org>
References: <20220130135634.1213301-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_055655_889821_EE74CE3E 
X-CRM114-Status: GOOD (  11.05  )
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
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Samuel Holland <samuel@sholland.org>
---
 .../sifive,plic-1.0.0.yaml                    | 21 +++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 28b6b17fe4b2..1fa5aa7e4c2e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -35,6 +35,10 @@ description:
   contains a specific memory layout, which is documented in chapter 8 of the
   SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
 
+  The thead,c900-plic is different from sifive,plic-1.0.0 in opensbi, the
+  T-HEAD PLIC implementation requires setting a delegation bit to allow access
+  from S-mode. So add thead,c900-plic to distinguish them.
+
 maintainers:
   - Sagar Kadam <sagar.kadam@sifive.com>
   - Paul Walmsley  <paul.walmsley@sifive.com>
@@ -42,12 +46,17 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sifive,fu540-c000-plic
-          - starfive,jh7100-plic
-          - canaan,k210-plic
-      - const: sifive,plic-1.0.0
+    oneOf:
+      - items:
+          - enum:
+              - sifive,fu540-c000-plic
+              - starfive,jh7100-plic
+              - canaan,k210-plic
+          - const: sifive,plic-1.0.0
+      - items:
+          - enum:
+              - allwinner,sun20i-d1-plic
+          - const: thead,c900-plic
 
   reg:
     maxItems: 1
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

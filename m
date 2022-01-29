Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805C5C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jan 2022 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7hoiN74fxTJlsH2pcGZCg80BtO+0C3G5kxozeyMlEo=; b=pAaWtgmBSzoH2D
	Fh+OogtvrVqi3RCG3DoL89Tldq964MGm/j4lFgpo5pgVPAjHDxjUQQWnV1Y623fpTnEwuZ74yMkGG
	wo2C5bf+riIRN9iZAd+fv/fU2lVH2zeCeK8oUhJyWaWZbWAky51fT4YlF94fLdhYBG4nITj+NQBRn
	B2GU2IKO20Pf/OQRCeSgy/sEG0qXFGlfK6jgLmYAHuzW6JgojRv3YPO0drYexom9PB237VzL1xVvv
	n24Aq9aO/I0ZrRaEYVaQjuCDSLzP8Yuhh1CVj/PJEznkAsrEq9h003FH8LXl3300M6vq7opPCL/15
	x+h7z5kyaejctf8wJDgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDqa0-0055SG-05; Sat, 29 Jan 2022 16:28:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDqZw-0055Qs-8C
 for linux-riscv@lists.infradead.org; Sat, 29 Jan 2022 16:27:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C3A2F60EE1;
 Sat, 29 Jan 2022 16:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C535CC340E5;
 Sat, 29 Jan 2022 16:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643473675;
 bh=ydnuLLSPbVTwByYCzZeq7vAqtnlXTC8PzWC+C5Q2PZA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kq2OEZlH40g7mVhiQJfp0QxCdUMjSXPRpPBv7zi2hEwFsOYVsWJhp4JOK/qMqpVgb
 /D+T95hNdvibZltIfi+FRsOa6Ujp072kNWEsWEA4rSyjg+ZwpnlvgZMkZEcADmEIne
 XbK98sVARkN0PZZmgrTnV1Gg76pfi9rlPUG14az8AgcLZ1YErjzwIVJOB/8zfRLCvk
 9zyxBwGqohpVdN0Pok41whgXKcGgQ1IvTvS9YZYx6MKZFTDF7AGV0Ytv/a31LbgOl9
 RLT5WnzN62xgIATWdaubqgM7+CS5N1iyNFUjQ0eZhjrbIs5SbpzXPERd1FCbiqce86
 IT6530KsMea5Q==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, maz@kernel.org, tglx@linutronix.de,
 palmer@dabbelt.com, samuel@sholland.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH V6 1/2] dt-bindings: update riscv plic compatible string
Date: Sun, 30 Jan 2022 00:27:25 +0800
Message-Id: <20220129162726.1154501-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220129162726.1154501-1-guoren@kernel.org>
References: <20220129162726.1154501-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_082756_359722_E4E58999 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
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

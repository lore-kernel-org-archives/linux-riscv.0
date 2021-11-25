Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58DBC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Nov 2021 15:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+YMv9pjl/fH+qjRGgjNs8tirYzBuRgraPbNvggxTt6Y=; b=hYv5+mfqFzgS3+
	XWmeKxZnXbdT63Oh4klPPsBO+jyY0gTxmhugYY3qceBbeVoR4HJkrT4UifpU+2jKkBfG1Iw9Sxbe9
	Ig4ySvteoqxkWIWtlXc4cWhG7UskavD9x6J1CPyhLZfYMXE2qsxhyY8I4uoksVpAI+wDJj4RW8W2J
	yQg0zxkR/ks9RyxJ91tKhw/MorLv//dOkYmx7aAtrxIIoUlbP2M5Zhiwft1KLqnKSXyO/ihhYMU3q
	JxwnqZFLQb4NRSIuVRpzId/evWJsSQqpJmTLH1PxA7+a90+WCECq8Fb64ZT7sdjDr14Ko3njbnGI/
	0rAWdkbGMxwxBiZoAL0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqGH8-007vtu-Dz; Thu, 25 Nov 2021 15:03:02 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqGGv-007vsB-Bx
 for linux-riscv@lists.infradead.org; Thu, 25 Nov 2021 15:02:51 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:1511:ffa3:275:45dd])
 by michel.telenet-ops.be with bizsmtp
 id Nf2e2600c5CGg7706f2e7S; Thu, 25 Nov 2021 16:02:39 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGGk-000DAH-Ak; Thu, 25 Nov 2021 16:02:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGGj-000g2p-3w; Thu, 25 Nov 2021 16:02:37 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Green Wan <green.wan@sifive.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Debbelt <palmer@sifive.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] dt-bindings: dma: sifive,
 fu540-c000-pdma: Group interrupt tuples
Date: Thu, 25 Nov 2021 16:02:33 +0100
Message-Id: <20211125150233.161576-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_070249_959734_76500BA6 
X-CRM114-Status: UNSURE (   8.58  )
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

To improve human readability and enable automatic validation, the tuples
in "interrupts" properties should be grouped using angle brackets.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 .../devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
index d32a71b975fe200b..75ad898c59bc493d 100644
--- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
+++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
@@ -50,7 +50,7 @@ examples:
     dma@3000000 {
       compatible = "sifive,fu540-c000-pdma";
       reg = <0x3000000 0x8000>;
-      interrupts = <23 24 25 26 27 28 29 30>;
+      interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>, <30>;
       #dma-cells = <1>;
     };
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

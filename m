Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A710FC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jun 2022 20:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sz4vCo88MbD7FNazyu9/cWBrGyp2EFdEu4AKlXPF4Rc=; b=hA4pW1pjQfeJ7Q
	iDy1hLBUMTrDfVempDYLxmHgYb7LR0Ruli4ctPFxiUC1LWLeC5xO2OGN+O4o8rUkMBu6TGkc7X+uy
	68qZtHxtRNQw/Ex+d0RN6dMx+jNWZQcg/WJEWphKNrKENvG2MpRRT9rRixJhIjTPwO2kZVQqxdF6/
	n4OforUlRHLLxympGr0/9uRp6pvE2ZqeCGOiFxbGxQsI8mit43pRenoawQWngou+iaamNnYmTKxCl
	orndb/BiZm4MUfnHqTsGnf7BnpP63vbSEh99h+LrVLPxd8BgKD6XN7XviePpKTfoyaVSQcSoOWBcY
	e7C5FIDN53BJwfBXFgRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o31aw-00F7w7-Fh; Sun, 19 Jun 2022 20:32:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o31at-00F7tx-IA
	for linux-riscv@lists.infradead.org; Sun, 19 Jun 2022 20:32:28 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o31an-0000EW-Va; Sun, 19 Jun 2022 22:32:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wefu@redhat.com,
	guoren@kernel.org,
	cmuellner@linux.com,
	philipp.tomsich@vrull.eu,
	hch@lst.de,
	samuel@sholland.org,
	atishp@atishpatra.org,
	anup@brainfault.org,
	mick@ics.forth.gr,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	drew@beagleboard.org,
	rdunlap@infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 2/4] dt-bindings: riscv: document cbom-block-size
Date: Sun, 19 Jun 2022 22:32:10 +0200
Message-Id: <20220619203212.3604485-3-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619203212.3604485-1-heiko@sntech.de>
References: <20220619203212.3604485-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_133227_659220_83A9FB67 
X-CRM114-Status: UNSURE (   9.88  )
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

The Zicbom operates on a block-size defined for the cpu-core,
which does not necessarily match other cache-sizes used.

So add the necessary property for the system to know the core's
block-size.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d632ac76532e..873dd12f6e89 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -63,6 +63,11 @@ properties:
       - riscv,sv48
       - riscv,none
 
+  riscv,cbom-block-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The blocksize in bytes for the Zicbom cache operations.
+
   riscv,isa:
     description:
       Identifies the specific RISC-V instruction set architecture
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

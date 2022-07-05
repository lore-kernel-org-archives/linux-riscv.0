Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD679C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 22:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sz4vCo88MbD7FNazyu9/cWBrGyp2EFdEu4AKlXPF4Rc=; b=xWFyoIqkhnbM65
	fiOKevXMaBxxcEwSWDr2Wu87ohgMJQmCjiycR9PS3yL0dfPXzUeYfz3lr/1jEhxRpDVofsFBmXhqk
	srAFRb6Zg1QmhBvlQbtFhxGwhXOysaojSfrZz4J2iUnHS4/+VqUMvKkRpTaqwB4ga2heP2/cf02jU
	45xTRn1P9sRQ7j8iKls6mldNiDoXAiHPlCAHNsLN1huMtZDHHwRcuH0KMc6Pwoyk43d6j3/syldfg
	KC+5FaiDNhgKd/sAqteL9tqZdiOV9jX5Vm51nO2cWTndyEotRNqmuo4FCNBKr0iPxFIa03Nveoxhj
	ScIJIr+SPYFaofSHrmXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8rKK-003H56-9i; Tue, 05 Jul 2022 22:47:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8rKD-003H1O-PS
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 22:47:24 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o8rK6-0003yY-3R; Wed, 06 Jul 2022 00:47:14 +0200
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
Subject: [PATCH v6 2/4] dt-bindings: riscv: document cbom-block-size
Date: Wed,  6 Jul 2022 00:47:01 +0200
Message-Id: <20220705224703.1571895-3-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220705224703.1571895-1-heiko@sntech.de>
References: <20220705224703.1571895-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_154721_926498_CFF467AA 
X-CRM114-Status: UNSURE (   9.62  )
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF35CEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t/oLZpBMdWa0gFI2jJs2TbZfCQeZ795WlrkLyakHO40=; b=0qyvY7nEk8ho92
	vEtC7g2h1x09s38Qeq+LT5Nf+d5LtYSyW4M3rzyV7TYTbhYUq5tBnre2g94y0X3y6gmZbuqliY9c9
	obJrw+1xbrJ5YE/bwuYnu4qr/QzHX6goEtsodrN+FRd6heUdwI5XIcEoTF177XKlBlrXuKDhPYmoU
	xfiNpAgo/HkrTtg1VwaKxZlXBmtVSBdGAWd19cmP4tZEAmHhCuxvA4jnpcG08/2Za7F6j2K68BT/B
	nkxUKnP4T4u8QaFq1OzdYHhBsrZf7QgaeGBXsG9Tf2C4j6RLvfJGWhI4rhMhXX0Euc27D1Me68KrD
	kNO/eouGghxbgAQnWadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL193-0000000GKDD-3W63;
	Mon, 17 Nov 2025 15:27:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL191-0000000GKCn-2jQd
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 15:27:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 051114041A;
	Mon, 17 Nov 2025 15:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D328CC4CEF1;
	Mon, 17 Nov 2025 15:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763393274;
	bh=XFDVtRf2dMtnXChbfMlAQOSupgvm0o+20uGF7F280SY=;
	h=From:To:Cc:Subject:Date:From;
	b=NupxwpXUwCsda4Fdwn7X7Vjt5zK0uy51eh6KomuAiAFfCoeB9pZngMO1i+WvO09h4
	 BIYVxBUcgjqslkP14jr02ix211SK5zM1exSGcX8beR/oB8jQgsAhhNCx5cxEfJjwhP
	 KStS0TF+8z10zUqq/Td12gD6boU4IyPcW6RaPQ8U5GGP7Z7ZUdYHGiIsCeXgm1wE7p
	 WW81pVLr4/n9p+KkZwhumzbNEOlCjtTSzoM4qE9kVah4NpYq6G3C2/r2aDgnj0Ja+4
	 Cw6B35nNB8b9qxSxqtm5+4wzgwKXWlW7CZpviZ50D4/XISvBdxDXORyedJQVUE7yTd
	 kEDVmW6iMmf4g==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1] dt-bindings: interrupt-controller: sifive,plic: Add pic64gx compatibility
Date: Mon, 17 Nov 2025 15:27:36 +0000
Message-ID: <20251117-evict-corridor-5efe40101eea@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=AAavUHU+kBNL6KIcRm/Gg3Eg3Y0+OFfa4VUJWSUbQt0=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSds9Ond1e7PvdxXtDv8HTZ6fMA+7Pa26bP82h6/3uN zMe9LBUdpSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiK/wZGT4zC3i99lvsrBkg vHyltsfiZ/l51vxdh9PSzkxx2b9njQvD/wLGh+Z2GVwC54LdPDOf3vl9iOVZkYVMaXPl5KMX7ge vZwQA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_072755_731794_AB6EF8A5 
X-CRM114-Status: UNSURE (   8.09  )
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

As mention in sifive,plic-1.0.0.yaml, a specific compatible should be used
for pic64gx, so here it is.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org

 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index f683d696909b..3bc0ae9ea70b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -60,6 +60,7 @@ properties:
           - enum:
               - canaan,k210-plic
               - eswin,eic7700-plic
+              - microchip,pic64gx-plic
               - sifive,fu540-c000-plic
               - spacemit,k1-plic
               - starfive,jh7100-plic
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

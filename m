Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A742FF5108
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 15:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UT4deUIajthrIjOKglhi996SIsXofS2ASkmylsmxuns=; b=NQ9GUHfPSufyo4
	C+/vJLHLPzx8YKBJWvTjILYrN1/lXJ7exC4OW434jfYIYbSQlK1Gd841bweQHiDHxZh/Uvi+kL9AX
	2TEZdJtpeQgaZm8/Fjmw1HO1kOHVBKGdAJzPQsbhxyrEE8oenq+mV6zTBaQ1x+JjRZxR0aAAaZvDs
	5v/XQP1znGeeT8mCe7dlY2NJp195B6tph49ZhWNLWsU+6bLTbR/Sg0y0Z1xhr0zB9g8HKxYNlVJri
	FoiKlAT6YV3vGfSz5QCFoW0nfdfFxEhL4MyKE1SVXWmjUcIPIZNnSY3aH+4IWjqQ+LGuyZtAVh7B4
	yKuj71PUTlyGBPsZ6wlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8No-00000006i12-48sT;
	Tue, 07 Apr 2026 15:30:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Nn-00000006i0R-2uv8
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 15:30:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B3E2600CB;
	Tue,  7 Apr 2026 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9FDC116C6;
	Tue,  7 Apr 2026 15:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775575825;
	bh=TbudX6aGyCNPsFVssjZ3W5xAnai05Ks8V4pY3NZT0WA=;
	h=From:To:Cc:Subject:Date:From;
	b=LjSgZ7ArsiIgSXuvC4Wa7OwmiSV5natfgZll6bAz11p/VX5bFsojq9j0wkeB+RDSa
	 bLwORRzjSMbAe0hR0CytgHpMri9eL9TmVMraAzQgyh8JspoY3/RkIRcZBaCUkyd681
	 AYpd6W1Gh4i1DhUgl1yz/9cxCdUhfYNP+7GJlH3JgZX4AzNMqrnOmf6s8e+GhPZzBq
	 7Ujf8xYxSYwCui72pT9lACnRTZqGPJOtv7W+N3LA2nN5FKPVDkWlSgUTbZXC5F+/TE
	 H021AByuPtzTtoOIaynxgWpFOmDtozYctzdZLJjnBxWQ+qtBss35vSJxaPz5hG7dWd
	 /E1zBo2/YA1Mw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: soc: microchip: document irqmux on pic64gx
Date: Tue,  7 Apr 2026 16:29:31 +0100
Message-ID: <20260407-headache-reward-ae93bacdba0e@spud>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=nvr39C1LZXppwb7vRRHE2hQ7HrUmAZPXSdwtVK9tNMI=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlXlW5zFeyzO6d+/PqyFGP5zdczxbb7BaabvVWTFKp6N zV3WVtlRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZS8Z/hF3NDUvOsC+ufBFk4 y3hEe8RcVb579p4M/6+eEyfd/nYcjGH4HzD/hb2qVq/AwzJxrbro4AdJQWGzAvKKLeweaR27tbe fBQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

Being practically identical to PolarFire SoC, pic64gx has a irqmux
that's entirely compatible with that on mpfs.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 .../bindings/soc/microchip/microchip,mpfs-irqmux.yaml       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
index 51164772724f5..419b32e2df936 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
@@ -26,7 +26,11 @@ description: |
 
 properties:
   compatible:
-    const: microchip,mpfs-irqmux
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-irqmux
+          - const: microchip,mpfs-irqmux
+      - const: microchip,mpfs-irqmux
 
   reg:
     maxItems: 1
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

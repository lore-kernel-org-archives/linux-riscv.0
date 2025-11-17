Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D95DCEBF61
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 14:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWwbDyibiYNB599D7iCMiNkoPTwYAUzWOzZdXrjnLnw=; b=P6QySYprzZjW4K
	iaDNJDYNDYYPkrg6iBz49DjfUYQbeLIa+o/iQdne+GyHYSKff8yElzjBPvSXwFOE9dOS4nKZdrzHM
	LGfljGFuX8MHDNuhao3006ObQi+N2E1+GbQ8l8zBVMba3R0d8lyg+K3TmlXsDBHE131Wbc5Evdboy
	NbKB5WP/e/pGHof98kTHv5E+xKJu/idD/M9dU6+hG2q3M1tT9WjlfICne5w1q3TweF8vezbAI6dA0
	fAcA/8MJHkVLT1+oNyWj/j/JrNSTlrJz8aVyasP6uAGNoQpxI9LmW+43yFT+tfMkdAouuOe2SIgNW
	bcMJ3oMAXbJ8wOPT7LDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL06r-0000000GFYV-3v7u;
	Mon, 17 Nov 2025 14:21:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL06q-0000000GFYO-1l35
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 14:21:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D744960207;
	Mon, 17 Nov 2025 14:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D5FC4CEF1;
	Mon, 17 Nov 2025 14:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763389295;
	bh=VMkhzVdFF718xxI3R8myeRKPldhaPCNukn2Dr7NViNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mj79QdGcCMslu9I0Lj53jxL8YNXYsTHzsbexR+87t9n4CoRE1NqjvYXIaKKfhrA6Q
	 mLr6oPtrV+PELHftah0sUEaq8QC8fwwqSiLtXX492jp/kTjkabwMEjDZwNAvuhtVgI
	 An11iV1m/4FqyCdkw86872P8gpxFCU6VCLjJ4jhiHlHWO3QYKFEmDPWN+fL33swTAo
	 D9+EL91KIzHBoDTfaqMKU3E2DL8uwqkAuy8C4ajhDsOhcHkrwILm+q+ykL26sZXxKJ
	 KZOUR93TrFe50u7k7fGweKzyXNuOcVrRw5mcyp4LvW5t73cEYZYLR4bDTu9hxL6mwQ
	 AG8JQO1ElMZXg==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 1/3] dt-bindings: soc: microchip: add compatible for the mss-top-sysreg on pic64gx
Date: Mon, 17 Nov 2025 14:21:20 +0000
Message-ID: <20251117-reversion-distaste-986c81a33f20@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117-mashing-cursor-6e965a77ce6a@spud>
References: <20251117-mashing-cursor-6e965a77ce6a@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=9r0jELMzsNrhXXub+HN5urN9Eek071kdQwUXmSVqQ60=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnS+rE63PXr+A4o3N4cPmtvXMrP/+u+mu561dfbZfVei b9uv4NQRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACYSxs/wz2hC4nehJYVHjv4q 4BXJeHWy64mN2/TvmeLaa35InP2zUoHhf+W97cdZLnkebbTnUOp7vGOGhNuBJ95/D2qVLW9JFOw QYQYA
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

pic64gx has an identical sysreg syscon to mpfs, add it using a fallback.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip/microchip,mpfs-mss-top-sysreg.yaml   | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
index 44e4a50c3155..2c1efcdf59b7 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
@@ -15,10 +15,16 @@ description:
 
 properties:
   compatible:
-    items:
-      - const: microchip,mpfs-mss-top-sysreg
-      - const: syscon
-      - const: simple-mfd
+    oneOf:
+      - items:
+          - const: microchip,mpfs-mss-top-sysreg
+          - const: syscon
+          - const: simple-mfd
+      - items:
+          - const: microchip,pic64gx-mss-top-sysreg
+          - const: microchip,mpfs-mss-top-sysreg
+          - const: syscon
+          - const: simple-mfd
 
   reg:
     maxItems: 1
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

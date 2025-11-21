Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FE1CFC27C
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 13:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EP+XJmfnswdK13uoiV6sTVyPtt05O81ZgzCtVhtDzGA=; b=Q+rij88evKy4qG
	UG0h1xMrWijcw9/6RGVBDpjnUsUA00aYdLlz0jWncgIormhBgbBFZrOp3+A34yXCzuxkR7IoLuid/
	B370MQD5BL9c+Cg9iWcERYhgZ4wnUSczrXJCGq/gSfKdOv1rmN4/ownUDRpmf0heqJXGe3w4zCjK5
	lGZo2lMjlNcBGf35vqMSefMUM4kej4obXa7lP28QgZvFLsEUQcn+VQa7trlmOGTiSvtoj+J/x1+k/
	VpVdg4qRSzWTWbIriCDMcLDJiMwCpcx/R6d7lcPpJOjzwOxd+w2OR6CltkodVgDkOHlHM2dD1+2pd
	hbk3crPp0WwtakYa8Ceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRQx-00000008R8K-07Am;
	Fri, 21 Nov 2025 13:44:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRQu-00000008R6x-3tTF
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 13:44:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EC064189D;
	Fri, 21 Nov 2025 13:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B69C4CEFB;
	Fri, 21 Nov 2025 13:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763732656;
	bh=0+J1Q5CKVMTP2xhn6YpjpspBi2tj6Gjjxk8nh8alXSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MrcXdDJfyvU/I3meVg/ArtkEdEJx5REMlOb+eK7jKHWiSdBCUuRvZm5Eda3nnwROr
	 tM58qKQjtrApyMD6gWUjO4pcmzRjUXsDdDaLGyyuHGlDi0pv+x3VmG623BS0d5zvpJ
	 FKYpJblG+oBsMVYEETH3cbQ79tLlnCXx/rQ7fpmAlhYRoMXZteLfdTgd5bFwXaWUg5
	 x4/F6y2j2UgxFMTXfRQGhcQNC309vIDGWSJ+JsVchrLEAi76LXGcoXKsuJxuPjKkUV
	 q9PoYR7va2W052QLZpCrXc47d3E9i0qZyPZYUPVJ/Rw1kE5gqmYrVsPh2UUDkSJMv8
	 fUotfhTBuhOog==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Subject: [PATCH v2 3/3] dt-bindings: clock: mpfs-clkcfg: Add pic64gx compatibility
Date: Fri, 21 Nov 2025 13:44:02 +0000
Message-ID: <20251121-unclip-shabby-a7a16e865146@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251121-tartar-drew-ba31c5ec9192@spud>
References: <20251121-tartar-drew-ba31c5ec9192@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1375; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=BAqYmh3+kZOKEzACbZi5m6qzBFcZG08zjLdoiX1jvnQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkKOfMTLvxZIKvxR3R3ZPbj37b/pu479/R0njDjUV29i ObZk5LvdJSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiaiYM/yxqF7nGc1v1pHDq ZZ763J5xM7IyYm3eebWswNroeTZ6zxl+s3Z7KBlM0oj+8Kf41vkdukI1vaGnXjoV7BM62F574BI vKwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_054416_992448_643FB0E2 
X-CRM114-Status: UNSURE (   8.44  )
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

pic64gx has a clock controller compatible with mpfs-clkcfg. Don't permit
the deprecated configuration that was never supported for this SoC.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/microchip,mpfs-clkcfg.yaml    | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
index ee4f31596d97..a23703c281d1 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
@@ -19,7 +19,11 @@ description: |
 
 properties:
   compatible:
-    const: microchip,mpfs-clkcfg
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-clkcfg
+          - const: microchip,mpfs-clkcfg
+      - const: microchip,mpfs-clkcfg
 
   reg:
     oneOf:
@@ -69,6 +73,16 @@ required:
   - clocks
   - '#clock-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: microchip,pic64gx-clkcfg
+then:
+  properties:
+    reg:
+      maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

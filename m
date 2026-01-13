Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007BAD30CDB
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 22:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAvvcuBM5Uxs+gZ9W0AqTG+z7XIBRQIVcHMtD2zlFdQ=; b=uc/dA3rT312Fxt
	h33KtRUcQ0Vwmd/Xvju7rllUbwTRuRAClRrK+C7xnmeNJHGeaRVSb7cXFh0C0dNvrPve4EcRJkzDF
	M45nVnSQIfeF7oAu78oq6IT6n3DaJvKjiWwDKSoqZf3v3oc2sxQfEILqHfcXLnfd67SpUaUpsb+fg
	QSplK3OYxkrEgj58HsfaDlWCjj9lU4lLfYzBYPwckTZmHgP9OQILxLBSh7AGtkJql5pK0PdBkW530
	6Bp4ZHzyatezD8OyCM4BeLxP/CVUPonI1/8o5qUEUCP395ko/l6H/OoFxJRJoH06Yo9jveWM9Kl6D
	/NWhrwyW+hq2nnC2zsEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmcV-00000007nog-0YoR;
	Tue, 13 Jan 2026 22:12:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmcS-00000007no6-21DV
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 22:12:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 365D844369;
	Tue, 13 Jan 2026 22:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BADC116C6;
	Tue, 13 Jan 2026 22:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768342328;
	bh=hhOL3Ebuv8HCu7aFlXPxRjmRk8hM7W0i6or4f1TWUtw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mro7RMswWNzVyH+/XdlrD54TiCu+5sASSEfsPTgeDoI+wRdDE0JL6HJDGL/rqfkFt
	 w6dRRyAYyoVB/RUp1VGxKYH6dHJIMUW8fusKVebBIQGqN3LOXJ5bUyl5/a2bmEAz8F
	 CMFfF95FO650X/I6JMatPOqLtRPwrc0tgkf6KPc9TPoz4GxojnBw0eXHWhWlYn9vTb
	 A9OahDAVZ0X5YWb23xzZlYkGR4HkpAwVSdCS949kdbcUxB3+wEIHcJMJnCQ7jSOh5t
	 ZWN1YtlcM8Bw1Dy4AH2uvHNeqZcWrbASITp1kHZrYwPIuLHPqlG9Ywlds4SLhHDhb0
	 JAe0KtCnu74lg==
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
Subject: [PATCH v3 2/3] dt-bindings: clock: mpfs-ccc: Add pic64gx compatibility
Date: Tue, 13 Jan 2026 22:11:46 +0000
Message-ID: <20260113-guise-conceded-88030697b831@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113-snagged-blemish-52af3d00d88e@spud>
References: <20260113-snagged-blemish-52af3d00d88e@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Z6twspJZK67KIShOCoO30te6Ga2fX6fNsTohld1qusQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlph9WzZwpa/heOv37H891523KfKjZh5QQmZs3bDDOMM vZJ/XnbUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgInYczEyPI9xnn2sxPZQ3Eop +TS9j6GT7fqqXqU6/buYIvmqm8t6BcP/WqmNkrU3GKrvBimlrFZ5bPxcdeuzmVIHWleLBXb2+X5 hBgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_141208_542004_3E8D8B51 
X-CRM114-Status: UNSURE (   7.83  )
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

pic64gx SoC Clock Conditioning Circuitry is compatibles
with the Polarfire SoC

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/clock/microchip,mpfs-ccc.yaml       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
index f1770360798f..9a6b50527c42 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
@@ -17,7 +17,11 @@ description: |
 
 properties:
   compatible:
-    const: microchip,mpfs-ccc
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-ccc
+          - const: microchip,mpfs-ccc
+      - const: microchip,mpfs-ccc
 
   reg:
     items:
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

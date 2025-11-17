Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335D2CEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 15:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=387I8GUiMD1N84mVOiHFM068Y1wcHbCoIZzOrY00ffo=; b=pWPeIQ5vND8h2y
	bAN7Ma7t38HnbdKLsJcF8DySUQWR++O/IG1GXRrNYMNJxbDqsdZvj/CQOHwfefoSY3dqqXfl8gRZA
	sOS/o3V3DfLxg5kg9SIctLeEo5KGsy54FBbGXFFZPzw6hjPY8zMXLuc9pM3t8JM8/5QTJxaXecySY
	YPQ3+iPQmIhrhB6v/+Whw+AGTkX9AkTFLw4x50ibg/9vuwmHIIjIM786m+OJxnKQpl9jrXjy0s++r
	P0opNSeLGWrSEz9bUfME/sisVh5IjT6s/96xFVisGEtO6qLwo50qgSy8zDfBDuWwSUI3Y4tFeAlAY
	WBmd1lw61xTa9tWRPAOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1BA-0000000GKOB-1B7b;
	Mon, 17 Nov 2025 15:30:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1B9-0000000GKO2-1U3m
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 15:30:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C9A860239;
	Mon, 17 Nov 2025 15:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC573C19424;
	Mon, 17 Nov 2025 15:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763393406;
	bh=NXDSR6umU8a9vB338fxPgJsPJ5ZbizTgt4fXoyw5HlU=;
	h=From:To:Cc:Subject:Date:From;
	b=DxnqSItUjdT1gWTHmU6qdQIXrFpYxVT1/nTkIMYZzE9DCwJ4zPtl2Os/lD5IgT4iC
	 A4X/WM/XhmhbwMLFj5Z1AJBXU4GI2slU25yLbG78ZZn+l43PnrCyxktU2mdVIKZGMm
	 m30j4072f5HTj1IskPNQoVa3DwOijnsJPfzDVLBhIg2u2kyJ/TzVdDosXH1yV1dxHd
	 d5D/dePxWWKnybmbnPTOgvb6R94ZpalWZbw6hc3U2aHN3s7oMHlZ6+giH9tYJ+wHXs
	 OOpTt0yd+mmmZFtZApV3qJ5wxSghCwECPuS6mWdlnFty6vBDOYcacYg60l5IfmD2jO
	 ZJztt3G2gtmzg==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1] dt-bindings: timer: sifive,clint: add pic64gx compatibility
Date: Mon, 17 Nov 2025 15:29:54 +0000
Message-ID: <20251117-sadly-scrap-4671550cd78d@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1434; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=jVGCo2PwmaIFmt25VfSAX5mcMLxJOF6mINCMWhpY8yY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnS9gUztbumzbu0vORF0LsTEw7wVPNL7b3591VudQ7zI buF/ytWdpSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiKxIY/pmoXTrstaFbSKon kfXS74RVNh72d9ee1TnYwVvotdPzcC8jQ+P0RwKOeapztVZKL/hgGvgiRv/Q23mtlWGPk81cNuS w8gMA
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

As mention in sifive,clint.yaml, a specific compatible should be used
for pic64gx, so here it is.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org

 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index d85a1a088b35..f0b7b9d2f46d 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -31,6 +31,7 @@ properties:
           - enum:
               - canaan,k210-clint       # Canaan Kendryte K210
               - eswin,eic7700-clint     # ESWIN EIC7700
+              - microchip,pic64gx-clint # Microchip PIC64GX
               - sifive,fu540-c000-clint # SiFive FU540
               - spacemit,k1-clint       # SpacemiT K1
               - starfive,jh7100-clint   # StarFive JH7100
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

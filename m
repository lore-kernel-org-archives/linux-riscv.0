Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B0ECE8D6B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 16:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OXrV4fFkhAhBivEGJ/7TDKGVUkgVOs8KWlj7+rIUZnw=; b=cB0Wwu1Ydt3N/7
	Z+vjQ/O3Tbyt9hPNikgdCsBDFYAbbQAiUQl2P1q3OpgmrePIv9NW9Uhv5/G+LsfHfvfqYV1llsQNH
	cn7qjjinkQR+Ae5KrCH2h61ySwZg05Czpj8AZ4Guuam2ePprp3fkbb59fJczPohEiezLqwGCBAPBM
	dtAaKVgMzNHZGq+LIo9kZpxpOrjdcbmPZA0hVtcBTDWVPIlc2TGck19Mt/9vJSZ5vHKVNMGdMdxzO
	iNASuizKtdJeMmaXzo0jpIcCZitWqpQZJoUSzcjWaF48kzQxtKf1PBChOSS7FJpb7ItXamCCmQTcl
	SxUkglOxbKuTBVORqtwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1eE-0000000GMZD-134w;
	Mon, 17 Nov 2025 16:00:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1e7-0000000GMTU-0PdT
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 16:00:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 59288443FE;
	Mon, 17 Nov 2025 16:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927C7C19425;
	Mon, 17 Nov 2025 15:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763395202;
	bh=4mldTrpNfDBUNb10bIu/HKmz1c+0kq9vpFRlKYSObhU=;
	h=From:To:Cc:Subject:Date:From;
	b=kwCsuJ/4E81FYWxB8nhIpUh98cGRHXdkaivmeqCeFwzimnMDyucuUDCBGwnjff6nc
	 6aMpYp939HTLPDOiKMAgSoz4Kf9VBqOxHbC/YCVXexBa5ZHUEjc6KjNDtcmHolXquj
	 snq5mYN0o8C62kQV+JSgEW3K+C6zUDnbi0ohFiTCL9sv53J13GO3nyKJY92nTamckl
	 ESVl0CEcvv2G6BuIsRLGUxqeGzQIzX50FfoRVZqbgkGfWkM6O85q2NiayVJvbXvzcf
	 JktQMrF9XM9nFGDBiakDEr2E+lUWwg2UzrJWzORpQ37Q2Ht5YyZbnQdQYOAvBxyXWn
	 G0hOwtandKaww==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: mpfs-gpio: Add pic64gx GPIO compatibility
Date: Mon, 17 Nov 2025 15:59:18 +0000
Message-ID: <20251117-grumbly-oversized-2215fe887181@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=vBFHITy0tUgA8hiGFkPbCnmDy5W/03hkEl85M76mBwU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSbiHV/7SuHgz+9H7m+iV3CnfFfHtx75zaA+Vts6c4T Miq3ZpT1VHKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJvOZmZPjskn6NIYEn+8ni ZPP6xD7W/w7nTTbNspuXfU1F8bMl1yKG/wkSK6Z6JJ0QODEpWeG1gF1KrtTECb29a1Zc3W0ScWX DMWYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_080003_159207_42E45175 
X-CRM114-Status: UNSURE (   9.27  )
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

pic64gx GPIO is compatible with mpfs-gpio controller, add it with a
fallback.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

The diff here is kinda scuffed, because for some reason this binding had
an "items: - enum" construct to begin with.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
 .../devicetree/bindings/gpio/microchip,mpfs-gpio.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
index d78da7dd2a56..184432d24ea1 100644
--- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -11,7 +11,10 @@ maintainers:
 
 properties:
   compatible:
-    items:
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-gpio
+          - const: microchip,mpfs-gpio
       - enum:
           - microchip,mpfs-gpio
           - microchip,coregpio-rtl-v3
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

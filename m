Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24788EDA694
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 16:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WUP31s9+53x43SEM/YxZsaIkaki97KNqFJtbtMXvBcE=; b=kBwY/CYHSM2L8S
	NNHuQiTo2RA14wK9uklkrMEtndYf4hzKke5zUMa7SXuQ0AuSi7plxD9+Qa4bsPyXPHzqeTmx0PFHb
	vrXNxEQy57bXTAI2Qs35Tieqy7G0P2bPhhPOZtlKNdh97PLRKqvltLoTyghJZt+h1OjLrrBIWo9ZL
	5DZikn14lE2Lr6oTJiFxRZHmeXTzxvoqenC20quYqOEOgOV4zAEMl+Emlx3wVz9a2vt2ZVb/143iI
	j+oDlCwGjcwHzJTux7iD3Bs3MJtcBZ0C3MDZfmIocc3YPbwwzpnBb4I6FHCypml9Ig5G0SHwYuNYz
	/UH/p3ZyigoVR/0VKvzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSgU-0000000FZu7-1Yl6;
	Tue, 03 Mar 2026 16:33:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSgT-0000000FZu0-12oQ
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 16:33:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 570CB60053;
	Tue,  3 Mar 2026 16:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D605DC116C6;
	Tue,  3 Mar 2026 16:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555600;
	bh=GNniCdhssQvj6kOsAg5nxxAmhRPrZp0Gd8y3TJFrI1g=;
	h=From:To:Cc:Subject:Date:From;
	b=tzzepbats0DYxPv38UnDFpKCG9GFlgUaJB2E99+0FEiPaO56cHA5TU+s1OcE2jsyB
	 v603bEMy1S4ox6OAXsDmhTi1Ylf89+IKGNnSxh8Hxgz5raT/1v6rjHgHUCXjMWsSBH
	 YmJwX0yLZ7nvZf9loPCCWOcINYpqSwaM8MU2FRzJtryEatw5R9nEsniVRwqiWxComP
	 AwjziEGlWoSA22nmwPRFibOZEEQ/4eqiT7QwcVbx4Owg4A68nxhWIh/iOuranCECcY
	 03b0anrNJ/9Li9g18//jcpkny9o6u2dLMCXqZgiOVzKxp0r/yOA94E1F9TlTC28f9v
	 zpFUj7vLz8kGw==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: gpio: mpfs-gpio: permit resets
Date: Tue,  3 Mar 2026 16:33:12 +0000
Message-ID: <20260303-irate-hungry-b54cda817e42@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=adnK8FQbeajElGGtcAWQu96FhmakqixOrQ9WdpBSAk4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnLeT08bkaErRQtnTTVm3tGzxKLvWrS6Up3CsssrO4L/ m3XOjm5o5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPZUsXIcMt94e2wG5plD+9N tyjXaOpenC5WyXPvpN/7Ze7uypKfIxn+J8mpnOJnePkv+Pqhax3nD1wV2D6f/0nbouONt4PLVaU /8wEA
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

Both CoreGPIO and the hardened versions of it on mpfs and pic64gx have a
reset pin. For the former, usually this is wired to a common fabric
reset not managed by software and for the latter two the platform
firmware takes them out of reset on first-party boards (or those using
modified versions of the vendor firmware), but not all boards may take
this approach. Permit providing a reset in devicetree for Linux, or
other devicetree-consuming software, to use.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Linus Walleij <linusw@kernel.org>
CC: Bartosz Golaszewski <brgl@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 .../devicetree/bindings/gpio/microchip,mpfs-gpio.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
index 184432d24ea18..eaa254a468063 100644
--- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -33,6 +33,9 @@ properties:
   clocks:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   "#gpio-cells":
     const: 2
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

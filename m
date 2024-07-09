Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F76FC2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 10:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+DqGRMrv/kq6S1hsrRrVfYiYi/ZAWWWiROCvtRD56OE=; b=IFmB9K18pnlfb4
	byl1sozRLQfIZVT/Egz8W+4vw1MUXLo1fBScMgNOQyvNTG3YrdRlPILCoOM+WOJAVK4I+7eIAXef9
	6waovDaIfSY0MhOhrz1D4inJnPI04SsWMU+YwOLqcVQAyjtMGnElDXsJCRCXghxLiPvbDvB+j1DyK
	8z1EpErA7m0ZQg21K6hGpCFXwmpJxjnPQLbd/ggEVEFwvmJlTaRbCXDQiSCaCiC5U55YdwA5cR/J3
	z9LokCIIvhND9Md39a++ZaJ5ZyJ24Yr5YbEdf5tcOe3jwRrGt3lWd+3E09ghR08Jb/RpSWgfKyOfP
	Bc5TJaI2YlOAouiwEKWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7kx-00000006jle-03GL;
	Tue, 09 Jul 2024 10:07:31 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7ks-00000006jjD-0u4G
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 10:07:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCF1C40006;
	Tue,  9 Jul 2024 10:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720519644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lwHOPxVN4WzseMpm8k0NEmyddjr++H2IEYNI4aIOG2w=;
	b=oe/k0raPnNXaUjvo1qgcMND8z4lYzFd77vEx22BFr4I+SfCOCKnFSNcHBsgXEGaLjPa0BX
	f276Q+22/Q1eHMvACRuBT1Eu/oreIJRF2DXWTMTTKKYvx8e9z+vRYVF76JT5btkfXIRjbO
	y/dxwe5dO9+VoSIiHBDd82PCW2bx8MOOeaa3ZcJw+M5JEGVO4gZvYkjW7ToF6tIVwz3H0h
	Ih5bxYpwUeoZ48bw0mcQBD7o8PKGVR1JX6irNBBD22tk3zGsz55UJoUnuq7JbGeijZauph
	vBT+98dYAk4Ha0uvtRtCLZ+LoUpYP0vdi8dPmGyTNDF6HCmIsTISGuXHpDHLHA==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Tue, 09 Jul 2024 12:07:18 +0200
Subject: [PATCH v3 3/5] dt-bindings: riscv: Add Sipeed LicheeRV Nano board
 compatibles
MIME-Version: 1.0
Message-Id: <20240709-sg2002-v3-3-af779c3d139d@bootlin.com>
References: <20240709-sg2002-v3-0-af779c3d139d@bootlin.com>
In-Reply-To: <20240709-sg2002-v3-0-af779c3d139d@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Chao Wei <chao.wei@sophgo.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_030726_423546_F196E52D 
X-CRM114-Status: UNSURE (   7.74  )
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

Document the compatible strings for the Sipeed LicheeRV Nano B board which
uses the SOPHGO SG2002 SoC.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index 9bc813dad098..a14cb10ff3f0 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -26,6 +26,11 @@ properties:
           - enum:
               - sophgo,huashan-pi
           - const: sophgo,cv1812h
+      - items:
+          - enum:
+              - sipeed,licheerv-nano-b
+          - const: sipeed,licheerv-nano
+          - const: sophgo,sg2002
       - items:
           - enum:
               - milkv,pioneer

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

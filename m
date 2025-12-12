Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937A8D59D8E
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 21:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Frsd24XGWW9MpUQvrn0SduYyyA+oAXKlc1+EK93vTC4=; b=qKCQK+rN5GWA7b
	vF16EZpIrIB0rixHSrKXSVC67V+AMmIGuejEgM97shfM9+6pNBxVxym9eKbKa+4nbgBWLD19k4Gcr
	EgTmsf0KU5PY69Zx1z0CVsGqyTTUmk51/QLeEbttYgFt83NhWDd3i3xKaN9R/Zm/dTM8RT8lzhBd/
	hgSh/3hSuSAKSM21x6A9Qjsoc4hfSP1ErE2/Bs25VVR7u0SEOVfiw6XZ2vZ7pfGRMCWiSny+FLAIc
	43fxWt9C29aP3xS4bz9Ny6H3PR/5SGYgrzBVBwAdh10wUj1BJzYnp6SOS/C1PBDKOnyLE4zPfbsci
	Bp5wEdl0mZ/q5hVLp/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUAam-000000016z3-3JyC;
	Fri, 12 Dec 2025 21:22:24 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUAaj-000000016xm-2krB
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 21:22:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1765574436;
	bh=5MdfPukJ3hoONSmZ87YbV4TFIzjtXUGofKnYalLysac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vr6uJPHcV2uyHic5JqWEU3dcYtBTqdM4OyKM4abqfFWYen1c0l1B3Qp/aGSe47aC+
	 I2F6hIF0J8jWEPi2D76kCUIgcDz/1w6FB4Mcs2/N+p7RuNHWYISpju426Ti6PVdL4u
	 t3ySdOhKjRtIar4R0bw6/gt3U5YjG2w5s7bISUFerrEjAzF6FHbrUAX2dnCu0J+7wP
	 hM7rQJPNHJe7Xu4WpyfMYGV6lchqtd/NN/GE9eHyIKpdXs5jaXovlMuvD0GAY3NF0i
	 yMNCU1mUBGkux5pQhhr1ZcOCgW28bJs5g1Z56vDAefqqB1TjyYbCL+HbppsYT57YeO
	 a9MhS4rTgnPdw==
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id C3970B221428;
	Fri, 12 Dec 2025 22:20:32 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hal Feng <hal.feng@starfivetech.com>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	E Shattow <e@freeshell.de>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/3] riscv: dts: starfive: Append JH-7110 SoC compatible to VisionFive 2 Lite eMMC board
Date: Fri, 12 Dec 2025 13:19:20 -0800
Message-ID: <20251212211934.135602-4-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20251212211934.135602-1-e@freeshell.de>
References: <20251212211934.135602-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_132221_838491_3A3F247D 
X-CRM114-Status: UNSURE (   9.22  )
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

Append "starfive,jh7110" compatible to VisionFive 2 Lite eMMC board in the
least-compatible end of the list.

Appending "starfive,jh7110" reduces the number of compatible strings to
check in the OpenSBI platform driver. JH-7110S SoC on this board is the
same as JH-7110 SoC however rated for thermal, voltage, and frequency
characteristics for a maximum of 1.25GHz operation.

Link to previous discussion suggesting this change:
https://lore.kernel.org/lkml/1f96a267-f5c6-498e-a2c4-7a47a73ea7e7@canonical.com/

Fixes: ae264ae12442 ("riscv: dts: starfive: Add VisionFive 2 Lite eMMC board device tree")
Suggested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Signed-off-by: E Shattow <e@freeshell.de>
---
 .../dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dts     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dts
index e27a662d4022..7544efa95de4 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "StarFive VisionFive 2 Lite eMMC";
-	compatible = "starfive,visionfive-2-lite-emmc", "starfive,jh7110s";
+	compatible = "starfive,visionfive-2-lite-emmc", "starfive,jh7110s", "starfive,jh7110";
 };
 
 &mmc0 {
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6CDD3B7D8
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 20:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zeXddfe60pv0M01gqePeJP4GYMHKgnuJ/RfE2C4knQM=; b=r9zp6lNuTCrCtt
	4oTHaWY84f5jNSqlZBmMn5MXuw2gF8GsPcxQRtCqtXymjcEv8J4ePRg+JHGJitKdGpEAspRR0TInW
	5EGyGZxXqhWDAyABhs88PYpUcesQ/kt5Dp4I4LxbSiYes9jeHm42SuRblyvTMp/ZQfFz+M2uddUmw
	L68HqzV92vnqLPsDGR5CGW3nosyFLPeAR728UXzFTvbryctBq5q50q0bIqXuJUx7axLquza6jrI+B
	hmi/PPTaln7PZ8vRQTPAKANwpqQgmgyK7eOimUtgbZLxFR/vZWuR2ndGLwsK6HMA3S+eIcSDlaISp
	ooeqUPpCVvf2PObCSg5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzCB-0000000BEEa-1HAO;
	Sat, 06 Dec 2025 20:47:59 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzC8-0000000BEEA-1YU9
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 20:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1765054045;
	bh=/hVPiAB1UhekBVxBQYggXVu9VX3NvkQjJuMtLwWXj/M=;
	h=From:To:Cc:Subject:Date:From;
	b=bySTcO7E+iV+2lsZfaGng0ngnuaPFQndvR9zQfJ87eh3Q1ObOxvkSy3kwLPDzDQTW
	 FtswZBfn2B01TPDCht7gyUIo3jR11EyNoIc06xj3/hvI5HEMsni/uoitMgUVO7mMP8
	 KrI0qI2hbxBWP0LHgEA1KXrOc8Eobzp5vWaLdcGiv6lv71IQydVYCcFQEaAuwbdCPT
	 PUwz5yx6FT9Y9xZN3JDsJXbrVPcradIPr44DXi4GF2FiJdgMgXlxFonFvE1t4pLhWW
	 5TQWeL6Trp+Gm3awOQ0THFgX/SnlUhZrmhRbuHnMxSI3xodwcm9Qoree2/9zOJp9lx
	 iat6e/FYjt3fQ==
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 611C9B220632;
	Sat,  6 Dec 2025 21:47:22 +0100 (CET)
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
Subject: [PATCH v1] riscv: dts: starfive: Append starfive,jh7110 compatible to VisionFive 2 Lite
Date: Sat,  6 Dec 2025 12:45:30 -0800
Message-ID: <20251206204540.112614-1-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_124756_884351_82006A97 
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

Append starfive,jh7110 compatible to VisionFive 2 Lite and VisionFive 2
Lite eMMC in the "least compatible" end of the list. JH7110S on these
boards is the same tape-out as JH7110 however rated for thermal, voltage,
and frequency characteristics for a maximum of 1.25GHz operation.

Link to previous discussion suggesting this change:
https://lore.kernel.org/lkml/1f96a267-f5c6-498e-a2c4-7a47a73ea7e7@canonical.com/

Fixes: 900b32fd601b ("riscv: dts: starfive: Add VisionFive 2 Lite board device tree")
Fixes: ae264ae12442 ("riscv: dts: starfive: Add VisionFive 2 Lite eMMC board device tree")
Suggested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Signed-off-by: E Shattow <e@freeshell.de>
---
 .../dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dts     | 2 +-
 .../boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts
index b96eea4fa7d5..b9913991a1b7 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "StarFive VisionFive 2 Lite";
-	compatible = "starfive,visionfive-2-lite", "starfive,jh7110s";
+	compatible = "starfive,visionfive-2-lite", "starfive,jh7110s", "starfive,jh7110";
 };
 
 &mmc0 {

base-commit: 5e5ea7f61610239fca058011e7d4f342b34d1558
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

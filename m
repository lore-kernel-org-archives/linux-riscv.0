Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B21CD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 16:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bVwjjJb8HGj5EMHFbrgK0grMrcTeFB8VIGBzNqxIh4M=; b=SuL/Q/0TdGjBCI
	/F6uH1reiVsXmAfdqwFIEwZnEFdNFcNLIgCGCr4v/7US+Z0Hv8/lYgBL8095rtJzVjeSXMllhb1q2
	ANebylIOjQCAnD6x9AfGI89wMKX/tXXiMkNbbdoIzb+8Fxsepp7kXSjIzZhUq+tSIJqqkN+BQ1/Lh
	NY71I6IPqmERP/WMEoRLsfeup246n93ETMFOfmB0uc0B24peDXpWRbWLQ7e3sFQuG3kGAxhDskQ/9
	srtU7YzqxEUW85RtFjtHiJMbjKlkykzgYFM+NFQ/SapWJVptxr54Kux4etEKW2d7hR00kPY2HGwe+
	RXR0eAwAnxQelcJjixXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvkg-00000008uw1-2t4t;
	Fri, 15 May 2026 16:51:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvke-00000008uvo-2Bc4
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 16:51:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE49A60098;
	Fri, 15 May 2026 16:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DF7C2BCC7;
	Fri, 15 May 2026 16:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778863863;
	bh=BReUGgHoYTDJh7cSrs/u1F61XWcA/9TtEZBk5WoaNXc=;
	h=From:To:Cc:Subject:Date:From;
	b=bY6tYAilDsW6nxBiun3BUTKPpj3Py8uxttjb0Mevx1dedsXLndxyHn6WOIqgWmitp
	 d8evHBewmLdlzF6aHgUt13fHWMcQuDDd5zojOxZ2Q4YfQNawRgP9x/eH89st45Tcgx
	 gs/2RighS00AW+67HuV+2itB+Cu46Ub6NRW/j0E5zFqiBNT2TsyPGMmDndkM/nOHvf
	 i3mgCeQaxbMkaB3RUxIfSE2sqcysBf06bOR+bwIi5UoJiHCG9xKhLODjcHm5a1rcQE
	 Y+448r7SFhDoQjiRsyGB1XTpZOg5eB3db95ao6wVC2+AIwEinahBuRuy2M5GPvnD4h
	 rcK+iLjIHKHUQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: microchip: remove redudant enabling of syscontroller
Date: Fri, 15 May 2026 17:50:42 +0100
Message-ID: <20260515-fetch-antennae-2eba5bf45593@spud>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4396; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=+j3Q+HJOMszU63lc/mKAVJp2ABWAuiZDnQ2FzIBLAgE=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFnsfo9Y/lRs1ZtZNpszsmHKs7BLO7b+WFn0MMTotOSn6 +vfK3n1dZSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAin84z/OEROXSuaVaoANvT t04OfBJcFYVz7yx7k6pn1M0cvmRjqhvD/5T1bTssl5d+qnZcvTwyZ7HQVvlfG3ZeDDp1UFAky07 8OQcA
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

The system controller is never disabled, there's no need to ever enable
it.

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
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts       | 1 -
 arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts          | 4 ----
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi | 4 ----
 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts         | 4 ----
 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts         | 4 ----
 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts            | 4 ----
 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts            | 4 ----
 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts   | 4 ----
 8 files changed, 29 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
index 7bbd400b71039..6d7037c9528dd 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
@@ -328,7 +328,6 @@ mmc@1 {
 
 &syscontroller {
 	microchip,bitstream-flash = <&sys_ctrl_flash>;
-	status = "okay";
 };
 
 &syscontroller_qspi {
diff --git a/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
index f769c9d5d7b47..da2fcde263e3c 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
@@ -199,7 +199,3 @@ &spi0 {
 &spi1 {
 	status = "okay";
 };
-
-&syscontroller {
-	status = "okay";
-};
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
index 7816408343a32..a11e3103b8f25 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
@@ -238,10 +238,6 @@ &spi1 {
 	status = "okay";
 };
 
-&syscontroller {
-	status = "okay";
-};
-
 &syscontroller_qspi {
 	/*
 	 * The flash *is* there, but Icicle kits that have engineering sample
diff --git a/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts b/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
index 86234968df486..973e34b74be44 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
@@ -179,10 +179,6 @@ &spi1 {
 	status = "okay";
 };
 
-&syscontroller {
-	status = "okay";
-};
-
 &usb {
 	status = "okay";
 	dr_mode = "host";
diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
index 510d59153cd07..cad0871a62a5d 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
@@ -112,7 +112,3 @@ &refclk {
 &rtc {
 	status = "okay";
 };
-
-&syscontroller {
-	status = "okay";
-};
diff --git a/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts
index 8f1908a105671..46ded8a4fc363 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts
@@ -149,10 +149,6 @@ &rtc {
 	status = "okay";
 };
 
-&syscontroller {
-	status = "okay";
-};
-
 &usb {
 	status = "okay";
 	dr_mode = "otg";
diff --git a/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
index bc15530a2979b..c6950410e918a 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
@@ -171,10 +171,6 @@ flash@0 {
 	};
 };
 
-&syscontroller {
-	status = "okay";
-};
-
 &usb {
 	status = "okay";
 	dr_mode = "host";
diff --git a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
index ef5bff3093fc3..180fd8891903c 100644
--- a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
+++ b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
@@ -170,7 +170,3 @@ &refclk {
 &rtc {
 	status = "okay";
 };
-
-&syscontroller {
-	status = "okay";
-};
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

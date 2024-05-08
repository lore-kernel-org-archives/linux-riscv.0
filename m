Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CB5C25B5F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 10:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q3lxovYyquC3UaXDxMjAFe/RI+LzeIrV0lJnZpKRGCQ=; b=1KikZej25A5v3q
	HDUaC+HfhVBRoJo64v9FiyeCFII81Zj5aUql6QQlkP9Dvk9rxRKMALJcbox5eWW5To5cfQ1wIao3/
	JAE7MwXmPGDoUIPua4vNj0zwZoxFTfVgBntN1nA3dZzcU+j3ueXmglJiy1WskCo4apBX2+GhpqNAE
	EHoslchgPu/45TQajH/m3h0i5PliuNXss06mSgAXTJHwuUqNGFtCf8oH1xZSvwRNpKNWYEr7Cd5AT
	u7krPq5h6wBDzzEcJOsowH8DGjWgzQgvCbaXGv17a6y+voNFccXNmaX8YzO/6oEW3P7c1VWF19/dH
	WOQEhTjtSZoufGYaDqaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4eQL-0000000ExOx-0dXM;
	Wed, 08 May 2024 10:21:21 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4eQI-0000000ExN2-2peV
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 10:21:20 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:985a:f2a2:ae2e:5981])
	by albert.telenet-ops.be with bizsmtp
	id LaMB2C002241EGo06aMB10; Wed, 08 May 2024 12:21:11 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s4ePO-00EEy4-M9;
	Wed, 08 May 2024 12:21:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s4eQA-00HAy2-SF;
	Wed, 08 May 2024 12:21:10 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] riscv: dts: canaan: Clean up serial aliases
Date: Wed,  8 May 2024 12:20:57 +0200
Message-Id: <ac93f18200c5e3f878907084a7c660ee60591db2.1715163174.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715163174.git.geert+renesas@glider.be>
References: <cover.1715163174.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_032118_900425_AC95EC77 
X-CRM114-Status: GOOD (  11.03  )
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

The SoC-specific k210.dtsi declares aliases for all four serial ports.
However, none of the board-specific DTS files configure pin control for
any but the first serial port, so the last three ports are not usable.

Move the aliases node from the SoC-specific k210.dtsi to the
board-specific DTS files, as these are really board-specific, and retain
the sole port that is usable.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/riscv/boot/dts/canaan/canaan_kd233.dts     | 4 ++++
 arch/riscv/boot/dts/canaan/k210.dtsi            | 7 -------
 arch/riscv/boot/dts/canaan/k210_generic.dts     | 4 ++++
 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts  | 4 ++++
 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts | 4 ++++
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts   | 4 ++++
 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts | 4 ++++
 7 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
index 8df4cf3656f2c932..8cbef8daaec1097b 100644
--- a/arch/riscv/boot/dts/canaan/canaan_kd233.dts
+++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
@@ -15,6 +15,10 @@ / {
 	model = "Kendryte KD233";
 	compatible = "canaan,kendryte-kd233", "canaan,kendryte-k210";
 
+	aliases {
+		serial0 = &uarths0;
+	};
+
 	chosen {
 		bootargs = "earlycon console=ttySIF0";
 		stdout-path = "serial0:115200n8";
diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index f87c5164d9cf658d..febdff79c13cc5fc 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -16,13 +16,6 @@ / {
 	#size-cells = <1>;
 	compatible = "canaan,kendryte-k210";
 
-	aliases {
-		serial0 = &uarths0;
-		serial1 = &uart1;
-		serial2 = &uart2;
-		serial3 = &uart3;
-	};
-
 	/*
 	 * The K210 has an sv39 MMU following the privileged specification v1.9.
 	 * Since this is a non-ratified draft specification, the kernel does not
diff --git a/arch/riscv/boot/dts/canaan/k210_generic.dts b/arch/riscv/boot/dts/canaan/k210_generic.dts
index 396c8ca4d24db79a..36b4ba9cc556bc3f 100644
--- a/arch/riscv/boot/dts/canaan/k210_generic.dts
+++ b/arch/riscv/boot/dts/canaan/k210_generic.dts
@@ -15,6 +15,10 @@ / {
 	model = "Kendryte K210 generic";
 	compatible = "canaan,kendryte-k210";
 
+	aliases {
+		serial0 = &uarths0;
+	};
+
 	chosen {
 		bootargs = "earlycon console=ttySIF0";
 		stdout-path = "serial0:115200n8";
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
index 6d25bf07481a6ed8..e5a77672fc65bc47 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
@@ -17,6 +17,10 @@ / {
 	compatible = "sipeed,maix-bit", "sipeed,maix-bitm",
 		     "canaan,kendryte-k210";
 
+	aliases {
+		serial0 = &uarths0;
+	};
+
 	chosen {
 		bootargs = "earlycon console=ttySIF0";
 		stdout-path = "serial0:115200n8";
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
index f4f4d8d5e8b88cad..04c2bf227b1c69ad 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
@@ -17,6 +17,10 @@ / {
 	compatible = "sipeed,maix-dock-m1", "sipeed,maix-dock-m1w",
 		     "canaan,kendryte-k210";
 
+	aliases {
+		serial0 = &uarths0;
+	};
+
 	chosen {
 		bootargs = "earlycon console=ttySIF0";
 		stdout-path = "serial0:115200n8";
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
index 0d86df47e1ed3987..f9f6cc136bc3d98a 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
@@ -16,6 +16,10 @@ / {
 	model = "SiPeed MAIX GO";
 	compatible = "sipeed,maix-go", "canaan,kendryte-k210";
 
+	aliases {
+		serial0 = &uarths0;
+	};
+
 	chosen {
 		bootargs = "earlycon console=ttySIF0";
 		stdout-path = "serial0:115200n8";
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
index 5c05c498e2b88bf4..e90188bfb70bd8a4 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
@@ -15,6 +15,10 @@ / {
 	model = "SiPeed MAIXDUINO";
 	compatible = "sipeed,maixduino", "canaan,kendryte-k210";
 
+	aliases {
+		serial0 = &uarths0;
+	};
+
 	chosen {
 		bootargs = "earlycon console=ttySIF0";
 		stdout-path = "serial0:115200n8";
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

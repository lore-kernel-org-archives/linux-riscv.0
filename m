Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C13EC5B572
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 07:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6TRXgyCGGpgDjZQtHu+xpgsw1vYxtqsc5Dsn/ZmSqSc=; b=lMn1ZHrnzjpTjD
	i9Dz6edaF+KcyrJ5tEfGOZbtS5t6Ln7qqkYP4dY2PeyJvMOgd/UufL9fnfT3PDjxHTZ1cz4/aAoq/
	X+JH8E9+PpoLjCqtK+d/wPm5rAa+s+rM7X52tbH1BI4Bp0A2Lhn5WoLerTEzF+1Yzm/bSSc/fEdjp
	fgi6zrqdlPr4TbpEMcEl2GENfEihQUF8DqyX0+uoP6Vwh6/nEdGFT9E6MtFxAww00qQrfbz8A9ina
	jbxrgh/W5zKFpvvUki3GLNfpJN1cDuMCsjzN94WmtoTPD6tMiUccx0Z7uS3569QjC9Vz0qei/TXNl
	hjVs4uhk1tG4bJb+O8FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wultt-000000024J8-2eUN;
	Fri, 14 Aug 2026 07:00:21 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wultp-000000024Gp-0OE8
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 07:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=1887; q=dns/txt;
  s=NAESA-Selector1; t=1786690817; x=1818226817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ShnbVuSJnvDO1yDDDt1DyIbRfQh4el11rwFcGN8Hw/E=;
  b=bD06F5bFAZQ2Hlmeaey2qqxYOMBMaEQr9IYRRBSXinnCMX8JSG4GjopF
   sMut6FeXDJmVzdvtVZSeqJh1r22CVF2KXp91WXY5wNhgVrAuEc3AIxpDE
   xEHU1fPsoCssPXnxt+J/l2ajiWNQhQKuDfIvRpJCDGQwyBctn8rYfMeFO
   OASRx5kvjAbcio83p3JH7o9SvRBEQkazFy3KoyidbOh4HW+1Aq1kSbdBL
   d2Rta2Jr1pmIs9aFPCOj01Qm0IzkvTDvONivxh6OEwweIZCB506HMLqNj
   26k/RAk2wwi+FOjRfYXROKDNdz9W3MePAF6ObZ3MhX1nSqcKXB4EpLmM3
   A==;
X-CSE-ConnectionGUID: ZxbC9qbLTwOr/IZRrkcbWQ==
X-CSE-MsgGUID: JKUzBGSSRvabiGpJqeI6Xw==
X-IronPort-AV: E=Sophos;i="6.25,222,1779170400"; 
   d="scan'208";a="60479720"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 14 Aug 2026 01:00:10 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Fri, 14 Aug 2026 12:30:07 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH v4 2/7] riscv: dts: eswin: add clock generator for EIC7700 SoC
Date: Fri, 14 Aug 2026 12:30:02 +0530
Message-Id: <20260814070007.1662455-3-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
References: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 14 Aug 2026 07:00:07.0599 (UTC) FILETIME=[8A591BF0:01DD2BBA]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_000017_341543_ECE85A90 
X-CRM114-Status: UNSURE (   7.79  )
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

From: Pritesh Patel <pritesh.patel@einfochips.com>

Add clock generator node for EIC7700 SoC.
HiFive Premier P550 boards have 24MHz crystal oscillator to provide
the input clock.

Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 .../boot/dts/eswin/eic7700-hifive-premier-p550.dts  |  5 +++++
 arch/riscv/boot/dts/eswin/eic7700.dtsi              | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
index 131ed1fc6b2e..a5c76b14a38f 100644
--- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
+++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
@@ -20,6 +20,11 @@ chosen {
 	};
 };
 
+&osc {
+	clock-frequency = <24000000>;
+	clock-output-names = "osc_24m";
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index 430a210f01e6..b3a230870315 100644
--- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -4,6 +4,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/clock/eswin,eic7700-clock.h>
 #include <dt-bindings/reset/eswin,eic7700-reset.h>
 
 / {
@@ -203,6 +204,11 @@ pmu {
 				<0x00000000 0x0000000f 0xfffffffc 0x000000ff 0x00000078>;
 	};
 
+	osc: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		ranges;
@@ -343,6 +349,13 @@ gpioD: gpio-port@3 {
 			};
 		};
 
+		clk: clock-controller@51828000 {
+			compatible = "eswin,eic7700-clock";
+			reg = <0x0 0x51828000 0x0 0x300>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
 		reset: reset-controller@51828300 {
 			compatible = "eswin,eic7700-reset";
 			reg = <0x0 0x51828300 0x0 0x200>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

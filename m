Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6ECFC5927
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 11:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzFfmZ88XAMIfu5kxlMWgJh41NrDlXhH+ZbijgVGsjY=; b=wCplM0NUcPlOaT
	UkaL7eCgOsS9zOE7MnMczQ8jXgfp8ZSUxytu6I3wJsZ6T0DXszZkNpqLrvbSGFdCSD9wvAK0xa+/3
	8cjuKefjA3IueWixWF8aq2LerAiKHYELX1wiyetenvBdWK++BImv/34xBIZFH1sefwqdi0yS4arnr
	g46ZSA7Y2yvLwKateh789YfEgWTuPZYQxkBjAUhYSE0m/RVHPSOR/+sKlNfrXBDNfoOWQcTu42iue
	LM5w2oes1ZOCLKmeOCTE5+YdmpkGcOb/0pXd4tiHUYpaP4qRJ33trRqoAcMJpOonyy6+x1o6X01rM
	AMRHgadj2Qac0tmwzZjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZ9p-00000005ypE-44d7;
	Thu, 26 Feb 2026 11:03:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZ9n-00000005yni-0CLj
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 11:03:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E43F44473;
	Thu, 26 Feb 2026 11:03:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC173C19422;
	Thu, 26 Feb 2026 11:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772103826;
	bh=phQfqbyabbOdNqjOuj7NK2iAIoyPl/OhSuvCTIyQ0qo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V4MlhLGiCDU2UEPxMRw+USykYsQpETX9z3k+qEG+CJYRUewxa4mpJjOC3lfBFo8xH
	 5GdmM2pBxpu/V6i+UBEm62Ss7zBNtEVQwZReO9jjGPohBD5teUZf9nJ9IC2N/JCVQ5
	 aeZ7X9T5axbqW6KKE3DeqHlUwjn5KdPD7H2L/CXj/yZysEd2KXNbJ5HqgppQi3Omdp
	 iHrVvIERFvshZPz3kyvey1xBznsFW3TdA7L8Cy6dP3YIOoJzjBD/gz20RHLGE1crC4
	 n7Qn8ly8+vD5muNoNL6BAYAPo/nZVjrnZiwk3Fow6UfCfE+4EVcboWzXF1K6zv4piM
	 ukjFxiTBMfHVw==
From: Conor Dooley <conor@kernel.org>
To: netdev@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Neil Armstrong <narmstrong@baylibre.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH net-next v2 1/8] riscv: dts: microchip: add tsu clock to macb on mpfs
Date: Thu, 26 Feb 2026 11:03:16 +0000
Message-ID: <20260226-briskly-severity-69c2988e8dc8@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260226-snowshoe-amusable-6716d4ddea11@spud>
References: <20260226-snowshoe-amusable-6716d4ddea11@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3466; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=YBmcAd9qnWn/x3Gu0jOv29xyhvfqaOmflkLzzges9dc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkLNMoY0jNXFK98wBMobtnKtZbpHcfT4Ps15x/z7VzIE VIcM/9jRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDaEi1MAJhL2lOG/J3uF6xe+cON/yXdW 6M3efKrhtpzlfQ1Z4ak2J20nZHL0M/wV37Q3YGvYDbcnCS1hUdx+h4U/HtZdcm3qufilChtW7br OBwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_030347_126596_4A773AB1 
X-CRM114-Status: GOOD (  12.89  )
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

In increment mode, the tsu clock for the macb is provided separately to
the pck, usually the same clock as the reference to the rtc provided by
an off-chip oscillator. pclk is 150 MHz typically, and the reference is
either 100 MHz or 125 MHz, so having the tsu clock is required for
correct rate selection.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/Makefile.orig | 26 +++++++++++++++++++++
 arch/riscv/boot/dts/microchip/mpfs.dtsi     |  8 +++----
 2 files changed, 30 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/Makefile.orig

diff --git a/arch/riscv/boot/dts/microchip/Makefile.orig b/arch/riscv/boot/dts/microchip/Makefile.orig
new file mode 100644
index 0000000000000..e94f4096fd401
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/Makefile.orig
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0
+<<<<<<< HEAD
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-beaglev-fire.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-disco-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-icicle-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-icicle-kit-prod.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-m100pfsevp.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-polarberry.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-sev-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-tysom-m.dtb
+||||||| constructed fake ancestor
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-beaglev-fire.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-icicle-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-m100pfsevp.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-polarberry.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-sev-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-tysom-m.dtb
+=======
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-beaglev-fire.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-icicle-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-m100pfsevp.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-polarberry.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-sev-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-tysom-m.dtb
+>>>>>>> riscv: dts: microchip: remove POLARFIRE mention in Makefile
+dtb-$(CONFIG_ARCH_MICROCHIP) += pic64gx-curiosity-kit.dtb
diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 5c2963e269b83..ccd7c2e4724f4 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -448,8 +448,8 @@ mac0: ethernet@20110000 {
 			interrupt-parent = <&plic>;
 			interrupts = <64>, <65>, <66>, <67>, <68>, <69>;
 			local-mac-address = [00 00 00 00 00 00];
-			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
-			clock-names = "pclk", "hclk";
+			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>, <&refclk>;
+			clock-names = "pclk", "hclk", "tsu_clk";
 			resets = <&mss_top_sysreg CLK_MAC0>;
 			status = "disabled";
 		};
@@ -462,8 +462,8 @@ mac1: ethernet@20112000 {
 			interrupt-parent = <&plic>;
 			interrupts = <70>, <71>, <72>, <73>, <74>, <75>;
 			local-mac-address = [00 00 00 00 00 00];
-			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>;
-			clock-names = "pclk", "hclk";
+			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>, <&refclk>;
+			clock-names = "pclk", "hclk", "tsu_clk";
 			resets = <&mss_top_sysreg CLK_MAC1>;
 			status = "disabled";
 		};
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

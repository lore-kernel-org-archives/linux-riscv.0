Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4A7606A331
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 08:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=egGTHaMW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=FsenHpfD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:Mime-Version:Date:To:
	In-Reply-To:Subject:From:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M75BYB5L0sYSYTNIhLW3uGLRmwRrtA5MC37EEp7giy8=; b=egGTHaMWbMJNQ4ZwkOb/Q1+KKe
	zrJdBWvPHfd+RgwKZMm6dHFzw04kNjAdsCO+EH7TojT+XG/CbY89ipwIYEht917CKNriuueebHg2y
	qwhorZw3oYYptvMuMwtTNa0Pi7R97coApPiSG0bwoJhyekRY3pZPM531VBSU0JOwgbTcDk/GWJCP9
	Dlkfp6K4aeFq42CD4DL3rM9xPSsmd9y4fvVe9TvYOzQrSAs+sKTFBKTXBcD/Rf8gkVOZ213gS1J4i
	OBMiN4N3u4by+9AmSw3vqRDhK0dLQUw5sGfHzMawGs6bdvjsLlsaVquiH8virbU5cxURfKIZPKRS9
	Tog+WgKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUm-00000008Fom-1DGg;
	Wed, 18 Nov 2026 08:58:24 +0000
Received: from va-2-50.ptr.blmpb.com ([209.127.231.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUj-00000008FmG-3TZF
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 08:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992296;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=sveQCqM0T8TQXebLs1ee5J0Akp/eUy4wpp9ckOQs5CU=;
 b=FsenHpfDmPTX/Bv1PN4d8ayLPq6yaQTPA+iE+hEfIVLCTvRCgNYa5LUBuuY2vaDcnHI0gJ
 GV1+cjVdoztYQdtEPb25qV7xfLKHvHsa+gaEERlaTA/bOVzhC4hn1a1rPnNGShnpAHwdZm
 5e+2Qxq3cRg6sLbkZX5vGnOWoz//Sdmy3Gtij7ujVc+5uChLpx7fVVUU9LuzHqfCtVNl3+
 DC+sGKHKLBptjpexEYiXVwV0uwwO9CqsPv6k1DnXNyJ1EqmJi+TXpu+/7ycTUP/88mQc0E
 azlPrY0qhUSJia6nkyLsZ5+/ZznzE29+a65v+IuT62di8c6ljAJcQ2zUDQ/sfg==
Message-Id: <20261118085742.1817536-8-yang.wang@deepcomputing.io>
X-Lms-Return-Path: <lba+26afd68a6+52366a+lists.infradead.org+yang.wang@deepcomputing.io>
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:58:13 +0800
From: "Wang Yang" <yang.wang@deepcomputing.io>
Subject: [PATCH 7/9] riscv: dts: spacemit: Describe the K3 eSPI controller
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
Date: Wed, 18 Nov 2026 16:57:40 +0800
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_005821_944566_E66D13DF 
X-CRM114-Status: UNSURE (   4.96  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the disabled eSPI controller with its memory window, clock and reset
connections. Keep the board-specific EC child out of the common SoC
description. Other K3 boards remain disabled by default.

Prepared with Codex assistance from the existing DC-linux EC support.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5c..d859c84bb 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -648,6 +648,37 @@ gmac1_axi_setup: stmmac-axi-config {
 			};
 		};
 
+		espi0: espi@cac8c000 {
+			compatible = "spacemit,k3-espi";
+			reg = <0x0 0xcac8c000 0x0 0x1000>;
+			ranges = <0x0 0x0 0x84000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			pr-mem-base0 = <0x84000000>;
+			pr-mem-base1 = <0xcac8c000>;
+			clocks = <&syscon_apmu CLK_APMU_ESPI_SCLK_SRC>,
+				 <&syscon_apmu CLK_APMU_ESPI_SCLK>,
+				 <&syscon_apmu CLK_APMU_ESPI_MCLK>;
+			clock-names = "sclk_src", "sclk", "mclk";
+			resets = <&syscon_apmu RESET_APMU_ESPI_MCLK>,
+				 <&syscon_apmu RESET_APMU_ESPI_SCLK>;
+			assigned-clocks = <&syscon_apmu CLK_APMU_ESPI_SCLK>;
+			assigned-clock-parents = <&syscon_apmu CLK_APMU_ESPI_SCLK_SRC>;
+			operating-frequency = <20>;
+			io-mode = "single";
+			alert-mode = "io1";
+			alert-type = "open-drain";
+			watchdog-timeout = <0xffff>;
+			crc-enable;
+			auto-gating-enable;
+			peripheral-channel-enable;
+			vwire-channel-enable;
+			oob-channel-enable;
+			flash-channel-enable;
+
+			status = "disabled";
+		};
+
 		eth2: ethernet@cac8e000 {
 			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
 			reg = <0x0 0xcac8e000 0x0 0x2000>;
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

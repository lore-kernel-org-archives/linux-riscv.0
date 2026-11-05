Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C32606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J/bxj6YI;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=tA73fOh+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vTwd+XUDMNqMOqleHY00oe3cMDCXjlxAuJG6kJtehic=; b=J/bxj6YI6tiwhjaT953uwBRMZG
	6m0uZmmN1zH3U00raD9poPgWuEqMhdSFhxdqj4TrlNp33+twT0r6kq4zGicyqzYKMLdx7PdXslhYm
	TOVDOtWCh+q4Qcc1cQjsXUd7jRGplc3MSwBqu2XGlXdqJ6gSCsSTnIP7p47+WY6VPEn7ZtR6tKOhz
	SE/m55HErPujQr3Ki49CAzEdzoQq8b6hz3N6Bu+XcQCbOs+b6SSPWNzSMc2qNNk2XhnYqEnnC/dIi
	qS3CGZMyH2g4jMQVf6pvMWhhImKPfPC/SMjDn2qvYkhY0OHGRhsmNd6RAT93zsFlhBlcKyA3zhYNj
	j/pWZTbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOss1-00000008A4e-3ZUW;
	Thu, 05 Nov 2026 08:30:53 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsrt-000000089y2-0FcE
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 08:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867380;
	bh=HpKrwB9rCAuUJd/mdqKwOdrJ24+UX+4D0BCjQpCzHeo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=tA73fOh+1U5PUysM9nOa2S6hyY4QI66V+RkHQoOhlU7D+scv4u6zLAjoKaZR62JmJ
	 qzLDDsXsKR4JhwAD5sO2tw2H29IIjWR5LecjtZUXgrABicge02oHyhnAGPJLGfoJDn
	 KtvzUV2vR/BO6k55LWyZ4Q9Y6t2i/ppfaVC8trDo=
X-QQ-mid: zesmtpgz1t1793867378t0c8c3d9b
X-QQ-Originating-IP: RX1adP727/U1jyvgtCrXrR1MW19ffD4TGAPRM99bsf4=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:29:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11866058336167670261
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:29:27 +0000
Subject: [PATCH 2/2] riscv: dts: spacemit: Add K3 CoM260 IFX TQ support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-k3-tq-dts-based-on-com260-v1-2-aa0b7714aed0@linux.spacemit.com>
References: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
In-Reply-To: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2339;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=+Ys6xDTlkWYC2lhqTf399k5bJBFMMlgJMp/BntR0DlM=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlv7NI+1jZsPftm1WLPg/Ehq+5emG48dXe9g/68B8yBG
 ecVo4RdOkpZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACaSuInhv2t1wtyq6A8OK6ee
 te2851NZ9i/zybXUplcrn7WrL57H18/IcJD3gOT7t32NK/Zq3tdZ5fSGr+iBfIB5540S/9ZlUmJ
 ODAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MpkHnaaty8/1ZKTrmYba56RYANDSeaa0RuUvra6ZNBs5OXkHVviDdkal
	h/BB7UG4S9XwBZPoEzZoukFlhqBQwd3ZtQrlqoVJftv/WuozjTtmwwokwcLgTbFJLSixsRB
	sg8jf6pbOnPyfb0VY4ThH37eVbk0QnUUymQhTEu68FRUP/3tsRfh69rJF899sU3x+KLASKZ
	QSuut/aP/Lc8gRHWm895WXSOBu0fWeYLi0jLNDbokNUs6sxvbJCGPg5b9KxCsPLQeYn9Jx/
	8cR5twGbftmiu3WoUu2pP2yfZNS2NJa4NSNgt/KEt7QKv9qDBhMhOXgyQJrVPNYyYtEZynP
	1v/AuOYX40gR6dP5nCTJgmtt9/C1mdKYX/ldb1JXUJhNdWXc7vrMqcVcrU4h12U4YFcDYVz
	SpTsRfzIGclrcvZiV+B98YVzVyBJLXRdCjiTUBrNir5wY33Ayxs3r2FUnFNmboAV+42283j
	VL4Ep1ZDhfTSL5LlgOwzl8mghAxTJ434VTkqYN1OWDNiK7drP4XPYkfy5h4eJ06ZpKAyVa1
	Y30xscAswPfSM02bp0C95aS2JmQ1AlI8TmF7wsDNoVKJvSMasmUns2uWwECg5oNre1JjmYk
	k2Kt0ndnwLfF9nGNeD53eoyEvAbSEuMn4L1ZiFkXOI2MGPjDMynPENQ/yUYe5SH7kxG1r4b
	TGX2R03q7mg63dEWJ7vtVAMIYkK0IoynFPyXAuhSbM+PqOtFi5VFoq9U0djiUszcXRcro3Y
	NYvvnDHie4b93yLydsJa7KLdmxPsD4uHun9WeFcqdKW2ZZFourktFcZQvnctN9J2SwHExbn
	KFpbi+5zlHhG/jtxTjyk2Nzh1zYrD3vcccKIxiPSEHglNPv+e9K96bLQVd8q+fSRsG81p2h
	+8e7w0cbNlpTrG57hj8IvdLDiBAywoc+8AYHmW+CRvDgfNKfLmgOK6v4fkvI//DW5am5WX8
	nAvUT3dI+qB8V9sZdm+fcXQ+u0+XUn1vG8prl3rxdhzmcSHW0zEWVrac05kkn+sUtlEth14
	LWZFzuRcjVrxgC18K+207LAntwpXlhNb+WB+68CwrpiA+ygkk/fPLPcQE3IdkknO+b1haD6
	Z2QYvkcxsFEiZZMvP5I9vcSmJvVeuIe4h7LnjJ9q2Wh1TQpCIfzptqFP+xQUZ20GvO7F4pu
	VZCvXXU3ydKvvytkPz2aRLd6uWONpQUrjci5OtOcM4lwdBo=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_003047_925633_6ADC15E5 
X-CRM114-Status: GOOD (  10.67  )
X-Spam-Score: -2.1 (--)
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a device tree for the K3 CoM260 IFX TQ board. It reuses the CoM260
module description for the UART console, Ethernet, module EEPROM and
PMIC.

Describe the carrier's green and yellow Ethernet PHY LEDs while keeping
their existing hardware state. Enable ALDPS power saving on the
RTL8211F PHY and disable its unused CLKOUT output.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/Makefile             |  1 +
 arch/riscv/boot/dts/spacemit/k3-com260-ifx-tq.dts | 44 +++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 851b701e5da4..fe664f84e1dd 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -6,5 +6,6 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-com260-ifx.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-com260-ifx-tq.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx-tq.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx-tq.dts
new file mode 100644
index 000000000000..6d9b2dbd825d
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx-tq.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd */
+
+#include <dt-bindings/leds/common.h>
+
+#include "k3-com260.dtsi"
+
+/ {
+	model = "SpacemiT K3 CoM260 IFX TQ";
+	compatible = "spacemit,k3-com260-ifx-tq", "spacemit,k3-com260", "spacemit,k3";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet0 = &eth1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&phy1 {
+	realtek,aldps-enable;
+	realtek,clkout-disable;
+
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			function = LED_FUNCTION_LAN;
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "keep";
+		};
+
+		led@2 {
+			reg = <2>;
+			function = LED_FUNCTION_LAN;
+			color = <LED_COLOR_ID_YELLOW>;
+			default-state = "keep";
+		};
+	};
+};

-- 
2.56.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

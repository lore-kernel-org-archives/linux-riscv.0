Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE078606A338
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 08:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3k5TafeN;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=YQ7rADGQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lFsHYoET6OAj4KOJ7uFXTWgge/oM0iEl7qisREGlXpI=; b=3k5TafeNMBcGE/DZITwNQM3fDr
	j2AN0W6Xh42Z+J6sfFyYH7aeXN9DAuoY+V2EbQlm6vxcyscOI3r+Ra8myWpnnoIRMXeAzOyGKIN6j
	Mhb0BQa6uIl0h7TCIgEeVugYAGmQhfzOeTWdoxSMgqru4l1vP5W0xXWptER9f/R5ziJ0gJaxX06A1
	NQjtxdo/bh7IvfA1FBR9pGeCpMhAfKfXuz5XeBuZ0EBG76USSDwl+HHPPEOf0k01xPgdL327+FnOS
	QYf7NrHYOzwC8NM8kF1W5uN10rCdwT+QGp6SOn9AGXA5llzt6/dxzXlVvCU2oiA6CGNn367CUgOHD
	xakBh3Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEt8-00000004xTC-0SmL;
	Tue, 17 Nov 2026 08:50:02 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEt4-00000004xR8-105X
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 08:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794905347;
	bh=wU4xhqWl4USAlYADvxoZPgburqO26mwdbOZt/lIipRQ=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=YQ7rADGQqe1gY6WktryEXcwnYlsrUOpqdRVUUe00A8ObW7QGpgKDJfUtNZjqFVijh
	 OW1zAHDcYKfdihXLPd3KY0VxeCsT1tv4/ETJiDvCsOUsQL9qCFZrZiyvKky54i+EOZ
	 +N0TD+q8iyZbAHvBPbe0bvM72TzvIZfUiMOffMW4=
X-QQ-mid: esmtpsz16t1794905345t39b49035
X-QQ-Originating-IP: 8i72p43sCJOlZh+xmUN2PACtZiedRJUMSKKHKChrVCg=
Received: from = ( [183.48.247.191])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 16:49:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3412498541306828585
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 17 Nov 2026 08:48:52 +0000
Subject: [PATCH v2 2/2] riscv: dts: spacemit: Add K3 CoM260 TQ support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-k3-tq-dts-based-on-com260-v2-2-68b337bd8938@linux.spacemit.com>
References: <20261117-k3-tq-dts-based-on-com260-v2-0-68b337bd8938@linux.spacemit.com>
In-Reply-To: <20261117-k3-tq-dts-based-on-com260-v2-0-68b337bd8938@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2698;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=dIRJzVDA8Y7pxPhVjGCYcpGvvNVKuQnpBBe7ZGfT2hM=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFl/RL6FGigeUDT49KTO6c1ar76Tx6/oidRVvJdQ3Wi1S
 HL3//XzOkpZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACaicYeR4cETg/3vezneNGrL
 8UtI/lSOCV149n7g95U2Vw9t2W8rrsXwP76j827YvJZqiU2t+24fbYjQzdS70KLPqb6/657Yb6W
 XbAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M3uTjkO5QXGxKB9lctX0W8V9g4v2SH76LJinG/vk1nCqbv3to1NYt9r1
	mQVykDAsgDEe8zU3uQ3wMfnqNuofSFz3WIFJHlIQfdD+YtCxVFX75cBT75pnRs9lcUS/J//
	i0aZd9ECMh5OQtkhD9MD2/WkKw5/kECzQpvxzY/inaiHmJKj/FtMIVe6S3KW0pvwtpq2WW+
	ScVrMaOEAZX2Haeo93boxvIzic45KsjHafUeqBOpyA4xRQdBY9NAnYY02kseXj3lWnXMP22
	OBM35nMkBaVa1BUzQNl6FRchWW8VCUBx+Owys70w05ZoCiBe6CP9oOBsiW+n3nxz5xJ4V0q
	FiYMThNa2VBv5LD/b86xazZDMhZuTKYRJdHkDy96LsDMjLEGuL8hmHHDs+btiSTfyc7wI5E
	N8hYSTWdc6nEnqEuolOUws1PzgXq5ZJsYqT0VvXeU5TzN7H6VrJuzR1ZkVOH+B37nom1CY+
	0jIALLlNgeybRwprtzNMBUHT/pKuBwOLqQmN8ijVqBO2yGKkbd2mxGWW49g4DmEoEF/bJyF
	cucPbr1louSqnzTvowL2E/O7T0umaYPAFcuVCG/qAV4B/o/RtVpYQtKKtyPRn516s99zABj
	PwasTxjVQWU5EXL1BV/W+pwJVuDyoJJR+LIfJrkQmHOUnCAb40YdDPZGIDAkLse7GibK12Y
	4qtiO82/VLa0f1ZhRUC77AkBsoeKxmjv5umUxpbn/9lIJ90AY/GGqgOrX82ila7soQVlzaG
	3bVLu/jCofV8WD6ummMqs/UdbTWYI6swIUUwKjSabfs9V70vVUZfps52gJt2Cg6y8M8oH9D
	ueZ+27LGnXu/3TFd/rJaOugvgaqpi0YF6uWJ1NeiwGAzd/jgrA/Oy9uL/A2Nm34Gur8kZos
	tv2C/QjCDG/G97g+t607CzyY0EqhIjnafiH7d54fxRHyS341nIxci55C3/ao3fVd3S4mRN6
	rrjntpFQPdPw0ZkmbZ03YzqdVAYlbVPLG39j7X6IgxGs++EyMF+3flJxiPrUQJSB2Q5xjQ4
	4grElp9n2PGhZSvDsE2lCjn0cJ8JG/Qg0Irm1ytv/wNM8QXyGNNqGyjutHoGe7cp+iRiBP3
	+psUS6I3GT+BIG+k6es47M4x/1rN5pQ2QpJXnN/9lTOW92yg2Ov86BlgwLzHR9AkrDmTaXS
	/jZK
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_004958_755391_9D14594D 
X-CRM114-Status: GOOD (  12.99  )
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

Add a device tree for the K3 CoM260 TQ board, a K3 CoM260 module on the
TQ carrier board. It reuses the CoM260 module description for the UART
console, Ethernet, module EEPROM and PMIC.

Describe the carrier's green and yellow Ethernet PHY LEDs while keeping
their existing hardware state, and enable ALDPS power saving on the
RTL8211F PHY with its unused CLKOUT output disabled.

The TQ carrier board is built with one of two power schemes for the CPU
clusters. The bootloader programs those regulators and Linux keeps the
voltages it leaves, so this description covers both variants. Once the
regulators are supported, the power schemes can be described as
overlays and applied to this device tree at build time.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 arch/riscv/boot/dts/spacemit/k3-com260-tq.dts | 44 +++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 851b701e5da4..bac9dcb5efe5 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -6,5 +6,6 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-com260-ifx.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-com260-tq.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-tq.dts b/arch/riscv/boot/dts/spacemit/k3-com260-tq.dts
new file mode 100644
index 000000000000..758347f30b3c
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-tq.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd */
+
+#include <dt-bindings/leds/common.h>
+
+#include "k3-com260.dtsi"
+
+/ {
+	model = "SpacemiT K3 CoM260 TQ";
+	compatible = "spacemit,k3-com260-tq", "spacemit,k3-com260", "spacemit,k3";
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC74CD1297
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Nov 2025 22:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZnejRU7lNXljpOGn6zxnYHseXzTlJ5Vi/NE1yaoYwB0=; b=3BzGd+UD7tN7RNOng62Z6RgRxV
	cKsD7JnWD5qHMVmkuhRArPyl4U1np4SIiy6tGlGCjGKxC6ri9LTGmI2ewOjpvEye9zKo8ZWNkVNYh
	tSn3kMq5TDMwYdN6d2DgV3+t1o4+rsC9dEyHgljNM7LKgCbZBLXbl+RLEVtij02VP9UCRYl30A0DA
	TGYwGBjor2V3qTwOYo7wF3pMbrHyaIrMtC8rPhBv8qaDGHBuz0TYdl4ixgauclwviqRYlasoBcVQL
	YDicHLDHC7hZ0zTpcGxLWTai1axlE/w0XTH8j9KPAjLnXN8tYhADfHt6z/qRN+FefbPjHw/sx2oaP
	zC/0Mxlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDvP-00000004RZf-0i0l;
	Sun, 09 Nov 2025 22:30:19 +0000
Received: from panther.cherry.relay.mailchannels.net ([23.83.223.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDvI-00000004RYD-1AAA
	for linux-riscv@lists.infradead.org;
	Sun, 09 Nov 2025 22:30:17 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 858174412CA;
	Sun, 09 Nov 2025 22:30:11 +0000 (UTC)
Received: from fr-int-smtpout22.hostinger.io (100-125-88-217.trex-nlb.outbound.svc.cluster.local [100.125.88.217])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 00F024409AA;
	Sun, 09 Nov 2025 22:30:08 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1762727411; a=rsa-sha256;
	cv=none;
	b=vERM6O1uJw2HUBma6mj6IvUoMiuf2k3tqIbj3BPCMNQBF5yzBKYlLeVwjyeOf4HzC6Obse
	3lT5SrCr+KeMfdf3j/9myvEl4Opa/89dsk+uYrs4xj+vzNEzmier4V8q3DwHDXq5O0R4pB
	XFx9+67asxM/I39dlUDwe1rBwAQ///hA6W546JqFQVB+RIv9kzICUJFTrKgQnrkcToqtRW
	JFRzoiZ/7IxPc37n0gBwiUObveY7nc90DI6PZSLsHV+BpQt75HEcTxf4bBW1QcmJsjR6UU
	XrIuCnmIJt57NwjiIn9zSq1khRczD9SrrERVzT2PrYsUj6csuMbn+eqoi6Xtyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1762727411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=OnzB8tUlNhjuqpRMd3wVZEX5Ft6jleeLFpGIqLlfB1o=;
	b=QDAMKsETD1li04Cu6MO3ybg6csYdAnaMUpS2NRp72YLUqrmK69v4BXnsR2ZezB2dpneXvQ
	9Jbi+pO/nib1DTLXEMuMq4+v5j68EhbzGFFkWlnQIoWZvMj/KTceDxbwyIALRLQyWMaH3q
	IY3nQsc2gOqyvo67lglX7ubsrUpAa4suRrUbbnBscfTsISn/jurt2+0qZ+xhE64D+a9Bp4
	zTW/CmoVY/P3ez7YjrM3kIYUil8yDet4bv0bUPmjDHDMz3jgsAyYwdkXQaxEOaPEy3IFbT
	ppz2Wr4kA229ogTMRLw+CHUrt2A92rg8r+k/hRsCN+pnCs3D9lT0kkCDlw1vxA==
ARC-Authentication-Results: i=1;
	rspamd-768b565cdb-p8cmr;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Wiry-Society: 33d38cbd3de99961_1762727411368_582066256
X-MC-Loop-Signature: 1762727411368:2521275184
X-MC-Ingress-Time: 1762727411368
Received: from fr-int-smtpout22.hostinger.io (fr-int-smtpout22.hostinger.io
 [148.222.54.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.125.88.217 (trex/7.1.3);
	Sun, 09 Nov 2025 22:30:11 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:6854:e5c6:92e9:8517])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d4SCy692TzyVc;
	Sun,  9 Nov 2025 22:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1762727407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OnzB8tUlNhjuqpRMd3wVZEX5Ft6jleeLFpGIqLlfB1o=;
	b=TRX8SMUHf+neB30GgnK0On3y9srRGxDViHTm/KGzb/W/Xx1CdQzxBp4YxAc1ucU6gcwrOB
	KpOh7FFG69y8asb9IQ+VK1p5yGm2RaOOMJG7oId3ZzoA8p30ur6+zFiRFtGM+eO0n4k+rL
	PyuJfiJ73SgkkbWLYV/oOki3ntswdWw0tW003dKnAv+Z56ktnBfdbSXsjqiwFqX1iB85k/
	XDUNG3hey4C6PSmpKJ203/vfCu9IXvrNUmkzQeTimSt05hoSsqAWibYqrzzJcvmQU4pYSv
	L+D8SQZLvgR7XdHpYto2ejVnOHzsG/ivnNfwd663JJQYXAiFu36Z27hdPfPIhg==
From: michael.opdenacker@rootcommit.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] riscv: dts: spacemit: Add OrangePi R2S board device tree
Message-ID: <20251109222858.3085488-3-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251109222858.3085488-1-michael.opdenacker@rootcommit.com>
References: <20251109222858.3085488-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Sun,  9 Nov 2025 22:30:06 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=DJTd4DNb c=1 sm=1 tr=0 ts=691115ef a=9hvhlO9olek7/vweJUpOAg==:617 a=xqWC_Br6kY4A:10 a=5dAzR5NRAAAA:8 a=lv0vYI88AAAA:8 a=d70CFdQeAAAA:8 a=fyVzuThwbwnzMy4Arf4A:9 a=9STjDIb-X-UA:10 a=ZKAZAlVgJm32z6MX8p4a:22 a=9qqun4PRrEabIEPCFt1_:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfBDv8wuxEcZm0rxxsQK0O9hAKjHcE2Dtr/aAzii29qy//HG9wJPROy1JZgYMjUw4B9BEYgKwG69rnjGjIXckv2pVGEiuYMoK2a5HmjfiM7upK9pHm67P be2WYT/byBC0fTa3502Pc37mVFIhWfAmgqGTfVNN7S7w2PGDGcWVzLaMTTrRhdG9YQ6XT/1SDnZcYZh2s2FL2mZ207/ScGn0DjbTbZfNaFTJuOKae0a9bGyT 3N0gA0No6QoFCaBEVNnDnACyvFCQAmpq5yFTGT+WoWWMXfYLHsevflHl7/qSkSKu1sAK4v89CGqO30VBacAp3nnt3RlbamFQT7BxEjMa3yzstjxEOKHLn/xb WMzgZjvmFINoRZ+/z1yFaEMKpvg6fttvy7GXHydAbKBlmh3qS3gOasvjfCRe+cdq1bytWZTgilTCoU++GIYSBKdHX7fAuwb8cF6hrwdxVfpsZ3s1KsugezKT scmkaYdn6D9ksowvW2Y5Wl/LO3PL/9HFE0zvThUgjsZbpl2EX8sG7CebNW7UsQyRPRfbXrD1JF3i2kjEGV6JWFsDS5+ZqlJC7cynj384UnR17vnzQbbeSnsD svoTfExxQYmJgtuQFhS4xPE17onubAY5/cb/pzo35QRrfHyanxMBm0O/Jq8C9v17D+d2JAzF9sZ1hPpeMTcns+Y3zcb1sccndZxWtKyw3Lz1eA==
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_143016_199727_098AA956 
X-CRM114-Status: GOOD (  11.31  )
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

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Add initial device tree support for the OrangePi RV2 board [1], which is
marketed as using the Ky X1 SoC but has been confirmed to be
identical to the SpacemiT K1 [2].

The device tree is similar to the OrangePi RV2 device tree
(k1-orangepi-rv2.dts)

This minimal device tree enables booting into a serial console with UART.

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-R2S.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 942ecb38bea0..96b3a13a3944 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -3,3 +3,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-bananapi-f3.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
new file mode 100644
index 000000000000..902cb6702fbf
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Michael Opdenacker <michael.opdenacker@rootcommit.com>
+ */
+
+/dts-v1/;
+
+#include "k1.dtsi"
+#include "k1-pinctrl.dtsi"
+
+/ {
+	model = "OrangePi R2S";
+	compatible = "xunlong,orangepi-r2s", "spacemit,k1";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_2_cfg>;
+	status = "okay";
+};

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

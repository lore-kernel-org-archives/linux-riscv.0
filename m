Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA84F606A55A
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 22:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SJ6ch+5U;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fyd4+BWo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T0hCotwnwZRQG+dF1xo5bIQpupGOychYCsl7TXv+BwE=; b=SJ6ch+5UFf/5V68Dz/2HTfQJwS
	3wz7OtIiF6EoSQZwrCCPiyRYEdiFslN79zGC1Ef9T4CQaqVwI44DEbfN8Cbh0p2uCqq/Q3gtOxaPq
	WtDWL9qPknNbS4NAm3Guirxk8NN5iDB1SqimoBcwPR68h3/g/75vs648R9WHtLuwpXsDFXcXcFngg
	wVpBZF8PWoA5qwvY3l4X1gc8q+kFVPAqj/WfijY7WunbEQpEPuglbGrsiXwuuDB3GgbEe0lrF3nmV
	7Mluyynx3Hy4Y04UCf/fksF8KyUW/ojR4MbdlxWJIsoZW04DICiJCDZm6tCmQM9cizcGRY+FLqxWN
	QR0FCEuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzqd-0000000Eiie-26zs;
	Fri, 13 Nov 2026 22:34:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzq2-0000000EhnZ-2PbR;
	Fri, 13 Nov 2026 22:33:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 04C3C634D8;
	Fri, 13 Nov 2026 22:33:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794609221;
	b=ixXZyX6PNaFH4FrMFF2i7WsHjvAc23Yx3BPq41Mg5Jqj9kYtllKpGrBwJ4pW0m8u9bjv
	 sJTKkiJ1qb5VNJeaftulTfGTVw7eOrN8GUzOUVP8GnGI9/zCp5LGnr20DjkV1gnWKTe5N
	 5Ps+JPcetfh5sq719Ooj7D0HAjkyHmWMK8ORLNJe+6KqcH4HOLeOx0vzEY4FjcMEz/miC
	 9uuLsYi0/UuynrMHFkT4ZHz+5SMpchOo6X6v8lTZUnkdqjexq8ybSHnnC8cV2nppm3Id7
	 MPbWrUyYNFJpuRgdNKB6ykp3jQ3UgEjUXxcTwqy2asJxz/BkFA3TZwBbQA5/OWhgshA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794609221;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tAMzkHW3x619qcSE6ghe9OxhnYf9AsPfwmmVyuti68Q=;
	b=SMRh+U51g4jzVdRWM55LG3pe3X4WEfzIcyhhu0usWl8oYSR1HIh+eeMOOxnZZLiutTs5
	 LGcTbn7auv65H0DTaeDuiHZwT+Qc5LsulEwQVY8F3Jm3qESK4N7CSLpUaZq1XjQ2bVxiR
	 H47ZIj/aBgM0IcOVl9DIMFpONDwPUyQvTnr+ScGzDTZfT5DKhzFpWrNnDXeuvy2KHfSdf
	 EBKDdhMEeYwuASl36zHZPnvS9xms3S3iWqK9NBI9KXK5UVgvrK3H6atr3S5hEVBXJR6er
	 P5tQMY20OD40AumDBt/IIUyvGhHczNYkkWhNwnpIQK2mf15xM2UCcZ+9x/8L7feY8zA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 543BE1F0182E;
	Fri, 13 Nov 2026 22:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794609221;
	bh=tAMzkHW3x619qcSE6ghe9OxhnYf9AsPfwmmVyuti68Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Fyd4+BWo9SAEAgTUcWSfp2jxVvQglhZmUdq5m0HhB9GSHbPHNJ4hy0bQfcI1UrD6s
	 VT6t9XNz+rWbIr6EEM8YzAMtMKHq0py10+BDgugqm22w/9LBy32gek518/jq/5WmTx
	 KcXgfVQPQBlKYO+9DwIyztRbPZSpPG3oGaiYG8YAdMW1AG8i63CrpB+BKngj6VMNir
	 zc3HfNLLzho1gNekNo/GrNLbTXeKc4UdRSBZpK2xKMqIYx8oijBdKMRUFQbC5rhS2l
	 TlueSpQIxt7bC0vM/DugKKZsIfl2Byyw8j26Dir8fDdnMdUwOJ7zDJDDGJj6sepsR1
	 b/ZEuSqXBBMSg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1DCB049B9A;
	Fri, 13 Nov 2026 22:33:34 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 14 Nov 2026 06:33:44 +0800
Subject: [PATCH 18/19] riscv: dts: allwinner: add the YuzukiHD Avaota F2
 board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261114-v861-v1-18-eb71ec3ee523@iscas.ac.cn>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Han Gao <gaohan@iscas.ac.cn>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794609209; l=2024;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=KqCPsLCb1dJ4aF8ZRP+gwHxIPe0+kCAp6k+KqhGB/tU=;
 b=JAcotxw+M6j30G6Y+hS6IIthgJBH9a0dFcYqiLwL8VfrQYXbseALNWB7FyvsQlLFdrq1ifsfd
 XTqr4BlvW/tAFUhX0NaT1c1hZjH3ZcIUsvJ3w2wYbmlHtGbMZ+QCYs9
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

Add the YuzukiHD Avaota F2, a V861 board, with its memory and serial
console.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/allwinner/Makefile             |  1 +
 .../boot/dts/allwinner/sun252i-v861-avaota-f2.dts  | 43 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts/allwinner/Makefile
index 1c91be38ea16..725919d9a4af 100644
--- a/arch/riscv/boot/dts/allwinner/Makefile
+++ b/arch/riscv/boot/dts/allwinner/Makefile
@@ -9,3 +9,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-mangopi-mq-pro.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-nezha.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1s-mangopi-mq.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun252i-v861-avaota-f2.dtb
diff --git a/arch/riscv/boot/dts/allwinner/sun252i-v861-avaota-f2.dts b/arch/riscv/boot/dts/allwinner/sun252i-v861-avaota-f2.dts
new file mode 100644
index 000000000000..e3f5e6c8d350
--- /dev/null
+++ b/arch/riscv/boot/dts/allwinner/sun252i-v861-avaota-f2.dts
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/* Copyright (c) 2026 Han Gao <gaohan@iscas.ac.cn> */
+
+/dts-v1/;
+
+#include "sun252i-v861.dtsi"
+
+/ {
+	model = "Avaota F2";
+	compatible = "yuzukihd,avaota-f2", "allwinner,sun252i-v861";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	/* U-Boot updates this node with the detected DRAM capacity. */
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x08000000>;
+	};
+
+	reg_vcc3v3: regulator-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+&pio {
+	vcc-ph-supply = <&reg_vcc3v3>;
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_ph_pins>;
+	status = "okay";
+};

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

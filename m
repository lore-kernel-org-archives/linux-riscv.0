Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99630C83F3B
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 08:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+gYnKaobdy+ALu+UbU0jjJ9ubBmBBXWOWiulrdY3Us=; b=VERDF4wgfFpQjf
	ws5vreStfCk3B7W+G4ifjN4OZ8S0QJjqY14BdiJl0PGEmp8hUO3FXkWo9N3VArfpAsxYac2BRt8Wb
	TFt/mK9nteRHiVsPp6a/l/fAk2Eie5KtXpxCYhNDnaIbof4AJ7CE2x+rOw+4hhzhSxVCqoWaG5WyG
	5dOWm1sl50iu7BWrFpKcChbuX7EvSnfCPfhmmCnQ1EUBzdJU6OrtKmmYmmWarPwBb9V25/DFyLp9s
	WIbEMvqYyhLmuIDMbAcLl6gNwLEcLguUqjJATJUwjX2RqGBn1pg/OPitBHIWWEAOH8UglANpcnqDA
	jVWgexV4cLWa3XYKl1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgw9-0000000C6SC-2NKG;
	Fri, 18 Jul 2025 08:59:25 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucghi-0000000C4iA-02S7
	for linux-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 08:44:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4560d176f97so20826625e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Jul 2025 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1752828268; x=1753433068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZF7vneJ/oeaOQ29Nz/sbY4GH4SE3qUarTuWdFIe75qc=;
        b=GFTyrVxo4bpyObLKEZeUrXDWTXfVIFGz5t/q8Vzqa6PGLPw/sC+nECfWmicM0NlCfB
         vQbLAnLj07kbNQlC+Fbdi1GxkeDd1Eb0HYaTbfMqZ94x4U8hLzPiy/6ZO4cT+JS1gl9i
         fGgsaDqqOH9tR2+G+Hn3dmbpiFs9yWa4cmpe4cxo9GTmQhBHs4jAGqoN1hD+1QRk4EOM
         IwNTbfjIWq5R2Jo0IlZ2P66z3SruPVWgm8//AiJfYFGiVSlk7u3dImk82ZDenzA3KV1N
         Lk82LULBOGQ1Jg7z+pFjUSVYsC3OhbgYUte1mG7tdDWObINVN0FYcl4P2C3YqKW0NOba
         eJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752828268; x=1753433068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZF7vneJ/oeaOQ29Nz/sbY4GH4SE3qUarTuWdFIe75qc=;
        b=B8BwgcFK52iD/JxUCfLQcGpeYOJvcl8S7nRbfOoxfb1Jxbo6D8fzwCtYynqBO6Y71C
         hjSx68XMnd33j/Jekdg/QFt+CaiF5s3JMXFpzcDz+GuQ4wZHDQjsOyk6P4A88EqTxwNc
         rw/EQItJEUJSwD6yX8Av2wlpBl/aDY0ieao1P2vs5GmKzwkcBIpMG3hxqiCyPRzzCZdx
         1KCyF9ru1V966mt2k8M+dR68gUuGQsBvKUmWxekiflZpQxRTYp1ZaLr8VfMq3o5gSOSt
         +PXYOme158MzltfHvl2tlavhecUR7qsKMT/DwC2CFqZS5/21bZAXOnZhLrklW6akMRP7
         w0VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzqVTNoGpMa5tF9IoGuw8Dlxa5AaFsOgC/g3bq4K2RsSvhfb5XZ1BSBDIutjyCCh8OmnTuoKliDT/LCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZMjACTQm2gTeOUAsp2amDqgFw7MEke3Kj/8HnXQtl6T5tkmda
	8NNxHi+OW4TkvSHk+9OfWaRx0hYp5z+Fr1eh29GMx8txnwGo+Fa54+jfKnOT7DJOm38=
X-Gm-Gg: ASbGncuy7mjHSrzmH049pvnyvsK5t2DTmEWcnK9L0R+vAFu23EjNVuagmfOIJ4b3eQk
	NQNgFO62PTh15LCpkYcCyj5zLGVRNpEQXmVW+exKyAYLkJiQM+pRjC/I3D/RFzOiolpG5P//s5w
	/kPi4uZI6KiJl0vpwXvtXYckAlZcWsgOCDV9lhzdzUWjgjGd/hKzwOpdUx2aX7Zewstk+ysObz3
	WM8WCpiNvV6aH+BQqrLESn0bnEK4aA9gGlDo3Bk6Bhpvmk8wV2jfbK0cjRXpcFtfrOJLSxf24VY
	uszSaBnZ106oCihjFC+E4ZXJ7f1UQd1BOQZocO7pnhjz52EQKFxbWjdsoayc3emQuOeu5Hkavfd
	/dmDbcJZmLV87wBAnyfZpzXDo1KmfXT/bCrPwsKZmumn8UjZ9
X-Google-Smtp-Source: AGHT+IGqz0s/AaH2jo7lzKlm58e4CdVC6fpR5T/WfzdfwX2FhNDW9nmVqoPf2WlNPuA5uOQWGsE3zg==
X-Received: by 2002:a05:600c:8b0b:b0:456:1442:86e with SMTP id 5b1f17b1804b1-45635e6d11emr49725385e9.21.1752828268318;
        Fri, 18 Jul 2025 01:44:28 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:9aa9:dd5c:bad6:e31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45627962384sm58208115e9.2.2025.07.18.01.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 01:44:27 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	palmer@dabbelt.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v2 2/2] riscv: dts: spacemit: Add OrangePi RV2 board device tree
Date: Fri, 18 Jul 2025 10:43:39 +0200
Message-ID: <20250718084339.471449-3-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250718084339.471449-1-hendrik.hamerlinck@hammernet.be>
References: <20250718084339.471449-1-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_014430_045658_BDCC3B3A 
X-CRM114-Status: GOOD (  15.24  )
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

Add initial device tree support for the OrangePi RV2 board [1], which is
marketed as using the Ky X1 SoC but has been confirmed to be 
identical to the SpacemiT K1 [2].

The device tree is adapted from the OrangePi vendor tree [3], and similar
integration can be found in the Banana Pi kernel tree [4], confirming SoC
compatibility.

This minimal device tree enables booting into a serial console with UART
output and a blinking LED.

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Link: https://github.com/BPI-SINOVOIP/pi-linux/blob/linux-6.6.63-k1/arch/riscv/boot/dts/spacemit/k1-x_orangepi-rv2.dts [3]
Link: https://github.com/orangepi-xunlong/linux-orangepi/tree/orange-pi-6.6-ky [4]
Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
Changes since v1:
- Added the aliases section to the device tree.
- Removed the memory section, as it is populated by the bootloader.
- Replaced unclear copyright similar to the other K1-based boards.
---
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 92e13ce1c16d..152832644870 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-bananapi-f3.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
new file mode 100644
index 000000000000..337240ebb7b7
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
+ * Copyright (C) 2025 Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
+ */
+
+/dts-v1/;
+
+#include "k1.dtsi"
+#include "k1-pinctrl.dtsi"
+
+/ {
+	model = "OrangePi RV2";
+	compatible = "xunlong,orangepi-rv2", "spacemit,k1";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led1 {
+			label = "sys-led";
+			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+			default-state = "on";
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_2_cfg>;
+	status = "okay";
+};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

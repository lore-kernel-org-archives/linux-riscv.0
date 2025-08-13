Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF51CA0EE5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 09:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BPEu3vofCxDhy+tORKLrKQI4ODEQs4/F7EeyHEkuNA=; b=afu2m6B554OFBn
	McO2bcPeHQP9F+9ox27ODdFvOYOvddGa9PXymQgmI8TJuScCLH50DH8vvi+OFvQ8qjF+QzSC9aymv
	X66HAEotWFhdm681O5DjHCQMJCHqtKDZNO64rm/kj5UOEyl5RYpzCYKIhqBQPXcntAxh/Z28ccFa9
	zD9PAHp3zqJ0l0THZx2fnX6N8dHB0lY84YqTNPmR80wX/uoFNZcunk5KPO4ICFInHHqWAfBZbEF6F
	CzjD0E6K3+ZkwvOqunZo6wvvZCXXiFgxytvdhAncd6+qgd0CJX+02K6BwmVRm6ZF302Z6fjUx4qdf
	WfznbziqYyVyPVxcCBKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7hu-0000000DDAE-2kiq;
	Wed, 13 Aug 2025 09:23:42 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7hq-0000000DD7d-0plt
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 09:23:40 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3b9141866dcso910161f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 02:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1755077017; x=1755681817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1TU+Xl0n1RhqfO3nfZOueztwfTTkM2m62EBReINxsY=;
        b=as3HRBLhJJvfwjw9USuyLfnbmse6nxXHShDl6pRjwYsGU0UOzJVRMs4AMowjjToVNp
         H3aVcVSGQalrreDs30c+6DWfKcKHbUDmkCbfbFWnN9YTSPwi3kDTu8uhG2v9nnDS9cCc
         3e54auIwAc0FB0fuojWtmOU8FWOYwZH8RIL36bcthjfr2+gBZhG3dpNi5gKN0N9GLV/7
         PtOjpYt/RjDaj9QQHpwctc0J55BkM0fNQoGl0XL3o3YPdmrrVN2DWTcNIp/2n4+7MSXS
         j85W2cOqTfBmGgaAv9+TqUp4z4PbjVOdj99gGVDPrIBZlBS0gnLmYHbK1AH6qMfPEGdU
         16oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755077017; x=1755681817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1TU+Xl0n1RhqfO3nfZOueztwfTTkM2m62EBReINxsY=;
        b=PzmsJ34qLTgl0IT3ZOL9micpovvW8kfTFu1cUyFYo1lnaNvF/eNMW7CJcs2n/O8Lnu
         Tn6MZ1Mf/IaPuVzPOKs2+KAR+/EFor2q010sikn7KYFwvlbYya5wXz1U8KPLOe4ieRjy
         IYEmJHp7LT1gMdGhE5PeZjegeTVk4W8t64CptQ1To4FtDWZ/okSfcUD25g3JtUfxDDVD
         UH3+WrdGUHMsBWNMjfNA+By0sZGj6mQolWoAI+JoknAaYaerKtmQYLWiWiT9AuuBu5Nf
         LFM4FF5kBBuNmu/1fyaVxUIv2pd93uPO34OTwIx9PDTuEvjG2icAt1NKZjHnlEBdSf7/
         ue5A==
X-Forwarded-Encrypted: i=1; AJvYcCU5JAp48VkYi4X9EskiltozJz7+tC4WauMZiTINbR5OFGtA/h4Wl7Pei4+g4uMa6dNTgt65HhuZg3enVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAgj5XSANsRWITBISM0N3TxvH3ATsx+evWG1k8guIQ/SRblK+L
	znlG4WV+ps5VhAy17qo/hfp+AFGtQoU2IgiGinTJE520JjOBX4TmXp3fSEBMNtFE474=
X-Gm-Gg: ASbGncvnjueHNwSRS2t4hhQlVbbGrtwV0t3VAU3i8I5TwELDUUGNG6V8Wk3Aqu+vCCU
	FRom5lFMU9q5O7HgM8XMRQyrIVJ3pH6tBo2WE2yqZnOQJo3L4uZm0UUbvwT8NhQkHF+s1MvHNnS
	Fe+koPDkgK7QAYYGyQa3tss+Wr1QHgl/HU30sbQMCYfPvvpgDqPuFWgDZSQylCpYs/0yIVEQbTD
	QR1K+QFkWkNfuyc5HQJfrOM6OKr6v4Vgi0OygmkrxVHj6kxzKP4fBXLIeT8JtLd+jZzJ42Tx49k
	g3Qltu6WXXiydV1l8dfbqgeaWBKq9Y3p2SfRfwRnH/TfSpYgckbmGGnkheyNDS12OSnbNslaSdh
	0p2HnJFjxqmeeZxrw0EN6BVYk+DXRbfBVqEg+8vItnatd2OgQOw==
X-Google-Smtp-Source: AGHT+IE3vtz1ELNgTuw1NVDgwEF012pagU0/e5TxjB4oj/3WIMChqDWH9mXGzW1B/LaUDhfksyi79w==
X-Received: by 2002:a05:6000:2087:b0:3b7:905e:2a32 with SMTP id ffacd0b85a97d-3b917d2a92dmr1794493f8f.12.1755077016260;
        Wed, 13 Aug 2025 02:23:36 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:d33c:e682:2af6:3c3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac158sm47966077f8f.4.2025.08.13.02.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 02:23:35 -0700 (PDT)
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
Subject: [PATCH v3 2/2] riscv: dts: spacemit: Add OrangePi RV2 board device tree
Date: Wed, 13 Aug 2025 11:22:40 +0200
Message-ID: <20250813092240.180333-3-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813092240.180333-1-hendrik.hamerlinck@hammernet.be>
References: <20250813092240.180333-1-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_022338_236997_9C43B634 
X-CRM114-Status: GOOD (  14.97  )
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

Add initial device tree support for the OrangePi RV2 board [1]. The board
is described as using the Ky X1 SoC, which, based on available downstream
sources and testing, appears to be identical or very closely related to
the SpacemiT K1 SoC [2].

The device tree is adapted from the OrangePi vendor tree [3], and similar
integration can be found in the Banana Pi kernel tree [4], confirming SoC
compatibility. The main difference with the current Banana Pi BPI-F3 tree
is that status led is using GPIO_ACTIVE_LOW.

This minimal device tree enables booting into a serial console with UART
output and a blinking LED.

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Link: https://github.com/BPI-SINOVOIP/pi-linux/blob/linux-6.6.63-k1/arch/riscv/boot/dts/spacemit/k1-x_orangepi-rv2.dts [3]
Link: https://github.com/orangepi-xunlong/linux-orangepi/tree/orange-pi-6.6-ky [4]
Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
Changes since v2: improved changelog
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

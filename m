Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143E1C83F1B
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 18:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4lxrMGNBbcNEw9FrNfyA4ki8yu+EN48c4HW1MMeYts=; b=1evUXZotf3NU7h
	d7Z2y+xmWD+HFw4PL48gYFFvRew6K0vRGynygy5BHSNgAd+Z0CIOmof5AlTSrEruJeZI9VmByFpuL
	H9+j1xCQahREiwV6KgcvFUjEf4NuWp9Oaqp/r/ene2Z7DC0vecJH7uJEDH3m8xNKtO8EyN+Nyan9l
	5fbYpy7gMDdeLcurhhKZIStV9SqR+PNdXK/sbINDIePpp05vrJoaHWeeWYl1BMDFYxUvMt7cx5OFq
	TgiQkIREDa7wp4rnUdzc8zrLL3qnt2hKZSZZTkn8irQMmb0qjnu9/K/HJy0YPPeAIqUfBCZpwHjYB
	FPQxYY/BR6DRYOxz5gGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaId6-0000000FXFd-36Vf;
	Fri, 11 Jul 2025 18:37:52 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIYp-0000000FWFN-2TTV
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 18:33:30 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a588da60dfso1745464f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 11:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1752258806; x=1752863606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajLVmCN8EV1ROtFCYKGnJZHORiVxqh3PONYE32dE2Kw=;
        b=iIUVEFbShivZ3+8sUOfu08vfLUPHdZwC8eDt3sqJt2dGbc8H3Y/VRAe3AYnW3LiT0x
         9eypyHy2P/R1+HQAH5ksNNU0aFpF3NkMokyl+J8bD1GZsEbr5ASOxHWYFjjQ5npLLhcq
         YoN4I1e1qMVyxUGZbh+TPMqkG+fCOL1QAQ0H6MODCwNUO//TPvnt+nLaQMwrcENMx/pY
         xpSHBzYMwDzqSmkJ7Qj876KpGAPqj+JsKb2HARcpVR2Vdu+JQFcliS97WAyFze2SUgdB
         grbbDGT3gEDbABlD7nLHvPN02vWoprkKn8PGxjRcuXTPopiI4NDGzeOuyr4sGbTiVCaH
         e/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752258806; x=1752863606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajLVmCN8EV1ROtFCYKGnJZHORiVxqh3PONYE32dE2Kw=;
        b=ei33ofXfLNBdpi8zStarlj3Tk4cWne6GuFC08XQJv2Btg95chOJPkkbz7jsGb6mGmT
         RYySaobFbkMqD31EmP0QSANiGkVT75ktTEcr6WlzTjLlB8nrIyFn02FbLM08cr+Ni6iA
         G0XB6hKmQVuDOuFmG51WqtumDyEUXrXcyQXuN9a4lQ2VNHy7GCqZW+OFYocjECTarOy+
         ETQALrm9E7/+vXRqZxDMYXu5aBME/nwJB4/W2GykeERwtKhOxp2ndYPOqby8Q7gvJhc1
         s7sQ0C9suK50n+djZb4/+AsZHZ1wfPL6AM1yUnKNur9Cv2LMc68rm3TGRxmQvNE6pf9K
         oSNw==
X-Forwarded-Encrypted: i=1; AJvYcCWzEw99f//fqVP06Cb8Cnn6idJoC6733iW6/4X/z19i/E+1hDmvahofFGkna5bLEvN7v7NLaIpdBFKLxw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz433cOhOrf1oLc8+45uh1tJVowqab+1YqpNSosCCeHjLps8Z3t
	no03c6ya4F0X39B0IsNUzNiyVthw15KaJ0OWskg3YqMJdZYzwWhRF1jBd7FF5fpw/RA=
X-Gm-Gg: ASbGncu0B2Rt/hDZy2Of3UZ3H+wFA8gGnFvf3+Gz/TF48ZkfSaFP1pZmLH8tPCPB9Ou
	eCQdYpICvnpFyFcAQBd1AVjoPMA3RcHUU32kbr5wPtoAgabqWt46xEKK5+++pzzwgi1czaPPs4C
	uWyvyamnOfcLYlSgNtiQiUngp/vp5LhpKie50f3xgXQH/yDyozU20PygKeyyabugLjsXkxeLAX6
	JDZHsFCJCJ7CVMzaNrK+94+GoqWq33QHrpwnRH+gqDTi1woYLiKTiYdFDhdXrCMJuUZqH2NJE1Y
	cSEXM1BK7ckA2Aj94VNmjuMZFkVbRNOM8pyBbvYsRQN46rj1dR1ULaZyHioCgeKvpdGvPy+hwTq
	niQ/wwPdXN5qhJ/zpXpLloHY530djLSaeX9DRwb9Mmsl18UmUsQZP2NC6lLps
X-Google-Smtp-Source: AGHT+IHoIVVNWSLMADUf1EqgQlVt++Sa+z/qkL2VbBz8sznu1zu8Z81BC5P4gKRYQcV0niTuA1b6wA==
X-Received: by 2002:a05:6000:4108:b0:3a8:38b4:1d55 with SMTP id ffacd0b85a97d-3b5f18dc7dfmr3898978f8f.28.1752258806040;
        Fri, 11 Jul 2025 11:33:26 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:bed2:2848:b66c:32d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45601053020sm705205e9.36.2025.07.11.11.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 11:33:25 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	palmer@dabbelt.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH 2/2] riscv: dts: spacemit: Add OrangePi RV2 board device tree
Date: Fri, 11 Jul 2025 20:32:45 +0200
Message-ID: <20250711183245.256683-3-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
References: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113327_629320_C556584B 
X-CRM114-Status: GOOD (  13.65  )
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
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
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
index 000000000000..8313f9589cd2
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2023 Ky, Inc */
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
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x00000000 0x0 0x80000000>;
+	};
+
+	memory@100000000 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x0 0x80000000>;
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

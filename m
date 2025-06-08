Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10070C61CE8
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 23:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P7gq17Stwl/BSGs8M1BjMXlbyK5Aog861dAdNxBfABE=; b=2uuMIA+hBqZc8r
	64nVsiy9CLxXAYzBO0CD3KBq+jZwFH3ADhA+HgT2emmBy+uyzjY6rXTc7Cjdrzl1tHTMXhPVwOGH4
	W2jpMCBKTp/gL7KyE+i/iK4ded6Kq2qdpAfSepHzmGryuWkE28AalxpP/5gDQloD56jLJwoJL/PBt
	bpHyCqMvLzZI9VLGUAi4+jholXQs9bkqN50cbwnhb9QHPbdvFjhLOa1e0iO2AgRfiJj/qn5gRYnm8
	K8RTNkTTALFNlP5sRBuWMnq/QV6tLvDVqnqm56nH6K/8w4oUa+Uvan8wF2tWzdVDDa/Ct2SQU04WX
	6qwAYqJwac4QFb1OxNMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPMc-000000036ZS-3SD7;
	Sun, 08 Jun 2025 23:23:42 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPMa-000000036Xv-2d5j
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 23:23:41 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4a442a3a2bfso69841381cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 16:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425020; x=1750029820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyOPT5bb27xpSlfKUprjkFPzASHSgU4t1PeuReJqiO8=;
        b=m1vPRtlZhTqei5kDDin71OaiaqKv5uYZFLYfalh/HCIUG54xi1nJ0kMVoFQtoiD4Li
         BIFVCjc7H7pd8zJCnf5hLR33aGJqzPIModPIJ/fYwnj0nha+jqCm4sipFJPnsaa2NqJj
         Md2oYT6PJgH/O26GwS9bO8koFmDtwkmMhkuDdiM64ksCfvWk20U/NPacZukvhndQYnTj
         0iaBDyuro5wNFnFgG05kfWeo/N7bMuxW6K9tbElYmFs3FZZ57DYRYoaT3wfDjq5YIlxX
         YH0/b2WjVDScWHTVZL9kJNQV3RTuzZIkDLcwr+6QYG653vcof9w36RXMyrmLFa8/nM/p
         yPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425020; x=1750029820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyOPT5bb27xpSlfKUprjkFPzASHSgU4t1PeuReJqiO8=;
        b=Uy/Z/sGW02r8eXpHDhRuPYrCKyijWw0Yeczf5gbXio/rGFLQ8h2ktgdWkViUeK7ncA
         R/BbZs8GYhKy0XxTPTIgxW4nE++zrwwRMNKsEI4Aicrp7WMLokVKv1zpuOXbG3+CZKsW
         fkgCiF8ZnIIekctGGJyJJdNussSy3tOu+iOFEhp2TeztLcLr3K4LFecsXfjlhplSBG5N
         kOeCpaU/rrmP9ob69uYlpkpEVwpbj/mfMNJAiOf8Gn4+8/sZAAX8zfGruLrsveXUbPlu
         W2iPZcW9hZo3q/dR574j30M+XJ6n2EA9rajX5uTwcGU/K+h0tvq1jDyf2XBGJLLIcf8Y
         5z/w==
X-Forwarded-Encrypted: i=1; AJvYcCX4wjFP2RFDen0Q1cyLO/rkcrrVZY5Kz4lcfJc/Wam9PWCJP6x0o9ybPE9pqrQsWLyt/lbXGIiz42cWvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YygwE41dVHMkAbKHrG72132r3+flv5MgSTA70NnbBTYyXJtrysV
	BHcqLWKi1KE0OO0z4m9H3rwIrmqnvgqcCgaSCUdHmzfnSj0vj/mGQ+OX
X-Gm-Gg: ASbGncv/ThPPVrWKvHUcJLS0ZxOGiNiU5C2BeFxjqEH275Jyk41rkJaHV9fV6UDpgT5
	x8qAGyJcOa9BdHForFKIR7BPSC+i421v/vx/AfiDyu/ATKl7lIRKYol3qOdEhZnX9xIJ4jpzJ+4
	X8dWbwZPUMbcn5Klt9fguTLg7/JbvFZTfJpY5WO8zTi8rQoKrjB7vEJva94IvRy6fOaWMSzQKQa
	UbYOirTb3gc7B5efnKuiO/bOvAPtni+NcOgQw1JPkE2B2GjGkBzrjk4TYc7kP0j2JkbpqfnpfaV
	JOINYWTSzH202uhnM/SqtqYz0P4Toto62ov5Aw==
X-Google-Smtp-Source: AGHT+IET3f7QbRTBxJ5zmqMOJC3RYOEvWDP8i0B7bIKfGXy4c6ekxkf5y/zk5WatlDc2mvCvrtc3kw==
X-Received: by 2002:a05:622a:1cc4:b0:477:1ee1:23d9 with SMTP id d75a77b69052e-4a5b9a2ae3bmr204216041cf.20.1749425019695;
        Sun, 08 Jun 2025 16:23:39 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a619852dedsm48449871cf.39.2025.06.08.16.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:23:39 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/4] riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
Date: Mon,  9 Jun 2025 07:22:09 +0800
Message-ID: <20250608232214.771855-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232214.771855-1-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_162340_663168_689D51F3 
X-CRM114-Status: GOOD (  12.63  )
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

Add reset generator node for all CV18XX series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi    |  7 ++
 arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 +++++++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ed06c3609fb2..4c3d16764131 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/sophgo,cv1800.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include "cv18xx-reset.h"
 
 / {
 	#address-cells = <1>;
@@ -24,6 +25,12 @@ soc {
 		#size-cells = <1>;
 		ranges;
 
+		rst: reset-controller@3003000 {
+			compatible = "sophgo,cv1800b-reset";
+			reg = <0x3003000 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-reset.h b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
new file mode 100644
index 000000000000..b9b6dd56a9e2
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#ifndef _SOPHGO_CV18XX_RESET
+#define _SOPHGO_CV18XX_RESET
+
+#define RST_DDR				2
+#define RST_H264C			3
+#define RST_JPEG			4
+#define RST_H265C			5
+#define RST_VIPSYS			6
+#define RST_TDMA			7
+#define RST_TPU				8
+#define RST_TPUSYS			9
+#define RST_USB				11
+#define RST_ETH0			12
+#define RST_ETH1			13
+#define RST_NAND			14
+#define RST_EMMC			15
+#define RST_SD0				16
+#define RST_SDMA			18
+#define RST_I2S0			19
+#define RST_I2S1			20
+#define RST_I2S2			21
+#define RST_I2S3			22
+#define RST_UART0			23
+#define RST_UART1			24
+#define RST_UART2			25
+#define RST_UART3			26
+#define RST_I2C0			27
+#define RST_I2C1			28
+#define RST_I2C2			29
+#define RST_I2C3			30
+#define RST_I2C4			31
+#define RST_PWM0			32
+#define RST_PWM1			33
+#define RST_PWM2			34
+#define RST_PWM3			35
+#define RST_SPI0			40
+#define RST_SPI1			41
+#define RST_SPI2			42
+#define RST_SPI3			43
+#define RST_GPIO0			44
+#define RST_GPIO1			45
+#define RST_GPIO2			46
+#define RST_EFUSE			47
+#define RST_WDT				48
+#define RST_AHB_ROM			49
+#define RST_SPIC			50
+#define RST_TEMPSEN			51
+#define RST_SARADC			52
+#define RST_COMBO_PHY0			58
+#define RST_SPI_NAND			61
+#define RST_SE				62
+#define RST_UART4			74
+#define RST_GPIO3			75
+#define RST_SYSTEM			76
+#define RST_TIMER			77
+#define RST_TIMER0			78
+#define RST_TIMER1			79
+#define RST_TIMER2			80
+#define RST_TIMER3			81
+#define RST_TIMER4			82
+#define RST_TIMER5			83
+#define RST_TIMER6			84
+#define RST_TIMER7			85
+#define RST_WGN0			86
+#define RST_WGN1			87
+#define RST_WGN2			88
+#define RST_KEYSCAN			89
+#define RST_AUDDAC			91
+#define RST_AUDDAC_APB			92
+#define RST_AUDADC			93
+#define RST_VCSYS			95
+#define RST_ETHPHY			96
+#define RST_ETHPHY_APB			97
+#define RST_AUDSRC			98
+#define RST_VIP_CAM0			99
+#define RST_WDT1			100
+#define RST_WDT2			101
+#define RST_AUTOCLEAR_CPUCORE0		256
+#define RST_AUTOCLEAR_CPUCORE1		257
+#define RST_AUTOCLEAR_CPUCORE2		258
+#define RST_AUTOCLEAR_CPUCORE3		259
+#define RST_AUTOCLEAR_CPUSYS0		260
+#define RST_AUTOCLEAR_CPUSYS1		261
+#define RST_AUTOCLEAR_CPUSYS2		262
+#define RST_CPUCORE0			268
+#define RST_CPUCORE1			269
+#define RST_CPUCORE2			270
+#define RST_CPUCORE3			271
+#define RST_CPUSYS0			272
+#define RST_CPUSYS1			273
+#define RST_CPUSYS2			274
+
+#endif /* _SOPHGO_CV18XX_RESET */
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

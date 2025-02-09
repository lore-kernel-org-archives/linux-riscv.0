Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15247C021A1
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Feb 2025 12:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCir6uZRw15Esx+OoyEvox7AJ+2nRljwpw6ldOZrL0A=; b=g5ZDDz8636/7/8
	prVWW1on75zwXDFxC5wNFjKdBDUsp3IVrZd5++xYIskVd7lCCuudP0bUyR4iJSRCGC4fo8QEe53tP
	PYI7t54HyA4GFxEp0TLpi+pZ/LDYr2iBEgUQK4UuosOC3SEWnUe+4gNwmvpkHhJ0pBCTwh1B3oetn
	pmvM+7VRHN6h1AtHazNvbHaGZK1hpAkt8gQ6sFjQEHAlMr70kqZLG8uLysm2qbD1/MwO8/7ZwLjXn
	2mUkT6kBiNWUAOPW2mQlmAfyjgA2MBea6nGCqGxEVBdqBuFxctQ+YSeY4a4HbKhranQ1+3EfFL6JH
	YsyIHcttqy8BqCHU0ruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th6cr-0000000Essd-4BC1;
	Sun, 09 Feb 2025 12:41:30 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th6Rp-0000000EqzM-1GEZ
	for linux-riscv@lists.infradead.org;
	Sun, 09 Feb 2025 12:30:06 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4718e6fffbeso3200481cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 09 Feb 2025 04:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739104204; x=1739709004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGHYTtsO5m0v1wjedl0Lk54MdsgI8dY68S8yR3p3+p8=;
        b=fAugFJ9Pp5ySmvIIkDTySJt0MycagHdgnfjr8ymDyM+tF0Mrq/MnhSBHnPR3CKn1aD
         VbzOBEoD8jRnAIMa6q261uZWt/6VmxqqDlXeo1zl2y1q7+yGihNdbMFuUhYfqd+lziBE
         riLJH1uWPVI3VCmbNttcc+9/6t/qYHExAuE485FYKaumFB1hbOw/0Ec3R3gTeYYGAn3x
         XtugArxKWEe4VfomKTwO3tqR3tJ3t7pV/0r2xhzNymYso/vdVWNwWeW+egdjoHj/AnOp
         QKiB3UeXOsYwMoi2EX8fZGxW++rQWhELciKSWDoInm9KJqM4QmPxHoIxFuwpD3rhF8+F
         XbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739104204; x=1739709004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGHYTtsO5m0v1wjedl0Lk54MdsgI8dY68S8yR3p3+p8=;
        b=Dj7c+rqN8PHBEbGrrnSf7v1+HVsuWryvWe6uHgOIsAPDuf6/y2YfhVP3oHAE81Yb9o
         g0I5I4XpZQev4Po1UwFisFvlGaYvMNltz4MSTudIqbqmh15KK6l4XUQWHglut2Zvswec
         q2Fk4ZBn89mOsW2de1N+8KMTJfzX+0p3ZdMxhP7rJT03GA4sYFke0buu7EeBOAEQChBh
         Ch38AAAe/dZ+rgQ3+ZRWQ9+NENVE0GwV0wJOKaniodK2fFtKQ+va/Pc/HIAn+2XzmWgu
         kuNSIxyxY1izm7iouTl1rD97Wx2851xLtIM3iobsdKAa7eFVxR57Xnh1/vblEc+vJkrD
         sYaw==
X-Forwarded-Encrypted: i=1; AJvYcCW4aU6f5F+OVDlPDy7BMWOa15HFrjbCjqy+5f82zpDOqFb65FF0t1z3zthyRWZjp1QujU2xX7IGtZID9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXYv7aXkCx0ivRW6FD3/CkA1RbnRJHz9jExZYuJ9ut3LH/ENw8
	rCVHweaYnvb+wDUCoZjXjnwB5nWnD5cf13vs9TwD/fyE45jC+kBs
X-Gm-Gg: ASbGncvVCQv067i3sX3wcn4NvmBYfMOjeomArw9uoUWpYxeZGk1w3KHR9ttsTDKemoG
	IMsRz/zSmMRklnGt/+t5Vvbth11qVon0F3iZlxoI/uIjVmJ9DBAPbIlxuIr5l+1msi5kXzVhKPA
	xipFqpJEQebpMsY3G6xJ3kkwuj6Ci0UZTyfc0Na9rLubb7mxsBTbccV7uSzrdM95eIVIjlB3OlM
	VQrlIdsD4y7FgYFpW9SVwn4s+jKxbkBTt0l+F4bhaiFNNmGaB0TWzxSiHvQuRtdzP8=
X-Google-Smtp-Source: AGHT+IE+DwN/tIPHA9yVzmEHHvww+6T4HxFjt9LxAFNhsW2bNJs1ipcvQrD0Ovvh/YRzs9Ku8jQ+5A==
X-Received: by 2002:a05:622a:519b:b0:46d:d8be:d2c1 with SMTP id d75a77b69052e-471677f61bfmr152285431cf.0.1739104203900;
        Sun, 09 Feb 2025 04:30:03 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-471921be65dsm1729841cf.65.2025.02.09.04.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 04:30:03 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/4] riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
Date: Sun,  9 Feb 2025 20:29:34 +0800
Message-ID: <20250209122936.2338821-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209122936.2338821-1-inochiama@gmail.com>
References: <20250209122936.2338821-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_043005_337411_8F8A6348 
X-CRM114-Status: GOOD (  13.12  )
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
 arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 +++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi    |  7 ++
 2 files changed, 105 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-reset.h b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
new file mode 100644
index 000000000000..3d9aa9ec7e90
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
+#define RST_AUTOCLEAR_CPUCORE0		128
+#define RST_AUTOCLEAR_CPUCORE1		129
+#define RST_AUTOCLEAR_CPUCORE2		130
+#define RST_AUTOCLEAR_CPUCORE3		131
+#define RST_AUTOCLEAR_CPUSYS0		132
+#define RST_AUTOCLEAR_CPUSYS1		133
+#define RST_AUTOCLEAR_CPUSYS2		134
+#define RST_CPUCORE0			160
+#define RST_CPUCORE1			161
+#define RST_CPUCORE2			162
+#define RST_CPUCORE3			163
+#define RST_CPUSYS0			164
+#define RST_CPUSYS1			165
+#define RST_CPUSYS2			166
+
+#endif /* _SOPHGO_CV18XX_RESET */
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index c18822ec849f..9aa28ade73a4 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/sophgo,cv1800.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include "cv18xx-reset.h"
 
 / {
 	#address-cells = <1>;
@@ -61,6 +62,12 @@ clk: clock-controller@3002000 {
 			#clock-cells = <1>;
 		};
 
+		rst: reset-controller@3003000 {
+			compatible = "sophgo,cv1800b-reset";
+			reg = <0x3003000 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

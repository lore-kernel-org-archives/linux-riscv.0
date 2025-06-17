Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B73C7114A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 07:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lUIzuOVWgOuD1Xx9Clal8DAsZJCu+ieQGm0mCECbP/Q=; b=k1MWULv/cPggM6
	+gNdWl404VzqWE0QEb+LBCnJUJx/0dpvENIryg0zWKmlTewUHR8qgSLEaM5VnhKODvgbXoyVNfwcv
	J2CUIY9EVPMxYM2uw1bPlNbiLr6QciMyfYZeADVYVdBkm0wnLjaUkHvx2mW9+VXjCgAOduzFTbzyL
	eI20+f+Q37GQ0Z6tkfdn+wXw+JSBgwJPzDF1TKl908X0NYMVNURDCqp5Zk8EoMhiQa6jEKYLNWbkh
	o24Z6uJ3OBp02G+ZxFVeoV5FEZsKtrpbt3e8dciZ9hRIMPXsw6I/DQp/RKvnmZ5cRe7/yUdFArYo1
	ek+vsJ5WNN5e62G39/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRQNj-00000006QEb-1n7n;
	Tue, 17 Jun 2025 07:05:19 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRQLh-00000006Pr3-00on
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 07:03:15 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7485bcb8b7cso4224038b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 00:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750143792; x=1750748592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UdGSRBtW3zJuEa1jcNBnGiuq7LhCNm0hvyprzoUF+I=;
        b=lzRXZvpj7zQO0PYZFEW8ERuZDlxHhS8nF6VAKo6WAokf8RAfopMykuosch2KXeOjrt
         5jQsSBA4mTkXx7vT5DtG2lxfuw1dFeT3b7pBEYDD/ZWzL0UXY6WQjR1ug2K8B5abwWCX
         RSJxsCfKGQFG5OOQ6Cvihdw5pi167KIircN3SnW6Ly1V6c9TDMqVjPbjBlt+WNlfWEEf
         oer2RHdIMTsU7n6GAnxja03GoQJgknDQ5rmuqsEqKEq8S+V7Gs6AXn46Vr+/Wf2JpWmS
         lSPgStE4mPJXfBhg4z1cOHaqa5wC1G3D2P4b1AtG6L1WlsPjh0un+3VG7F7lsCOJtqjt
         EKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143792; x=1750748592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UdGSRBtW3zJuEa1jcNBnGiuq7LhCNm0hvyprzoUF+I=;
        b=R3pFzE22T/ODU2wHYL+z3S+o7ywUMUQbYkH3n6vPJTpJzlqHI4dzNhHj3Q76Lzmiw3
         HBFM3iQvU7jxkhEs7rq0Ry7HAPpYtJkBzkObXID36zjiy8sw8zTFD5B1nm5H2ENScrZK
         s5GC8RmQCRQZicSbLyZ39tHF6PZkGPOdlwdWQ6J7/popF1ozFbz3h24/FfRy0k+5isSN
         7WzL4FPOkhHgGFnQi4WDrjfcS6lX4jSYI91GIita4CzGmtenW7RzqKyHdeD4atRk5CNp
         EHUB812pm+swdZlf7TE6AgnL2TnM9WVI2jrFdhloDZNE1uEqCuGGAVwn16c6G0xcqYRc
         gS/A==
X-Forwarded-Encrypted: i=1; AJvYcCUonJjjoFGsFVKOLMrynzn6OXbtIDyiRUYMFoU9W7aeRk2GuajdyYeUshU62i3ruaB67bppxIb+/kjKFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfODQ4rQjP8ldyeOJ5jWAcWOg34Kh0XD6lqxpgSQc3NNSCbkCO
	h1glhJXlWfbmBFUAJgU8CQiMnGmM6zI9PSXuVFuttozB+6wvOyJ/+1Li
X-Gm-Gg: ASbGncsJIwyR7lnNIQU3lFXXIwNF8UvbxAGlcN65AW2lSRG7Bocn55pu2aGJl3rUuaU
	r1kxZl0DLCtEN/5xp3XMt4jqL54nBcXa7sF+9egUU9HO/4LLBm/bjktwSWwrPWoyxOqRAYGtBoM
	FZytiFgRirmYMOTLRBNq4voNNhqAHvD6I0kXbEeLdgojjI2S+EDRWsJe2lz/zObZkB90BPwBW7l
	ETEHGcsMpF9DmLW7fgvsWm9h8S1mLPfjjOWpy0U8uezVb5ymNM5d1sPU0wJfG0g9ZWsI6AV9JON
	2dAPfXZTdswB5A0gSNzKYxfutPyCpplJuTgRnqX+TlR1rs7MxtFMMXQJsIq6rA==
X-Google-Smtp-Source: AGHT+IERdIRVvngfHGqJxfX04eOz9nZM4qur7mID14p1Iyz5B4TsKxuW2OSyqquX4OQBh6x7oRRpeg==
X-Received: by 2002:a05:6a00:846:b0:73e:1e21:b653 with SMTP id d2e1a72fcca58-7489cf5a90fmr16117748b3a.5.1750143792204;
        Tue, 17 Jun 2025 00:03:12 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-748d956442bsm300539b3a.35.2025.06.17.00.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:03:11 -0700 (PDT)
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
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v4 3/4] riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
Date: Tue, 17 Jun 2025 15:01:41 +0800
Message-ID: <20250617070144.1149926-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617070144.1149926-1-inochiama@gmail.com>
References: <20250617070144.1149926-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_000313_298997_313B5881 
X-CRM114-Status: GOOD (  12.77  )
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
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Tested-by: Junhui Liu <junhui.liu@pigmoral.tech>
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
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
index 000000000000..7e7c5ca2dbbd
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
+#define RST_CPUCORE0			288
+#define RST_CPUCORE1			289
+#define RST_CPUCORE2			290
+#define RST_CPUCORE3			291
+#define RST_CPUSYS0			292
+#define RST_CPUSYS1			293
+#define RST_CPUSYS2			294
+
+#endif /* _SOPHGO_CV18XX_RESET */
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

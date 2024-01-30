Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10238C47DB3
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 01:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QM6f3va/vu8ZpYe88MS+FnwEhja/J+sXkRD7sLod2D0=; b=NO6BqP9CuNvPQ/
	RpqoZNb4NtHhZKpWWM+KgrIGRLXGEyOPq6ttr6QBDyzFgsY+e3EXNx9t7PSqxyKH65huZfPE4k4oU
	tYY8PufcwxHTBuyhbyMyjnAfISdTjTicHQG+lmhdDlov8nY+GfSWRI05xOnSpd+y8CO9BJ8QoED7Q
	Sd7VY781x/WdNoRLhSCkFfucjMWWvNMaA4U6UMhWyJp3gBOLu8UudqeZk+kThbbUPs+Sz5oW4plfK
	GjoVGmMywdzMsKWCZxfQCVvCqvGqBYPF0+v7ngd8qchuI1QrwOm7YnA3qEuNdkbYEFUd/7uOHTgdJ
	/11EPYxae/z1RODalpEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdGF-0000000Esbt-0kHg;
	Tue, 30 Jan 2024 01:50:03 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdGC-0000000Esas-2cnw
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 01:50:02 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-218642337c9so1624495fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 17:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706579398; x=1707184198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juTltaRHemCcavfwicmcF+YQ/ilhPYwdWF3ZG+iZ1DY=;
        b=avrfqpC2TB5oO47OItAXKPh4+zN8emWeFxLfVfrs18dygTyGBm/Z277d2M0qGJXj8x
         fRz/gVKv5IfDL5Isl5F/rYeLclQfLm/iOe2F5iXquKiPVdMbReCW6+CT3BuHjx7Dbn5i
         yvGCh0xrcy2Hnm5RjiM31vMzD4cPR1NVCWCjyr3pPbGTiYXeUwBq9MHApkyTF+AceJUn
         8+JsdWHxyAeNoYcLIG31ePVV5EpXVatryy79HNKxdIE7dTvsFqQo9c8yxFKQn+ZXVIjP
         y/W5wbI/OM2rFC9UvlaVoPx/DiLGfunlTTJs2Vq2BIGEg7yS7NHZDPhtivIIWX4D/Ohx
         YTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706579398; x=1707184198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juTltaRHemCcavfwicmcF+YQ/ilhPYwdWF3ZG+iZ1DY=;
        b=QHRJqYxX+6vEO5e6ELnCbIMmIQJsUFGqqsUAocB5MqXCU6c8xk80tmh80b9OnQWvPf
         hbRpizksZ2tqQMHn4+UZyIp/Oza2fHFFe5TnKOhVqlHl6WUBkPgsJJdmy/oA9bOsw6v4
         1Kg4DKcXKv5nHhbenRG8oH8UC3njV5e5RERGdO6r1/aklTMdKI247jruUdxrkYJsOYJG
         RL7ynbR/mCQDX7/pX7MrT17bKddATHvo5H9ADgAQgXrkPV1Jy14k+kMYpN6X7GFomw4i
         oUOixZ4KEpRqnLvBvhbJTmpcsDiorzmqgo0V0qVyRkZz2Gyk1j+87LU6r4ZIS6u7iOno
         KSZw==
X-Gm-Message-State: AOJu0YxGu+KtcG+eghw8uaYk+eGCHDz8QxtJMJs7Qu4GmQGTPd9phQae
	dhPnh5nGiEfG9cejdbPB6ial4o3iGVa8J4iLiKLNOXZ/RYO4umKh
X-Google-Smtp-Source: AGHT+IHFwIztoAKmouJ2ISxEyX8d2luZETfQl7oA7Uu2cy1y/m4y5eg882Q8cjHqaLw5+kKYn6Ucvw==
X-Received: by 2002:a05:6870:169d:b0:205:f733:1169 with SMTP id j29-20020a056870169d00b00205f7331169mr8551171oae.56.1706579398465;
        Mon, 29 Jan 2024 17:49:58 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id he24-20020a056870799800b002186b9cc12bsm1359044oab.5.2024.01.29.17.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 17:49:58 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	p.zabel@pengutronix.de,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/4] dt-bindings: reset: sophgo: support SG2042
Date: Tue, 30 Jan 2024 09:49:45 +0800
Message-Id: <35c348437b6e18972ccaf90d9c38040caccd1f11.1706577450.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706577450.git.unicorn_wang@outlook.com>
References: <cover.1706577450.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_175000_693692_F2199FF8 
X-CRM114-Status: GOOD (  12.82  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add bindings for the reset generator on the SOPHGO SG2042 RISC-V SoC.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/reset/sophgo,sg2042-reset.yaml   | 35 ++++++++
 .../dt-bindings/reset/sophgo,sg2042-reset.h   | 87 +++++++++++++++++++
 2 files changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
 create mode 100644 include/dt-bindings/reset/sophgo,sg2042-reset.h

diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
new file mode 100644
index 000000000000..76e1931f0908
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/sophgo,sg2042-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 SoC Reset Controller
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+properties:
+  compatible:
+    const: sophgo,sg2042-reset
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    rstgen: reset-controller@c00 {
+        compatible = "sophgo,sg2042-reset";
+        reg = <0xc00 0xc>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/reset/sophgo,sg2042-reset.h b/include/dt-bindings/reset/sophgo,sg2042-reset.h
new file mode 100644
index 000000000000..9ab0980625c1
--- /dev/null
+++ b/include/dt-bindings/reset/sophgo,sg2042-reset.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Copyright (C) 2023 Sophgo Technology Inc. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_RESET_SOPHGO_SG2042_H_
+#define __DT_BINDINGS_RESET_SOPHGO_SG2042_H_
+
+#define RST_MAIN_AP			0
+#define RST_RISCV_CPU			1
+#define RST_RISCV_LOW_SPEED_LOGIC	2
+#define RST_RISCV_CMN			3
+#define RST_HSDMA			4
+#define RST_SYSDMA			5
+#define RST_EFUSE0			6
+#define RST_EFUSE1			7
+#define RST_RTC				8
+#define RST_TIMER			9
+#define RST_WDT				10
+#define RST_AHB_ROM0			11
+#define RST_AHB_ROM1			12
+#define RST_I2C0			13
+#define RST_I2C1			14
+#define RST_I2C2			15
+#define RST_I2C3			16
+#define RST_GPIO0			17
+#define RST_GPIO1			18
+#define RST_GPIO2			19
+#define RST_PWM				20
+#define RST_AXI_SRAM0			21
+#define RST_AXI_SRAM1			22
+#define RST_SF0				23
+#define RST_SF1				24
+#define RST_LPC				25
+#define RST_ETH0			26
+#define RST_EMMC			27
+#define RST_SD				28
+#define RST_UART0			29
+#define RST_UART1			30
+#define RST_UART2			31
+#define RST_UART3			32
+#define RST_SPI0			33
+#define RST_SPI1			34
+#define RST_DBG_I2C			35
+#define RST_PCIE0			36
+#define RST_PCIE1			37
+#define RST_DDR0			38
+#define RST_DDR1			39
+#define RST_DDR2			40
+#define RST_DDR3			41
+#define RST_FAU0			42
+#define RST_FAU1			43
+#define RST_FAU2			44
+#define RST_RXU0			45
+#define RST_RXU1			46
+#define RST_RXU2			47
+#define RST_RXU3			48
+#define RST_RXU4			49
+#define RST_RXU5			50
+#define RST_RXU6			51
+#define RST_RXU7			52
+#define RST_RXU8			53
+#define RST_RXU9			54
+#define RST_RXU10			55
+#define RST_RXU11			56
+#define RST_RXU12			57
+#define RST_RXU13			58
+#define RST_RXU14			59
+#define RST_RXU15			60
+#define RST_RXU16			61
+#define RST_RXU17			62
+#define RST_RXU18			63
+#define RST_RXU19			64
+#define RST_RXU20			65
+#define RST_RXU21			66
+#define RST_RXU22			67
+#define RST_RXU23			68
+#define RST_RXU24			69
+#define RST_RXU25			70
+#define RST_RXU26			71
+#define RST_RXU27			72
+#define RST_RXU28			73
+#define RST_RXU29			74
+#define RST_RXU30			75
+#define RST_RXU31			76
+
+#endif /* __DT_BINDINGS_RESET_SOPHGO_SG2042_H_ */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

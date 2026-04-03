Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4014E7E378
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 11:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JASQDl7QrTIutrrnlN7jv2B/ZlSdkd7ElLeSR4L6uw=; b=GPRVWmrNFd3SBg
	UnkUfyQvdFMQvAQ55Bua3jaoSTkA3Ms2AsHu52A5X0RQZV649YID/eE4KUMSrpkBYjNNu+Ky30f9W
	BiK+wHkgPyWQh9pQBEJrHe8cHrwGriTyodmEe+b741tH2Mz6cb21qVGk3w4yj3A+DYAOLDVoIywNm
	cTmyrb93XyP8Rb+Maloz+LsJ823YXvsP/UzR9SUQLnfxSZPf2MtBAsygEU4aCedXPazVhsb9B/3FK
	/Muwdu384JWs6vnRIufQOJTwSHuPuK3cMJ7CnDxyNoFqFuGlJSD21K5gaSxhsIARuTz9jLWGk7Sij
	pRVH1v3QHhFyceP42qSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cVU-00000001voV-0iSB;
	Fri, 03 Apr 2026 11:16:08 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cVS-00000001vnA-00ET
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 11:16:07 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-8a4b8c3a30bso24417556d6.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 04:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775214965; x=1775819765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJAPLXH+JSPAdQeklsWr8qGoeKpyEbUrtjYWuQxTQmo=;
        b=WRbDIJurrC6C/xE0JNV2Qf5yVG4DTrj7w8imxAhnfoM8oN2hZQJmaEkE1BZzHRKpaz
         O5oxHKYdIBMxmHzR6r51GYlRKtNKhkevEKdrTdT2CuiJoUuBqwpUGUc0reM10nPvpExw
         0nbrGWpWu8QGPUpJc0JaSsBHyuvs0v6qLjjE9p3YRZRQXJp5ED7R83fFltNh4tY3eKF4
         iwY8ps4bWRkHPkAg+glpdl08mImKqBvjIQShqbt5W7dLQ/bqWF1NZYDYkjRw1VGec2gR
         7W6tVD7srrj/BTy15hQROy1TKppbHd5Fgr/fmAz17m+EOONxsH1no8GGTLjt5rBs+fzt
         Og3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775214965; x=1775819765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJAPLXH+JSPAdQeklsWr8qGoeKpyEbUrtjYWuQxTQmo=;
        b=Zq0v9v+luJ84cmybPfXy1uv9DpnkJlSfbZf4FKvlLH23TDbhBr468lSfPGJ8aNG5fx
         vugSu1vPsM3jtr5ptQLyQs0EJc94PCbP0EyBrcqxyEGZyTZeJxnqyRc3KWTF8tRMz7v4
         hdCZBDXLnEzgMSF/6ID4nSOsQxedJiHd06zjOtIwPOQPXMrsMwXM0xvbDu1jXO02fxxT
         HWi1uA4OGSNhCaQmzuq4K8XP5PvctqEJM349fb3gjs3Gzm6UzRZNmMhsZ+YC/SqI3Kx0
         gkmp63cSWImuwITRn8BBQTO5lUhjwWQYc7xUT+tLNwKPIX8feYjYhb/NKOzfa9KcMSJn
         UP+w==
X-Forwarded-Encrypted: i=1; AJvYcCVOTXK6RaXVD/7DwzuRE4gkYMC1ff4ZVT+4yVgt+eggmhOn3SjapReDDp4K5MSpz8s97whG0cKyjzoCcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFdFMv8tuKGAXirm1t4eTWLaMEA7oFbixazC2c2ABWvsla01oJ
	ss9YotrwZAZlnxMDzfVDW7R8FPqq8QU8zKHfZdOEguwlL7fqU2oIA99n
X-Gm-Gg: AeBDiesb6cPIdyMtEVI+uEHSJ7+NdIDuIuHdoBMLzlNjBSr7qm0b/HD3tTUlfTvVNAH
	JKMh5V1nbacp6bKKJWMNd6Iq5JtlNO+Y7/TeYTHp+cr4ULzBD/4HRfPWS77XFuUvyRFqbN8QjWu
	A2S+K9bSX71qsXTmSeksX29qDub1yF+n2V3C2oaeLh4/DCY+97w93nQMaW62UhsWhGFyO3w0UyQ
	4eh4c5PCScn0i2XysV1YfnZPIgEDP23U7lKuW6gnWUp3de9yvMp38V0snhZeKsaNp4yQNa09yPs
	U8V8nwcnI9pkpg3C/tTLSHUg54fNn8GHMd7lwsxaWNaLTmcg7bvU/96bZM9x1wzHZyjbRX8bfdi
	cXE3K1ZaBEM+mXSopmzxvNrIvWJqvO0QMWZE2dNZ9FLUvytCSv6aWzc/KKm3A8o8TtvWod8fTd9
	Grogc6Fy+KF7P7BlM7GGiIBW1LuunwbHRWYmIwImo=
X-Received: by 2002:a05:6214:55c3:b0:899:a91a:2e08 with SMTP id 6a1803df08f44-8a704bb920fmr38024396d6.52.1775214964596;
        Fri, 03 Apr 2026 04:16:04 -0700 (PDT)
Received: from sleek.hsd1.nh.comcast.net ([2603:3005:1473:4000::71a3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974e8e8esm45319836d6.43.2026.04.03.04.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:16:04 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 4/5] riscv64: dts: sophgo: add SG2000 dtsi
Date: Fri,  3 Apr 2026 07:15:15 -0400
Message-ID: <20260403111516.379795-5-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403111516.379795-1-josh.milas@gmail.com>
References: <20260403111516.379795-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_041606_068270_21C4DF47 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

Adds sg2000.dtsi on the RISCV side.

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2000.dtsi | 53 ++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/sg2000.dtsi b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 0000000000000..412adacc00576
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "cv180x-cpus.dtsi"
+#include "cv180x.dtsi"
+#include "cv181x.dtsi"
+
+/ {
+	compatible = "sophgo,sg2000";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x10000000>;
+	};
+
+	soc {
+		interrupt-parent = <&plic>;
+		dma-noncoherent;
+
+		pinctrl: pinctrl@3001000 {
+			compatible = "sophgo,sg2000-pinctrl";
+			reg = <0x03001000 0x1000>,
+			      <0x05027000 0x1000>;
+			reg-names = "sys", "rtc";
+		};
+
+		clk: clock-controller@3002000 {
+			compatible = "sophgo,sg2000-clk";
+			reg = <0x03002000 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
+		plic: interrupt-controller@70000000 {
+			compatible = "sophgo,sg2000-plic", "thead,c900-plic";
+			reg = <0x70000000 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <101>;
+		};
+
+		clint: timer@74000000 {
+			compatible = "sophgo,sg2000-clint", "thead,c900-clint";
+			reg = <0x74000000 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
+	};
+};
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

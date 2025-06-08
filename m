Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1085C5AD49
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 23:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ek8mSQPGZhLI967kdFQgTp+JxkReZd23t3U8Gl00W/w=; b=pyExACzmbzcmoO
	ifKXWdNtI+cfuuKDOXVwgJkSGGIQxzYHuWGov6FngbB/mDY1MmNKI7wLvULiiSXWyEWOS8HNhwvIQ
	63L14C9GM85EhAXHGDHl6GW76eMlRUZi8aFU37JeufxCThzchbqjvIVlJH0bKt3EMUC2dUhgKKfL/
	wwO2MHLtGb3k1cY8NARgsI7lNAVMYO+3bq6Ud59jr55XJ/lDEHY5pJ/bI5kwQ+eniYGaqJ/Ba/5JJ
	crwNpqcDm+i9xbw29UBXZt7ma23smZ+NkCiwe50eqLQnyi+fOE9JG4WDcPXherZhIzS/LNofYUvjC
	7DVduIkr5WHTUjfoDfgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSa-000000037Dz-2ZjK;
	Sun, 08 Jun 2025 23:29:52 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSY-000000037DD-1C8i
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 23:29:51 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7cadd46eb07so413252985a.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 16:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425389; x=1750030189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRmOcfIym+jztFj2oNw/dbYG2NDcS8k8iQRMon2PBA8=;
        b=Hhs/fJXBpTRIx9nWXCSO7ybv96um17h8QrWzuYWyjw9S3yOATNF5GN/8nf/H8F0HcY
         8PSBI3KkXdj+BA5ipUiPevc4IQeYprSrn8Lm547Tf4H17FA+OjCrsELQy2+Neiv2j2HK
         dPXeJ/+a8/iGXfWCL0XCrYNA+XBMS8FRQdcpiCeA6eXqZkFoiPJsH2meY+V6u2wjw1RQ
         2Bw4RjLV2050iuqjGETiWS0UC9oAeyt0/JF4jkWSfxTfJ9p6dT/PK6xgOyYDo202nvjf
         XXOOzcn/RDxJG7WZNtnlN6xZfZBUnbvYhdy+UJCdGIRUgSzCTxnWs7p9xxjqay8YlGpR
         SP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425389; x=1750030189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRmOcfIym+jztFj2oNw/dbYG2NDcS8k8iQRMon2PBA8=;
        b=v8zg1Y2xFNcLHVwGJpcK4kkH5BsraieV7FiIa+a7DboE3hLhhD95vs60wipLhM9PzE
         tDaOwwRjmD9KqiOaYZ61xgRAFGRtxInpBFULgg5q1oLGNAK5JkMJm53advfITOTO+oI1
         JJMPJI7L+dQorBq0hBNIMH81hoNW17UJM2uPXUnmiYd0KKEPLVhx07EQxzLYJM+Wztop
         prz/aA1TmEfWpbTwk1b3Gezj5RWAkxJYxfIJwbYrHBm7KmLcASi04JxUJu6N2f/O7pto
         myR+y8pfSyf1aOaum4VQdcRS/VcTaFt8jN2NsRnGhVrw1opDgTJ+iYgePWdz1LhkuXNw
         DjNA==
X-Forwarded-Encrypted: i=1; AJvYcCU1Fk1i0wj3ybCs0CYVXFn4P7h40YZFSg6slOUy3SIgyDXoFaZPr9CE6qmUArNQeDwfNod+V8+IwpJ6gg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsjBiMSZC/9TkoYlTw7OY/QcMAT6JJC/qe3WGXSmCWSTb/WmzD
	Krxt68IOt+iqWJ9UH+ZIk53dP7LFlLys+wvjwGcsPAzk5k36A0mzZ1bTKZvYiIX8
X-Gm-Gg: ASbGncvf0awIZk17LRID1HBc/580dWSv7h86dV3Owi+V2qCYcELQjXVXOSwcWXwk6eZ
	dXxjXcM1DAaqrJdmPOcLGJYlgw6IXk67yWiNdMRiYavEooYuBcvLNx10qvCIxNM2A//fG3EZ4+E
	GQBhd58cfJHfW3uSLEcHAr9IJbrnC6lIsCyoHCkNeVeuXPY5mbry87nng9hlm3z4WlxkrFLy9Vc
	qHkdgLn+8Dk9kpEt1nIHv643AsoFBFTGrCM31FSzVXEnoNnvUSkNR6cy0n1SfUIckT6C7NdxsFN
	D1qfn98LM78FhQ7n40SPjE9lIX5obuqVMFpdgA==
X-Google-Smtp-Source: AGHT+IE5/Gz8qqya3fci5rtlQe9R/OPJWsD97+s3Z1RsEKIEirjoWmQf9uF/h0NVyozgqLtYvjZHjg==
X-Received: by 2002:a05:620a:4154:b0:7cd:c6:40f3 with SMTP id af79cd13be357-7d22985c859mr1849137885a.2.1749425389266;
        Sun, 08 Jun 2025 16:29:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b2abfcsm43841216d6.104.2025.06.08.16.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:29:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 02/11] riscv: dts: sophgo: sg2044: Add clock controller device
Date: Mon,  9 Jun 2025 07:28:26 +0800
Message-ID: <20250608232836.784737-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_162950_323448_2EEF6009 
X-CRM114-Status: UNSURE (   8.14  )
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

Add clock controller and pll clock node for sg2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 34 ++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index a0c13d8d26af..d21a59948186 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -3,6 +3,8 @@
  * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
  */
 
+#include <dt-bindings/clock/sophgo,sg2044-pll.h>
+#include <dt-bindings/clock/sophgo,sg2044-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 #include "sg2044-cpus.dtsi"
@@ -32,6 +34,9 @@ uart0: serial@7030000000 {
 			compatible = "sophgo,sg2044-uart", "snps,dw-apb-uart";
 			reg = <0x70 0x30000000 0x0 0x1000>;
 			clock-frequency = <500000000>;
+			clocks = <&clk CLK_GATE_UART_500M>,
+				 <&clk CLK_GATE_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupt-parent = <&intc>;
 			interrupts = <41 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -44,6 +49,9 @@ uart1: serial@7030001000 {
 			compatible = "sophgo,sg2044-uart", "snps,dw-apb-uart";
 			reg = <0x70 0x30001000 0x0 0x1000>;
 			clock-frequency = <500000000>;
+			clocks = <&clk CLK_GATE_UART_500M>,
+				 <&clk CLK_GATE_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupt-parent = <&intc>;
 			interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -56,6 +64,9 @@ uart2: serial@7030002000 {
 			compatible = "sophgo,sg2044-uart", "snps,dw-apb-uart";
 			reg = <0x70 0x30002000 0x0 0x1000>;
 			clock-frequency = <500000000>;
+			clocks = <&clk CLK_GATE_UART_500M>,
+				 <&clk CLK_GATE_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupt-parent = <&intc>;
 			interrupts = <43 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -68,6 +79,9 @@ uart3: serial@7030003000 {
 			compatible = "sophgo,sg2044-uart", "snps,dw-apb-uart";
 			reg = <0x70 0x30003000 0x0 0x1000>;
 			clock-frequency = <500000000>;
+			clocks = <&clk CLK_GATE_UART_500M>,
+				 <&clk CLK_GATE_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupt-parent = <&intc>;
 			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -83,6 +97,26 @@ syscon: syscon@7050000000 {
 			clocks = <&osc>;
 		};
 
+		clk: clock-controller@7050002000 {
+			compatible = "sophgo,sg2044-clk";
+			reg = <0x70 0x50002000 0x0 0x1000>;
+			#clock-cells = <1>;
+			clocks = <&syscon CLK_FPLL0>, <&syscon CLK_FPLL1>,
+				 <&syscon CLK_FPLL2>, <&syscon CLK_DPLL0>,
+				 <&syscon CLK_DPLL1>, <&syscon CLK_DPLL2>,
+				 <&syscon CLK_DPLL3>, <&syscon CLK_DPLL4>,
+				 <&syscon CLK_DPLL5>, <&syscon CLK_DPLL6>,
+				 <&syscon CLK_DPLL7>, <&syscon CLK_MPLL0>,
+				 <&syscon CLK_MPLL1>, <&syscon CLK_MPLL2>,
+				 <&syscon CLK_MPLL3>, <&syscon CLK_MPLL4>,
+				 <&syscon CLK_MPLL5>;
+			clock-names = "fpll0", "fpll1", "fpll2", "dpll0",
+				      "dpll1", "dpll2", "dpll3", "dpll4",
+				      "dpll5", "dpll6", "dpll7", "mpll0",
+				      "mpll1", "mpll2", "mpll3", "mpll4",
+				      "mpll5";
+		};
+
 		rst: reset-controller@7050003000 {
 			compatible = "sophgo,sg2044-reset",
 				     "sophgo,sg2042-reset";
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B44CC3ABA5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 01:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SCWDiAY3AxDai7t+dQxMJk8Y/rR6wQbUUoN/P2pMuI=; b=evwze3JrbFJcAU
	wQY967S1vgACH5wtqnug/+Q9EnVXjrwzJevaibF8He6BDQP/4qiicCMbTr9PY42oq75gKAVia3eRP
	VU26s0WRdsCcIT0TPZ3dknQ8/v9L4sFaeGJKw66A323gsfcfLp9Q6RVO7Z0dnRHzNaFHAJ7fU97Ak
	YFZy9MRRaauouGjh2hcNc7P6vqroSGlsUVOAFy7qKmBrr0R1SSDxU6P9vh5nd3kHADhwyCwjjTcyP
	C2pu3paNheizDf7dM+nPWKWOliQsI9K0DEDvIwwgI5CQjq8T8vSoiu+MhpVs2orezjGgzAXh81lQE
	g1TatL18jghvLP32S3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wEI-0000000BRH8-1Ysa;
	Wed, 30 Apr 2025 01:27:18 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wEG-0000000BRGA-2ZNu
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 01:27:17 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7c08f9d0ef3so421253585a.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 18:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745976435; x=1746581235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqOgteceJ97EqtrfFsHCyBg+ecnlV+lK+Sepl7glG9Y=;
        b=BPzAtm0rMHPj7+7+0QT7Fw4x8njaBKyIacXhhRIyp7QvyFeLB1C9Pj4mC5pUcQlNhv
         BJh8JU8LR9F5TqJ1fnbl6xygeYQ8ZPjHs0Z8uC3wCwGY3fz+WGLZQsXjtW1zgWEO91j8
         6hMLBv3+zxxQcfq8A3aiNJuMmHG+nNR2LH3/rHDL/J7hTdVQTLKPUuiqWseJq76dlf0Z
         9wjJZFsSge/KGQihwxYEOwj8k464cAOeBdT8u+u2ra/VBR8wlHM9SINNELMkZ7z840Ud
         NCla613b69SDEY/MsxVlbKLjVtYkRfGhij9NdtwKpss6RAe4fw47qzSD/IQjhcXYM14I
         Rziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745976435; x=1746581235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqOgteceJ97EqtrfFsHCyBg+ecnlV+lK+Sepl7glG9Y=;
        b=E8s3pTc7ub5GZatMdw0gVy1fiaewdWI/Bm5MkgT2M3rwP6hTB8wV1XlWMzHuH8rmiR
         /iZH9TcTwMEszOafMr+D6xRLuzD29hd3ybHtsvhlKCRBwxsQZ7tXEBAzoqbCIgFpSDIG
         tx32UVAmiGXMTbTdOzhm8Wq26zzWIQtXTeKhNyPii82Yb5aDnHgwIJNptRQg8DBCfa4c
         SqKLQT0NQcK7JvSFqJN7K1cTRGxrBo/eWNtwV1Wg0YpRFJLZtswVda3zSn0+hdo9ZwYL
         ou1enZSjTo13WfgUVZ0e2GzCYpOfGcleTTzbipmUrzHBPg3BM4R6szmuXKhuW4FZsai6
         X4kw==
X-Forwarded-Encrypted: i=1; AJvYcCX0+LLC2Oy+sh6bnFIblEKEbl1O5aj57c/uSkR3OehQmrYM3/DlrxC0O61cz3LUJqovHlw2NygMa9gSSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaTGAhVY82SkgENrlL40vuZ3e5iVzgT4O56w3ovIzzHy+r4Xqa
	dmX4LffPsUzCsKmAt1ouHbxAHR0SRQz+fkSbJAct9GY2S3GuXSOi
X-Gm-Gg: ASbGncsgEnpNrGi1RCuaM0/093bpP070raR1W8MAKpJ/fIKf4bK7nnhz76KIFPgQWLy
	g1891u7LA6BbaEJc9U27kjFnq6chQ6WPKvQBUSFXeJhTu3BNfQRg+PklCu0h9+VnDd0zhdr9mSk
	bAy63EGhPVDECDbix34HxQQehrbDnUOPnTQTuGkVTXTFCK2bZkkNw1bXUqCd/TXaeDyf6mv5lOa
	fc5WL69a7XYaz2i/G8e4OfvieWe4F+4S1s+H2aXb2OkDM6oEuOU+c5i9TlJTzNKsU+4EG9Lw02e
	lwZPU05RRzjKh0Ds
X-Google-Smtp-Source: AGHT+IFznVwOf+7rTL3cFYJFJLEVhnwOPHd8m3x4Z5Bx6Mo8zEqI8CE8JP0GuGQpjVtULfwA4CqyEw==
X-Received: by 2002:a05:620a:2a0f:b0:7c5:6ef2:2767 with SMTP id af79cd13be357-7cac74086famr152959585a.2.1745976435289;
        Tue, 29 Apr 2025 18:27:15 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cac60e24d4sm68062285a.39.2025.04.29.18.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 18:27:14 -0700 (PDT)
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
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/4] riscv: dts: sophgo: Move all soc specific device into soc dtsi file
Date: Wed, 30 Apr 2025 09:26:50 +0800
Message-ID: <20250430012654.235830-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430012654.235830-1-inochiama@gmail.com>
References: <20250430012654.235830-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_182716_652717_BB962C42 
X-CRM114-Status: GOOD (  13.21  )
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

Although the cv1800b/cv1812h/sg2000/sg2002 share most peripherals,
some basic peripherals, like clock, pinctrl, clint and plint, are
not shared. These are caused by not only historical reason (plic,
clint), but also the fact the device is not the same (clock, pinctrl).

It is good to override device compatible when the soc number is small,
but now it is a burden for maintenance, and it is kind of annoyed to
explain why using override. So it is time to move this out of the
common peripheral header.

Move all soc related peripherla device from common peripheral header
to the soc specific header to get rid of most compatible override.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 38 +++++++++++++++++--------
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 38 +++++++++++++++++--------
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi  | 22 --------------
 arch/riscv/boot/dts/sophgo/sg2002.dtsi  | 38 +++++++++++++++++--------
 4 files changed, 78 insertions(+), 58 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index aa1f5df100f0..fc9e6b56790f 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -15,23 +15,37 @@ memory@80000000 {
 	};
 
 	soc {
+		interrupt-parent = <&plic>;
+		dma-noncoherent;
+
 		pinctrl: pinctrl@3001000 {
 			compatible = "sophgo,cv1800b-pinctrl";
 			reg = <0x03001000 0x1000>,
 			      <0x05027000 0x1000>;
 			reg-names = "sys", "rtc";
 		};
+
+		clk: clock-controller@3002000 {
+			compatible = "sophgo,cv1800-clk";
+			reg = <0x03002000 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
+		plic: interrupt-controller@70000000 {
+			compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
+			reg = <0x70000000 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <101>;
+		};
+
+		clint: timer@74000000 {
+			compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
+			reg = <0x74000000 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
 	};
 };
-
-&plic {
-	compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
-};
-
-&clint {
-	compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
-};
-
-&clk {
-	compatible = "sophgo,cv1800-clk";
-};
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index 8a1b95c5116b..fcea4376fb79 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -17,23 +17,37 @@ memory@80000000 {
 	};
 
 	soc {
+		interrupt-parent = <&plic>;
+		dma-noncoherent;
+
 		pinctrl: pinctrl@3001000 {
 			compatible = "sophgo,cv1812h-pinctrl";
 			reg = <0x03001000 0x1000>,
 			      <0x05027000 0x1000>;
 			reg-names = "sys", "rtc";
 		};
+
+		clk: clock-controller@3002000 {
+			compatible = "sophgo,cv1810-clk";
+			reg = <0x03002000 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
+		plic: interrupt-controller@70000000 {
+			compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
+			reg = <0x70000000 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <101>;
+		};
+
+		clint: timer@74000000 {
+			compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
+			reg = <0x74000000 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
 	};
 };
-
-&plic {
-	compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
-};
-
-&clint {
-	compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
-};
-
-&clk {
-	compatible = "sophgo,cv1810-clk";
-};
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index c18822ec849f..805b694aa814 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -49,18 +49,10 @@ osc: oscillator {
 
 	soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&plic>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		dma-noncoherent;
 		ranges;
 
-		clk: clock-controller@3002000 {
-			reg = <0x03002000 0x1000>;
-			clocks = <&osc>;
-			#clock-cells = <1>;
-		};
-
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
@@ -344,19 +336,5 @@ dmac: dma-controller@4330000 {
 			snps,data-width = <4>;
 			status = "disabled";
 		};
-
-		plic: interrupt-controller@70000000 {
-			reg = <0x70000000 0x4000000>;
-			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			riscv,ndev = <101>;
-		};
-
-		clint: timer@74000000 {
-			reg = <0x74000000 0x10000>;
-			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
-		};
 	};
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
index 7f79de33163c..df133831bd3e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -17,27 +17,41 @@ memory@80000000 {
 	};
 
 	soc {
+		interrupt-parent = <&plic>;
+		dma-noncoherent;
+
 		pinctrl: pinctrl@3001000 {
 			compatible = "sophgo,sg2002-pinctrl";
 			reg = <0x03001000 0x1000>,
 			      <0x05027000 0x1000>;
 			reg-names = "sys", "rtc";
 		};
+
+		clk: clock-controller@3002000 {
+			compatible = "sophgo,sg2000-clk";
+			reg = <0x03002000 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
+		plic: interrupt-controller@70000000 {
+			compatible = "sophgo,sg2002-plic", "thead,c900-plic";
+			reg = <0x70000000 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <101>;
+		};
+
+		clint: timer@74000000 {
+			compatible = "sophgo,sg2002-clint", "thead,c900-clint";
+			reg = <0x74000000 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
 	};
 };
 
-&plic {
-	compatible = "sophgo,sg2002-plic", "thead,c900-plic";
-};
-
-&clint {
-	compatible = "sophgo,sg2002-clint", "thead,c900-clint";
-};
-
-&clk {
-	compatible = "sophgo,sg2000-clk";
-};
-
 &sdhci0 {
 	compatible = "sophgo,sg2002-dwcmshc";
 };
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

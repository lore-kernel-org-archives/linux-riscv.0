Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDC5C04FF8
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 09:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODSPDGpdYEi+TtHX6/sYHsb18aqUzJ9cKRbwKcsCtG4=; b=fCUEG5PISCxW2h
	4sWGeHFgZ5kUY56Rt+Ibk22E8cZ5nB4ZqQlx+WWKriXWX/mUIHMwXBr2zex6Rg1zblctqdNWSSgZc
	axhGYB/a4/KiHPgF5Lz6gHBCuot16NeoM+bCgnTWXcQRIs4oWfqUPYbXYZrd1mfRExsrSWnJP5FxP
	yB1bvRSbAMIzy3+ZRomWioGK5CRauNiwulHpj46kKpeypnniY/bQdeKlq8AogA1oaYcCVHxGSxO80
	40SqvR7dwxxFnUBxffW/pyuH8ymd7XhYeA5IOD02j+SX3QTEXW5I1wslnzzXNJpQ4cXZsFqlGO6gY
	AYj3yBN4spjBa67Hs+kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwfTR-0000000BfGQ-0mUl;
	Tue, 16 Apr 2024 09:51:33 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwfTP-0000000BfF8-1cWb
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 09:51:32 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6eb7b6f92d4so1267745a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 02:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713261090; x=1713865890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKVl3O7EHtWd97mA3oU7jwLqrHCbe1j887QmZeXMuow=;
        b=mej0hjMjmlc0csm0OkilSzQy2wjJC9r0ID0B/dxLpb65HyPLvEE2RYQx3fBAzxN3ne
         puFn0CQPu4V1UckjVnwc0iZOLHhdU6bxgfxTK7PBSttKHgTzq3BzPkduDZrUlWIUnvx3
         pfP2QZhxg504/oBc4G6V/tFCx5h38/X2DFbCJ5rIVY6AGFWj6YL6ogrmfvntC784auAD
         CJuZgN1m05KVAlaN2XYzVfEVKQK0+y6tXKHkgWIoPPxU+/z4DogMUI0iak2IN7IB6hlc
         iBe+q88KkDVFJoRsThpkIZQvtDeYY6edzlO421LWnDTeXrNwjEYtXeYjF+saXjRXbPon
         v2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713261090; x=1713865890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKVl3O7EHtWd97mA3oU7jwLqrHCbe1j887QmZeXMuow=;
        b=KGa57mHsVGgjBoPWOvrE4ydFXJwMFKhb8fa1DbLDk7a7SYiGHDQgYyMgXdtnOZ9mch
         XIOgFcInypS4O16ZycaILU+xXeRkFpZJbo9wCNbaR0K+tlDMA86LvqhaNdXPlWmyfjHo
         4JEcRUD/1PWFbBpoFF5E3NFdpvzS5mCpb+QGAzf+O1c5DeS9i+LIlW8Mi5WTGqNUBz8a
         gX1nCSH8PH8sJXnHlTjTh4mZgcmxld5UbGfBTwW2SJxBgiBjYs8w1XwlvdtIrZqpOxF+
         C/YYUIOk/BEyy78lqxCJw+HBhDYlECjQYiTzKvDjRGbE/pqUPhG4mMjY1fyUjcGxfJ0L
         dFrA==
X-Forwarded-Encrypted: i=1; AJvYcCVHTCLezeHNIn4ccEIQnVsXUxEtKkeImeYxqOeuyluL0I+QqMFCCkRKkH3gFfv8ord99/VafubFCvG1UpU2+pB5VmvjshbEGR2aRio3/plN
X-Gm-Message-State: AOJu0YzuY2zJgErOlqcqkvmTLiGQzgtNPjjT23w9HDpmvYLaMm4XR2c8
	seCRKr+kaiKTIaxCes1srDGtaMMqk6SQ23GTVTcYw3OW1FPe5MtD
X-Google-Smtp-Source: AGHT+IHl5acEs2pYbrqTh5iHgq44xiaQV4kYEp3Vhk+eWUjXxy/E4raAKDXC5MVfqMp/9gtwJB7ODA==
X-Received: by 2002:a9d:6b09:0:b0:6ea:2b0b:6171 with SMTP id g9-20020a9d6b09000000b006ea2b0b6171mr14412997otp.5.1713261089960;
        Tue, 16 Apr 2024 02:51:29 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id h13-20020a9d600d000000b006ea23d8fcaasm2190528otj.32.2024.04.16.02.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 02:51:29 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: adrian.hunter@intel.com,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	ulf.hansson@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	tingzhu.wang@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH 3/3] riscv: dts: add mmc controllers for Sophgo SG2042 SoC
Date: Tue, 16 Apr 2024 17:51:17 +0800
Message-Id: <05f55d1c83b1dd6b810ec1710b38771c03112876.1713258948.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713258948.git.unicorn_wang@outlook.com>
References: <cover.1713258948.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_025131_482201_F7503CFD 
X-CRM114-Status: UNSURE (   8.73  )
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

From: Chen Wang <unicorn_wang@outlook.com>

SG2042 has two MMC controller, one for emmc, another for sd-card.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 15 +++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 32 +++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index 80cb017974d8..c4037eff5c97 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -26,6 +26,21 @@ &cgi_dpll1 {
 	clock-frequency = <25000000>;
 };
 
+&emmc {
+	bus-width = <4>;
+	no-sdio;
+	no-sd;
+	non-removable;
+	status = "okay";
+};
+
+&sd {
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 8aab027cf730..0b176712a43c 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -393,5 +393,37 @@ uart0: serial@7040000000 {
 			resets = <&rstgen RST_UART0>;
 			status = "disabled";
 		};
+
+		emmc: mmc@704002a000 {
+			compatible = "sophgo,sg2042-dwcmshc";
+			reg = <0x70 0x4002A000 0x0 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <134 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =
+				<&clkgen GATE_CLK_AXI_EMMC>,
+				<&clkgen GATE_CLK_100K_EMMC>,
+				<&clkgen GATE_CLK_EMMC_100M>;
+			clock-names =
+				"core",
+				"timer",
+				"card";
+			status = "disabled";
+		};
+
+		sd: mmc@704002b000 {
+			compatible = "sophgo,sg2042-dwcmshc";
+			reg = <0x70 0x4002B000 0x0 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <136 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =
+				<&clkgen GATE_CLK_AXI_SD>,
+				<&clkgen GATE_CLK_100K_SD>,
+				<&clkgen GATE_CLK_SD_100M>;
+			clock-names =
+				"core",
+				"timer",
+				"card";
+			status = "disabled";
+		};
 	};
 };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

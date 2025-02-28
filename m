Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2494C19776
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 12:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tu89fERF6mbBgulSC9C9elpyropXReFGB4L23gv1aag=; b=tWLwqLBBpHtjWm
	9xK++nk+Hbx88aUaH+c62mPrr85hkPTDK+uWm8f6EnQFszXWgTA/nYonfOFa8fxc8xpt2I2IKgFtR
	jfomNLpwL4VySNltJnJfBBTjBzJMCDit6J49SoF/QQ8zaib5JKx1WlH+V3JQJ5SSHgt1PAKghUBJA
	ffF7/RDvf7rK7QOsENzYTdIxl0FXmz43+6225pH04A6/VbMAiUo+0YZQ1bBOCso6xe0oqty5jmnMr
	EK7Bl0Sd8bOXCW4JBVAweQPBtVGzQp/q1os2w7Nz2jqUe1mBvYvg5y6fhICP+OLrTqrvDl7lIeYg1
	CtUJh7leuRhmhkEKZ26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzhw-0000000AxPW-3IU3;
	Fri, 28 Feb 2025 12:43:12 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzff-0000000AwvG-2MFD
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 12:40:52 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2f83a8afcbbso3641164a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Feb 2025 04:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740746451; x=1741351251; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zaPjgAHsPYLWvjG1+7VgSdE4nc17PmUEpTLjntHG71c=;
        b=UhdAUDzbxuYkLBR0mPtlWamEkRiT84iOo6qDme7UlSVnzM+oCwRrCTabYNIGUI3kE5
         YrhnNz/djCQFzhnDUdv/e/SkRGFIp6kLUdXGa+XlUjnu+dWtKM+z3oPaUK0xSpcJxyLO
         8qwlYHpFnhN0QmwDZZztvyejfXVo61kxypoEmv7PQbsKNbsKGssR4bdlVlCeDwV5KBMt
         Nq9Nd76rAe2tz48JiI+hYrLd9tPn4Tw3aCmuCtB5OkHjMkY7wQW/AO94DexJALauU1xT
         FSh4ExWITsWhgvMUPdK+iLO8yiDUUbdYc8TPMpGCIM+QPWqk83PIj4WoiXhcMe0SoL0E
         Whjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740746451; x=1741351251;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zaPjgAHsPYLWvjG1+7VgSdE4nc17PmUEpTLjntHG71c=;
        b=YkfFxhBJAjlEwJ0uWMR5DYy/L2M23QpMofNJZHIf+xi3GgANFjTQQXf2qXCY1qE61j
         p5o4nZqjMuSb1n/P7Vu/2S4fHiUMCLarRJ6/C3Dno8MCaBkuBztYAKDFllhpDCOCuNea
         QgQE/SQ00QfJOOLpp7s4WCW5nS12t0AUyql750soplkPK9GA6Vy1pmOKRDPgYfF0Nv3+
         LLAin5G8FB3TqSibU4Umjtzzj85vaNP4mh5MQzTBkpl1wTEgzAzrlb4BJ7U05MyO9MpQ
         iqwLqOO02oOoFpmNa8K+/2NeunkwBlITaXE2ksRkCChQJcc7e4DFy8ksUfAI6QLuuH4m
         K8jg==
X-Forwarded-Encrypted: i=1; AJvYcCUJX/ADGNGz6bu4G26C9ZB1ar20bxj3F7PU7YKvKW8SCPzIn+WIUIhLwFmPXVaXD+fFIU+UjW7sEx20zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwONXwYmBx/q9EQv3KNbLqrrh2Ba7k3aerUe84N8M7rFG1SPlM4
	idIwXEkglBVVBzrMNCWEQrRZP+DQkvX7PFsZNGRTx6CmhTJe20on
X-Gm-Gg: ASbGncvJNRkN0K5MN4RCNjob911udJdOOyorMsc/GoTwCVwrpnhwsgksMFW33DMhZ8m
	rndUHBtOkbK7gn7OYPt/xQTy9Z8HCAbgZeSeZZb+3v5292HjUfUJEHzCDNTaWxZiyVhUgcd9vtU
	9YchsRpxH54pPEtIXJmJe3fvLwOVQQyV4utAgid+ZmNnMU9VFcdtFyUKiHdvK7d3hzj/RMmGFH5
	VWkZ32Z9YtxKHZd5aaUHRNtTGqnjFJWucberEFoQeGLZdHR2n0qQuaCxgYW7jx+JXzmNpsYjZ13
	IA9aTgKiUi0iBQ==
X-Google-Smtp-Source: AGHT+IG2oguQtkP0baYvz7DFJRXL72Jyi0nbCU+efrgTYtEnyx8hDBEi/ILU1lDlG5ECXjkwwcxA3Q==
X-Received: by 2002:a17:90b:498b:b0:2ee:8253:9a9f with SMTP id 98e67ed59e1d1-2fea1346613mr12045174a91.11.1740746450459;
        Fri, 28 Feb 2025 04:40:50 -0800 (PST)
Received: from [198.18.0.34] ([2401:b60:a::698:7eb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea676c55csm3624891a91.19.2025.02.28.04.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 04:40:49 -0800 (PST)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Fri, 28 Feb 2025 20:40:23 +0800
Subject: [PATCH v2] riscv: sophgo: dts: Add spi controller for SG2042
MIME-Version: 1.0
Message-Id: <20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com>
X-B4-Tracking: v=1; b=H4sIALauwWcC/2XMywrCMBCF4Vcps3YkGRUaV75H6SJNJ+mAvZBIU
 Ere3dity/9w+HZIHIUT3JsdImdJsi416NSAm+wSGGWsDaTopohaTD5g2gT54smys8rYAep7i+z
 lfUhdX3uS9Frj54Cz/q3/RtaocTCtsTyaq9H6EWYrz7NbZ+hLKV//58KnngAAAA==
X-Change-ID: 20250228-sfg-spi-e3f2aeca09ab
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, chao.wei@sophgo.com, 
 xiaoguang.xing@sophgo.com, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740746442; l=2729;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=pPMhzcYM3CTCeeRM3hVc0R8I+4MebI7ljV90QEYY07s=;
 b=MXqgr2mcGpw61fx8C5ZrYZfxi0VQxHbEiCtbasaOy/l+UsC9ySW1oMZiECMbe7Z6EzrpdMDf3
 8e33dSukgSJCTHvc6ot+tBqGiX8pxcZzdamJjhsWdceYQTAQyZI5FqC
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_044051_601518_BE3A8D49 
X-CRM114-Status: UNSURE (   9.76  )
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

Add spi controllers for SG2042.

SG2042 uses the upstreamed Synopsys DW SPI IP.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
For this spi controller patch, only bindings are included.
This is tested on milkv-pioneer board. Using driver/spi/spidev.c
for creating /dev/spidevX.Y and tools/spi/spidev_test for testing
functionality.
---
Changes in v2:
- rebase v1 to sophgo/master(github.com/sophgo/linux.git).
- order properties in device node.
- remove unevaluated properties `clock-frequency`.
- set default status to disable.
- Link to v1: https://lore.kernel.org/r/20250228-sfg-spi-v1-1-b989aed94911@gmail.com
---
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |  8 +++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 28 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index be596d01ff8d33bcdbe431d9731a55ee190ad5b3..c43a807af2f827b5267afe5e4fdf6e9e857dfa20 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -72,6 +72,14 @@ &uart0 {
 	status = "okay";
 };
 
+&spi0 {
+	status = "okay";
+};
+
+&spi1 {
+	status = "okay";
+};
+
 / {
 	thermal-zones {
 		soc-thermal {
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51ac55abd922b5ef796ba8c2196383850c4..500645147b1f8ed0a08ad3cafb38ea79cf57d737 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -545,5 +545,33 @@ sd: mmc@704002b000 {
 				      "timer";
 			status = "disabled";
 		};
+
+		spi0: spi@7040004000 {
+			compatible = "snps,dw-apb-ssi";
+			reg = <0x70 0x40004000 0x00 0x1000>;
+			clocks = <&clkgen GATE_CLK_APB_SPI>,
+					<&clkgen GATE_CLK_SYSDMA_AXI>;
+			interrupt-parent = <&intc>;
+			interrupts = <110 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <0x01>;
+			#size-cells = <0x00>;
+			num-cs = <0x02>;
+			resets = <&rstgen RST_SPI0>;
+			status = "disabled";
+		};
+
+		spi1: spi@7040005000 {
+			compatible = "snps,dw-apb-ssi";
+			reg = <0x70 0x40005000 0x00 0x1000>;
+			clocks = <&clkgen GATE_CLK_APB_SPI>,
+					<&clkgen GATE_CLK_SYSDMA_AXI>;
+			interrupt-parent = <&intc>;
+			interrupts = <111 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <0x01>;
+			#size-cells = <0x00>;
+			num-cs = <0x02>;
+			resets = <&rstgen RST_SPI1>;
+			status = "disabled";
+		};
 	};
 };

---
base-commit: aa5ee7180ec41bb77c3e327e95d119f2294babea
change-id: 20250228-sfg-spi-e3f2aeca09ab

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

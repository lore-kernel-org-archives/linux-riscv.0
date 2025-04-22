Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6481C369D1
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 03:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqHla//mpzjdVZOrth7d6FLipt9IO2Bi1jcX+U/9Q84=; b=c1BDUegRxclAJh
	NzY2Ua+h57OI5RgbBsGwwG+ZSbuulaUQEJByeJSCAa+JMWU02FTjt3eLJBLulPsm+XWgvo8KsrMHP
	Kv26tCvOLGlC8XI9zJVPUiUhIgeXA7dmwZH1vj4kqJ20a1CywaF9b/Kvl9xzCOyV1JLxyBOpUHyhC
	E6SE/39iB83beZ5Vbea9rYvQXLbg3oW0tExYE0C/IzFytNx4Hvqj++O+/RV5yO0D6HrTpLJr6AqGy
	iC2spP9vKigvrG2NEGb565jL+CIYiGmeL6Ny4relCohnpt9yCajCMbZQGEbY51aYs31qHS+q5QeIm
	j9TvOwdQn865wKQV7cYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u74fv-00000005k86-02FA;
	Tue, 22 Apr 2025 03:51:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73MI-00000005c5k-0jkh
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 02:27:39 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-223fd89d036so56316595ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 19:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745288857; x=1745893657; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYhIc8nI7TQrbMQ5ehdUi9XRR8BUa9kFTApEz1i6px8=;
        b=db3XoqMm7rVejwCkkkLOabomygHQn9eTakgKE6zO7aCD9T+hCsKTuIYHBVEYOoSyk5
         ZmPIX2pbph92kpRigMV2XWx43NzTsqe69h8M/6zibtN2FKq+uK7ka+ZreGwIW03/UT3o
         d9ntF/FRuFpFXUx3EDYz4KgVQ6MZqLR2aOSfcLLPotw3fyNS+LxsfqItHfhF8b/i+Pim
         gsI7xOEeEu2O8jT3Wxg2OYYyW3rWVoaVjHhXDT7UR1M8yGm5eKAhqWPTMigabmUPHS7K
         hY/iLN/LasGt9hzkRk7WwBuv+YGtL7YU4e8po68AN+o2TcX51y9T/xS0M0wSeJPD+7/A
         jbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745288857; x=1745893657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYhIc8nI7TQrbMQ5ehdUi9XRR8BUa9kFTApEz1i6px8=;
        b=wUMIu8RW7gVbV8eg9Y9BnpJwJ2WieNJevNu7e7+ZMwChokhS+Hn2BHRV+o09C/U+Ev
         2q07zXhjmDt0PVrxwwYMMZUOmu8GwyFBmJEjN8uzGG2NOC9kRgTaCUu4K9HKTVVXnmOp
         H05gX/b4k2DKJAtiFj2pheyz3GhBvARFaVXappWEDZhzmtsyVxA7UTujIciL27gbifAZ
         epQ1eteeacki9MXtZM1fS0SydFaeMOO3Jgjss0BEZp8IFDHkPVJfDU4Ln94aNFm/U1YC
         XgZDQJLwy4aYFpIwn9/Dbx2LCgiaEwopWlD+HUCviu48jt6v9iiQf3HdU2vHKnu3ts35
         3jRg==
X-Forwarded-Encrypted: i=1; AJvYcCX4uVonIk81/xwtoQxxPBIIIV7+J+2F72mRl12Oo3qHdtNHeTyEDdzUYPcg0wd6AEBNmZp3PETSpMwItw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFS73kVkGdepp8+hn1AjHdPJkKF84WPPaMrNNq9QIPsVrR620K
	n31MzxqATeswWBkvv1HIOdr3GAXfMlSuk9fsOSDljl2qGccPkhAO
X-Gm-Gg: ASbGncvyOLeV4C95kTjKy2F0AuOSPMCmKOeePSANY3hYDVPX1TrxtUshNaGn0ulWpaP
	gkBF4GmbnyTcA2AAK/7Z97jU0yfKoPHKB1sWpq77UbMHnl4TN3kA+DM+Qxu6krJlVLd8nlfkTd7
	oh0HkiIsOsiPcfiSoRAJZpPPDxGG5vocVDIp69LkgT9VDIZEdmtleUQP0+rC9Tyb9ZAyfy5jKbn
	lHNo45Vo+wmQCl+W2zRfm4+pryC5pvU7rLsmgS54q71UKLJj+9hW+/XdLDg7OvcQv5yqLDDxWxm
	sRKvlVGLnxkWG01QEJgMEjScth5U8G4SxjhC20JRCxOJMwX7
X-Google-Smtp-Source: AGHT+IExQ+ztUjssrgQSM1us5/55FyqKMbgSSaCY7W9HzLRHDBJHaDVv7TjABQFxbCdhKT4/A3fWOA==
X-Received: by 2002:a17:902:cecc:b0:223:4b8d:32f1 with SMTP id d9443c01a7336-22c53285bb0mr208982725ad.1.1745288856770;
        Mon, 21 Apr 2025 19:27:36 -0700 (PDT)
Received: from [127.0.0.1] ([101.76.241.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4ae9sm72962905ad.110.2025.04.21.19.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 19:27:36 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Tue, 22 Apr 2025 10:27:10 +0800
Subject: [PATCH v5 3/3] riscv: sophgo: dts: Add spi controller for SG2042
MIME-Version: 1.0
Message-Id: <20250422-sfg-spi-v5-3-c7f6554a94a0@gmail.com>
References: <20250422-sfg-spi-v5-0-c7f6554a94a0@gmail.com>
In-Reply-To: <20250422-sfg-spi-v5-0-c7f6554a94a0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
 dlan@gentoo.org, linux-renesas-soc@vger.kernel.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745288836; l=1524;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=bsOb61YGYomuONd3drp4jb88EZWek6I8D8vdw/YFqjA=;
 b=3nFg+D2YxLVxcX9tiCAuyqRm8Zv2W7XtJoeJ8rKEUvkzPCQBp52ycjtBSOgMztlNMYeeHMmsX
 cQ7rG2Mn4jBD1jpXGmi2Kk12Xwa/vhSD3KiPhLi8rrykE6nn/wTVzcW
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_192738_217492_C12915EA 
X-CRM114-Status: UNSURE (   8.49  )
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
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index aa8b7fcc125d71eec12b09493964d90f5dfed27c..ddde4c613c4734db191de500b016b322a9602efc 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -537,6 +537,32 @@ uart0: serial@7040000000 {
 			status = "disabled";
 		};
 
+		spi0: spi@7040004000 {
+			compatible = "sophgo,sg2042-spi", "snps,dw-apb-ssi";
+			reg = <0x70 0x40004000 0x00 0x1000>;
+			clocks = <&clkgen GATE_CLK_APB_SPI>;
+			interrupt-parent = <&intc>;
+			interrupts = <110 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <2>;
+			resets = <&rstgen RST_SPI0>;
+			status = "disabled";
+		};
+
+		spi1: spi@7040005000 {
+			compatible = "sophgo,sg2042-spi", "snps,dw-apb-ssi";
+			reg = <0x70 0x40005000 0x00 0x1000>;
+			clocks = <&clkgen GATE_CLK_APB_SPI>;
+			interrupt-parent = <&intc>;
+			interrupts = <111 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <2>;
+			resets = <&rstgen RST_SPI1>;
+			status = "disabled";
+		};
+
 		emmc: mmc@704002a000 {
 			compatible = "sophgo,sg2042-dwcmshc";
 			reg = <0x70 0x4002a000 0x0 0x1000>;

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

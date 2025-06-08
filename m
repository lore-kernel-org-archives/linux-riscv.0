Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87D5C5AD49
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 23:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hdHtY8c2sJqgnKtBElIYGuVL1uDJGpaaJzLk85UyiR8=; b=BRm9fPxYVMUJBF
	rjNp/C693936L1gLh9d9tZsUtFosgn9CzOd2Z9P0i6wzS1Ua35q84JXGv9uIrpJ/Bb0Wu+n+B3EhM
	5XPtBq0+YfPQdzLCk/nnRj7FG/vGtIMRVg28jiy+6DdtlVpqBDL4KICy9LKXVKxX2Huox1CPmUSKJ
	LCvutdicEpZizW6H5taPd3SMO2RUSwPOnKYCpF/fH44TivTQMjQlyGTKKh5JY9JarHVbQxcw6wYVH
	gLsgeO20TnJYC2q1LQMfZp2XKWrFw+dPuY8gGgJYbnsxpCkRoZXAi0ovYG3wnaVOz2Fjn4G5ber/Q
	OQMlY80vm9JkTNk+LQuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSg-000000037Hs-3h9F;
	Sun, 08 Jun 2025 23:29:58 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSe-000000037GO-2GTN
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 23:29:57 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6face367320so34775906d6.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 16:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425395; x=1750030195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9s+OR8R49kht0oCLKo0xvH8vU3cihaJW7otzDR/klE=;
        b=bKnlzh59U7YvoLskPjG3q4GGwOV5V8r6dQsV1kHNyOx4LfM7o8XJSEWJDTxeM9SsRv
         pxDODhncUK+zIO+CL2Aqqw0IkzTLJdit42artfEhwoRa/JcyEvRVWsjkF/b2IREsJpEx
         VlYSJ390kxQDl5en/mxvMIQw//70DYtNhMORRTtVNF/iBfEOc/kxaM3EcpyI0VSv29Tl
         02HGvKHq2xkKNjCQAgwTjqhYaIiafxb9Kwvs1B+Y9eD/fUfBGbIvHM2U3qISYqt1cGyE
         2z2txeBgx2Gv3G+EIDJCP/LZh6JLT3LKKuc5vQilC9zZt5M3pRK/tENz/nhJsywg9ojC
         ln0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425395; x=1750030195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9s+OR8R49kht0oCLKo0xvH8vU3cihaJW7otzDR/klE=;
        b=AdV/dw4niUyU94Qz2KYTYbBDCkwrJN98QP/P5g5hPT0/bAbL7YPNYBJkKin5Vw//5X
         LIJ3K7v18QYsBc5iOt1JNgseWB7XL8f6KBGuVR1cVbDLrVkK3ktPw4xh+UdhONc/LZ/V
         0Ahde9Tx28y3HGdUHVeWy/NDIuQamHgmD93bK+And4XLjjJcz7FJ0PK+AEXG4kSsmY+c
         e4+dGhVODQ05hxsW0s7BDjwqvYwI9ZU1SsUtRFjt2qOSCWfPe3jbEpighw4aDU+FUjpm
         jytG2TnGR5KH4FN2VJhCDgz31dtBItBH29hJZxnpW40ogcXBVdtaxzngKTj0Xj00lBpI
         oShg==
X-Forwarded-Encrypted: i=1; AJvYcCVFxludQutcErgWHsM6yeuAuGBAVSUBE1MzJhUu/CpmlkHlRJly6gJADuZsaresuDC1tN+BNd1YsahA0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/ABjzrpRna94l3CwV9Gq8hr1ZOTSvNYETJWWwoXnrS5oSk6JV
	PHJ3XGpMowhswdZ0bR2rO6Tgq1JFuZGyqZM00Pn9mVCTBCKlJHYqgzMw
X-Gm-Gg: ASbGncsv/OgILDk2NQgci1AO13p5XnF4cme0qNRmQDxPVJ4FuqzD0fhMEiC9e46E2Ib
	oE6u0f8TPgXvjBijyG1VwoirmTPys7DzJ14aQ6truKnMWZCqiAXBJoiPNg+O0zEmq22vdu5wqMW
	eJYqIfT1Hhm/MOADgL/Riks9S734DJrkUjuu1GEhGfzHsPRq6EyWoNf4DCAuf7ahhZaGyFggswz
	d7O9kqgMSVhe26CqK13hRzB0xCGKLPrZGM9O2XULvYimH7X/+HaBdudavl+eLhZYSdAPLAaiiUI
	a0V5NIkpSIeFV0NYspcbNUqr/EUNcwQNhtGWyA==
X-Google-Smtp-Source: AGHT+IGVTE7AStEym8OCBDDJDYJzCP+mLeMVtHSUB2sGRL4PF3E9St8SXV/iVZLVAiLmOZXbB+WmAg==
X-Received: by 2002:a05:6214:d02:b0:6fa:cdc9:8aff with SMTP id 6a1803df08f44-6fb08f612c7mr204216496d6.25.1749425395577;
        Sun, 08 Jun 2025 16:29:55 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b1ce38sm44503256d6.68.2025.06.08.16.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:29:55 -0700 (PDT)
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
Subject: [PATCH 04/11] riscv: dts: sophgo: sg2044: Add I2C device
Date: Mon,  9 Jun 2025 07:28:28 +0800
Message-ID: <20250608232836.784737-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_162956_577756_D196503B 
X-CRM114-Status: UNSURE (   8.25  )
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

The I2C controller of SG2044 is a standard Synopsys IP, with one
the ref clock is need.

Add I2C DT node for SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 56 ++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 70d1096f959f..a25cbb78913d 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -91,6 +91,62 @@ uart3: serial@7030003000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@7040005000 {
+			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
+			reg = <0x70 0x40005000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <100000>;
+			clocks = <&clk CLK_GATE_APB_I2C>;
+			clock-names = "ref";
+			interrupt-parent = <&intc>;
+			interrupts = <31 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@7040006000 {
+			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
+			reg = <0x70 0x40006000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <100000>;
+			clocks = <&clk CLK_GATE_APB_I2C>;
+			clock-names = "ref";
+			interrupt-parent = <&intc>;
+			interrupts = <32 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C1>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@7040007000 {
+			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
+			reg = <0x70 0x40007000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <100000>;
+			clocks = <&clk CLK_GATE_APB_I2C>;
+			clock-names = "ref";
+			interrupt-parent = <&intc>;
+			interrupts = <33 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C2>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@7040008000 {
+			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
+			reg = <0x70 0x40008000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <100000>;
+			clocks = <&clk CLK_GATE_APB_I2C>;
+			clock-names = "ref";
+			interrupt-parent = <&intc>;
+			interrupts = <34 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C3>;
+			status = "disabled";
+		};
+
 		gpio0: gpio@7040009000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x70 0x40009000 0x0 0x1000>;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

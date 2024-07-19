Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30906C3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 08:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sCy6NVj46mj+ro7M+AOcb+gQyNpLxV7JOLx/gpr9hFg=; b=pnC3HYWwref0Ea
	BDOfhUBHj3NGaUEvzP1Qi1bvfqlFCkb13eewwWYrusXuU1SywIU0hCbWiW+5mL9f4mpW5nGfYo3fE
	l7p+4YGcMnzkFm/mRK8y2C17bAwO5CA3neXj4D529tsG9mkyP9DbW+xwxFWoacHVVtXOcCgMHxkz+
	MCSHiv8PzKzAHHn/ctCVChINVmL+mtiWyOex19faN3fFciH9Tgo/1UbGVMja3Z9qLUvH2SFu2JD6r
	4PT1/QOwgkCrTsEyKc21F+jI3+sAhrpm31IdoUdkhe55GE87sH3n9tuyIq4zTFA5vT8e8CUXrgEuj
	XeILWektNBYSFUqaVhsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjH4-0000000290U-1nyk;
	Fri, 19 Jul 2024 08:47:34 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjH1-000000028yi-01Fj
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 08:47:32 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3d9ddfbbc58so985580b6e.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 01:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721378850; x=1721983650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8010fnFp4bSW28SSmXx92MpzvQhq7D5Mg6hXVKiJ92g=;
        b=fl70gLM8hdksjliVhhUszwZBSOsFlaLaLlBY5XB3hO7yqW7oI2yeGPh7xgXIgUyGGQ
         MSlUbXI3/ShJqSRlnJm5/Frf63kkdlllcV/Ss7oQbg0ybH5k56saMCnIe/v2jichho69
         lgr3vxLwCxdqj/+UVea77AmEx7O7QeyM/YXwG4Rj7Kk0iv71ALyhCH51OmPYYp5rru2Z
         3CQc80C+43uPhHbgNbzajZVq1541rJJytwpYdRCNInHl6L6zqwOMBvbLlIxidxVmQ2oU
         TLfrImVepW42GHRG3G7k/1H8U8WSYvR5O1X0HcLDemsJ+tf0ZNsDeVk8tHJnfe8esO99
         dO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721378850; x=1721983650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8010fnFp4bSW28SSmXx92MpzvQhq7D5Mg6hXVKiJ92g=;
        b=Lgp4s6Dod9GLqwLUmU8RLXcPTv0TSw4TdjNsw4waNl/fkbq+WnS02jeS2IxuIMNTol
         LAIgfbN2qm8kLFD3vSOUMS1YTFT1snB+1uyeOxepVZolLJ2LRiw1hPSQtzctcMieHtAB
         X5b19dARlpx/Yzy9ZH60KOnCDALt22IuQOFc2vg+VTCJIwwwZkD9Y02k9r03OvA5I/nE
         eqEYm96MQ6hvWRvH1dKVPYMaN5Q6ChmJqz8kNRR2sHZms1L4/r1bQioJlsEyJL09oV/A
         rHn4Xq+UPLlXdQsOFhbslCAC6fPEBUUK17fdWgwrW29tyoLF3nNR8rvwvCKVTzcRP/LD
         cSng==
X-Forwarded-Encrypted: i=1; AJvYcCU9l7KXZ9S9eE8Ujwtzt3iQFbR5OOfbfeolC3OoXQRX9t/OfFsY7W7J4vK7MIvMAuxJiMQ+A7VUZCJG2ecwYJw6yvN7eNJcSa7LxaE0SA+w
X-Gm-Message-State: AOJu0Yy3QSiSIOhRwaYrc+XQMbgOFoaVF7Lkh+oMzUeMNiCpNEd6CPyl
	37XiOjtoFpQ9pe850sePdjC28PsuRa86DLnwVYxwmZBMHquDs0eK
X-Google-Smtp-Source: AGHT+IEcrcICdMO2BQR9SZdf8B1sqIfILWJsv2xAN22U15n04nucXVZlzWKnOPIkj7CAFhyibZvnWA==
X-Received: by 2002:a05:6808:14cc:b0:3da:bc74:e9c6 with SMTP id 5614622812f47-3dad5271b67mr8796899b6e.37.1721378849865;
        Fri, 19 Jul 2024 01:47:29 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3dae09d5fa7sm209479b6e.48.2024.07.19.01.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 01:47:29 -0700 (PDT)
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
Subject: [PATCH v5 8/8] riscv: sophgo: dts: add mmc controllers for SG2042 SoC
Date: Fri, 19 Jul 2024 16:47:22 +0800
Message-Id: <5110a64d513390c01daf3b4a6a6fc5560baf77a8.1721377374.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721377374.git.unicorn_wang@outlook.com>
References: <cover.1721377374.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_014731_070601_39CBACD2 
X-CRM114-Status: UNSURE (   8.88  )
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
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 17 +++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 28 +++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index 49b4b9c2c101..164db23586e0 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -14,6 +14,23 @@ chosen {
 	};
 };
 
+&emmc {
+	bus-width = <4>;
+	no-sdio;
+	no-sd;
+	non-removable;
+	wp-inverted;
+	status = "okay";
+};
+
+&sd {
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+	wp-inverted;
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 81fda312f988..e3194f147d13 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -346,5 +346,33 @@ uart0: serial@7040000000 {
 			resets = <&rstgen RST_UART0>;
 			status = "disabled";
 		};
+
+		emmc: mmc@704002a000 {
+			compatible = "sophgo,sg2042-dwcmshc";
+			reg = <0x70 0x4002a000 0x0 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <134 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkgen GATE_CLK_EMMC_100M>,
+				 <&clkgen GATE_CLK_AXI_EMMC>,
+				 <&clkgen GATE_CLK_100K_EMMC>;
+			clock-names = "core",
+				      "bus",
+				      "timer";
+			status = "disabled";
+		};
+
+		sd: mmc@704002b000 {
+			compatible = "sophgo,sg2042-dwcmshc";
+			reg = <0x70 0x4002b000 0x0 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <136 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkgen GATE_CLK_SD_100M>,
+				 <&clkgen GATE_CLK_AXI_SD>,
+				 <&clkgen GATE_CLK_100K_SD>;
+			clock-names = "core",
+				      "bus",
+				      "timer";
+			status = "disabled";
+		};
 	};
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

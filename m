Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D494EC27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 08:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UDkLbTV8/Lq1Yr53oVyO8j7rpy21G13C33AkDXNEkxA=; b=4vtPDZmQ4Bh7nX
	XuRN3UBYxdtGfYzmdINUsXVum4laRJP8NMmDCXKRrxF69FKOLZ8eOt26WIPiK2SwKJfoptwHf0PnE
	dmb31TxW5hp85swsyG5lq4++HYobdzoo58Ul86tApFxOvfd43ZuJS3nWCMtbvlkMQDibpLrJuNIYb
	mDqenlvK+e1xGyCwMUCnfPHPayhM6jEFlTkEJ5doi3nkugzl5TK4Pk81NTnr3lErz9YGDbK34TPJQ
	ay+ZGqu13g8PLoW0mG4NpNUWyHIRCgVBxanao2rBcI1YLdzQDwzg5OdUd5/DKWBsLJDk1ncitevuF
	4xMNjxFa/uWZsoBYtsdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJUNK-0000000E6Fi-00jB;
	Tue, 18 Jun 2024 08:39:34 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJUNH-0000000E6ER-09iW
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 08:39:32 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6fb840d8ffdso2472027a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 01:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718699970; x=1719304770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcoMCm+enNSGbUuJXoL2d96+fYWSHPTojOmLTIxiMc4=;
        b=EqJQRq1bKl8mp65yLoio5seOurKOPFo1UIjfqJuaYd0k1LQDhDNhDN1/IWT7WFJnAe
         cw2JDSnLRrwt9PNCfq574R9JugRYV5cQDr22N3TDr4hMPGWHXtNHEgyEkjVLZUJA4hpF
         HGjdnWgFPvilQYdt+1TOE6NMk78PtrBt6+ZBO6+ZPclvgH3SXXg4CsTFREsD8hjkOImV
         po6yoUBPYKe2K/PIwgdDbylbnMSPJuF+1K5mgnLhYfjjJuwiUXLFjpBkjeoJ2e7WRk7k
         fSXjvCYthIjre75kM0LPSnYzBbYSGfVe07DrnHuxAa0DAttQT8P1I8jsexCtV8D8bwcK
         0e4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718699970; x=1719304770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcoMCm+enNSGbUuJXoL2d96+fYWSHPTojOmLTIxiMc4=;
        b=S25UHXb9+0zo9f+ulmkXsMn6ooJ70K3lSw01hg061lUbNrOisLBwPbK73j6b3LOulY
         BaKPjlB6byaEs2Irl3pRLYfugkK2q6pHRcIvKvaf4hltC6Fe23BcBR8cF9JjgKxWuv0r
         0TFfRmU1ocxMboufeYHi+puMS9dApWjWrqlkm6oopP+Mc3p7GlLFkW2LQ5MSSVj1E3rk
         08ViDou3yyxsH3vHOTgX5fuDaY5qHqCJrZjHIbYgQdkMdPx9lWxlIgR/Agp49vzPRUEI
         86R2+nwrVSh0k45XlpIwHBhlDs/AtttvL29S4cXgOZFupeHeAwcrutEYquTHcEJfkNjN
         ppAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlc2jFMUGcuyDHX2kqSW50qtvwdGwOe5cg8wftGUBCwjE7p+lq5wGxLVp/Mdgs9p2j+BhuV87FrIH5BKk2LraanP3EJ23P8tPGrFrcj3LW
X-Gm-Message-State: AOJu0YxcERYsL6TWSXaWBGNugHAXCmR2SkSX0B3uHc/50s60pQg1Yv63
	jcoG067sa7DGRIkLwq7ptfuLNgjkaa+XmH/iMdhKi0SdSoH+ONwn
X-Google-Smtp-Source: AGHT+IFcy1nbT2issyZB1cEgm/lfGKAVteBPOb6Fg8eo1DnNX6U9jgGHQwHqqALGVpgz4hatJydTPA==
X-Received: by 2002:a05:6830:43a9:b0:6f9:90ba:6646 with SMTP id 46e09a7af769-6fb939f328bmr15303711a34.26.1718699969712;
        Tue, 18 Jun 2024 01:39:29 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6fb5b75563csm1770804a34.66.2024.06.18.01.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 01:39:28 -0700 (PDT)
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
Subject: [PATCH v4 4/4] riscv: dts: add mmc controllers for Sophgo SG2042 SoC
Date: Tue, 18 Jun 2024 16:39:20 +0800
Message-Id: <e2d3b19e06fa29116b8032addc70c8dc1ec3866e.1718697954.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718697954.git.unicorn_wang@outlook.com>
References: <cover.1718697954.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_013931_125681_FC21C60B 
X-CRM114-Status: UNSURE (   8.79  )
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
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 17 ++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 32 +++++++++++++++++++
 2 files changed, 49 insertions(+)

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
index 81fda312f988..bfdfd6f32912 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -346,5 +346,37 @@ uart0: serial@7040000000 {
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

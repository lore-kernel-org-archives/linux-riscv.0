Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9A1C3DA45
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 16:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mOk9eSIhA0M1aHLY6nuxFi0qDmtcb6VBHtHyR+5lXAA=; b=tBAGBBU45MOCqx
	G6ow6gh4VVJK/ylSV2R7qqTW5qMOsKjV6MMxvbPvldynEA0rrT81keJfRURqplzJtX35GMAtg05fp
	guNOA1d+7NqlWY2/rL5tfOy0kPwZe7AiQwqAqO4RrbCrylav0XijiLJN8xai7tjq0hn2Z0s4QGkkS
	IB4YyhemVlcrCXhoKp05Vx2agBVF+R2fmWa/NFxcuDyM8ZLvEANMpnPGpv8NWoQ1stZcZJYOdvwG0
	HBkZ0yXOwB3Kv89JQhmolQkdsb81668C5GXa3UE4iqEYTWi4HfKqN5ztFkrwOeOvbxPRFoWL8OkZp
	XMqOYCrFGxJnL1YIam1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRx61-0000000ElgX-46q1;
	Thu, 11 Jul 2024 16:56:41 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRx5w-0000000Elbn-0vBu
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 16:56:38 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-382458be75bso4590035ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jul 2024 09:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1720716995; x=1721321795; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=te6oCpGS/6VZhMCuPEflrqjqzTzldtZxzFsSrDrIRSM=;
        b=aIrpkaJO386RIhdWTr91P+4btKrclb31xci+r6sTAv5Iktqek7j55UCS/PyvTOYY8f
         dMsUXI3KEfqSFvZjAUtiBDs2JnWluS+vOmr6TvIkEd4JVB9xw4p+Z3xnWsh5rRo4XCJo
         ukEvF5bR5/e0o/dGSOomEMShUhcqp5AkFbxJSQQ3jLSFy9SlJGdO68laRK5BUcAZ0c4r
         85RdQA+tLV+ahgrcmYebmWTAudEhujHMSMN5mK5OSi+6Ad+rM7ksRtkD7oh+AFgvTLUB
         pkbNcqv0TxwpsbJP+sylbaRSEBBqHlMChJVzlywxkQY84WiOpjFJYtOoKKOy3CzDuHrF
         PxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720716995; x=1721321795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=te6oCpGS/6VZhMCuPEflrqjqzTzldtZxzFsSrDrIRSM=;
        b=ZOWUhryzIV6HbodrYuTiP28YzItj9YDuM5akC1qy3cJO4UuL9ZYqF7kFGvmCG5UbIx
         /CEGFxpGPeK+O5rRlj1Owf5RKo7g6AZnj41VkWva67gW/ly8X4+GnNOMavpHR0XraehE
         zzCZbk4XjeCdF4FNfcaEWas43vRj/6SmYbvWZGBUWAtgr8LnR26d9UV6AyPm1iEkLcAD
         heHHAGG6mONN5z1CEYSjwaTnu/KQ7qOe0wm0xyk5C02IsjCAtsfgpkAM3Zzxq4Ip126V
         xiWT3lDy0w02d450wPMnyjxPc8I9B/rLpnVbrzanmYl3ktx55JizQosvkJPjhnU20H8r
         Bb5g==
X-Gm-Message-State: AOJu0Yxg1HBMshgSfpJe+t6pruaOhNMTaFjUHYAoWCZe6CnpZ5p1Qq+e
	IntABN8itiSbtob2bqIzGjX7+nyE4gnnKu3QX6zpOdfnDFoDBBt2v8NgG9ETdnA=
X-Google-Smtp-Source: AGHT+IGzWPfDV/E3YcTV0DYpsGumkkg2HKME8gswI8MuO7enICuTRWBiTCWgxl87cgh3yZKPyv10Pw==
X-Received: by 2002:a05:6e02:1aa3:b0:374:a781:64b9 with SMTP id e9e14a558f8ab-38a581a844cmr111474085ab.13.1720716991215;
        Thu, 11 Jul 2024 09:56:31 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:5ee9:fea0:d9de:cee8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-787089bc5f6sm1360038a12.92.2024.07.11.09.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 09:56:30 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Thu, 11 Jul 2024 09:56:23 -0700
Subject: [PATCH v3 5/7] riscv: dts: thead: change TH1520 mmc nodes to use
 clock controller
MIME-Version: 1.0
Message-Id: <20240711-th1520-clk-v3-5-6ff17bb318fb@tenstorrent.com>
References: <20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com>
In-Reply-To: <20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720716985; l=2932;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=tRjLHNA3SUuyjwpgTudoab8pZI9wG5YkzGm3OgGpM00=;
 b=/J1Le/i2Ub7P3mFRDRhdpUD8z6RNIFe8SaZHadbyBrIr8iwcVW+MMA9ZwLU7NYkZQFxaufvA3
 4rYWM5YCrJ5AjZXjifm3Pum7SMOQhZ0ySfNAxPh953GcvtVzQG1jmgo
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_095636_411731_C2C945BE 
X-CRM114-Status: UNSURE (   9.91  )
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

Change the clock property in the TH1520 mmc controller nodes to a clock
provided by AP_SYS clock controller.

Remove sdhci fixed clock reference from BeagleV Ahead and LPI4a dts.

Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts     |  4 ----
 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi |  4 ----
 arch/riscv/boot/dts/thead/th1520.dtsi                  | 13 +++----------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 164afd18b56c..55f1ed0cb433 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -48,10 +48,6 @@ &apb_clk {
 	clock-frequency = <62500000>;
 };
 
-&sdhci_clk {
-	clock-frequency = <198000000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 1b7ede570994..762eceb415f8 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -29,10 +29,6 @@ &apb_clk {
 	clock-frequency = <62500000>;
 };
 
-&sdhci_clk {
-	clock-frequency = <198000000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 66df04ceb3e4..ce3a0847aa9c 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -141,13 +141,6 @@ apb_clk: apb-clk-clock {
 		#clock-cells = <0>;
 	};
 
-	sdhci_clk: sdhci-clock {
-		compatible = "fixed-clock";
-		clock-frequency = <198000000>;
-		clock-output-names = "sdhci_clk";
-		#clock-cells = <0>;
-	};
-
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -200,7 +193,7 @@ emmc: mmc@ffe7080000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7080000 0x0 0x10000>;
 			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};
@@ -209,7 +202,7 @@ sdio0: mmc@ffe7090000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7090000 0x0 0x10000>;
 			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};
@@ -218,7 +211,7 @@ sdio1: mmc@ffe70a0000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe70a0000 0x0 0x10000>;
 			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

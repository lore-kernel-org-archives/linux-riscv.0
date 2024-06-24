Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3CFC30659
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 02:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OTEKmqTCpQ36ROrbSRT0HH1j+nCFp/WK5d/DSgOloqc=; b=wE3sLL/B8lbLbo
	YmmKslWMmFq67rWjweu2auvuBo330tI2tlsWaILSXBrGkAPHEZ9qy1ULWLBlrKqydoGQKeHJqwbn3
	0+itr6/fSI7RKdcWCOM4VjA8w/7Xc3GRTEf0SqvcfbQcRmK8/WrJR5kmNhMvi8q6Pquq+2OC/20ke
	WykQFEQ25wwrw+wIw2lsLT6h1ewvmmHR1U1iBCSkJFj8NcpPxEI1JFkrtFkSG0B1IrGCFfHY8HNkR
	KUvRe0j3loLQvvKkqUhZHJWtda3lBITV1/khmFjdjmq6BTTqwTN2HrZsHswWPVKkVQWibZ18+Of0j
	HgCygI75O+UqkIq/5SAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLZFO-0000000FGKh-2u4U;
	Mon, 24 Jun 2024 02:15:58 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLZFF-0000000FGHV-2aD6
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 02:15:51 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-656d8b346d2so2580795a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 23 Jun 2024 19:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1719195349; x=1719800149; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjiqrN6ZK51SnDznCbj3+gzdRKmK7FOnr/vCNYUG2QY=;
        b=iDq3AAmv7Mz0EtUW3QqMQQ9fC1Uv93ljx46O63I+j0z690ZvrmM7TOvNR5wDCsES0/
         JU7P+8WMss/lEIjOIto7UwKX2AiU7HZg0iJgJrKGg0z0p5M370c0Gm+6VBpZRw3lJL/i
         7lbO7SzxeCmmAQmv7cxoBPbUokjByh/4hgoExG8B8YIJ9U6se1qpV4XxND5xunk9K/ie
         zcq2ZtL/7KSCKI5mLsK65lbyckcgSvezhBGnVPQ4eAVDMYNYEly04JAOdzCJj1zmgEwF
         WcijD+//tDS7oAeekYI2g4eljVZLkRoeBIt3x4+ti852/aWZJgHCHmjWEbIqYp8iCilp
         5vmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719195349; x=1719800149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjiqrN6ZK51SnDznCbj3+gzdRKmK7FOnr/vCNYUG2QY=;
        b=S41mn3L5PYsLT/gQauiVNsRtWA0A78WT8m0ZHKL5/wSVT/lpVbWLA2KncyJ9dqU7PY
         RPWmyCvcub/OnizkkgKu/NwRRl3iXXuOO6cDer/DuQz0xOVV2UEgAeaht3GJ4RuY+70x
         CBx7T47485OzM+9CoQxohClY7KShZWBcekn0eGzCO4O623auJIje8hHAKHK9lzcmcwlx
         cKquqObr+Mi9+M788MOcULxIDjrNbqxoy9YiS1uk7lf6ScpEdYsqSqDvaKDcMsJK4VV6
         heI/Gg5YhlhNSSGJJ0183XGfOrxprY6tkGF5DGgTCqgQwetKzKi1FoF4kz2SUxOuOt7S
         9jNw==
X-Gm-Message-State: AOJu0Yyhi7Ey0Tl6Nz1E0gACP3Bd2ygcawzgnoKy2nY5uc4/tGNBNh2L
	ac2ST6zUujB3ufCZvAzcKd7PsKtm21tNZKihNYU6k6yX8fyb69F+ACrDHga2JPI=
X-Google-Smtp-Source: AGHT+IEpOJg5cTyl1rKSokOjaYsq1oFSF+Vg++cvFpeQHqC15A8f7WRXLOQ2rcZgaL+QgOhTSIDd1A==
X-Received: by 2002:a05:6a20:b918:b0:1b1:f0d4:71b6 with SMTP id adf61e73a8af0-1bcf7ff9c95mr2331801637.54.1719195348931;
        Sun, 23 Jun 2024 19:15:48 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:1584:936e:5eb0:fab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706511b137csm5071770b3a.86.2024.06.23.19.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 19:15:48 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sun, 23 Jun 2024 19:12:35 -0700
Subject: [PATCH v2 5/7] riscv: dts: thead: change TH1520 mmc nodes to use
 clock controller
MIME-Version: 1.0
Message-Id: <20240623-th1520-clk-v2-5-ad8d6432d9fb@tenstorrent.com>
References: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
In-Reply-To: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719195343; l=2852;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=fVxaLUMTb3CyDlrBVjs+Sch5+L04pOv+EAfH3Xd/w5E=;
 b=HNA4TrACYlPMj2b3NCZ/cUVczsm8my7IqBecoB3JoarAlOInJZM8as4J/k9ayqg7ee3656Zyx
 vC3CHuzDSZVAdmafpeWS9vx0NjCbXL48XSXYgClr3N6mcirKtZ/noTJ
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_191549_715340_845BBC13 
X-CRM114-Status: UNSURE (   9.75  )
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

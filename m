Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E59BC41513
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 04:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tAin/c7q8MIaVXe1A6p+pc4voMYmzo9dsZX7dY8M27Y=; b=mxUPYY4cwgCiHJ
	NkY5qb8OR8uMHTwQ7lInYXOSl98BqCTzPpDFCkRvqyKPpeW6Op09Gq9n/vB9H1ouJWP5+kFrjGju2
	ytfmklAAByINW5pZmU2UvBErf9V0YwAu6ERyWLsQhLgucMhkDXrM0mJRQwgFfvXYj5DeEDhq9zjEG
	+69/qz//zBLEt8H+FxfHGR4ZYWGniVuAPaOamRWaISZnBx4zv+xxqvY0uRt9m6FLiekaU1rxjMdzY
	6a1eT9C1LJY/gViOCsboEhC/qZu+dRTe9zRzeUyaBwfs9b9KtzKBwiy7yJaY7x2Pz7pQ5+8uP1KAC
	Hn5TpH8Fm7KClcEB3zZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4CtY-00000009d2Q-0OD3;
	Tue, 07 May 2024 04:57:40 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4CtS-00000009cxP-2iJX
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 04:57:37 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6f4603237e0so1511914b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 May 2024 21:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1715057851; x=1715662651; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvImobpR9QD2Br3BfnFIc4ZTdsXi4UyVtbpSlCU10uI=;
        b=YfQ4bKy318oAgDSlZs/+EYTFOpxleQ4fHZRLSC7Aap1Tst8yyynq8UjYCjpIqxxSPO
         HklB1WB1PB6kvddRmOx/sEO+HzsIX8nKIuSkCifF72WFBSZXPNPUpv5kxBx9mB5P6KGo
         pjMD92Y8skbEc9xoSimhTD+4RJq9ndZxfXdeFB94cTBBfi5GNaHK52ReAsMo6z1PlR7J
         wWP00idSzUh56hBG+78tSljUSDi+3WYlLWMr8jwtjhKPVgrUnSRkH3yRxhCxkNHvuukG
         Cw03gVUCACWZjrtAwkorFDEcHVPDRfMPwJyZgNkUWc16FFQc99v49cJedXG+WO3Q/Ml6
         MtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715057851; x=1715662651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvImobpR9QD2Br3BfnFIc4ZTdsXi4UyVtbpSlCU10uI=;
        b=KOVaH7caH6Q0eZq0IHJlsQsE42cQuWGYR6OoMfwrqDNq7CxXNQPfHhyO82KSHX2EEN
         Vk3Bc5gR6jSSXXxWSqgJzeCm1A46g7VyZ8AVDqOXsQEMwqhFO8YsiWr2A4WiBw3rb/qc
         R1r4V6l7diSSMQNhh4fz4xIyFMpyWK/qVN0XVP9Tbf7PHOQYKyOfSAWwGgOJ6bP3PL3A
         3bQR6dAhXqX087c8bhbWVQxUKw6V720qKb4h/erdbyII1XrAT+64xF8sRQL0s6a8wTC3
         Hag3WU9ktTcLjRe3ABNhWV5X61MCir2pvb4wv9aqoLM/8p5hmojl97drYIWtRhzyyYkW
         0zgQ==
X-Gm-Message-State: AOJu0YzlEbCp9j8Og4A0idUPV3v6cuGhPKcBvKUCZ2UPWx2Kjcaxie2f
	L8VSPuhRhCcYU1Fxq7ER3M4PWGoh4VO/OHHj3pAG1EOQX2bfu/LzoPhAPehR1zk=
X-Google-Smtp-Source: AGHT+IEsztZhA15eZ+a3JYYUcAVtuUaDjpScLG/VWRPRMBDOCAO3wkLLYVuT6QgjYV9F5R9xkVQbng==
X-Received: by 2002:aa7:8742:0:b0:6ed:41f4:1886 with SMTP id g2-20020aa78742000000b006ed41f41886mr2203053pfo.8.1715057851282;
        Mon, 06 May 2024 21:57:31 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:6870:7119:e255:c3a0])
        by smtp.gmail.com with ESMTPSA id o14-20020a637e4e000000b005f80aced5f3sm8987249pgn.0.2024.05.06.21.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 21:57:31 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 06 May 2024 21:55:14 -0700
Subject: [PATCH RFC v3 1/7] riscv: dts: thead: Fix node ordering in TH1520
 device tree
MIME-Version: 1.0
Message-Id: <20240506-th1520-clk-v3-1-085a18a23a7f@tenstorrent.com>
References: <20240506-th1520-clk-v3-0-085a18a23a7f@tenstorrent.com>
In-Reply-To: <20240506-th1520-clk-v3-0-085a18a23a7f@tenstorrent.com>
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
 Drew Fustini <dfustini@tenstorrent.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715057849; l=2484;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=0Ot4hVSus7f5v4Ml6Hb9TXPwAtMpDZsRAGOrrpUZWI8=;
 b=HLvXY5FVkY8PqB/hsbRI2GENm5Nc6Jmo+rVl3j00x+TMr9OtGpxR5SNDbrBI7Vz1CFWK3Zua9
 D/x6qhAhIwhBnZTDAHOfJBMN261PJt7KOch5ZDKmpAs5nZxVwLc2E9W
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_215734_742121_0A4FA546 
X-CRM114-Status: UNSURE (   9.21  )
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

From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

According to the device tree coding style, nodes shall be ordered by
unit address in ascending order.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 54 +++++++++++++++++------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 8b915e206f3a..d2fa25839012 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -193,6 +193,33 @@ uart0: serial@ffe7014000 {
 			status = "disabled";
 		};
 
+		emmc: mmc@ffe7080000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe7080000 0x0 0x10000>;
+			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
+		sdio0: mmc@ffe7090000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe7090000 0x0 0x10000>;
+			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
+		sdio1: mmc@ffe70a0000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe70a0000 0x0 0x10000>;
+			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
 		uart1: serial@ffe7f00000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xe7f00000 0x0 0x100>;
@@ -311,33 +338,6 @@ dmac0: dma-controller@ffefc00000 {
 			status = "disabled";
 		};
 
-		emmc: mmc@ffe7080000 {
-			compatible = "thead,th1520-dwcmshc";
-			reg = <0xff 0xe7080000 0x0 0x10000>;
-			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
-			clock-names = "core";
-			status = "disabled";
-		};
-
-		sdio0: mmc@ffe7090000 {
-			compatible = "thead,th1520-dwcmshc";
-			reg = <0xff 0xe7090000 0x0 0x10000>;
-			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
-			clock-names = "core";
-			status = "disabled";
-		};
-
-		sdio1: mmc@ffe70a0000 {
-			compatible = "thead,th1520-dwcmshc";
-			reg = <0xff 0xe70a0000 0x0 0x10000>;
-			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
-			clock-names = "core";
-			status = "disabled";
-		};
-
 		timer0: timer@ffefc32000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32000 0x0 0x14>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FCCC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 21:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zyjdh20muEO4UiWMCKuC/eYc3bdmbB8JdxqF/R+Vab0=; b=Yd1Z7sV9fAc/0p
	8Zq5hv4B7m0oRKn/7hLASzPl0ukUcREFERqG4CaM3xlGMeuPPQBr1z/lCgih0CiQB/jLumM34wP4B
	gTFKVzxuHlNWboX9aAtmbm/34lZsDk3D2BVRtesA4kVqQG47csV2AH3jcM9IheWAXgTvwhVbLs9e/
	hvVRA7AIjNJjHVSUc6PiE2q63V3Whj0cIh4RYARVaSn8GobkkwTLmK8katJqzgCjd81HDbSfjK1km
	PjlZVm/q00d+kD4zACHznZSaALm76pjEJ9r2fURCTmZc7e0RlAsWgFGxWo9+gmvIaWQQgdvjtxkMT
	BMU4JT1K6UMr86J8vDNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r30du-00Go4Z-2d;
	Tue, 14 Nov 2023 21:08:18 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r30dq-00Go1B-0f
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 21:08:15 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1f0f94943d9so2982156fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 13:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699996092; x=1700600892; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sez5TNXPSBGATbv4iH/EIetO26Yi46HMN2DlkNo1h/Y=;
        b=Tw2yZKAi80PXtu8KXp3aILqws6yRdqUIMcwc8hXTMHxTrDxBr2GV7PHcNrGmRdDZfM
         SYG4fFLgUuTLX6vrJi147dUd1CK/s0hh3MG3dNmRscLyRO79bcEP3IFJn2WjlWrzG5c5
         bOAOo1i596lN5P86g6Aeh9/GspV0YRALpnCUufxBzpE7Cz2E+eFzzylfCbUgBA+3BXlj
         sbQmA2zSGAJfkyNyTzsOKpkn2kXsBPLCfvWizHTADloK5vCv4mRH+H+jn5dBAqOgCdys
         9gA39rZJtZ1a/nwySJMl1+cbZ9hde/6lrD3Vx8ENrvFpWYUhtCNWx18aXHCKT7k64ITZ
         Gkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699996092; x=1700600892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sez5TNXPSBGATbv4iH/EIetO26Yi46HMN2DlkNo1h/Y=;
        b=clm828zZaIJFpsWB+vb6DxC7gVMtrsVmHpFysCnG/XzpXNIVjwSIaVq1lUg9ku1VDi
         kp5jSa/rokTyFbC/UrACCl9bJNr4SzrwS3xyTIMq2l0POSu+GnE6bRiQMTMMcXjdw5zC
         QF/MzLEoUUD7IPuk8hTK5YfbvaploUHfJpXm4rkw1iBEYkJoi6rGWscWviDJvqwK9IEG
         0WA0kJqrgDIQZxQLOiTV+bQpHupweCK0y7tOUJ4zL1P+mj1MVS+6VQXpk5fnyvxuqwdq
         CBb/97mgSB+iLs0BtlGFyCbALZ//buDZ4QKsbN2udy4tJMNnreeGnBr3dhlTCp4dyS09
         lxtQ==
X-Gm-Message-State: AOJu0YwFORrthIim/RB75ecepvjDFexZYp2Fkl4Zxo8Kr0BHUOt0hMxK
	+4rv8XAQUCfShMHWyE479pxh7A==
X-Google-Smtp-Source: AGHT+IH8BurOsz3HvxflMOcmou3k9iE9yOvNj8QSVkmj8wmmZZH9NXkHgQkBGtnbIJL3wDlNIlsdBw==
X-Received: by 2002:a05:6870:6ec4:b0:1ea:2447:5181 with SMTP id qv4-20020a0568706ec400b001ea24475181mr10001030oab.9.1699996092052;
        Tue, 14 Nov 2023 13:08:12 -0800 (PST)
Received: from [127.0.1.1] ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id x16-20020ac85390000000b004198d026be6sm3027549qtp.35.2023.11.14.13.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 13:08:11 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Tue, 14 Nov 2023 16:07:59 -0500
Subject: [PATCH v6 5/7] riscv: dts: thead: Add TH1520 mmc controllers and
 sdhci clock
MIME-Version: 1.0
Message-Id: <20231114-th1520-mmc-v6-5-3273c661a571@baylibre.com>
References: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
In-Reply-To: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699996086; l=1662;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=5F3cUoM9uPwZr3nAbkkg8hlE/aYbHbZypGZJHmRKKkc=;
 b=sThdFfxHu7C2ISnkASyL2+wqHUobTAv8LAVRkg+GAuiicLGX3E6KGT3ZKwLzgZL2o3ywX/aly
 pVCC5HUCjOrDQuteATDqXpsfo/PxZDp6Iyt51XFI1h/TTmrr5Ki+T4F
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_130814_247201_884A6401 
X-CRM114-Status: UNSURE (   9.93  )
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

Add node for the SDHCI fixed clock. Add mmc0 node for the first mmc
controller instance which is typically connected to the eMMC device.
Add mmc1 node for the second mmc controller instance which is typically
connected to microSD slot.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index ff364709a6df..fb8a4a04d3c4 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -134,6 +134,13 @@ uart_sclk: uart-sclk-clock {
 		#clock-cells = <0>;
 	};
 
+	sdhci_clk: sdhci-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <198000000>;
+		clock-output-names = "sdhci_clk";
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -292,6 +299,24 @@ dmac0: dma-controller@ffefc00000 {
 			status = "disabled";
 		};
 
+		mmc0: mmc@ffe7080000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe7080000 0x0 0x10000>;
+			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
+		mmc1: mmc@ffe7090000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe7090000 0x0 0x10000>;
+			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
 		timer0: timer@ffefc32000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32000 0x0 0x14>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

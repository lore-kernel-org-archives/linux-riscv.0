Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5523CA101E
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 04:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzT25OSu4M8DQhNsH5L1ZINbDqt/+ifptECbl+la7qg=; b=iHUJULdWBUNk6X
	Cm5zCyeOqs1ovd47tbBgAfsU1nnrn7Eqi7SiNz0qhDOQW81tje8FhepMtH1YV4+x+KgQBQ15aj5SE
	VtvusStcNWMEfd3eDWNF+1o5o9UGhQCiA9/40//NW77kgAfYLOAN2/hc8+gpMSqZNVflW3QpBBeFG
	9JYu9NaMOaJNO8MfY4zNb+C3fNwkg6MnoP0oH8jLbof23g+t+hW75zi/YMFc3RCsxCwik57MUMK5o
	Bs6N4abuByJUQT5LTfeMIQ1tRK93A8vjypT5EwzNyovXkSIZ4nVVOy3w5kZkA/pn5uFZajrx8lUDi
	1nYe5AawO34igZOK5Mag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slKqh-0000000GFiV-3GjQ;
	Tue, 03 Sep 2024 04:08:59 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slKqe-0000000GFfk-0eDF
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 04:08:57 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-714226888dfso3952155b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Sep 2024 21:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1725336535; x=1725941335; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NiQQIOurN5s0FJRXD43MLGWhBSOLzbp34+DraYLBvAg=;
        b=LqW0rBYtRHM5Nu3zioiQ2wFAPW4tUgy9ha09FPSK8/P8ClbD4WzAihUstz/Y8ev/+o
         f33p66zDMYzfCVA11DEOpCpU1SJo43itkZW0A33R4QobP47pZ4k44u+8WFwfpiSyXytv
         JsypPx/h1e/XUd1879ZPPhQPP4v+R11YqbZpGNhBIcsXqwTfPRdCc93U+8l2p3RYpGSc
         ksGyDIIYF2QjXr1y8+Zr8cacHFpwL0L6Oeu2BcSE2MQ8+jbyyRGd7/2RYvS7qSHoiZeW
         YMh8zqWV4+aPeZxQgWsqeKlS/tnvkVjD1mWqDR9+P1V5mOjbVW9/4tdwuxT3NH7K61Wy
         W66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725336535; x=1725941335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NiQQIOurN5s0FJRXD43MLGWhBSOLzbp34+DraYLBvAg=;
        b=rZB0hLbgVG8Q/uZsHg+hdGP1D6bqA4MFyVaAMgcfacB2/uYF08ObD83GoCovpnfwgC
         mcUCz58NQOfcVl44ce4iA83nlD8ABR8F3CvmURZ22dDKaGKtgKPoVRdcq0Kw9k0OUL6j
         QSxaia5BzazJf6DIeYJdUPY8D/JHluCpww0MRrzA2ZsYTG6NGXTTV/313SS8lAk+Kiya
         77Lb6tN28AO/r5BnvR5Cd97sW+sYnlZT5BUw+w13575353KSNcK43HaC/LbopEpTBact
         YhvxFTDs13qGgosMfan2/ngXQLWef/o4da0enLhbkb0MxRT6K2dmp1mSgTkg1tcH+wYw
         8MDA==
X-Gm-Message-State: AOJu0YxuHfIMc/kZF2vBTFWub7SVrCiJxDaFe8fKyQ9vGQZaMuMCefUn
	tF6GitS9PDlpQDg87VoPOQEaGJfjTG5Hir24VJWWxSCyJ156Jg6WMvkA1B3+dxE=
X-Google-Smtp-Source: AGHT+IGzyiuhlkMwYG0YMzdnnd3LOlKnGZxIN1H4tU/WAf0wybOl/XWFUTDfriwcPu5zruQGDsplqg==
X-Received: by 2002:a05:6a00:13a6:b0:70b:5394:8cae with SMTP id d2e1a72fcca58-715dfc76152mr19057737b3a.28.1725336534809;
        Mon, 02 Sep 2024 21:08:54 -0700 (PDT)
Received: from [127.0.1.1] (75-164-215-68.ptld.qwest.net. [75.164.215.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e569ef39sm7532701b3a.122.2024.09.02.21.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 21:08:54 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 02 Sep 2024 21:06:56 -0700
Subject: [PATCH 3/8] riscv: dts: thead: Add TH1520 pin control nodes
MIME-Version: 1.0
Message-Id: <20240902-th1520-pinctrl-v1-3-639bf83ef50a@tenstorrent.com>
References: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
In-Reply-To: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_210856_257402_BF7E1B51 
X-CRM114-Status: UNSURE (   9.60  )
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

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC.

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  4 ++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  4 ++++
 arch/riscv/boot/dts/thead/th1520.dtsi              | 24 ++++++++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index d9b4de9e4757..be85e3aee56e 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -44,6 +44,10 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
+&aonsys_clk {
+	clock-frequency = <73728000>;
+};
+
 &apb_clk {
 	clock-frequency = <62500000>;
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 1365d3a512a3..530648ad64f6 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -25,6 +25,10 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
+&aonsys_clk {
+	clock-frequency = <73728000>;
+};
+
 &apb_clk {
 	clock-frequency = <62500000>;
 };
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 3c9974062c20..834dcd1fe7d8 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -215,6 +215,12 @@ osc_32k: 32k-oscillator {
 		#clock-cells = <0>;
 	};
 
+	aonsys_clk: aonsys-clk {
+		compatible = "fixed-clock";
+		clock-output-names = "aonsys_clk";
+		#clock-cells = <0>;
+	};
+
 	apb_clk: apb-clk-clock {
 		compatible = "fixed-clock";
 		clock-output-names = "apb_clk";
@@ -357,6 +363,12 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		padctrl1_apsys: pinctrl@ffe7f3c000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xe7f3c000 0x0 0x1000>;
+			clocks = <&apb_clk>;
+		};
+
 		gpio0: gpio@ffec005000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xec005000 0x0 0x1000>;
@@ -393,6 +405,12 @@ portb: gpio-controller@0 {
 			};
 		};
 
+		padctrl0_apsys: pinctrl@ffec007000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xec007000 0x0 0x1000>;
+			clocks = <&apb_clk>;
+		};
+
 		uart2: serial@ffec010000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xec010000 0x0 0x4000>;
@@ -529,6 +547,12 @@ porte: gpio-controller@0 {
 			};
 		};
 
+		padctrl_aosys: pinctrl@fffff4a000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xfff4a000 0x0 0x2000>;
+			clocks = <&aonsys_clk>;
+		};
+
 		ao_gpio1: gpio@fffff52000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff52000 0x0 0x1000>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

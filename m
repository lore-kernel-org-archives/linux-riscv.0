Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747DFCD98DA
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 12:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ShBwmezAvc1bkbNvbe6ERL+on38mCY8LiPQ7IengexU=; b=vprjX4Wl7WZKgB
	7E3EYsIYlNlooGlMCddPMxB95rLLiP62W4HrcMX45ArFcZKAyAZN2KZlTQJg3vrjBfOQOUzZBojKi
	DsOTwNaRp3wkXMK2wtA/S3QJfOFT2MNzhtuC/HBylkoFgTnEPDAbex3n98NuZ3fJ6QNh3jl25AkjK
	HROi52B6WfZjNH0AP7Xq7d6kaSj/og3jw+zY2a75AeLQyJy85RMQwRNxv2/PW2J+yrLT7KDu5eL5N
	LDyu+tywmxFnAfiOcouEtI8454IAWw/dmeb8EO6upK5eKQDz2yzYHIE1r9KFLsAwdjLPDF/x+Gt/O
	lVoRsT8tu0UyXfne+7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Io-0000000E9x0-2AFZ;
	Mon, 15 Jun 2026 12:20:30 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Il-0000000E9ud-1yoh
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 12:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=2449; q=dns/txt;
  s=NAESA-Selector1; t=1781526027; x=1813062027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q9lQpwaA0Hz3D57THFfabjgfrQUdMfIc8XvBfqBDOG8=;
  b=CFgVc5GuwboVlktn7DE+3ojTX/s7VZIt/Sky0tlHrbn0Cfrput2zj7te
   w83Yq2tpt2BrOt3L1Lp9dIsQxUuXVHl3Ko2AuVSyE1/oVMBUrsmsulRap
   chkJYnGVP0yYpT1hP2Xc8DLMsmocCLYZs+bhiu7fAl/a+e1snbE9tcJVs
   wDZZJk08c9M5WQjBXLdXhNZpq6FgzSYRs71LRhf4TK2PJwAJJW8BaSehg
   /jOB6tNzm3KITLt2eACMmscS3ii/Wum2UpUZYjRU0wnpbnASoTbN+cJkV
   PcAS/cI5ASzOglxJc8/0qvvK9Pyl2+n01aGYDM1zyzYymrug/Dr0FBsGA
   Q==;
X-CSE-ConnectionGUID: vrcrY6EdRu6UdHRwmXm2jA==
X-CSE-MsgGUID: 9dg8lPOjTFK1fK4vd1eAYA==
X-IronPort-AV: E=Sophos;i="6.24,206,1774332000"; 
   d="scan'208";a="55984211"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 15 Jun 2026 06:20:26 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Mon, 15 Jun 2026 17:50:17 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH 7/7] riscv: dts: eswin: add watchdog support
Date: Mon, 15 Jun 2026 17:50:16 +0530
Message-Id: <20260615122016.1110206-8-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 15 Jun 2026 12:20:17.0084 (UTC) FILETIME=[534EE7C0:01DCFCC1]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_052028_115316_5D11A120 
X-CRM114-Status: UNSURE (   7.37  )
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

From: Pritesh Patel <pritesh.patel@einfochips.com>

Add watchdog node for ESWIN EIC7700 SoC and enable them for HiFive
Premier P550 board

Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 .../dts/eswin/eic7700-hifive-premier-p550.dts | 16 ++++++++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 40 +++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
index 0f0c98474c62..a188a5e1d526 100644
--- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
+++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
@@ -193,3 +193,19 @@ &uart0 {
 &uart2 {
 	status = "okay";
 };
+
+&wdt0 {
+	status = "okay";
+};
+
+&wdt1 {
+	status = "okay";
+};
+
+&wdt2 {
+	status = "okay";
+};
+
+&wdt3 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index 28706431b2c0..a59a9932be0b 100644
--- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -265,6 +265,46 @@ hsp_sp_csr: hsp-sp-top-csr@50440000 {
 			};
 		};
 
+		wdt0: watchdog@50800000 {
+			compatible = "snps,dw-wdt";
+			reg = <0x0 0x50800000 0x0 0x4000>;
+			interrupts = <87>;
+			clocks =<&clk EIC7700_CLK_GATE_LSP_WDT0_PCLK>;
+			clock-names = "tclk";
+			resets = <&reset EIC7700_RESET_WDT0>;
+			status = "disabled";
+		};
+
+		wdt1: watchdog@50804000 {
+			compatible = "snps,dw-wdt";
+			reg = <0x0 0x50804000 0x0 0x4000>;
+			interrupts = <88>;
+			clocks =<&clk EIC7700_CLK_GATE_LSP_WDT1_PCLK>;
+			clock-names = "tclk";
+			resets = <&reset EIC7700_RESET_WDT1>;
+			status = "disabled";
+		};
+
+		wdt2: watchdog@50808000 {
+			compatible = "snps,dw-wdt";
+			reg = <0x0 0x50808000 0x0 0x4000>;
+			interrupts = <89>;
+			clocks =<&clk EIC7700_CLK_GATE_LSP_WDT2_PCLK>;
+			clock-names = "tclk";
+			resets = <&reset EIC7700_RESET_WDT2>;
+			status = "disabled";
+		};
+
+		wdt3: watchdog@5080c000 {
+			compatible = "snps,dw-wdt";
+			reg = <0x0 0x5080c000 0x0 0x4000>;
+			interrupts = <90>;
+			clocks =<&clk EIC7700_CLK_GATE_LSP_WDT3_PCLK>;
+			clock-names = "tclk";
+			resets = <&reset EIC7700_RESET_WDT3>;
+			status = "disabled";
+		};
+
 		uart0: serial@50900000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x50900000 0x0 0x10000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988EEC7EE33
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 08:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KBdkSmKrpb+PZkswhotg+F6Sespe3qjInn9t/SCY86U=; b=idXlH1Jdqo3+QC
	el0aB0hfDeHrnmOiTe9N1fDAHA+ZeQgzta0pVJjdxJ5aSGk5yhU678QC259T1ACmiNxtOt4lNIPLA
	rCBGEq2kowLAgfB2fJ3C92Jl38DNgrkTpbY5vwBAE2IVs+SOWvJFGU1vKuJ6EOe8r860igMgpI6VR
	/Yc56yeVazTjyTCznwSvUEYi/9fd6jqI9f2eKu2OOjBS8+qIU/+Guig+cB3fG7XbeHS3qEt0E/np3
	9k3GCW/oeH1FWsaq0e/8HKYzS+/eu+iHrBnH9911K4bZQZKKmvwTRSyzsQGeq13FN/qLpR2Lih/ix
	kX5MkT5wV2XVhHC7LxkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhel-0000000AtUU-2IM1;
	Thu, 26 Jun 2025 08:08:27 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhXo-0000000AsOI-2nIV
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 08:01:17 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso783974b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 01:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750924876; x=1751529676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9G8EsFLPHcydSdSrFsRKcmtgOEiF67NnihrfLuZNDOk=;
        b=mUrWkctrADkVTJ0xxqaaiGQCTHbidFlJFN2cNXN/kSFPSnrxfbBkbHHLG6EgnCs4Ro
         a9U46z+nqbD7v7aG9MzOmuIEv9+qI1gw3VixVGCLkVS70J6XTVgFyyT3NhfcdBn6Dc/m
         yXHBfn6rZuwqLmfN29kTVAf3iYK4PGeCLlc658JCTljjhMDJU7FDhCKjb+3l8V5WMUes
         U5H7CeE+ROAxYbtZZEY4NLidOGmW6kXI34mdIYdTt3KoTSiFI3jYSc5Ga9Flt1mse0V/
         E0UbWNQlPvoWVWPtoLmYoU4UPnZ6o/1lx3Y5iT5pC9CwDmaCS0X39XsdeE7KV22m23Ld
         Vhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750924876; x=1751529676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9G8EsFLPHcydSdSrFsRKcmtgOEiF67NnihrfLuZNDOk=;
        b=I6hVVar7RqEpfnoQvRrbIdIuKCgMKnJcG31AQdhs7BujG/geYTCzRwZt0WPKojimCL
         KWq9FnFbNRcZ571g8tnqCSI3BUX/zW5ZGtvXX2QuBgCX3QoHqnBrfe6JuO1jNkVIdtu+
         VdfL1XfIBWERzkFy1g1PgE45KqR1qf2KVIw4cfPRxUVnbFFDbjP+q3zQyCJBdt3ImkV6
         3At1zNQZw3A3SIMkPpw18LTA/s31Nsqb1CKr8qKLoUBYSFhrwURgfV8b2nefY1rs6axj
         Ly09zOuLsxbJMS2EJd36DyORYwnspFzORpJu518CTo0x4wYryEf+eHv7RfqQnN8ezC5K
         5qBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMCZrPo3LPS+3Og4AnhJ2TkW5r5iJk9nKBIwVWxQX/Jo8Nj4LEoTDuw7VjOpcOSWnNHxHzJj4cHB4CMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAaVlYAi/+X9o618qP8Rp6CYul4vokA/mS51VWQwuJBlGq00t6
	BoU00PawxPHaqps2CY0NrLPci34EYua/HnG4cdE9uniaZGZpBk6yFetp
X-Gm-Gg: ASbGnctMAmpw5xRZXEyzInbMrKK32CiXEZX36D6PkGbzbZuDgfHj1N9PxIkuo0lHpVS
	0qE5N5mE+5JcbpXUlgakc8anMU7JmMuNJlFZ66bSvXSUavRIAUgu9hOmfBy9INVSGyYI+QSRZDx
	FImRZROgsg8RdgSGWsx1MOG4Qe/V5FBCozZcJpgqCXcn4rnqhuxbtWTsNDdUQmJxdTazWS9V8k/
	xcr8cEiZ9jAYHgiMfa2jkiGIy6bZZj76k4snrgaspzWSZw2qMRnskyOeQjLxDl0Li69jwQ3CLuJ
	iN5CveAmD7idwGNsID5VLvfzbLsZhEF23Sr9JBI5piJQ53XJmWzExZKZ0y+Oyw==
X-Google-Smtp-Source: AGHT+IEeIBWKO8E5PCuCUGThQMx4lBDCQNancA7w0a6KHPfjh8T/RV1VkMb32vMY4xaiTzsYTWtccg==
X-Received: by 2002:a05:6a00:800a:b0:74a:e29c:2879 with SMTP id d2e1a72fcca58-74ae29c2a25mr3579898b3a.15.1750924875839;
        Thu, 26 Jun 2025 01:01:15 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74a9697817esm6108788b3a.124.2025.06.26.01.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:01:15 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v3 2/4] riscv: dts: sophgo: Add ethernet device for cv18xx
Date: Thu, 26 Jun 2025 16:00:52 +0800
Message-ID: <20250626080056.325496-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250626080056.325496-1-inochiama@gmail.com>
References: <20250626080056.325496-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_010116_704140_F954378E 
X-CRM114-Status: UNSURE (   8.86  )
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

Add ethernet controller device node for cv18xx SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 44 ++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index e91bb512b099..7eecc67f896e 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -189,6 +189,50 @@ i2c4: i2c@4040000 {
 			status = "disabled";
 		};
 
+		gmac0: ethernet@4070000 {
+			compatible = "sophgo,cv1800b-dwmac", "snps,dwmac-3.70a";
+			reg = <0x04070000 0x10000>;
+			clocks = <&clk CLK_AXI4_ETH0>, <&clk CLK_ETH0_500M>;
+			clock-names = "stmmaceth", "ptp_ref";
+			interrupts = <SOC_PERIPHERAL_IRQ(15) IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			resets = <&rst RST_ETH0>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,multicast-filter-bins = <0>;
+			snps,perfect-filter-entries = <1>;
+			snps,aal;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
+			snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
+			snps,axi-config = <&gmac0_stmmac_axi_setup>;
+			status = "disabled";
+
+			gmac0_mdio: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			gmac0_mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <1>;
+				queue0 {};
+			};
+
+			gmac0_mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <1>;
+				queue0 {};
+			};
+
+			gmac0_stmmac_axi_setup: stmmac-axi-config {
+				snps,blen = <16 8 4 0 0 0 0>;
+				snps,rd_osr_lmt = <2>;
+				snps,wr_osr_lmt = <1>;
+			};
+		};
+
 		uart0: serial@4140000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04140000 0x100>;
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

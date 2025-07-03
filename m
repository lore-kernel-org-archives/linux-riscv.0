Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58572C8303C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 02:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KBdkSmKrpb+PZkswhotg+F6Sespe3qjInn9t/SCY86U=; b=OYydczOaCM+th2
	dD9lWRmn26wBuc/TnnadYs+yoGFFLs5PbB2v40PTMZRvzq5zF7VwRwibr7oHLDYrLCggMhPomEY8f
	APo3cVsUdle7Jh7MAviF19J5ksDg7y5tdQpMCw1bJ5k1rxKzKyIGM9g4eK2VFDN+iOsbEhB6eXCqr
	HP4k7poC1Cf6a/z+l/BfiK1sedA1GvvGPtE2vcFyG+df5HMDgwNSPPYvAS9CwP6V9juaSzKg4PqH0
	5gCI9XsjsSaV/2mpxsoORGhC7gRZpWNxWxtD2u21+ldC+1cZ1GHQaX9bq2DKQz9N6vUkiU3v26W8p
	vCuIMotdErAsxbEpio0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9Uw-0000000A0MN-1Nq4;
	Thu, 03 Jul 2025 02:16:26 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9Uu-0000000A0Lo-2bjY
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 02:16:25 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-748e81d37a7so5281060b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 19:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751508984; x=1752113784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9G8EsFLPHcydSdSrFsRKcmtgOEiF67NnihrfLuZNDOk=;
        b=dpPzVMVibWs9xzS9yY4jKGbB06FtWVI7GKEi6KDbuCnZXuEidXV1IKArvectD1HuKX
         4HPikzRDjrQmzixtt20qiVtRRmM5LhM1+fpQoVFdvlO4mmgBKE6W/afkHs70L+3YhdGk
         xzm2BAqTutYPmw2GHXYb2cphjBCSSYEZ1kn0QxAx9jtr+/Be/SL7U52eN9ND9VGGlf3S
         EFV5R5roJjOwfcAUHhv74MBYHCMNhPT3GAGEWB/w1NB9C0xDYpNfQvoAGVj/YQBZLM41
         VohAdcYyRwOmMZNhXcoFg1Sb8yaYhwk+TAdpfI3FtgCPyJm0x1JocUt9p/bb4DCEmstB
         Wktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751508984; x=1752113784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9G8EsFLPHcydSdSrFsRKcmtgOEiF67NnihrfLuZNDOk=;
        b=c22xRZOtYw7n+/A9mupdyZjkwl0mYTqgMHb+Q9VtNxtXfnO0vr96A/4GyvKjV2aFgv
         GK4nePEYLHAhTFB45lNdcJ2KTicFKpxmn3Jk3tdKrbyabM5ot04gQm6uYxQURU4TQjts
         7dgwX2Qcku+2C5XrmbFDRhiE2SXjmL1lmfgWPqBSy22KD9CH7pQZT3TlbLThPNkI2JOQ
         Z9YpOiuG04o6mmda17m2uH4jOV82+w7yz2sEAOqM1XsuVmD5ABmsFs2sbMX2oeuUu+O8
         3zrVO8Qbu4waaIfWaVx/ATYbXCqYYEakPM7gqsn9fj5FavXJoHOcy9yW8zH9I2JfsFYk
         //dg==
X-Forwarded-Encrypted: i=1; AJvYcCUkLj7kRpbOct7xuyY3HqVJiu15v3H+YczLuoYWePp++YvYY/YThdCP37BpfW0xIuH7t7mcHbSYThUi4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzK0r3tUwd+vUQc1E6ufVOLgOIzG+eR5XnL8gRas3nRl26ZBX9D
	m6kYVLOlRiKOwVrxOPaM+c3ASRzhxV1YDIlrorzKAOFGK56qD1jOfDos
X-Gm-Gg: ASbGncuMGf762EyCS0bH++GdtUU+OnVfltxFYcsNxIQ16oJWErcugEH9OGN1IaprJyC
	ONDxNY653+YOX9DaLZigfxVkfISY00LlArXJe5uGeJD3kA6Kl82naVg4TtC3a5a1zP2/QkB8PAj
	7XP8/5inpoHKtEAd5+Z5kFe0gOg5fbl0MFV6XyqvLYgY2aUSZY0iLXM4OfF9hGni2JbNPIwzoa6
	rhDv5n1nqSIX74ZsFv2mvxxL9gs2+vgZDFIBPHocO9PCvU+NvOJzecuoFRQihDEUC8g+eu+nXeu
	ALCkkkOHlQTxYg6nNLUCtOdeah5Eb+/rd04/H5NtlnBU6Y2uwqdtyi+bnf9dJA==
X-Google-Smtp-Source: AGHT+IEpfvICwsWVQEs2aV82TjO8nSl/wr+6JnI2pnLczgYzsPIqjZfU+7/+o1SmEX0puDeKxR7JHg==
X-Received: by 2002:a05:6a20:7fa5:b0:220:af86:7e01 with SMTP id adf61e73a8af0-2240c6a1815mr2739797637.29.1751508983597;
        Wed, 02 Jul 2025 19:16:23 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af57df5ddsm16245401b3a.127.2025.07.02.19.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 19:16:23 -0700 (PDT)
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
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/3] riscv: dts: sophgo: Add ethernet device for cv18xx
Date: Thu,  3 Jul 2025 10:15:56 +0800
Message-ID: <20250703021600.125550-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703021600.125550-1-inochiama@gmail.com>
References: <20250703021600.125550-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_191624_658496_2A28907F 
X-CRM114-Status: UNSURE (   9.09  )
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

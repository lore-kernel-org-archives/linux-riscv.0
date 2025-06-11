Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0D6C71137
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7XfZfljt2WRGxnaNquMpTEcBZsX/QX+wh2AJmxPg9D0=; b=uvqzBRlP0yoxT/
	Oi2E8brCwK3R2qw91u4uLv1IZsUAlrFuaPOYxEPw2OGaMHfY72CVYzwydDQi2oy303eOzxHLRPXX8
	eEGLH+fp44/i9GMYXBzSA6Q+la4PANLiNFLgaFB9FMb/F3eQTVNrEjpfpy0viYl0SIxw01/Nkzu2f
	OHEQEvEkRmdS2XnO8m1Xc2zWRC1J/dMqjGoSX72pmuvYpbHwzZDSUcx+6yPEBkwrad/qMjNyphFo+
	N5ZG0te46UpTevtntUBM7LmpVB5/e8kngKuOTpXBenJFVDubpByWfIKBWy98DWfZKhIRAlkJPsSBI
	a9TZfwy4Xb8Wi9CSd0/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGw8-00000009HhQ-2ARR;
	Wed, 11 Jun 2025 08:35:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGVg-00000009Dcj-1GGV
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 08:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ge003WgsMwudUMdpNi+b49fQSC43w6jsORUWEBCoqBQ=; b=MOOQhmeT2kVCY+eRPOCaegJbD9
	gY5sj2DQnL+2Ot2N4ScXGO7akTz0FzFVFDVKbctnq/P10gcWnX1eIFG1OdPmsUoSN0KnN20azgNRS
	Vby+lS3sMWR0yqkHzOEzANo8U5CnxjpNcpvq/Y4OOBf0EV3IbIMu/BSAX3H6u6pyiM70f9PAASxpB
	mQoRdGHdb65ZjK83dxWNfSYaGdQgozBsQETkt/MIfkrRe8qJ4xCes1ohwp+MKC9V05kQmJHDBKNRj
	qdtEgp7JOpLMZjf8OTlP+YptVb2qQMgLE+kquBMNYoaip0CTeewJ0sm74+sXuXtTb+bn4pf2D0EPM
	OIRVvA4g==;
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGVe-00000002BRy-0AV5
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:08:36 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6f8b2682d61so6805666d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 01:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629309; x=1750234109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ge003WgsMwudUMdpNi+b49fQSC43w6jsORUWEBCoqBQ=;
        b=KIBKEEfTH4uzWvSxqaD2PCXioOT+PvdVSpkv7Qb00yb8LL6KyHfR2QBGAC5kYehCzU
         cQUnIv0cA/+LLswgY9iAPS8fi7+UvisUiWsIBS91jrBbQS5KE9FUqJpfIZzNNWze7oJ0
         AnHXJ0oNKI9Icl6wdERL63ikX9EenjOqfeZ9hV9twaFoRiRpaBruDaYRTJ9qNEj4I8Pu
         /ti/FwFF6Ubu2uDU3OXDjwcV1mi9jdf8dGFyP6B5V66crH4JYHiMA+5eNRnTIlDjXeOz
         q5iUXYM0w6I8yVWaudLQLNTd0Kbrfz5EmZMPHlRKQeRRyC0r+RLIenqL7BA7oiLlcfsa
         O6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629309; x=1750234109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ge003WgsMwudUMdpNi+b49fQSC43w6jsORUWEBCoqBQ=;
        b=oqyDCYQgqzoscnafDiUY/GqU+lWpRToeWcr+oxKguFW1+zek1t/3z36rLck9vRik49
         HDMskrLzSwZxULKj8bRi0t6tTkTiivCzW8W++Mmm/XKJIidB/+4flDa6gICqTVTJxDVf
         OAbCA2ae/WEMQIq1h3kNC0IZlDd6OTFsXbPoQvh2hIDwGk5yeb77favSk3cp7/nOu5eJ
         nxXbVx9/VtV4f+Kpih878Vqvq6f119o6ZDuD3PQGyptq8mUh213Sryw2Q5QhPbdFVBBX
         VyK4qW5mVgsgsvV6Hf62o8V/Y0mGkYXzvODyob3jw29vy8iGCCAPlFDePFqxGzEDGyxV
         s8YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFrhWH50lmxHmejpAD7yxkOfhznTtRHsa01Bmk8Eo7msPtMnMrIjA4KuMPBGhb2cYloX6D8AAge8aZZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrq2PesC8heggbzRREYFt/JzAtzhe0Zyj0BxXv/5eXjzldP0P4
	JLxALySdXe7f0E4zDBoGpMyVrOXJfGWfWia0Hwrk4iPVYg+tFGcogNZS
X-Gm-Gg: ASbGncsD/iCBdBufP/2B+3gOXexESZfg4AO7hyK7uCKGYmLhKKr/jA5Z/89dI9gJxcj
	Oh73YMyb8SvD/laXk29TGL/SSo+zhNfcPJw74VszcrD+OYSVhthkWFiJU7T4chp7iGGN/+8YaZE
	iYBDf4A/2dgwmQ9x1Xf4ziX7Kj6/e2FqFe6r6YJk4OAs9NmFdaejn/p0IsI/xsKAKxh9ZwB9Ppm
	uzB0LZwXrjMs1qRSZpJGD+xqTGRIsvFxtakt51JHSXNCtEsL4cAQxbx02QB7SdaoWuVYmSYtK+J
	Y2555j4ZXaW2aLL9/yOCV/TVvOn0fy4bo+BUL0U0Ex7oFeGv
X-Google-Smtp-Source: AGHT+IFBz0E3rXdgSVz181RQOaZkyTs2eWSoYwoAfP1yHwV/b8ZHhiVjlkMydErBFnwNENizLT3OYw==
X-Received: by 2002:a05:6214:2aaf:b0:6fa:ad2a:7998 with SMTP id 6a1803df08f44-6fb2c3d48a8mr39200286d6.18.1749629308594;
        Wed, 11 Jun 2025 01:08:28 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d24b32073esm847127185a.0.2025.06.11.01.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:08:27 -0700 (PDT)
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
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC 2/3] riscv: dts: sophgo: Add ethernet device for cv18xx
Date: Wed, 11 Jun 2025 16:07:07 +0800
Message-ID: <20250611080709.1182183-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611080709.1182183-1-inochiama@gmail.com>
References: <20250611080709.1182183-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_090834_219231_64AA412D 
X-CRM114-Status: UNSURE (   8.95  )
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
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

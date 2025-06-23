Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF32BC77B7C
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 00:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KBdkSmKrpb+PZkswhotg+F6Sespe3qjInn9t/SCY86U=; b=EGyYsA23attinb
	Olcp2nr7bfxZwUO1QIJ7yLMNvAgDsPF6wEO9IA8CXfkwhig4aNYXMqEz/Kcc6OVnyeDkWZDmfYNEs
	qIxrUeYPgvDgA0RCaih7EL2E6pwH/roGV5J1HgO4V4ERmN9gCYto/76HircPl14F7tIEvFRT3KDgE
	sQ1/pTpmry0jnvDrmr3A734RAiXRPpakbVtPNYFV6AaUViXEXnuv21+OybfUI5YHOZYWvMq8R/Z2E
	OTKdtujKXnn6VL/Zzmk4TEY4uXOy2fS+mEtgr6qKyjbsen4845LoSoxavlwGnCaB4OVbGGpJTbHkW
	b7FxpE9RRNm2EUTjmbQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTV5Y-00000001M2x-1wsZ;
	Mon, 23 Jun 2025 00:31:08 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTV5V-00000001M0y-1gAF
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 00:31:06 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-23636167afeso35492275ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jun 2025 17:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750638664; x=1751243464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9G8EsFLPHcydSdSrFsRKcmtgOEiF67NnihrfLuZNDOk=;
        b=E0hjuPfuIk35yfv2OafKrCe0sCuSVoOsqR2Jv535crXDDQ4IpGIk6hY7Gt1Gc80JYM
         VsYYBDE3p10Ikjzzvt4xXza3tF0BMm3Md5E90z4NdS7b2JAafTPLR4cdH80E5XNteteU
         3Sc3ayYUBL36AaHNN7Yw7RvJEqred4d9MP1pXiny61dUlvsLvTrzVDOoF9rFSbtcXrZw
         /KU7iLEEJjmqqUBL2CQ0D8umpY/4Ljb1URi6JJu5m/LeY0EhIhibSuTRoCZ7MfsbXD3n
         14ZZyd8JPa5OJsV2EpFnVOMMkJiDgIRs1ULQUciiu09pAT4AK6DvdpMPut8huOYaiDFY
         wSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750638664; x=1751243464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9G8EsFLPHcydSdSrFsRKcmtgOEiF67NnihrfLuZNDOk=;
        b=K79CbS8gFGZc2+edvLxIpjLI45mYtTL2gZ6vfMuJiE9vPSNQES1QxoB+Jbdni19lzO
         +L9riiktZ5Y8JkjtNYUD+0r8KLp8xMvsYy6BwfYHTSN/4Wwj/w7lwrldaCRK4NvHGZZO
         njlsw+U2pIzoQTNkamC6a8Afk1xO+G2WhBo2+FwUvVyYVV5UpPFNxTpMfxMNH83QD/gi
         GCdFF2ye5XQUj+Y2Ljq668DOlBXDhF5wfP0tDySDOgIFXJ7q6daADWylaaOGzGMMqJzV
         UUmDbalj6llaM2bhx1aXxBpB3o/HkyI11GsLt/Vunr/EWGWSwgs1OJxYqnsl9eVlycoT
         OxeA==
X-Forwarded-Encrypted: i=1; AJvYcCV8v8y6WWifAGc4dFdx3q0mgBRt5iHUt0jWqNWAWvvNkWiFakrJC3js/oIsKRTv4x/hTMCC4OvLwjen7A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6aO8+0oLoWcB8v/L/3qOK+mep31cP1+vkSrrmXXYErucIEJZd
	qcoKLcezpe31psn0BSt1rfrwLJ9vYMIhpwfRaSYsaxECJNyGhF8A45Wo
X-Gm-Gg: ASbGncuCAq8ArwXeb9HzfJHMtPJbl17XjvWbnZKKJkQHCDGnPXAwxnfPug05W9BrZH1
	hlHJuDoCQZ1mcC6NuLXnWmgZatKlILLxPtFlcGDXDP9CN3rqps5QMu1FGKv+VGYvhfQCK6ZvrzW
	251v+Fe5lTX0kCrzMSyWBnTN4ImQ39VR1mSoUJWFYES/vY1HIGu2zTvhjgvt1meVBVXF4Ld9/jT
	djzdubxtQlXfZNrVrwBv7fCkLN4xvNukadAX/TomnSQp6AKokzV9ooA1WQsy7mbpZ7Jbg/rKjR8
	F/teHrZJMua/A4xTf34j4fSJCx3/Rwcj5m//RFqcExddVX7LTU+4nFFzU4Fdog==
X-Google-Smtp-Source: AGHT+IH9nFpNJSObaAZYjqO9Xl+MXCzAAap0YDff4CiKEVwvDjlQgHiHJJhK3EZNLfia51iUp2PVwA==
X-Received: by 2002:a17:902:eb8a:b0:234:c86d:4572 with SMTP id d9443c01a7336-237d9a42e01mr143684805ad.30.1750638664409;
        Sun, 22 Jun 2025 17:31:04 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d8391494sm70195695ad.1.2025.06.22.17.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 17:31:04 -0700 (PDT)
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
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v2 2/4] riscv: dts: sophgo: Add ethernet device for cv18xx
Date: Mon, 23 Jun 2025 08:30:44 +0800
Message-ID: <20250623003049.574821-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623003049.574821-1-inochiama@gmail.com>
References: <20250623003049.574821-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_173105_438992_D24F172B 
X-CRM114-Status: UNSURE (   8.85  )
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9FAC8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 01:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KBdkSmKrpb+PZkswhotg+F6Sespe3qjInn9t/SCY86U=; b=ZPtlbdfzHWiwGD
	+dNamImW1ZduGtfvXeg67xfOf2ALLx74jMftLfb2mAh0SPi7rMtBt4sCDMdqxsVH5iKPgcryZUeJh
	l7lJP+oKQCN0ZMABSXyuj6phPQ6WxryjiZbHLV5jn4h3BtCXRG1TaGLKg/FPyKinSmaI31rfqy/xC
	6az9EdSHKG0r109jXYZJb3kBShplRS/n6ZAERgODtUWqlNlpf18CQ2PjBL8hthVwP6klB7ExyV/Mi
	x4MlTMcqhCQ1PofRZjNsXvD+Tp8dRSmIOMrTFIKQ52oQJhDgolAA5DsTV3PrrboYD3xxZoH9kB5vY
	UcHV2j6eKQyrpvjQGmnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWPdG-00000003o3F-2Mlq;
	Tue, 01 Jul 2025 01:17:58 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWPdE-00000003o2U-2kcy
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 01:17:57 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-313a188174fso4972791a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 18:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751332676; x=1751937476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9G8EsFLPHcydSdSrFsRKcmtgOEiF67NnihrfLuZNDOk=;
        b=NyybyxRhg9AEVBAuByNnXIv1dELqJ5ijKDL+ayKiFJR+3pout4umVgOjrIec90z+XY
         PW6H6Giew3KyqcwITZ15EvaLW8Ket/YW83frHUdOwyir/BcXZw+AjM8GHx4sQRad72fM
         /yjcgP/T73W2yexHKegAycgLvV+HsViV2NrRo1C6RXg2cq6YSpnXBhDc7+z2WpvaSyGr
         dw0NeR954LLA3eYEAVvewzCUL/DmnZOQADu8EVshqzIncReZbiAceL+D4hcNZxixF3N6
         1kENDpbA5zYgcjggMdvIG46wzZqjXpWVarA6RTY2VryI5hiLLthkrzNZvkxRBTODZxzm
         a9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751332676; x=1751937476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9G8EsFLPHcydSdSrFsRKcmtgOEiF67NnihrfLuZNDOk=;
        b=u+azWiwTuFmPcDdpgR2Q2/5xs/UqYxtOEC54VM0UOBD8EwVOKGmR2U3GWIGHDHyGtt
         4OW8QqQ1GLVbDZjmqNDHyqr+jOYnPIuBqD9XK78+guCRCEXiWpNMnVPkVw7Bdwk004xJ
         NlY9aBOamCIqXiYv0EMrZHgVxVz38Uhivl6zu3XveGAaIJHy3rv291v4Gqtym2qkHI0s
         TlR52YvbC680y4j2Mm6YtNx1F1RZCH57c1Ac0MD+ae0MZN3QYEcgGdE9X05S8tYcU4Gc
         P8+7br/v5uGkjpwppC7odgTywtnkYHohuHxVDmW10Fhw/uU/jA41NnmU9OX0EpAjCP5k
         m6fw==
X-Forwarded-Encrypted: i=1; AJvYcCXYE/E67uG/Dd81MTynQoFXb7yuuLrT0wg3x2MlId4Sbj5J8zZXS3WVDEFzYXdG5JI2KSjUPRyrlYATAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuHTMvzHuUgYONm1m4pZZA2086E/DNe2sN//0AqtlmMlt8MMtr
	KCTZwxYhJAyJjFqF3rWoyMcIbfslUACp+etjKXJCsctGTm1Kk7s3V2LN
X-Gm-Gg: ASbGncufitfTKB1ZBXWJj8/NmzLDKBRlX1EDQN0gubnRxq2NHrGTg10NrU9KdDy+Hme
	Nq0gsSpJtOPQdQJm845b8oe3I8HwWDQtGv9RUMeDUE1sHeaf+vTqOIaKWQPfLYWr7fJl/K03BsD
	h874GHsAuQRWYMQDhzU6RD/Ovw0Aa/iMo5V0/syulw777lONvW330bgZmWh23mC5mJpjYCKlvQQ
	BPe5I2soQNS5R5U8cMlWuLztRWfteC39JvZpx8K2LC+xhB34y3t8g5Z5Qrs7R7Ppw4/MqUjX+K6
	GS0H6m+Tjt69Xws9WgKvJif5MLyByQHstsBPCd6DdHMWgPH2esftxt4S5ga/kqCfR8NkF+bC
X-Google-Smtp-Source: AGHT+IFM9lShrZ0gDhqDAmlJO1Tr5XQLrwGfLFH9sgY8PsJvx+UPrYvYdI+o7sjOwSyPkHhG0w+dDg==
X-Received: by 2002:a17:90b:5150:b0:313:d342:448c with SMTP id 98e67ed59e1d1-31939b6400bmr2096527a91.17.1751332676004;
        Mon, 30 Jun 2025 18:17:56 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb2e325bsm93040705ad.29.2025.06.30.18.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 18:17:55 -0700 (PDT)
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
Subject: [PATCH net-next RFC v4 2/4] riscv: dts: sophgo: Add ethernet device for cv18xx
Date: Tue,  1 Jul 2025 09:17:27 +0800
Message-ID: <20250701011730.136002-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701011730.136002-1-inochiama@gmail.com>
References: <20250701011730.136002-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_181756_699557_1AE0E1BD 
X-CRM114-Status: UNSURE (   9.22  )
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

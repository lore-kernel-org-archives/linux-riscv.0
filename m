Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CD5C71130
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 06:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ebKI8M2JBtVMOPKU/GO0x87FmMfPyzKKtsCVs2CU4DQ=; b=vKN94cQAmw591Z
	2yTr9zzew+ggVoC5TOH3imWwvHDhwWZc96v9bP94igycIQ/r+PSPVfPsLhrIimHfJ8ZSM3HxrSnEe
	qhRCyr2WmT5riHR8OBfy2lTIvtH6IFqSbC/zqPBbVYU/H66PUlxhpdPmzleCw45i+AmPI46wcTJ7G
	5Hv9BLLrnEDiAA/3/Ru4OARjtvKs9OKDixhWiaJ4/3hUl94DTxirEQWkOE30NA0aybCl8O25x5OGJ
	eUuybBZkiWAGX2dATZH+n6xRjgoYrpyf8IbvcgQ8MgpkCWW8yigb3fM5ThcmrbkgM44a17HnUQUUU
	53qi6fR5izDEhac1DIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2A2-00000004Ubs-1Kxl;
	Tue, 08 Jul 2025 06:50:38 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ26K-00000004Tiv-4556
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 06:46:50 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b321bd36a41so3415967a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Jul 2025 23:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751957208; x=1752562008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=awAK1sQvEZGu9RSuFaWauBkV5Ie3EeA43euQnu2ZDvY=;
        b=IMbQ+mdcLK/3/QJJsIJ7C5tLXkeiHzruuFwCe5vawTlmdfsFqZQ3xGf2ZuwEHc9yEf
         EnUCYJx+pDwsJI6SgEQYYg5UzW2NhWYSurplXnlc9mqBfbQOyd/Ao/L2QVBkDsPpMtDN
         AWi3wg0jvJIHgjxTbbi3gBIeOxZP902sP8XYJTDbFyjj2MiqKMsnHlkFuX+g5YXRoF5n
         ULwdFUWpZDgTaCtgUzxqV/u4Rwab7kUz5Mizq0XNu0a1KXgYNR2ZB6PtSNippK1FY2MM
         KOyNOo3B16ZsuVpGtvcjl+QN+H4IvmabfbE0N378Qg8GJlPsbDpnLeGUJKUWXvJdWI5P
         WRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751957208; x=1752562008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awAK1sQvEZGu9RSuFaWauBkV5Ie3EeA43euQnu2ZDvY=;
        b=k8lC/hTTeYogAkRcDJQTFvNT6YIX5hMBeQf8kukesJRJCulZLE8XvJMNUS/MMqq4tk
         Xi/aJQNPr2hN/B846VARu94W9BUF2oPollzTF+UJO4tt7zobqZF46ExUx/R/kDQJ2d0S
         xv7Gmy4TT0AxHP63+luDekL0goG2aQgtoA7aryZHoqfkiCwOdEb4TluOFaG2JTTv8QtC
         2naU3wlnVroyYj6NlrzcddfTjrjwZLKy52r8tkYSkJxUzWCQjhUJuUgWDtgW1UzAsWeu
         +mb2kF/kRxcaD3h5kRJ7lZAI8tQ9GSh+fEaqeCwcxKat41MY08QnUbI39KKQdX1hdsOL
         bzAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5MCeLGqlZz5zxoLn2raesx6KakFn5wkBcTX3v+2iP78YIN/nwqOnMt+USc6BVQCB79tNqaz7klf2Uqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQeKd2XAzlN2uJHUYrd2MCMJJ/b8rPJIbrAHczYk53ash8lEGl
	NEJXXcy5bH8GOtI2I2CFySn2yvzkIP9HNobZo4a2WgZmlS4kf3vXosrb
X-Gm-Gg: ASbGncteJUutDjdQnmwesJy4Rfm0AcYhUmt8IfjoSe2WXhosY5+GLbWnnQR1auz6IX3
	j0BIQklZ1CHqS3KMem1wvGX47FIbjZsPv37LdsBWrSPgJba9JbY0nmJEagALKPojej4TbH7sX50
	OjDPB0QR86u2H/w6NFqUux4zA8VZpeljJKuXjKOMyp6c3UysDES6ax7wdnA8V36c5r5BVAsXvDQ
	WNhXsgBrA9CIdLh4Thn4g6mjB/jtIHI3n2Z/9YT4+IZenVfluv1/r6DVmi9WPwaeVftExDoENAs
	QkexkKNve4TAsHIAs81csZKrr7nHXzYREc9hDskQ54GBlM++6cWqpQIOzxbiqA==
X-Google-Smtp-Source: AGHT+IHNx4OiWoCq7M9t3p40CvKjBGEYTQs9/RQVmrqVzX0hKDNozKjkB+NwYNXyY7dlbQecei9Awg==
X-Received: by 2002:a17:90b:2ed0:b0:311:f30b:c21 with SMTP id 98e67ed59e1d1-31aadd9fd46mr18022165a91.26.1751957208011;
        Mon, 07 Jul 2025 23:46:48 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23c8457e15fsm103684335ad.154.2025.07.07.23.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:46:47 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Guo Ren <guoren@kernel.org>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH v2] riscv: dts: sophgo: add ethernet GMAC device for sg2042
Date: Tue,  8 Jul 2025 14:46:25 +0800
Message-ID: <20250708064627.509363-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_234649_012116_65F04795 
X-CRM114-Status: GOOD (  10.31  )
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

Add ethernet GMAC device node for the sg2042.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
Require the ethernet patch series for functional device:
https://lore.kernel.org/all/20250708064052.507094-1-inochiama@gmail.com/

Real board dts patch:
https://lore.kernel.org/linux-riscv/cover.1751700954.git.rabenda.cn@gmail.com/

Change from v1:
- https://lore.kernel.org/all/20250506093256.1107770-1-inochiama@gmail.com
1. separate from the original series and add dependency id
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 61 ++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 85636d1798f1..b3e4d3c18fdc 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -569,6 +569,67 @@ spi1: spi@7040005000 {
 			status = "disabled";
 		};

+		gmac0: ethernet@7040026000 {
+			compatible = "sophgo,sg2042-dwmac", "snps,dwmac-5.00a";
+			reg = <0x70 0x40026000 0x0 0x4000>;
+			clocks = <&clkgen GATE_CLK_AXI_ETH0>,
+				 <&clkgen GATE_CLK_PTP_REF_I_ETH0>,
+				 <&clkgen GATE_CLK_TX_ETH0>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			dma-noncoherent;
+			interrupt-parent = <&intc>;
+			interrupts = <132 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			resets = <&rstgen RST_ETH0>;
+			reset-names = "stmmaceth";
+			snps,multicast-filter-bins = <0>;
+			snps,perfect-filter-entries = <1>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <32>;
+			snps,rxpbl = <32>;
+			snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
+			snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
+			snps,axi-config = <&gmac0_stmmac_axi_setup>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			gmac0_mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <8>;
+				queue0 {};
+				queue1 {};
+				queue2 {};
+				queue3 {};
+				queue4 {};
+				queue5 {};
+				queue6 {};
+				queue7 {};
+			};
+
+			gmac0_mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <8>;
+				queue0 {};
+				queue1 {};
+				queue2 {};
+				queue3 {};
+				queue4 {};
+				queue5 {};
+				queue6 {};
+				queue7 {};
+			};
+
+			gmac0_stmmac_axi_setup: stmmac-axi-config {
+				snps,blen = <16 8 4 0 0 0 0>;
+				snps,wr_osr_lmt = <1>;
+				snps,rd_osr_lmt = <2>;
+			};
+		};
+
 		emmc: mmc@704002a000 {
 			compatible = "sophgo,sg2042-dwcmshc";
 			reg = <0x70 0x4002a000 0x0 0x1000>;

base-commit: cc6a9fb055e446e76a23867e42f12c4eff44eb00
prerequisite-patch-id: 7a82e319b011e5d0486a6ef4216d931d671c9f53
prerequisite-patch-id: 5a30fb99ec483c1f5a8dca97df862c3a042c9027
prerequisite-patch-id: e0da79790a934916d9fc39c18e8e98c9596d27ab
--
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

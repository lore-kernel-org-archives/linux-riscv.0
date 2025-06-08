Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696C0C61CE7
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 23:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7/ec81myLoj9NdJ+UVUka5OogsVbdD7lMgr+FccIcA=; b=YbnFIj3BZ5bMZS
	G+DRXmbhGQLSGlXRbU7Yr7zkZi5bBSJcQj08D1KUOZn9g/i7983UQrJ58CrnTnq/oUH/o5kVQGCB0
	FiJ7cngJcOF7qGk+szDuyQI/0GQnmEN97jHUZy73TREv/jhQyB5y9iLiCpcOIssDQ4KmSIMpxYyMp
	SFGarHnMWyM/2R1NvQysbfr+mRyorXUsy48PmeMz7whjW2HgBKKW/I4BeOvi47S3FfjI3z4k+Zst/
	qZwZZBGILMid5zDDK936WPVHh/BtBynHu1Y5MES+HNwiWeLgI8fcDvqi4bjZN8Clzt3edKFphQ0O7
	GuFZQNYm5mEoCLwNJPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSv-000000037SY-1SmE;
	Sun, 08 Jun 2025 23:30:13 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSs-000000037Qk-49yh
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 23:30:12 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7d09f11657cso365086785a.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 16:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425410; x=1750030210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmpEekK1exJPpnoGidNY1S75lqWDRnDWJRIusLvDb6g=;
        b=KWGtUdicq0OJDRnQAADuLNxqTQL6/7BLe3U2am8hTWolfe7sXaRUEpa/FCA0njsneR
         GmDoXv1BJc9XBFlXIb22mpRC76874595R40xZ0EyehMuv0wzQQ7heleLIitTvnAuN4yq
         ehRk78ssIjwfjPvfiORpNUF1lNTF6BpZoWypVxkVCgN/eE7CmkqGacVTtyWt1w6xqsKS
         DwpFYOxOe0xPbyzb3MP6pRXuoHtddC8LqD/2UEJs3ZoCbSzigZ7bACEegsvti+Oxksfb
         xZHy9aXIkKpCSB50nbuCpSt8uM6R+JkDVRv0HtZtUl69enghxrbQd+p+HnUPmvgjV7S+
         GBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425410; x=1750030210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmpEekK1exJPpnoGidNY1S75lqWDRnDWJRIusLvDb6g=;
        b=OkpDfoZFxIOCoNAsLaRk6MTu+irVNYECbdXR8YhmyZ67k8gpsRIlqlVk5kTGZs0l2R
         wMyGtVffmoYULDJAXHXOxFhtIqz6+IevjkwH4KXxfsiN4eAh8u+J8sJE5vxIJwe8N7Ux
         laxI3XNDMm4xGsRP3yMBuGHEqTEwaKUNsoybPUqudnYmSlfVM1VG9Mc8NYncJpN1HiWs
         z8eBnoVEdjNVUdBBgdjWhoAEHxHIFyFQiJrdFK3TWDSwlobgFFlNoEiDCMcKxDRkyhnV
         Z9YON8ygM+g4zjeJwCcxJT56YIAFX/vg7d35WwxPThaeUpCPbLceVEt5CIraD9/BmWBR
         2izA==
X-Forwarded-Encrypted: i=1; AJvYcCVPZczXeGni207EFRSW71L8gnJcwe7l2/szdL2+ayqfOt4sudJQJIOpuvR1/QQZhhVBM1N+Z+oA2J0EsA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIJL9ri0zYJVppHBIcGp+1QxsYKjtdAPkvRiptT1Vw/8slFlOF
	RHVZeug2EjfzYudIi+rWLadWYsa2cVHn2NmPH1moiIeVr9cOLpD9AQf3
X-Gm-Gg: ASbGncsdVuRqLPJgO00EQzprBdHxHVJdg8JZz5wIEv7qaDPWuhuHhFJOkLI+IsVVCJh
	462Qm1YyVV0Ds/S4hIlvaMdZrTPVA2Lub+mfJpcFUySpxSYHuXxgnNH0b4YD5g4mAvs674HXKaM
	EuN/qMoK6Wiq1aA3LdVVRUl2Fro779+Na9qTvF3NAO0dojGjw9pCE2NBRODQqVebQ45iQJRwCb4
	zJY8MaK2ogUE0GXYA9I0cIOdpe+ZCIqDvrhCFAOkkD9Sfw3IicSA0lnX6hqnnTVORgMloPdiqP2
	DynisnMmrZkj0Y+r6bDvurJ+P9yH3N4CzpsFQw==
X-Google-Smtp-Source: AGHT+IH4mdTeanbw7zBF+9/nISjw3MNAkAWHlSCzX4O+dmLV8Xf9YTcpy4gwDq/IqG6kdY05P5pZ0Q==
X-Received: by 2002:a05:620a:4112:b0:7cd:1d87:6c79 with SMTP id af79cd13be357-7d2298eba35mr1783805685a.53.1749425409927;
        Sun, 08 Jun 2025 16:30:09 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a53745esm466605285a.46.2025.06.08.16.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:30:09 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 08/11] riscv: dts: sophgo: sg2044: Add ethernet control device
Date: Mon,  9 Jun 2025 07:28:32 +0800
Message-ID: <20250608232836.784737-9-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_163011_029552_A8F47301 
X-CRM114-Status: UNSURE (   8.52  )
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

Add ethernet control node for sg2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts | 17 +++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        | 62 +++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index 75564b2719cd..01340f21848f 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -36,6 +36,23 @@ &emmc {
 	status = "okay";
 };
 
+&gmac0 {
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	mdio {
+		phy0: phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			reset-gpios = <&porta 28 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+			rx-internal-delay-ps = <2050>;
+		};
+	};
+};
+
 &i2c1 {
 	status = "okay";
 
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 6067901cde1e..bbf4191fb87d 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -111,6 +111,68 @@ uart3: serial@7030003000 {
 			status = "disabled";
 		};
 
+		gmac0: ethernet@7030006000 {
+			compatible = "sophgo,sg2044-dwmac", "snps,dwmac-5.30a";
+			reg = <0x70 0x30006000 0x0 0x4000>;
+			clocks = <&clk CLK_GATE_AXI_ETH0>,
+				 <&clk CLK_GATE_PTP_REF_I_ETH0>,
+				 <&clk CLK_GATE_TX_ETH0>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			dma-noncoherent;
+			interrupt-parent = <&intc>;
+			interrupts = <296 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			resets = <&rst RST_ETH0>;
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
+				snps,rx-sched-wsp;
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
 		emmc: mmc@703000a000 {
 			compatible = "sophgo,sg2044-dwcmshc", "sophgo,sg2042-dwcmshc";
 			reg = <0x70 0x3000a000 0x0 0x1000>;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

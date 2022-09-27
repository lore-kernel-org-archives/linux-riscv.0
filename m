Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BE9C6FA93
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 11:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tp5b2WPztf3dZVsm/aUeD+mCah+yDO3h8wXi63f6fmk=; b=LN99LeAut+W7Mz
	EdWHAl1NdM1FuME4Ld3YFoxoILH2d8YoQAuIsPmfFCF7JxcLPCjQDnPM/KYEmjbj4BQ6xZUNSEz88
	6oSzvGz0/M9Jz6o9FP9jh7wroyF4OMXcs+6KEkH2j2le/OvHyvQ06xeHp/zieZNpRLwXDsyvOiTDJ
	fHUAlyffMxFfYnqEgtEwoc2aEruBP//QNC2nzy/9T8RTVnIXY6Il/m8Q6FbOd30R/8cglCADFtgGl
	JvgTkldBCtdTgFirqVJa16Wga4miaEtIM7xTbNyLO1zsuVFM6106S97GvlBqLjgFFNLVrqNiu5ahl
	DIwgPmEvweOys7cfbYuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8e3-00AAWS-Ef; Tue, 27 Sep 2022 11:20:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8dZ-00AA5b-EL
	for linux-riscv@lists.infradead.org; Tue, 27 Sep 2022 11:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664277629; x=1695813629;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OsVWWpeogVW5hrrvPLEhshKbrhrTon0FHGytPjPWSr8=;
  b=dEcxhhbvBTcxgWbxlXb5mZJQCDGqrIpXr6zgUnRHnYSMXdq965Ty2h7k
   mnzLDk5iHa/YDHa5GLm8neUI2Z/YiI7jwieMo33nzfK9z/YtlYfrG7efg
   jB4vnSuQMbKtHpqGsmL675zNQRYFXbEbHs94Rzh1/BW8oVsCzDbD/tK0r
   DMRQ3nZqJnPwN1XJwXhTu9uvR0FMS4uC+onKHwOAgQzC4WRw4c4/JWQIq
   csOY5qNED+EH1eUG3CNAUsQAzLHJEiC8S310N0KEJitlFiKaHwhbBlVFQ
   SS0WG5bGShoyW5lwEm8gzDPxWzq+DXDSYDBdqNN03xke0yfXSRm/R2ee0
   w==;
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; 
   d="scan'208";a="192655951"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Sep 2022 04:20:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 27 Sep 2022 04:20:28 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 27 Sep 2022 04:20:26 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Shravan Chippa <shravan.chippa@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Cyril Jean
	<Cyril.Jean@microchip.com>, Lewis Hanly <lewis.hanly@microchip.com>,
	Vattipalli Praveen <praveen.kumar@microchip.com>, Wolfgang Grandegger
	<wg@aries-embedded.de>, Hugh Breslin <hugh.breslin@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v6 11/11] riscv: dts: microchip: update memory configuration for v2022.10
Date: Tue, 27 Sep 2022 12:19:23 +0100
Message-ID: <20220927111922.3602838-12-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927111922.3602838-1-conor.dooley@microchip.com>
References: <20220927111922.3602838-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_042029_512744_38B57346 
X-CRM114-Status: UNSURE (   9.88  )
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

In the v2022.10 reference design, the seg registers are going to be
changed, resulting in a required change to the memory map in Linux.
A small 4M reservation is made at the end of 32-bit DDR to provide some
memory for the HSS to use, so that it can cache its payload.bin between
reboots of a specific context.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index 42d350fe6c6b..31f88cb4d5e5 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -33,15 +33,26 @@ cpus {
 
 	ddrc_cache_lo: memory@80000000 {
 		device_type = "memory";
-		reg = <0x0 0x80000000 0x0 0x2e000000>;
+		reg = <0x0 0x80000000 0x0 0x40000000>;
 		status = "okay";
 	};
 
 	ddrc_cache_hi: memory@1000000000 {
 		device_type = "memory";
-		reg = <0x10 0x0 0x0 0x40000000>;
+		reg = <0x10 0x40000000 0x0 0x40000000>;
 		status = "okay";
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		hss_payload: region@BFC00000 {
+			reg = <0x0 0xBFC00000 0x0 0x400000>;
+			no-map;
+		};
+	};
 };
 
 &core_pwm0 {
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

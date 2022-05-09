Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BE0C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 14:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=770M8OD554mu1D2HULp/B6jUx9vqMml5ir3Pk4Gn2G4=; b=cyJyhDqt+s91EG
	tM9z4iaTcw5zGxIHidem9aYnjzvBeyyLOuDHzajUIpt7f9RbimyI/0G3bwblSF6uAgTy0c3F43xcY
	CLHPesRjQ9RDpWEH5uFfi6ABqKGCg6Al0hCBnlQwMs6hKuPP+FXRe36sNopMiTgSQP+PfJOOxyFmD
	MIQ+iJ3t6V7wlhOY961+Ug7TX8Os/96MW2BhUNoV/9yJ6vokphWNUYavJ/qyBlVt0WVBC/b+CjAHp
	mSo1k6c3KfvbQJbtrMyUrveFkJS3d0dycrPZ6MbncRe/BUMj3bJaJB4YvSz9Hjd1NA8sf2WY4Ja+C
	XL1xHv9KeDwxdFE5GZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no4MC-00Eq9Y-48; Mon, 09 May 2022 14:27:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no4M5-00Epza-Cp
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 14:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652106442; x=1683642442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sE8P8jfstaqRSnBMIC2Y8y6T/ZDavu/2NYcDCqLH/cs=;
 b=lY6kHnJb9EZ+XQLc9QfVpUclCL/Wsh5X/FqZlS1PP9D6G+ygSTTRFtgn
 jrHMehCqPRkQPpSNmHj9cGuACkG++3yKvhqU0Fvn2zsim/+oYfxR7g1By
 VTUdDShPGWG7yFL6gJ48ZW0wTsvSHevA4+tZ9+cjYSBfO717WtYVzAZdu
 9IwI9WhpOET5zdBIiBjfb4XZic/2xNhBNN0GAK/fLmyDj3m+2/kHCvbap
 4b83yEaHH6QmZi2bKSCaP6z6VoSND0ZuAU0dDwCovOSWcWW5nShhhKuFG
 OC5O8FQK8s3w6eo2APReUv/L9FYzjsKxq+Y3014i8nW6OkzNhbKHSZTmD A==;
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="155299047"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 May 2022 07:27:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 9 May 2022 07:27:13 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 9 May 2022 07:27:10 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
 <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
 Cyril Jean <Cyril.Jean@microchip.com>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v5 09/10] riscv: microchip: icicle: readability fixes
Date: Mon, 9 May 2022 15:26:10 +0100
Message-ID: <20220509142610.128590-10-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220509142610.128590-1-conor.dooley@microchip.com>
References: <20220509142610.128590-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_072721_529049_4DC1BD9D 
X-CRM114-Status: GOOD (  11.07  )
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

Fix the sort order of the status properties, remove some
extra whitespace in the mmc entry & add whitespace to the mac entry
containing the phys so that the dt is easier to read.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index 739dfa52bed1..9cd1a30edf2c 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -64,8 +64,6 @@ &mmuart4 {
 };
 
 &mmc {
-	status = "okay";
-
 	bus-width = <4>;
 	disable-wp;
 	cap-sd-highspeed;
@@ -77,6 +75,7 @@ &mmc {
 	sd-uhs-sdr25;
 	sd-uhs-sdr50;
 	sd-uhs-sdr104;
+	status = "okay";
 };
 
 &spi0 {
@@ -106,16 +105,19 @@ &i2c2 {
 &mac0 {
 	phy-mode = "sgmii";
 	phy-handle = <&phy0>;
+	status = "okay";
 };
 
 &mac1 {
-	status = "okay";
 	phy-mode = "sgmii";
 	phy-handle = <&phy1>;
+	status = "okay";
+
 	phy1: ethernet-phy@9 {
 		reg = <9>;
 		ti,fifo-depth = <0x1>;
 	};
+
 	phy0: ethernet-phy@8 {
 		reg = <8>;
 		ti,fifo-depth = <0x1>;
-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771B4CF8840
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 17:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1GOjqJctCR/iDWkgCHyw5SqD3oJHj8pU1oPeWXQdtg=; b=slXERscpSK2de8
	GOf9Ld9+m8CINa9Q7EmnPHvUMS5EC5QG6hR7vSmwOmKmIAri/CaJy4LjM08APkYGVTDO84wGG8gju
	fRZwYCHQtOi0sGAL0fHhHoDonrRgmTdwJCTwaLTmfIPrDrgD8gaxH8wYoAsxFy5D5wTuByqzQnNeh
	x7dB4mzdT/fb5Y8TL6rJbrfZWQxke+fNnjqHUO1H027aWvQxULZClPNifTepIw/3FlAkWw3R7LpLQ
	BjdshBYhQBoP60ekfVJjPCT7TM2rImquVhjpDWR+tu8o18dXhbf7iNeUTdBROxcrmya9xuJOEWfit
	WzaANmN6NG4NiS0UIFvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swmDS-0000000DXoy-0eFQ;
	Fri, 04 Oct 2024 17:35:46 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swmAf-0000000DX4N-3Rll
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 17:32:55 +0000
X-IronPort-AV: E=Sophos;i="6.11,178,1725289200"; 
   d="scan'208";a="220831328"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Oct 2024 02:32:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.178])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4FBC7403136C;
	Sat,  5 Oct 2024 02:32:47 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 2/2] arm64: dts: renesas: rz{g2l,g2lc}-smarc-som: Update partition table for spi-nor flash
Date: Fri,  4 Oct 2024 18:32:32 +0100
Message-ID: <20241004173235.74307-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004173235.74307-1-biju.das.jz@bp.renesas.com>
References: <20241004173235.74307-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_103253_989369_3028FEA6 
X-CRM114-Status: UNSURE (   8.02  )
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

Update partition table for spi-nor flash, so that we can flash bootloaders
in Linux by executing the below commands:
flash_erase /dev/mtd0  0 0
flash_erase /dev/mtd1  0 0
mtd_debug write /dev/mtd0 0 ${BL2_FILE_SIZE} ${BL2_IMAGE}
mtd_debug write /dev/mtd1 512 ${FIP_FILE_SIZE} ${FIP_IMAGE}

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Updated bl2 size to 0x1d000
v4:
 * New patch.
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi  | 15 +++++++++++----
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi | 15 +++++++++++----
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index 83f5642d0d35..434252a8c0a5 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -341,11 +341,18 @@ partitions {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			boot@0 {
-				reg = <0x00000000 0x2000000>;
-				read-only;
+			partition@0 {
+				label = "bl2";
+				reg = <0x00000000 0x0001d000>;
 			};
-			user@2000000 {
+
+			partition@1d000 { /* fip is at offset 0x200 */
+				label = "fip";
+				reg = <0x0001d000 0x1fe3000>;
+			};
+
+			partition@2000000 {
+				label = "user";
 				reg = <0x2000000 0x2000000>;
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
index b4ef5ea8a9e3..1255034acc3b 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
@@ -259,11 +259,18 @@ partitions {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			boot@0 {
-				reg = <0x00000000 0x2000000>;
-				read-only;
+			partition@0 {
+				label = "bl2";
+				reg = <0x00000000 0x0001d000>;
 			};
-			user@2000000 {
+
+			partition@1d000 { /* fip is at offset 0x200 */
+				label = "fip";
+				reg = <0x0001d000 0x1fe3000>;
+			};
+
+			partition@2000000 {
+				label = "user";
 				reg = <0x2000000 0x2000000>;
 			};
 		};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC77CAC5AC
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 20:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDG9xLbPjgqr8VfCcuVguWTmC1z0K3riwtKs5edpLuM=; b=MblyS4RbB6M9hE
	JU/4TVFjFGsf1fWT7v+qPDka0T0i92pDWpicxDHJWIhnxw0Gu4FXLN/eVx8HRZD5hAD6fWewOha6B
	hkslu+3qwsLO14LxS0cE6uBVcFZxVtkKg8C5eXR3rqkgeSEO7DxDynjSqR0J3FPkr23oiTk0oBui9
	JQ1k1G+pVlAPFmM1jGcqmAajvE1HcgH/nheR4F3pgTWqxqNtGpeGFZOiILgjZGniPBBZAUSLjUA8t
	XwUCjcU8a8KwmjnJmDv6A+Lv3SIgmUNRb9IyoWmhwT2B04DX81sal8a6T/IvZsbU6iYADYz8zfy54
	WKdRneRp+psYgwUWWk4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19yb-0000000Eo9e-1dwn;
	Tue, 23 Sep 2025 20:51:05 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19yU-0000000Eo7S-31wz
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 20:51:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=+6iIiad176OW4AQzEBo582ZIz3g89l1k5od4FKYfGpg=; b=AUDEH+rERQLyo78W2oJhgBgCHD
	g1waUWNm1jUEb2uw8J7K70U43NhDguWhD9TkCQyYjLFztlDzkR3oKbYyBAq4UaLazWEztNpz0sj1B
	nHlj4wfVLRSmMrPhDoumqk66C+ahK3Db2j0DtJDUnHwDjQ8KyhNJjW1nblu7jFH1fj8l1CW5bk5t/
	UKjtk2QQSedxjRCIQss0gTQkBhg/p2dhVKE4gqQYAyTxPZdihXKnIFYbA8MbLM+HzMGnsOEaK2GTh
	sezmvwfnuthdtqhElh9e7o2BaewsaI4087Oh+lKZTRYno3Xo0xQU6/15Pm87vQTVR+QTM/TTawy4d
	p5z4amVw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v19yJ-00CFUy-2u;
	Tue, 23 Sep 2025 22:50:47 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: [PATCH v2 2/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Date: Tue, 23 Sep 2025 21:45:42 +0200
Message-ID: <20250923205028.2355244-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250923205028.2355244-1-aurelien@aurel32.net>
References: <20250923205028.2355244-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_135100_022131_831C63C3 
X-CRM114-Status: GOOD (  11.62  )
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

The BPI-F3 board includes a 24c02 eeprom, that stores the MAC addresses
of the two network interfaces and the board's serial number. These
values are also exposed via an onie,tlv-layout nvmem layout.

The eeprom is marked as read-only since its contents are not supposed to
be modified.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---

v2:
 - Rename the 24c02 supply name label to buck3_1v8
 - Add a onie,tlv-layout nvmem layout describing the content of the 24c02 eeprom

 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 7df7f2c547750..994bc23cc1023 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -115,6 +115,29 @@ &i2c2 {
 	pinctrl-0 = <&i2c2_4_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
+		pagesize = <16>;
+		read-only;
+		size = <256>;
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			mac-address {
+				#nvmem-cell-cells = <1>;
+			};
+
+			num-macs {
+			};
+
+			serial-number {
+			};
+		};
+	};
 };
 
 &i2c8 {
@@ -143,7 +166,7 @@ buck2 {
 				regulator-always-on;
 			};
 
-			buck3 {
+			buck3_1v8: buck3 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

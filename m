Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8C910A3D9E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 18:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OheMPuATc3Hr7lo+XCaX+Kv9t9nQLz5KslMbpnONeUA=; b=b06DgzOOThz8vg
	nBX4cdWQ1rZNyeeGYzjAMnBe6dV1COJm8g8cHPxKn6irKhARDCooBb3B2nr+iSQ3hMQ64EclMF9FY
	8KUx0DH31LLKDdtWmfPzcVwqaxjdfXJ9EH+18YhcBJyjGaD5C2V17jHH+57qjaNv7louNZQMYdJ2S
	sulHN5jxnmnlJSw6ws4U4lAalj4U09zVy5SXUS1DUGvQUaXkkCQAENm0vWmmDJKWNLh44u0bJd0SO
	MUWqBuipDZ731tOx6hANK+RJ/AyFb9WRC690CRiQ8KeHYYC/EGFKGVfDmSfT9TeK0W4TprXPL43qr
	q8qJ4kkGSBD7lRYhfEQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pat-00000006396-08MO;
	Thu, 26 Mar 2026 18:38:11 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pao-0000000635j-3W3Y
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 18:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=fkXcxc78C3LR18JMiJxn0CXjcMZJuIDogetyJvmzDE4=; b=MY+xpJHD/r+E4BiiK/g79Pskb8
	kOb8RGhjKn9pXKLR4mCZqOh/rT9PPU+O96jmEvK8d4DrRJMZ/+fKJ06KxxaSgkQ2CP/VIaR0Hx5jv
	wYX6zXeVdrYxPEkZ2q8ajtTrWGGB9rTdyr0DikbApTx0UQCPd7liHivpAkFdR0LxAASqxULU9Zcmr
	2FOdanTyVxV6EET5xxunTkOiR1PDytcbp5sFWWeaNBSe98JAHKtVI/fJgoly138vWQV8H/tZXpFXR
	RluxkSHC9T8cZOL3v8KSo301QxBH5qcKZBuML7Mx6RiGNllfX3QKTaUzE+0y2/IFSI26IvZd1Ts44
	cgq2VnxQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w5pam-0000000GAjO-190Z;
	Thu, 26 Mar 2026 19:38:04 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Javier Martinez Canillas <javierm@redhat.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 2/6] riscv: dts: spacemit: add 24c04 eeprom on Milk-V Jupiter
Date: Thu, 26 Mar 2026 19:35:30 +0100
Message-ID: <20260326183745.1370642-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326183745.1370642-1-aurelien@aurel32.net>
References: <20260326183745.1370642-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_113806_874870_B98E07CB 
X-CRM114-Status: UNSURE (   9.81  )
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

The Milk-V Jupiter board includes a 24c04 eeprom on the i2c2 bus. The
eeprom contains an ONIE TLV table, which on the board I tested only
provides a product-name entry. Expose it via an onie,tlv-layout nvmem
layout.

The eeprom is marked as read-only since its contents are not supposed to
be modified.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

v2:
 - Collect Reviewed-by:

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 3cd83c5924e4f..bd48208a370cf 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -108,6 +108,28 @@ &pdma {
 	status = "okay";
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2_0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c04";
+		reg = <0x50>;
+		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC18 */
+		pagesize = <16>;
+		read-only;
+		size = <512>;
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			product-name {
+			};
+		};
+	};
+};
+
 &i2c8 {
 	pinctrl-0 = <&i2c8_cfg>;
 	pinctrl-names = "default";
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

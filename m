Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0FCCDB46F
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jun 2026 06:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SsFhaVK/TwOcrfypqIx/gAugrTWhzmqJ/KoTu7QGIok=; b=e3dqV3fz6p50C7
	gcTcuI08le8gdltA++zEGnCHJsfy0fPY+L6C76h/2Ls0vbAGmuq5JCn5YIk+evSfexex2dEZ6Yv6z
	ca4Ix77TUJ9tJN2KwSLy5T+U1YwgbH2URUgij8hylTEzEDSMsv33fh8TULCI0yya48GrlUGJI405B
	fDcumc/IoCM+jDttRoZALElFNSpQscc49VUZhJLj7amFcZnjp5n90bID4FCSinuh2lQ8wn+J5KnHl
	2I+TQ5v7s4b+WfF4Nf8LXSgQMBWxmLacarOwj44x3VwzkzlEbIRJrixBVoyUq8B6zlsRIN3stOSh0
	ht0L/K7xPReRnb38EKYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wap6e-00000003C9h-0AZ7;
	Sat, 20 Jun 2026 06:23:04 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wap6b-00000003C7n-13JL
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jun 2026 06:23:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Z782Pfe1Kf4eZ9GkQdSKkYALzPrTWhUboPjR6Ug9LSs=; b=u1RDWcrKi5sq21+gmqeDEGO0+p
	DhNA1+TQUNlUrprl2nt5tALVv5ykLBhS+fkAzIrxO1Ck7PXx050hDK6ODtxlyQnr8Z9iLLoPJPSq8
	icrDzDrFCED8gYYfs8u5Q/rq6O9mFPRroYGd7vsnWBZnHYm3z1pLgq+j0bF4Oz2bJQew9kocKXV16
	zgctLiSmq2NY5ACSjLVAyNpkd6xWhsI4JY98XDNLVRufuJyyyNlBdRfZoT34BUFiuMW5tMrnpflyL
	jQueh9d4E8CpvctLEsHylSsKvuF9bqb67ejhPlZQTY7bYU9pvANzBBbdzXEtytslWNlKaW58mwCm/
	0YJA38eA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wap6T-000000006dZ-0qwP;
	Sat, 20 Jun 2026 08:22:53 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 2/5] riscv: dts: spacemit: enable the i2c2 adapter on K3 Pico-ITX board
Date: Sat, 20 Jun 2026 08:22:03 +0200
Message-ID: <20260620062238.3199108-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260620062238.3199108-1-aurelien@aurel32.net>
References: <20260620062238.3199108-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_232301_303978_037A0468 
X-CRM114-Status: UNSURE (   8.31  )
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

Define I2C2 pinctrl properties, and enable it on the K3 Pico-ITX board.
It will be used by the 24c02 eeprom.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  6 ++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 509cebc0c9568..5fe9041ec5702 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -43,6 +43,12 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 	};
 };
 
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_1_cfg>;
+	status = "okay";
+};
+
 &i2c8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 3ee1471f37985..2017aa14fb424 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -78,6 +78,17 @@ gmac1-phy-0-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c2_1_cfg: i2c2-1-cfg {
+		i2c2-0-pins {
+			pinmux = <K3_PADCONF(46, 5)>,	/* i2c2 scl */
+				 <K3_PADCONF(47, 5)>;	/* i2c2 sda */
+
+			bias-pull-up= <0>;
+			drive-strength = <25>;
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c8_cfg: i2c8-cfg {
 		i2c8-pins {
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

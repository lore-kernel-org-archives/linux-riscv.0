Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB65BC44519
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 21:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYTmA5humFBt6XJsEly5jveR0txh3dw1V38Nb+0xtjw=; b=stoJ/Vf5OtKXcz
	sCp5o2T3AW06/tMGcsf54Jgnh1OV8KwfedgWMs0JP5guhamy4YOtS56vqISuLiHWZKopHVHfOuZTn
	H5sXuei9yQcfKco+s7NrDgwqGjBaSvMrei0NM7r/bbo0D215s+HAm4zUeDCFOpRqlCPcF5bkVQhYm
	Iw1vSoqxr3CKPBXjW0XIagllAhvf8vJEMasjI3Fm21Q73ugs86fxOI72fVWCN2RCvCqNI9LIpedXY
	5aOoYcG4HIvvar1kKpQkhQgy7iQveY1CgZQWg/bP3SQ9VB0yqZWqnWUx+4MXEJ4qW0Gm1gbaYJcS6
	8WN9kIIolIuEEw4fnyRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkThz-00000000dDK-2hmd;
	Thu, 16 Jul 2026 21:33:31 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkThv-00000000d9z-2eyk
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 21:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=mHnVwT1+Yjvp5RDq89O4la0pgIctTbERsLfiIHJzr78=; b=WIWENEJS2xZmabuyDIQ10BBfHU
	dS4WI95fvyaDt/xnV9/tYsAMkDbJ+iIQ4p5Y4E2klY/HSBUWrwe3jPa+caKlTNkxbDb+YERO8CVNv
	JQ8Je6epXpvMhJqni1QfPyjegkpAd7H19MzD9PR8A/I35Og+ZVS45FXxIy4mKfQpHnXqUpN947oOA
	1K7Q9WNm+ATYmtlKaMNwte8XLP8JXvWH9V8Y2Wgl35aU8du/FuIs3xFM1uleIBmujDOWWs1R54tpE
	BfcE+NLnUktNe+UTLSVGHH/vavzfbfAvHoumVl0IqylC6xCsDRejy2FYLQgm8rfDBcWnuCDNGUoYj
	WhsjWklw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wkTht-00000003GYo-1BYn;
	Thu, 16 Jul 2026 23:33:25 +0200
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
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 2/4] riscv: dts: spacemit: k3: add rfkill node for Bluetooth on Pico-ITX board
Date: Thu, 16 Jul 2026 23:19:02 +0200
Message-ID: <20260716213314.3027969-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260716213314.3027969-1-aurelien@aurel32.net>
References: <20260716213314.3027969-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_143327_671196_D843929F 
X-CRM114-Status: UNSURE (   8.58  )
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

On the K3 PICO-ITX board, by default the GPIO pin that connects to the
RTL8852BE Bluetooth enable signal is driven low, resulting in
impossibility to use Bluetooth. Add a DT node to expose it as an RFKILL
device, which lets the Bluetooth driver or userspace toggle it as
required.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 48b71cc419f09..4aa7d56fb7568 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -43,6 +43,13 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 	};
+
+	rfkill-usb-bt {
+		compatible = "rfkill-gpio";
+		label = "rfkill-usb-bt";
+		radio-type = "bluetooth";
+		shutdown-gpios = <&gpio 0 30 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &i2c2 {
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

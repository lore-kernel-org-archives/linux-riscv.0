Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8CAC44514
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 21:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GxTdeKZ4tldrACTBmRd5HCL/RhOZxnt4L+XrCz5XJA8=; b=zZxJhtUg+Y7uzz
	KBfN61kBNg1U8GvHCvaN6T/tFqlTmiB4QDUYfC1p1QL45MPttSB00TxeWpBlK4YwNmfpRyF2BhGSU
	iwB1xSWVdeA5p3pQRO1IeErISXFe5G66/RmclfcJxscqoZHtAJBYrPGAqPLZFwKnobNFnom9l9E3X
	unU6ukdbUKhAd0ImGtyadCD1G9dWg5iK6HPjKa/pmRbcKTUU/r3s7YRqRF8Xl2foD6tCU9rAaWGSm
	FCfz5MuragQO/yg0rckAnjnPgShKjbK2/ZAws6ZiTmk434Z++clCDXEwOpRQ5a81aD4IOOiUZ1VJ9
	UJiPWDP2Ti8V/fu/OsMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTi0-00000000dDq-01E5;
	Thu, 16 Jul 2026 21:33:32 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkThw-00000000dAh-2QZJ
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 21:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=w20tFWjgl7SpbISkFY39+gk/LQYyndb7IGAWxD+7QfM=; b=wiWyipM/QjvIzgDdjiDYPAGepM
	KnUTcKBBfBW9lQ4tPzBG7wc3GqcTWNUhAmM4nPoToxEYpGBpiGqOnuTlXo9AbJVry2Q0o/pJBGrI9
	SXyac/e0i5y/jf5APjVm9nThQWzVv0QjQkQvaqSjS2XsYtMGry5eyiiYzhrwN5HT6gV1puKZLzSZ/
	irIUdeo40Zt9/MAJ5W4IBb0v289S17O3pW0AWjsIaovvHcEGmNmCzo/miRCcYBLywgTnTeflhSgfm
	XsTXdoLCTdD9qqxcPRdPU/lwsZbxSzFU3tnayiaMtL5PX6NYYm8CRyKXDfcYetvSY91QOvYJoM1wu
	nCieDbmQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wkThu-00000003GZK-1Wew;
	Thu, 16 Jul 2026 23:33:26 +0200
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
Subject: [PATCH 4/4] riscv: dts: spacemit: k3: add rfkill node for WLAN on Pico-ITX board
Date: Thu, 16 Jul 2026 23:19:04 +0200
Message-ID: <20260716213314.3027969-5-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260716213314.3027969-1-aurelien@aurel32.net>
References: <20260716213314.3027969-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_143328_620339_365206F9 
X-CRM114-Status: UNSURE (   8.95  )
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

By default the GPIO pin that connects to the RTL8852BE WLAN enable
signal is driven low, resulting in impossibility to connect to any
network. Add a DT node to expose it as an RFKILL device, which lets the
WiFi driver or userspace toggle it as required.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 011a35e6372e1..328f4c2cd7e14 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -44,6 +44,13 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 		regulator-always-on;
 	};
 
+	rfkill-pcie-wlan {
+		compatible = "rfkill-gpio";
+		label = "rfkill-pcie-wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio 1 3 GPIO_ACTIVE_HIGH>;
+	};
+
 	rfkill-usb-bt {
 		compatible = "rfkill-gpio";
 		label = "rfkill-usb-bt";
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

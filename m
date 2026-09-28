Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF39CA5FA2
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 20:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbrHXTp2svgqexhJD/SYtB5+wBL6w9xxiZiLDpJD7NY=; b=wBe0sj0lI8BG+c
	w9lsErOUbee0brjCoOY0s+AZwAZ7Nyw49AdB0NFRuxiJkroCuZftmBltbabhtzyV9lhdQQdkCXb3h
	+lIRbfl1EQUZ9J8h2O5PrEmN9BtdC5ZIOqaWDltg7hxJmM+gRb04GdWsL4ebzUJFY3wiBZ3RElew2
	pIuz/pTccgjxybP5DyCZeviHenXUaUJ0+WidRh6OoPgUlR5tjNq0wkXNM+jczKq4OUTA0fFcE9Aub
	Zy7b+pF44iBiCfaoUVCRG8fPW5j7XF+SJYfkiefyDrIq6SPZp/5UvvYY5POz0lia7Vs4IFw30Ej2A
	ypPhLZSAZM7cYSrV61CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIJO-00000001c5j-1O76;
	Mon, 28 Sep 2026 20:50:58 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIJL-00000001c3o-2V5U
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 20:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=9J2seGKRWZVNJ1p8+AjKgKsDACjOYKsJmiv89i7OaIc=; b=NVJpd55RrTEoL6kRHTynZMWYU+
	kq801L3939AzaWSNCAxxuB65PN8V5OO7r9uPv5i1AHLd7Kk9sfRwkUUH3P6vcdT55ersl0v9FHFZI
	ecwyu36UbcAeVjrxWMCDesa5oc+ONwLHSSgqkqWibAb+6DQ/o5GMYVtHTUniDANhnRaJMxxLSCZ+t
	/+YIwqEfXXk6fJFGdG8sQzwxfJJQ93me744Tg8msRKqFZwXN+glg26bW+3L93/am9eLMG2+XtxfeB
	AvJUbhQOdMWp3e9bKhjKR1Equpgol70ncGxV2HFD9/mE782NWrulHATndUCgDLHKE1+jIfWHzhpjv
	xI2qW+6A==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xBIJH-0000000F7qf-2GWC;
	Mon, 28 Sep 2026 22:50:51 +0200
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
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v5 3/5] riscv: dts: spacemit: k3: add rfkill node for Bluetooth on Pico-ITX board
Date: Mon, 28 Sep 2026 22:49:08 +0200
Message-ID: <20260928205012.3689405-4-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928205012.3689405-1-aurelien@aurel32.net>
References: <20260928205012.3689405-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_135055_663324_6AB608E4 
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

On the K3 Pico-ITX board, by default the GPIO pin that connects to the
RTL8852BE Bluetooth enable signal is driven low, resulting in
impossibility to use Bluetooth. Add a DT node to expose it as an RFKILL
device, which lets the Bluetooth driver or userspace toggle it as
required.

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 5aa6fa89cab58..d3f256dffb4fd 100644
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

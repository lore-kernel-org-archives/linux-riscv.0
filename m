Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EA6C54F51
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 17:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CH/CYdcau6xEM5rCJcCqpPeEO6lmwao89q0uCCP6zQk=; b=wHiuuJIlQbVhzF
	l/tlK+GQR4FrojIbqXdfDTYwBgo2SPw4mrWDyMEQ+pPKFRgYW8YxOkp9knfwaMbqU1Bg6AuojtCr4
	Fz9h5HSqg3I2/f3gQ4djj0C1TYciB7fraw7WHsd7HKBAbXhnDHjA+5zMeBCTqlIi7gzhFoPsVijgJ
	SjvScAOxi6TXu7x/FnsTS0dRJ+1XCfCpck0ebKpaIqgWj2JkmQCFx5EQ6ErV2WUAphW2og9oQkEz7
	hCtMIfEoBOBrGH6qnF+QuV2Gx879TBTcgSCQdrDzcOnS4viXKEWfDk8GDLZyalvMa2PoFF9v+zLqa
	IQtiEE3upbzUTbuigOPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp81f-00000008gyt-480z;
	Wed, 29 Jul 2026 17:25:03 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp81b-00000008gwV-3rhC
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 17:25:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=5WSjlBAuSdaaHUNo5sujBqKXsLkR6III6zY1OEFMXJg=; b=RcbXGPcqA1q2fqzk0DLsRQq4g7
	QW1WeMJ7J6MLAt01dG+nz6zbCuRBaBU3NpnWwpwqBKwP4DxyruG87Xla6DL6bBfdqK4l/kQIeXd5x
	GvqPKX1YEnfGbJ9cdpTjfIHpVsl7S6i9UQDC3gmdiF0k+sfgidhRRG4plVCcJrCULaKxIWQ4Dtnnx
	D36S8ZgchKVAhtqrSRMM60mYPRspNNjET0rKnSIfnrvQChCKZy7odJoSGBhhXlxU2pr+bAKGKKZ3N
	it/l2YkWiqRM3PFuuypGC0AGwzZRS2TKy+SgniuZR3K+Z3zt4s7rhaXMVEx04+5IM1CfuboFfpPI4
	xkt8qchw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp81Z-00000002mXC-3eOc;
	Wed, 29 Jul 2026 19:24:57 +0200
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
Subject: [PATCH v2 4/4] riscv: dts: spacemit: k3: add rfkill node for WLAN
Date: Wed, 29 Jul 2026 19:20:26 +0200
Message-ID: <20260729172450.1660418-5-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729172450.1660418-1-aurelien@aurel32.net>
References: <20260729172450.1660418-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_102459_958853_3C02B064 
X-CRM114-Status: UNSURE (   8.81  )
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

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 37d3422af32ac..d1e53cfbc9030 100644
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

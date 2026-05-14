Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E52CD4F25
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 16:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEDDl9Go7ruAAoNEpKqaaTP9sLIkZ/4xxw77Px8inJg=; b=MsgMgdWPR4h4+D
	VHaIKs5uX9qhj/9Eg8H0Uvr9JUIoTxS1WIScdqvj96VBE0ll3r5h6M2c/rZly+hyOmeQ54nTy+6Zf
	Dr+ljkxpmJP0tRI9xY2YOzX35bSB6ya9VZKK4L+6uFnu1HQfogAPU2O2bYF3WwYlDoBT9V46TJFO6
	zsuyUZfQaSAtVtfqTQjFkDNo480Sc3tPAQ+73oxqKeI6JscXyuR6xVT1YPmMcMxe2jK/rb/FrzSI2
	v5/6R+XHPPpDFWZZrGcGUp7f7q+5rykB2YY9WMUG/mSpwP4ZF72TDyK6zXI344NZEzW8xZfNwqmfT
	eO1z40iVPRxb+NmDc4vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYYD-00000005zFa-35bB;
	Thu, 14 May 2026 16:04:41 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYY8-00000005zBK-0CnV
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 16:04:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=MDcF53V9v5HqtxunpienYMcM0tRyYISFa1MdRC1QzVQ=; b=DgBxONhy/TY6ZRn+5OyMN1kj3x
	bW5DyDiWmAfvdOr3j/NToJdpSwi2LERqUXuSZAoW0dD0PQypa5V0E2zxdjSJY2xnIoFe1zOnAp7KZ
	gBNoy95/V2OqOen/T0lNrSML/nPe4B+zsuDlxWLmghUNuEhsQNLHhQRaiWi2LTBq00IyszLXaaPX+
	7d3PEbAEPitrp2xl1f769C18OzeQGJwdogP3kMi0cAj1h0Lj/TZo5OcxH0HjyUeeu/LWphhW/A1I1
	VpQN4J5EmLWF5Z6wqIh/WQq6EAUDL9NKt6zS7ifl0iR+apvgVBIhczvagBJBB2zvmaD3/qB9V5YRS
	0reKX3Pg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wNYXz-00000007W2G-2Go9;
	Thu, 14 May 2026 18:04:27 +0200
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
Subject: [PATCH 3/4] riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
Date: Thu, 14 May 2026 17:56:23 +0200
Message-ID: <20260514160356.1642075-4-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514160356.1642075-1-aurelien@aurel32.net>
References: <20260514160356.1642075-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_090436_090755_5C75ADBB 
X-CRM114-Status: UNSURE (   9.38  )
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

The Milk-V Jupiter board has a connector for an eMMC module. Add an
entry for it in the device tree and alias it mmc0. As it is not
populated by default, do no mark it as non-removable.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 450d28e438293..b9b8ddc8e7fb0 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -17,6 +17,7 @@ aliases {
 		ethernet1 = &eth1;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
+		mmc0 = &emmc;
 		serial0 = &uart0;
 	};
 
@@ -138,6 +139,15 @@ &cpu_7 {
 	cpu-supply = <&buck1_3v45>;
 };
 
+&emmc {
+	bus-width = <8>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	no-sd;
+	no-sdio;
+	status = "okay";
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

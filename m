Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE910D58CA1
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Mar 2026 20:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bOrJn16waq4JBpv97xSqpbg0aoRdZ4rwGQfyigqCA9o=; b=rNraIQiGGUusp8
	VMdDf/18uPJcPFuqgEt4mui6qwiqIG52jz09JN6vjKHsz9Q6BcceHG37KBqHa3HQH+8dZh0kDDLFI
	Ndpapzggn4S791ErHZn7MdNdZl/XN7/ZvNXwSem40LufZ6GrdKFeQYlE/LaB9wEORIffkczUzoRfs
	MA8ZA0dHhLzi/pTbZRl83sZiyNhZeTi2IU3v6HxnXYZzkMZP8qyp673S4mekopIoEhMpfJNHfDcMZ
	nAESyaTPhH0yisPIO/8r7HpEAkC4eaalYEFl/B7eqNUmeomHRizqkqcq2LdkDX1CmWQcSU6XaxDSm
	j6zz+8EW6Lqz5vYabSiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4PMT-0000000FdYN-0UsY;
	Sun, 22 Mar 2026 20:25:25 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4PMQ-0000000FdXs-39er
	for linux-riscv@lists.infradead.org;
	Sun, 22 Mar 2026 20:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=bHa+8TMPMx1ILvk4E2TqNsND9CWODuS5VukkZ3jetbc=; b=EceHX5FBf1yLcFaOvIaQUrj8mf
	LhUzcvUNoXEQRJYJhMi34WbFglOds//tWPthVD1OVHe7/tc1pXDMAK1GO6BsQ2QQnw3Du67YGKPkf
	PRbSe2h0GACXQZlS/nvtzx+5pw0RYAfgocxGrKoyMGfL+FcS++J26r6xbUm32txJdJbCNCxEwzPOd
	Cwx39wOFcxNSHDrqZYy8yEcL2NJ3lMBVdPgFC+H6PyfyKVXOYsVQGpn73rRR+Fjpxwidjba89hS2b
	xV1VTH1Zk8UgaMlXR7xYuPrAOJp31Oe+0+kfqi+wtlEvFojwZY+O3R0F1U+h6l/BjIuiVoyS9ChiO
	6cLHqLLQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w4PMF-0000000AsAG-1Ndu;
	Sun, 22 Mar 2026 21:25:11 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Alex Elder <elder@riscstar.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH] riscv: dts: spacemit: drop incorrect pinctrl for combo PHY
Date: Sun, 22 Mar 2026 21:25:01 +0100
Message-ID: <20260322202502.2205755-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_132522_797668_75D9EFC0 
X-CRM114-Status: UNSURE (   8.03  )
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

The combo PHY on the Banana Pi F3 is used for the USB 3.0 port. The high
speed differential lanes are always configured as such, and do not
require a pinctrl entry.

The existing pinctrl entry only configures PCIe secondary pins, which
are unused for USB and instead routed to the MIPI CSI1 connector.

Remove this incorrect pinctrl entry.

Fixes: 0be016a4b5d1b9 ("riscv: dts: spacemit: PCIe and PHY-related updates")
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 404b69c47b91f..5790d927b93db 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -81,8 +81,6 @@ usb3_hub_5v: regulator-usb3-hub-5v {
 };
 
 &combo_phy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie0_3_cfg>;
 	status = "okay";
 };
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

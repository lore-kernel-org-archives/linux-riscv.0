Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A38CAC59A
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Sep 2025 21:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ec0yBwS8hfPvSUiLzguNKWv1f0BPmXb0DM/jiA+ly0=; b=gYNjlWtofqIeiH
	4Qw2Dt1iMJmMnkFsbpR5VmF+lA18eJDs7/OscQC7dsDC8GfOOWFfBmgmUzp8bDwdE7rm2V6LRpIm2
	pCd0fgV+ZLzEafS00APELpD5qp/iKAMGQlfd+BI4ZMzEwX9NQY+F1ANFoqgSG4EB1OtRjrv3NtSJr
	0SFDRrB6LOxHBQAcfCjAWpS17XcmPyJsGt8jzIis1xGRI+EXp+8ERvuHgBuN+UEm2qGujr21UjifC
	BpS1AFsvJOe9Nxpx1IcA6+yUn5KSAwWeyodz8KjXrunO8zEDIHtB9+uzpodqLiSXmK18hxGI8QVx+
	jlhm7inH7phDHuyW8C3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RDE-00000008Cl1-1reI;
	Sun, 21 Sep 2025 21:03:12 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RDA-00000008Cj4-05CA
	for linux-riscv@lists.infradead.org;
	Sun, 21 Sep 2025 21:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=p56GR8/f7eBhZdENpdLe5c/4ijriGq1K2w7eDJM2c9o=; b=rNJIqNAaKrYG7KpO79MRmikRtE
	1L0cau7/W5pvuknfTZhi47jp/IJiW3U+RyT3zu5ey+IkBPqoeppT2FFlq1kxWRE0t2HbMwF0tUu2b
	EVCJRztKbISxZ0yNT0/Hj8jZemXGHUpFA7G8wNOybmZrsW5ODg84cJfFY4y0O0GfG4jHQUuCYYkug
	EikWHXpnVzyR7i7f9xMTo7zgrK3cVC5LgLtB5PRnfIsd2yz6V5ePJz0gK/QUgOXxWA38Qb7/X40vG
	tEzGkXeJDYqo6b7mke4hRuDRhZjHOrpsNZLP4oGmvanV+LddHu4yBuyWllqXmpeE4wmxzApr3jqNS
	4BXjzx8w==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v0RCp-009LbK-0U;
	Sun, 21 Sep 2025 23:02:47 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 2/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Date: Sun, 21 Sep 2025 23:01:42 +0200
Message-ID: <20250921210237.943370-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250921210237.943370-1-aurelien@aurel32.net>
References: <20250921210237.943370-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_140308_427114_8971BD66 
X-CRM114-Status: UNSURE (   9.17  )
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

The BPI-F3 contains a 24c02 eeprom, that contains among other things the
MAC addresses of the two network interfaces. For this reason, mark it as
read-only.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 3b6e4f52e9aad..574d10fdf9b82 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -115,6 +115,15 @@ &i2c2 {
 	pinctrl-0 = <&i2c2_0_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		vcc-supply = <&vcc1v8_sys>;
+		pagesize = <16>;
+		read-only;
+		size = <256>;
+	};
 };
 
 &i2c8 {
@@ -143,7 +152,7 @@ buck2 {
 				regulator-always-on;
 			};
 
-			buck3 {
+			vcc1v8_sys: buck3 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

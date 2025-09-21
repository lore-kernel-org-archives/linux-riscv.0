Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCC9CAC5A7
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Sep 2025 21:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mf+wkiu94+97iZf5alYwHH9xpIv/HktR31B8URFYfMs=; b=PxoNjA+XAFipZQ
	bSSZ/SE4vHq/tmrRoBj5T65oiUCtfyahvCJtNeE8d39ERx+ICh16dqmZm3976q1RqVUXVwWbXLnIh
	QFfoXtNuaOCVSdm16R10/f1UCJAUB7c5/YQw4F8D7Qm/e1dF0mxc3v+vPZ4bVxVe7NR2fjQ6ATGzw
	xcbU6WJw5KAm41ywE056BFqToEboOhi4aBGlSUG2G1P27hab/QD7QZwXLBhwI8zcnWE8nIM6rAPpy
	zuARgYLejIEacTTEYNnSv3zgNlCrzp8nThBlM0S/24lM/ogK60rugF5s+T+1k/0EpqZtwaW74R3YT
	ARo+9g873v+wvCxceZjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RDF-00000008ClL-36nL;
	Sun, 21 Sep 2025 21:03:13 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RD9-00000008CjA-3xE9
	for linux-riscv@lists.infradead.org;
	Sun, 21 Sep 2025 21:03:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=J6mm7ThCUa+BZCqJW1oZ8znjpYf3rY1SySZcweF1uO0=; b=ahA6ZYhyoOv7CDJB2kGvlQgCoY
	ifBRiDbpnK4t32Lx3+hn4chHV6m2q9ebDtstjuJabtvzeD6Q2vDZ6FT3fGvQtVIQKCSD31G7nW/m/
	VbipN5TMw0eYmwTo1/qIQ1AWI4JCP3KbN5esjArjqO3ZAkWqUcdqCjv9XrROLHQnMs+Jv096CnitS
	nh1egHEpqtb4rJig94Nqsm7AhOx9RXmZ+KHz0YoHkhglFTPGGSWUTQqX5ErPaQZpd9Ii3N3HWbtFH
	+Ecwyqka6P27poKzrxVFPlco/QRmjgiirsk9chRmJnz6cTj2X5fu6dk4LC0Xr7d1Rpm/WGz6Y8KRX
	GR450Yyg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v0RCr-009Lbu-1A;
	Sun, 21 Sep 2025 23:02:49 +0200
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
Subject: [PATCH 3/3] riscv: dts: spacemit: add i2c aliases on BPI-F3
Date: Sun, 21 Sep 2025 23:01:43 +0200
Message-ID: <20250921210237.943370-4-aurelien@aurel32.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250921210237.943370-1-aurelien@aurel32.net>
References: <20250921210237.943370-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_140308_434742_79E08B8E 
X-CRM114-Status: UNSURE (   8.80  )
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

Add i2c aliases for i2c2 and i2c8 on BPI-F3. This is useful to keep a
stable number for the /dev entries after loading the i2c-dev module.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 574d10fdf9b82..a71eaf1c65deb 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -14,6 +14,8 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		serial0 = &uart0;
+		i2c2 = &i2c2;
+		i2c8 = &i2c8;
 	};
 
 	chosen {
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

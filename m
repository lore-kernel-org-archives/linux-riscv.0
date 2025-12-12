Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF13BD59D8E
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 21:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SH8n+/BRQPjREn+IAYTpPz7fuqg1kN6Et8VEUciQ8Sw=; b=4Cn8ql1MR6hHwj
	HxZnfU47eQUM9+Q0o/L7A34pIbJFjRMAr7o6e9dszOI9Dj8ZcadPJHDow8q0UZlsJidiNAZ32d9sw
	B94PSn6yUlQ2LNS+/rZ/ZM9uz5Sfm90tP1ABgYEXeFjDjj8ipptgAkKp5SPfTWOesO1T/I7v8AQoQ
	/2yKn7YuJSQeyIXG9mGhPPSsMA/qo5azqDbjyQrjykvhvkRDNz7vj1ZX2dp6O4HIfn9dFbiPkxoOJ
	47anUCXoQxKzp8X2VJQWl/wIzqUl0oDUfQVYBw+UGTl70YPtB1MxXE/TWDsoUyvDOhAHqCcQ0LMsO
	qonxjbRp+QwStH4U6kug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUAaH-000000016tA-1bC8;
	Fri, 12 Dec 2025 21:21:53 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUAaE-000000016sC-1avc
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 21:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1765574427;
	bh=IKuzSWtohKF/9ET2bz7WQiHSXrsUgF5VTXfnh4mpkBE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BfpYjokRo+aQysQQE960lnMzdg85mW88b15iNhCSqEyBylI8FaxC7f3JYP5UO2ZUE
	 L/5kq+nEE8Z5eyY/R7nPzfGLx6V3BNJZdJrZrB4ObfciFW59fgviAFvsZDVHfNRoA+
	 0beW5SDawu/pyGRbWPL21HC6xIhjlLBzBJatEdmwjCyRbag+tYaKTWm8Xin3a2P4yT
	 x5ceK0D24cl8CK+pRddDeAU69xw8q0auqo5NAK9vuvY79ijJpcPDdJfS4ZqXimpRhA
	 z0Pp+UHR4klwfMFEbtJVJkh4J+iFMy8WWuI76b+zfTzWurWXwdHHpDVx3n4px7BB+H
	 cXGnXMX2NX55Q==
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 50639B221414;
	Fri, 12 Dec 2025 22:20:24 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hal Feng <hal.feng@starfivetech.com>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	E Shattow <e@freeshell.de>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/3] riscv: dts: starfive: Append JH-7110 SoC compatible to VisionFive 2 Lite board
Date: Fri, 12 Dec 2025 13:19:19 -0800
Message-ID: <20251212211934.135602-3-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20251212211934.135602-1-e@freeshell.de>
References: <20251212211934.135602-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_132150_566701_8BB73B37 
X-CRM114-Status: UNSURE (   9.03  )
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

Append "starfive,jh7110" compatible to VisionFive 2 Lite board in the
least-compatible end of the list.

Appending "starfive,jh7110" reduces the number of compatible strings to
check in the OpenSBI platform driver. JH-7110S SoC on this board is the
same as JH-7110 SoC however rated for thermal, voltage, and frequency
characteristics for a maximum of 1.25GHz operation.

Link to previous discussion suggesting this change:
https://lore.kernel.org/lkml/1f96a267-f5c6-498e-a2c4-7a47a73ea7e7@canonical.com/

Fixes: 900b32fd601b ("riscv: dts: starfive: Add VisionFive 2 Lite board device tree")
Suggested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Signed-off-by: E Shattow <e@freeshell.de>
---
 .../boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts
index b96eea4fa7d5..b9913991a1b7 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "StarFive VisionFive 2 Lite";
-	compatible = "starfive,visionfive-2-lite", "starfive,jh7110s";
+	compatible = "starfive,visionfive-2-lite", "starfive,jh7110s", "starfive,jh7110";
 };
 
 &mmc0 {
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

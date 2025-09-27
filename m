Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DA4CAC5BE
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Sep 2025 22:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3BCQ2mWQQipFv2CUXbwj5xyeiUNaI/1Ptizqf8vlBiE=; b=suDGRq8cXLrDYa
	5KJuEYUGLnuHtUH84ZpDR+GEymuL09fk17G+6jlEnojb636vOAYD4gNJoPodB43N7awxhR50Ayz/Z
	JeQDAcs8nTgaTQkiCce4FZfolmVeb0iKhJccItwp3bc1EmtsijIuWJ38tS16jRqZER5LTUIo0L8B8
	8mUpuFrK19HULnyHyxb/3au7Ki8vsnEx3/+hcRCyYfsbCk94fxdMz24UflfIX0Rd2N+dfjYV2hJdd
	w1NfQ2Xkm+GNUXxFdcOAmlFBB064si966W0vvxxvXbEimWnSAciKWiPuwCPDbBX0eVKHtmS/xVh1u
	Xo7tSOxGSlE2PVoBj2ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2d6A-0000000Ct6a-1EN3;
	Sat, 27 Sep 2025 22:08:58 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2d67-0000000Ct3R-1BuB
	for linux-riscv@lists.infradead.org;
	Sat, 27 Sep 2025 22:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=LnbJoglKc7f9pJzM1IUAufDOro/snvek65bAvgBo4Ok=; b=dvPwE8V17m6sxxUAloKZ6D0Qph
	5rqcGNLhXTt7sZC7Yl123RtRqf/Fs4n8gIjBgmBpX7vUAq5jHkEp3sTls0UXpHz1sNqXDfuf68y+z
	93FZpuIyHQnEo3KsaA+YhjzyFsfJ6p5Ih+eMSbdh9JjaTlRyDmUX8KgZ3l41o4QJ9k7K6C0r0Shn0
	ry6GhSt6F9MTkoE+gunuO/XXUX6l1GzZOYOA4DOpHmAm1GI3uR/mF93Ny6saOaTrcvTUwDyFbcTGA
	pH5SZDob128ZgOd9jG2imxHpPd/VoUAtapPEKZT2N2tJdKkow2XAtuKM44RD+TuwV2TZcI6edY82I
	6pX6qH0Q==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v2d5v-000QXi-1M;
	Sun, 28 Sep 2025 00:08:43 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 2/2] mfd: simple-mfd-i2c: add a reboot cell for the SpacemiT P1 chip
Date: Sun, 28 Sep 2025 00:07:41 +0200
Message-ID: <20250927220824.1267318-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250927220824.1267318-1-aurelien@aurel32.net>
References: <20250927220824.1267318-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_150855_747239_3A273E52 
X-CRM114-Status: UNSURE (   8.85  )
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

Add a "spacemit-p1-reboot" cell for the SpacemiT P1 chip.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 drivers/mfd/simple-mfd-i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 696b602051260..2e86efb0c82b8 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -99,6 +99,7 @@ static const struct regmap_config spacemit_p1_regmap_config = {
 };
 
 static const struct mfd_cell spacemit_p1_cells[] = {
+	{ .name = "spacemit-p1-reboot", },
 	{ .name = "spacemit-p1-regulator", },
 	{ .name = "spacemit-p1-rtc", },
 };
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

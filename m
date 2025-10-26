Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93652CCF9E9
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Oct 2025 22:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EE+uMNN4ttaxZR4tkhWFSri/rwEwWK8hJjcdn/E55W8=; b=PcnvJU+88yB7LH
	PYRHk+MSoAVL0RZ8JvYL8x8+mo7wr0Ph558SfoOu2AY98mc89K2PxVl8NloOLTJWUBqLO+Nhec3vZ
	TyMfh4ALaSKscgDuI+6z3OZpvXtMuoT1bDK/ALltO+nkbPTlR2RXvvWI/4Ad8FvbkIK0xDZF57vDm
	rSb1DjEYsa3D61kZHb2h6FZvrIIZErk6UEmpF/Q+rOxaOfKB3YRRDxnWLIvln1MuyzBxkfMfRDkY3
	HLvLAOZriVtV1kDmsSUcigo87kZaAiDn4EZA99YR602I5ORqoLOl6PNABYcTRvK+Zo+JIta1oyPKQ
	qUD5qNGbT21oBYLckb5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD9Tu-0000000CpAf-26mJ;
	Sun, 26 Oct 2025 22:44:58 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD9Tr-0000000Cp9g-3YUa
	for linux-riscv@lists.infradead.org;
	Sun, 26 Oct 2025 22:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=gFq6+kMuN5bopOOzq99EFAzVvjYG07FDwQoJM4PPTMo=; b=a8GdUwn6G2fSB+oP4sg7/8XfqJ
	eNLoO6MVB5tLlvL7M3hpTdpLn+nCFfGqokBCClLx5tf+dTJAEHGm46XXI5YhTHNZb8w4hUGlwH3oJ
	Z05gW9DMOVjv+bJwTx81RC5D4O3eXhOxv3CXbWEmJTYxOSActtLNL6jxNRFNJudqU+K6co/02mc8b
	9BWYmP3s0/NJctx4WSR4eLLjB90Ib0CC1TFA0hUKDrUf41pKYUouYkPkkoR+hvbC5wX/1fQ41jbNH
	jKwyefxoLSfx0YsCrsuxRR9tvsfZ8RqteM74Eha2bF44HfyfViBjusF5xpeSIkhrOg3oloGNy8A1K
	K2LU582Q==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1vD9TV-0065U6-2B;
	Sun, 26 Oct 2025 23:44:33 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE:Keyword:riscv),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit)
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v4 2/2] mfd: simple-mfd-i2c: add a reboot cell for the SpacemiT P1 chip
Date: Sun, 26 Oct 2025 23:41:15 +0100
Message-ID: <20251026224424.1891541-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251026224424.1891541-1-aurelien@aurel32.net>
References: <20251026224424.1891541-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_154456_326437_188C6D43 
X-CRM114-Status: UNSURE (   8.77  )
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
v2: no changes

 drivers/mfd/simple-mfd-i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 0a607a1e3ca1d..542d378cdcd1f 100644
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

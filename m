Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D89CCD193
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Oct 2025 17:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Buzq8yTj7xVaUzTaUYVGhlHe4y2Kg2Kf4WQCpB/I7k8=; b=rcFkQ+Zhi279yD
	uaP0mEysj2hwp5e9srhbUIQgtZAVWnVXI08sbAg/ZVB14ZW1MxWyL4XXYQevFPw2yb7o2LuPn7wim
	I8Ukd0D0VwXILB5kfbZjQzD2je/SZFDJ3dc7ztpwG5WhMPXulC4vUwl+pHRYH1gXz1re8TL9kPMUC
	E788VGIyKPPOniy2Uvvs1p/SHUoKhpT3GTxAp+wEVTrt+Bkz9LpYUMNma1J+rT73Luj9Qg3coR3oI
	sPgUojHsJwu6CYpP6RLv+Gk/8Oge5gOYgeBNRgXxV9iHSgh+lOoDJ+l58UTrqvmaP1eTp7lVJfCUj
	o44XkR6Ogz5vlEeAxY0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAAMY-0000000ABNU-0srI;
	Sat, 18 Oct 2025 17:05:02 +0000
Received: from mail-108-mta72.mxroute.com ([136.175.108.72])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAAMV-0000000ABMB-05iQ
	for linux-riscv@lists.infradead.org;
	Sat, 18 Oct 2025 17:05:00 +0000
Received: from filter006.mxroute.com ([140.82.40.27] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta72.mxroute.com (ZoneMTA) with ESMTPSA id 199f8481138000c217.004
 for <linux-riscv@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 18 Oct 2025 17:04:56 +0000
X-Zone-Loop: 25ac25f633c642b5d498a811aaf861f72be385ecafc4
X-Originating-IP: [140.82.40.27]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=josie.lol;
	s=x; h=Content-Transfer-Encoding:MIME-Version:Date:Subject:Cc:To:From:Sender:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References;
	bh=RMXTb0TY3KLzvpj/5GiiYWJ/BKvw9XvuCO3jYEcFf2I=; b=WzBI4rFxiGzJTT5HdREkAMs6dy
	9W5P5Zj1K8wOCeyZabzNXOBwTCQL7L7fwQw/vAi+kzpqYaw6dMEyy/U9l4yTFJxLcIX7jOx3Jz1Db
	AuJAso0lqHkWqIZ2wW04yHeDtYGvX1bARjHZxrkz5lfDxvkH4tnQV9UL3DTkXT4kx8x/idy3JxTxk
	pq+AoLONfyvSvZdKucZmemWuzJFgkPVw7ufplbzzb9+RB8e55cKOzxXqNHcM2LteklmugSBIqevn2
	lknAn5SwIx7tNq83GKtYbtRNIuhm8F2e1IVZfffIIxXO6REf7vAgLqbLJlJlqW5BMxDWPFUpEzJpr
	jjA+GODA==;
From: Josephine Pfeiffer <hi@josie.lol>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] riscv: ptdump: use seq_puts() in pt_dump_seq_puts() macro
Date: Sat, 18 Oct 2025 19:04:51 +0200
Message-ID: <20251018170451.3355496-1-hi@josie.lol>
MIME-Version: 1.0
X-Authenticated-Id: hi@josie.lol
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_100459_791554_FE3F8E0C 
X-CRM114-Status: GOOD (  11.11  )
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

The pt_dump_seq_puts() macro incorrectly uses seq_printf() instead of
seq_puts(). This is both a performance issue and conceptually wrong,
as the macro name suggests plain string output (puts) but the
implementation uses formatted output (printf).

The macro is used in ptdump.c:301 to output a newline character. Using
seq_printf() adds unnecessary overhead for format string parsing when
outputting this constant string.

This bug was introduced in commit 59c4da8640cc ("riscv: Add support to
dump the kernel page tables") in 2020, which copied the implementation
pattern from other architectures that had the same bug.

Fixes: 59c4da8640cc ("riscv: Add support to dump the kernel page tables")
Signed-off-by: Josephine Pfeiffer <hi@josie.lol>
---
 arch/riscv/mm/ptdump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 3b51690cc876..34299c2b231f 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -21,7 +21,7 @@
 #define pt_dump_seq_puts(m, fmt)	\
 ({					\
 	if (m)				\
-		seq_printf(m, fmt);	\
+		seq_puts(m, fmt);	\
 })
 
 /*
-- 
2.51.1.dirty


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

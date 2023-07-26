Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65457C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 05:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjLLP0qNMV6UqlD6ZW9U/xopJZvk3aRl0+ldXpWqa9k=; b=kmIctzZShEHmqx
	1FiBocBfXF/9UFNd1UoRHiKCNcgkGLeHl1qfFHXQwTFrftTWi7Byxrzcs1V5ELmrF/QITg+Y5dkrM
	6KRsNfo1Wxz0IZbdnwQgk2zwcQUn2lBufIQktddIx+As3JqqEYXQUZoZDjqvH0M6OvL3bqotFmcgL
	fm9ESChriTNo9qPzj8fL1o966YTKLQJxFPpDWM9m8I9Ez3u03y1zWnC6hoVTlqbYWAHUah7by2lus
	eYfps8i8BSz9p/hPDC7V9/DrFyHOub7Rz6ofpX6OQUl5uC9Mf7YOKGjJAAAbXracwwJ6FKX79LMKC
	MvrPWgQLmJDNpSWQwgDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOXK8-009DoR-0r;
	Wed, 26 Jul 2023 05:44:36 +0000
Received: from mail-sender.a4lg.com ([153.120.152.154] helo=mail-sender-0.a4lg.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOXK5-009Dnk-2a
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 05:44:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 3A3FD300089;
	Wed, 26 Jul 2023 05:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
	s=2017s01; t=1690350271;
	bh=P4LiDHml/D6+pt3gk//ED0sIYm5qb1wZnHI9Y2soIcI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Mime-Version:Content-Transfer-Encoding;
	b=RqGM/vImq4X7Tja4Zdxl+kdxNiOAFQYVTDGtXkj/ShuyeZuupjjHU3c14Isona0xe
	 a6PTbWpeqnAb93H237dYxIVZGQzML26bUv1dA/cY9AzcrlWt7yBUmw//BYsAWddIYe
	 GuWtCCgoFMgFXeVOsvgoFEMXfekip6l9Cp6QbZ6g=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/1] RISC-V: clarify the QEMU workaround in ISA parser
Date: Wed, 26 Jul 2023 05:44:16 +0000
Message-ID: <8a127608cf6194a6d288289f2520bd1744b81437.1690350252.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1690350252.git.research_trasio@irq.a4lg.com>
References: <cover.1690006695.git.research_trasio@irq.a4lg.com> <cover.1690350252.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_224433_957822_FDB65F06 
X-CRM114-Status: GOOD (  13.96  )
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

From: Tsukasa OI <research_trasio@irq.a4lg.com>

Extensions prefixed with "Su" won't corrupt the workaround in many
cases.  The only exception is when the first multi-letter extension in the
ISA string begins with "Su" and is not prefixed with an underscore.

For instance, following ISA string can confuse this QEMU workaround.

*   "rv64imacsuclic" (RV64I + M + A + C + "Suclic")

However, this case is very unlikely because extensions prefixed by either
"Z", "Sm" or "Ss" will most likely precede first.

For instance, the "Suclic" extension (draft as of now) will be placed after
related "Smclic" and "Ssclic" extensions.  It's also highly likely that
other unprivileged extensions like "Zba" will precede.

It's also possible to suppress the issue in the QEMU workaround with an
underscore.  Following ISA string won't confuse the QEMU workaround.

*   "rv64imac_suclic" (RV64I + M + A + C + delimited "Suclic")

This fix is to tell kernel developers the nature of this workaround
precisely.  There are some "Su*" extensions to be ratified but don't worry
about this workaround too much.

This commit comes with other minor editorial fixes (for minor wording and
spacing issues, without changing the meaning).

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 arch/riscv/kernel/cpufeature.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index a8f66c015229..5b2ac109980c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -169,10 +169,11 @@ void __init riscv_fill_hwcap(void)
 			switch (*ext) {
 			case 's':
 				/*
-				 * Workaround for invalid single-letter 's' & 'u'(QEMU).
-				 * No need to set the bit in riscv_isa as 's' & 'u' are
-				 * not valid ISA extensions. It works until multi-letter
-				 * extension starting with "Su" appears.
+				 * Workaround for invalid single-letters 's' & 'u' (QEMU).
+				 * No need to set the bits in riscv_isa as 's' and 'u' are
+				 * not valid ISA extensions. It works unless the first multi-letter
+				 * extension in the ISA string begins with "Su" and is not prefixed
+				 * with an underscore.
 				 */
 				if (ext[-1] != '_' && ext[1] == 'u') {
 					++isa;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

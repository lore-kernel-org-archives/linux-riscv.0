Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B78D2D8FD
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 11:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rG6nngnF/TouiRVBL08ow5ZzNZk1H00vCAV6T/cmGhg=; b=zTkF4gSMaQvV70
	1i7LG7oo1Ts+XxGdYeexs0aK1ZHYy1cNschfSlEr6AYQZ1OJHm3AhVU3ecjXJ1ZrrK6CIGEotdkeu
	QYkXdyjhiKl1Y/E6QbJUSx4prCiqLOJ8naNZzBUvU7SJEFKdFOvAXnjVGmZ/aAqdlf2lLDKqX3pEA
	hO+D7tXuuOO3dixLQFIB3cjRbyeBWivGAHYCZAEsu6TgCgpkbzOCzxSaUCc1wiCO5ysSuinGKoQ4Q
	+yP76OqDheGJscEsSTRnHRnsfcQguYDH2cbl2MNZH27mjrsOzfJeDroM4WVpoKNYT0ZsPAyknT9DH
	W7laLaq5MTTp3eLdu5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgtc-0000000E7oG-0PL2;
	Tue, 27 Jan 2026 11:06:08 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgtY-0000000E7n2-1epc
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 11:06:06 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769511959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hZsdMhq6iLkjPyRNRG8K5diYgGVeAVxdxLQ3WjJ5Ji4=;
	b=Lo/ZCLuwju2REOne3vzlrUfJg86+OyUPAhONpqOgHrQ85qHDB1ad97Mo174uSyaJhzFSaJ
	dWbOFzZyhNl3n+sx2pCHBHekqbG1mUid49wIZlVV0hmVu2PpWiBfuIRIefisfqZBzrRy4/
	2CgK5Sn00rr60gTLS0U59nuZTwG3yg4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Josephine Pfeiffer <hi@josie.lol>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: ptdump: Replace unbounded sprintf() in dump_prot()
Date: Tue, 27 Jan 2026 12:05:40 +0100
Message-ID: <20260127110543.436242-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_030605_189527_23383331 
X-CRM114-Status: UNSURE (   8.63  )
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

Replace the unbounded sprintf("%s", ...) with the faster and safer
strscpy(). Replace all other sprintf() calls with the safer snprintf().

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/riscv/mm/ptdump.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 34299c2b231f..f4b4a9fcbbd8 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -7,6 +7,7 @@
 #include <linux/init.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
+#include <linux/string.h>
 #include <linux/ptdump.h>
 
 #include <linux/pgtable.h>
@@ -213,21 +214,21 @@ static void dump_prot(struct pg_state *st)
 		val = st->current_prot & pte_bits[i].mask;
 		if (val) {
 			if (pte_bits[i].mask == _PAGE_SOFT)
-				sprintf(s, pte_bits[i].set, val >> 8);
+				snprintf(s, sizeof(s), pte_bits[i].set, val >> 8);
 #ifdef CONFIG_64BIT
 			else if (pte_bits[i].mask == _PAGE_MTMASK_SVPBMT) {
 				if (val == _PAGE_NOCACHE_SVPBMT)
-					sprintf(s, pte_bits[i].set, "NC");
+					snprintf(s, sizeof(s), pte_bits[i].set, "NC");
 				else if (val == _PAGE_IO_SVPBMT)
-					sprintf(s, pte_bits[i].set, "IO");
+					snprintf(s, sizeof(s), pte_bits[i].set, "IO");
 				else
-					sprintf(s, pte_bits[i].set, "??");
+					snprintf(s, sizeof(s), pte_bits[i].set, "??");
 			}
 #endif
 			else
-				sprintf(s, "%s", pte_bits[i].set);
+				strscpy(s, pte_bits[i].set);
 		} else {
-			sprintf(s, "%s", pte_bits[i].clear);
+			strscpy(s, pte_bits[i].clear);
 		}
 
 		pt_dump_seq_printf(st->seq, " %s", s);
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

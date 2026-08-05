Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9125C55ABA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 12:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MUHlbpgEBpQSgpxNyl1CbO1z8i2ZwS1ifKfnXFqmdvU=; b=LexGJBxp+Wh/ni
	BZnmJW25u+Tnnq/bE2+GEa5YyyK7ZAjpGHaWcu9O1O2XUpxeJLSgRGi+Ku97XJYxYV8w/CHItVWLy
	i69/RlL3oAKJAd3w+eiayaKZJI+gXcOJzQ+7NgDAfndkTmFiZ9zJed6taVbWdIKVZw3v3+l8KfMev
	uwEtqE/GoZPRUFPsKNufOvQyf7sl9oGKsa/Md6CeVLT1hJGPRSQRf0/z3uAeqtwIf8c2zYbu28iXP
	fpgaG/dJr+vxClRdeHstlpaDVGrd/Vg2Vbbwz4eF71FVLS1BZwQ3PunWNNoLAiWSJot9ahWKo5Gtt
	wnxW8mbPyKQzmu9VJsPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraea-00000003tp8-3HeI;
	Wed, 05 Aug 2026 12:23:24 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraeX-00000003tno-34Lw
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 12:23:23 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785932597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQmUlerGIfmDflb91fg4O+jH4m7vxFQJPaUYGL93Kk0=;
	b=xS7J7OwZJD+fopQAeje3U74tdRqgJB0AsWNpoHGJEkzgWqKwf9qFkIygHIlawMkK3VMtQs
	u5f18HsMO9MK2G+Q6OxF+tF9DI2si68Cux79IGL0Xwpl0YmQ171WSmn8jQMDJu47YhzGmJ
	YtcXsWB+HpdtuBGNPUqdPQlxviLuYWs=
From: Ye Liu <ye.liu@linux.dev>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Ye Liu <liuye@kylinos.cn>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] mm/page_table_check: add explicit pmd_none check in pte_clear_range
Date: Wed,  5 Aug 2026 20:22:24 +0800
Message-Id: <20260805122224.2512983-2-ye.liu@linux.dev>
In-Reply-To: <20260805122224.2512983-1-ye.liu@linux.dev>
References: <20260805122224.2512983-1-ye.liu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_052321_915257_3E6AA49C 
X-CRM114-Status: UNSURE (   9.82  )
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

From: Ye Liu <liuye@kylinos.cn>

In __page_table_check_pte_clear_range(), the condition to determine
whether to iterate over PTEs only checked pmd_bad() and pmd_leaf().
This relies on the implicit assumption that pmd_none() is always a
subset of pmd_bad() on all architectures supporting PAGE_TABLE_CHECK.

While this assumption currently holds for x86_64, arm64, s390, riscv,
and powerpc, it is an architecture-dependent behavior that may not
hold for future architectures. Add an explicit pmd_none() check to
make the intent clear and avoid calling pte_offset_map() on an empty
PMD, which could lead to undefined behavior.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/page_table_check.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 6ffc536359cd..ed3e1a76f266 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -278,7 +278,7 @@ void __page_table_check_pte_clear_range(struct mm_struct *mm,
 	if (&init_mm == mm)
 		return;
 
-	if (!pmd_bad(pmd) && !pmd_leaf(pmd)) {
+	if (!pmd_none(pmd) && !pmd_bad(pmd) && !pmd_leaf(pmd)) {
 		pte_t *ptep = pte_offset_map(&pmd, addr);
 		unsigned long i;
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

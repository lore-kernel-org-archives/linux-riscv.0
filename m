Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22822C5DF81
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 02:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MUHlbpgEBpQSgpxNyl1CbO1z8i2ZwS1ifKfnXFqmdvU=; b=goELSJ9u4dO0ZA
	r3FoKVYHdn7wAvIGfu8vk4mBabRHMvQeHHKcPJiV8TUDemBoz5i7VZ2y4MdWWV/045mkCQeM/gBx6
	Pz0UhuYoDB8cg6Kx9hqD1GQ+v49wBJVbfkrxiVzl70UHtZ05NPefVmr9G+QJb//seGEp8k32XkTL4
	dxDh4mMUanvFRd5eSjtdOUkq5W2iiNeyzOH19mGKO9XAoKKqnkMOvyoqMJX5bAeu/dPeaESn0snCw
	lzbPbh5yiId9VY5gdZNVGcv3mANLVTgvienKaFAaaZQOiKgzMDi1z+KeQt5pZSdDk6ZE7MPPjp2l9
	z5vi2fcQ7c4LDsoerG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwWSk-00000008ugU-3z1F;
	Wed, 19 Aug 2026 02:55:37 +0000
Received: from out-60.mta0.migadu.com ([2001:41d0:1004:224b::3c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwWSg-00000008ufr-1JoD
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 02:55:33 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=3S5O+WmFCYTlfNAAGG8hR3gIY7XgRoq+MHcx43aEOyU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787108124; v=1; x=1787712924;
 b=tXSfet5IVoMqW4YaMXPNZHiCcIWhYvxhUsxmKN0dAUJY0MEUT8G9z97kbF7tpwAqbTKzHI0m
 QXs+8J2RKEf53Nh4j/Yopi1/QTGBBRBwagGbQCio9aiTc3WuNBdPEvvIuJY7Zom2uF2PeOaLzbH
 umI7qTXim9mY+ewNCkzyDxmc=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: from localhost.localdomain (223.70.159.239)
	by smtp.migadu.com with ESMTPS id ab08ddb189ee31a0;
	Wed, 19 Aug 2026 02:55:24 +0000
X-Migadu-Flow: FLOW_OUT
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
Subject: [RESEND PATCH] mm/page_table_check: add explicit pmd_none check in pte_clear_range
Date: Wed, 19 Aug 2026 10:55:15 +0800
Message-Id: <20260819025516.2967199-1-ye.liu@linux.dev>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_195530_672100_EAC09CF0 
X-CRM114-Status: UNSURE (   9.74  )
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

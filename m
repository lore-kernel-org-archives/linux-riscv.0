Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC0C606AC33
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 11:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HK6BoHVn;
	dkim=temperror header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YNMXeSlR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YJRqrnL56c6niG1MErpQ7/vllOQs3IBC8YTZuopoK6o=; b=HK6BoHVndGGqmeBmUhSHz/AR15
	F8UYLWMxKzM6BVqdYliwn/aELTBl7inqqe2WcZb3TxFPVtJlFrbbwDetRW4Ny5DT42jOH8XaKnQYD
	hzwsQhVRqDeo+EhCkSsEp4UOvYeiVpBOjvzbhUZeSugLdEP66SxWg88CDbAfZVh5uZOyJ6llFlQ9S
	hUNrWvcbOnIAfZZjDA5/WSEAqvXIe3SI4zTzratuqjYKPGVMyj81dBzCqvnkmnZTibhc1gqJHTlGQ
	wW0Fb+9dqZ/DWGX2Up7IgDRq/Wd8PPzl8X+fPhdXzpr3Ao2r9f2UvCgvlJVexeKRqPqQcWbj3QsGs
	3NU9E93w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkL1-0000000BTxA-1NYY;
	Fri, 30 Oct 2026 10:59:59 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkKy-0000000BTuQ-2mQD
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 10:59:58 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=CuJ+ZQTil/SFgi386JLyvRG7Aby/Bj7KaYnuIE8fy6Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793357994; v=1; x=1793962794;
 b=YNMXeSlR7KwSt0ujwdKsVyF8AnGTOL1mV2LrEKPXtGkpKM9rtYC6gw6Cjf3If9zhhjhyoXnz
 e7ux1o9ap5yFJwr1RMIMyrPlU8acMLGOuliKufNgYwKQ+xeAO1J2aQdAoKHvo1GMzb1oFTtH1aw
 idfIR1JUxbG7/vNIocBuqkK4=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4afd703a427bb278;
	Fri, 30 Oct 2026 10:59:53 +0000
X-Mizu-Trace-ID: 4afd703a427bb278
X-Migadu-Flow: FLOW_OUT
From: Jackie Liu <liu.yun@linux.dev>
To: akpm@linux-foundation.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	glider@google.com,
	dvyukov@google.com,
	elver@google.com,
	pjw@kernel.org,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com
Subject: [PATCH 1/2] riscv: Recognize P4D leaves when splitting the linear mapping
Date: Fri, 30 Oct 2026 18:59:32 +0800
Message-ID: <20261030105933.4180-2-liu.yun@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030105933.4180-1-liu.yun@linux.dev>
References: <20261030105933.4180-1-liu.yun@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_035956_852640_68E9AE68 
X-CRM114-Status: GOOD (  10.75  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jackie Liu <liuyun01@kylinos.cn>

The linear mapping can contain P4D leaves on Sv57, but p4d_leaf() uses
the generic definition which always returns false. Splitting a partial
P4D range therefore treats the mapped physical memory as a PUD table
instead of allocating and populating that table.

Check the hardware leaf bits in the linear-map splitter. Only do so
when the PUD level is present: on Sv39 the folded P4D entry may contain
a PUD leaf, which must be handled by the PUD splitter.

Keep this check local to kernel mappings. Defining p4d_leaf() globally
would conflict with the GUP assertions that userspace P4D leaves are
unsupported.

Link: https://lore.kernel.org/all/sashiko-outbox-190189@kernel.org/
Fixes: 311cd2f6e253 ("riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear mappings")
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 arch/riscv/mm/pageattr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 5b3cf326455db..32834a09a8097 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -197,7 +197,8 @@ static int __split_linear_mapping_p4d(pgd_t *pgdp,
 		    vaddr <= (vaddr & P4D_MASK) && end >= next)
 			continue;
 
-		if (p4d_leaf(p4dp_get(p4dp))) {
+		/* p4d_leaf() does not cover kernel-only leaf mappings. */
+		if (pgtable_l4_enabled && (p4d_val(p4dp_get(p4dp)) & _PAGE_LEAF)) {
 			struct page *pud_page;
 			unsigned long pfn = _p4d_pfn(p4dp_get(p4dp));
 			pgprot_t prot = __pgprot(p4d_val(p4dp_get(p4dp)) & ~_PAGE_PFN_MASK);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

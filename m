Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB32606A31B
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 12:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z6Op2p4b;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sc2ZjbzW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gWdvrHcc2FYdKa5/vfNJVTa992+Ln9goOfrwnznWTSU=; b=Z6Op2p4b+WHYmCwPmEm+wvaVHu
	K1a9Mfsz2csyzSaEljXKMlp8Ue1qBXXqyMNBQWCGzS/dQlm7zQOlMO37f5c79fCucRkYS0a+XLFXP
	IOFdSGL+GQhjaR8EV3WZuBFEJ/lK38g7WkBdv1o7fJzaVn82lQYEwSoN9Ig5GpRtnZeNUNhsQsVmE
	l3oaszin3SsCgcXSh1Z+Q1+DhhaZE1rxrFgu2sIyvTSD5ctUnCvWWFp3Uxom+F4y+2C37b0/oD+YK
	TRqSeeTWVIb1lyDC2HFr+3+x++BV94N3bY9lVd7czCxtUwkBwbPUKWnNzAhjIHqrLJGJarXPkt91Z
	vhaJG0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJjk-00000002UoY-1VFU;
	Mon, 26 Oct 2026 12:23:36 +0000
Received: from out-113.mta0.migadu.com ([2001:41d0:1004:224b::71] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJji-00000002Umx-2RhQ
	for linux-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 12:23:35 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=VK+2jIdLGQdX/tQ6IpYW8SlmlBv+Tmuw767vR1hlDsY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793017412; v=1; x=1793622212;
 b=sc2ZjbzWUp+RQBM4LuOA+TLjGhTFc7lvq/MiC3wS1Ywaz5VmPQInFqOh+zUYRARG7qt707sB
 L4oKPjzUrPwujxLfoVk5evSsjWrwwi90zpUPmCKy1UOn3z2j/irCuGLtma6HFF4O3QP9+keHbe8
 i42yC7qfoT9Y5Cca2wfNcVKg=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 450bc5343032882f;
	Mon, 26 Oct 2026 12:23:32 +0000
X-Mizu-Trace-ID: 450bc5343032882f
X-Migadu-Flow: FLOW_OUT
From: Jackie Liu <liu.yun@linux.dev>
To: glider@google.com
Cc: dvyukov@google.com,
	elver@google.com,
	pjw@kernel.org,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	muchun.song@linux.dev,
	liu.yun@linux.dev
Subject: [PATCH 2/3] kfence: clear the pool pointer before freeing pages
Date: Mon, 26 Oct 2026 20:23:03 +0800
Message-ID: <16dd0366222031d0f5fe398926b16edd6e956e0f.1793017074.git.liuyun01@kylinos.cn>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793017073.git.liuyun01@kylinos.cn>
References: <cover.1793017073.git.liuyun01@kylinos.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_052334_779225_8ABC842B 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jackie Liu <liuyun01@kylinos.cn>

Late initialization frees a failed pool before clearing __kfence_pool.
Slab allocations can reuse those pages in between and be mistaken for
KFENCE objects by is_kfence_address(), even though KFENCE is not enabled.

Clear __kfence_pool before freeing the pages, and use the saved address
for cleanup.

Fixes: b33f778bba5e ("kfence: alloc kfence_pool after system startup")
Cc: stable@vger.kernel.org
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 mm/kfence/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/kfence/core.c b/mm/kfence/core.c
index 6e3d01bccdf1..434df6cef7f2 100644
--- a/mm/kfence/core.c
+++ b/mm/kfence/core.c
@@ -1052,16 +1052,17 @@ static int kfence_init_late(void)
 	free_contig_range(page_to_pfn(virt_to_page((void *)kfence_metadata_init)),
 			  nr_pages_meta);
 free_pool:
+	WRITE_ONCE(__kfence_pool, NULL);
 	free_contig_range(page_to_pfn(virt_to_page((void *)addr)),
 			  free_size / PAGE_SIZE);
 #else
 	free_pages_exact((void *)kfence_metadata_init, KFENCE_METADATA_SIZE);
 free_pool:
+	WRITE_ONCE(__kfence_pool, NULL);
 	free_pages_exact((void *)addr, free_size);
 #endif
 
 	kfence_metadata_init = NULL;
-	__kfence_pool = NULL;
 	return err;
 }
 
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C10606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 02:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jcJ/6kZl;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AHoXjxLs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c+fgVJDKD3g5cGxyxIh7lwEQN9lI62FiJx+RjNl74EQ=; b=jcJ/6kZlSyTEbZzFlJBdxu03xp
	sTYLLDupgbgqFbDiqe4ZOtfQ7B40xblqq6kW05jjqmjvG4tisQkb28UXdvic6WgM05tNTvmiUcmwj
	55KHMiRn98UPDkRARgbbqYux7J611WqzDL3viQp/jykIGpbBHwrQMOe9C5sfMb24EWQcepleHyhVV
	RMhNR5GMMgMIY4sXP6q5mQR1+XyFIXe+wU87o3li/raf5TAoAO8AfAvyjzL19WbirFBqfF/9iFTRm
	tQVZXHty5dXT1N/pB4hnNr1nrqqrokwjvEPAis5aHajdgBOsJig6GhP5YkvAbBKg1ndP6ym+oG1hb
	LyLwmnjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMGLP-00000008E6E-3m6k;
	Thu, 29 Oct 2026 02:58:23 +0000
Received: from out-239.mta1.migadu.com ([95.215.58.239] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMGLM-00000008E4r-2yRT
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 02:58:22 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=WByDDeU8vlXf4dEEaQEAxXBZw7B3vV2GviEqbsJxnwM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793242698; v=1; x=1793847498;
 b=AHoXjxLsbodHPVYmh7FQkbKQmUIfz6dll6aVSaYOi9puDpSni8osSok0bxki/+o5nXfhI/9X
 4gTtAWR0DBEqv9lysguh0lHSAIK/DnQZdRzrRgtsIO59ZVrt2zO5y4yDYdiKnzQ8nac9lRtJ3HU
 V3+bQXs3CIJV0vKcCoXQ0Jno=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4cf64162aff185a0;
	Thu, 29 Oct 2026 02:58:18 +0000
X-Mizu-Trace-ID: 4cf64162aff185a0
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
Subject: [PATCH v2 2/3] kfence: clear the pool pointer before freeing pages
Date: Thu, 29 Oct 2026 10:57:42 +0800
Message-ID: <2fab8aaa82ab2004e706fd7ec8dac20427976457.1793242457.git.liuyun01@kylinos.cn>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793242457.git.liuyun01@kylinos.cn>
References: <cover.1793242457.git.liuyun01@kylinos.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_195820_906482_B8281D03 
X-CRM114-Status: UNSURE (   7.94  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
Reviewed-by: Marco Elver <elver@google.com>
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

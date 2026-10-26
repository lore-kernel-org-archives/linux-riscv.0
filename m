Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77580606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 12:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4RyFo/Dx;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LA5hS7xF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/iigG/ESKrVLH3FI/PQ/MMjNuIjk7OfesTiSeZIKVxo=; b=4RyFo/DxQYbu/MT4VM+HNR6/TU
	PpUa6FgQDINo/LKE4dkq76ujhwlebYLrwCZ3aWbucMkrWRczcbuLgySt9nOJugzSoyiAoPuy1UNEn
	z4HPdzlDIKkj8B9EpWK2uRs1n7RUOBmpbcSDNpja4zaPo1mZyv2wYGjOCMZQgaN4oT2BiTTrbcwl2
	IeXFKenpyLvrQzkqbmu/c4XlNyZIDjH0xP4G+I6bM01qyG/s48OzlmzkDbkA7i9UjgLoscobp+evj
	Mcb9QBySly5np3CtXyN+srLEieW4tcXjNHYuUJtmCZ3PBub2SN1EwHscHd8sXKxRi3D4IGmY+JJws
	1CMkEPFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJjc-00000002UlL-17R3;
	Mon, 26 Oct 2026 12:23:28 +0000
Received: from out-66.mta1.migadu.com ([2001:41d0:203:375::42] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJja-00000002Ujj-2ibW
	for linux-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 12:23:27 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=TKJOozfmmHwVWFMY6G0uMAS57LKpM/pay/4AO+73ogs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793017405; v=1; x=1793622205;
 b=LA5hS7xFQDfCqj++1BXRxIn1VZRcA48jQGUMfGe+tDhOVUwRAQbEW8stpbVcV7FFH8exbLaT
 fUsSpDKAWFoaLF2MWzlwoaORYG/pmA1y/7JnxhNpGX6OvS7seggA8ZrhWiYCh32/YEFrE08Ejn0
 jiT+ZW4t5WQDUH6mgFZaYq9A=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5ac50a1b89887b30;
	Mon, 26 Oct 2026 12:23:25 +0000
X-Mizu-Trace-ID: 5ac50a1b89887b30
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
Subject: [PATCH 1/3] kfence: fix pool cleanup on metadata allocation failure
Date: Mon, 26 Oct 2026 20:23:02 +0800
Message-ID: <f6a6154134fd14c21070f280739acbeb5881df65.1793017074.git.liuyun01@kylinos.cn>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793017073.git.liuyun01@kylinos.cn>
References: <cover.1793017073.git.liuyun01@kylinos.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_052326_866521_E5B93FD0 
X-CRM114-Status: UNSURE (   8.67  )
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

kfence_init_late() saves __kfence_pool in addr before allocating the pool,
so addr is still NULL if metadata allocation fails. The error path then
tries to free pages using that address.

Set addr after pool allocation so cleanup frees the allocated pool.

Fixes: cabdf74e6b31 ("mm: kfence: allocate kfence_metadata at runtime")
Cc: stable@vger.kernel.org
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 mm/kfence/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/kfence/core.c b/mm/kfence/core.c
index 90925c646c4c..6e3d01bccdf1 100644
--- a/mm/kfence/core.c
+++ b/mm/kfence/core.c
@@ -999,7 +999,7 @@ static int kfence_init_late(void)
 {
 	const unsigned long nr_pages_pool = KFENCE_POOL_SIZE / PAGE_SIZE;
 	const unsigned long nr_pages_meta = KFENCE_METADATA_SIZE / PAGE_SIZE;
-	unsigned long addr = (unsigned long)__kfence_pool;
+	unsigned long addr;
 	unsigned long free_size = KFENCE_POOL_SIZE;
 	int err = -ENOMEM;
 
@@ -1032,6 +1032,7 @@ static int kfence_init_late(void)
 						 GFP_KERNEL | __GFP_SKIP_KASAN);
 #endif
 
+	addr = (unsigned long)__kfence_pool;
 	if (!kfence_metadata_init)
 		goto free_pool;
 
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

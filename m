Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5093606A31E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 12:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rwjPMR0a;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LrSeN6Ms
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p3GQrDIWQvSCm9AEHZaor+LzrhwT/bLBvpYjRlpCgVo=; b=rwjPMR0ayas3z5gjps+MFPeUN9
	SKIFLkamG529omdkbx7GNWycCRWO0YDhbuXJFwHf9T5+JcedUbo/7iwS1i+qFwxW2PHUatytQCrqd
	EKVgnsWfrMlLztN1+EZUEGxFN394IAVpNFCxvzyvILQqrE9oNHBk/wgg+w6vNaJNkMlmaLIlZ8tQ1
	19d8ZUu2x4eudLs+4qLeCVaqd3Pu4reTJpZNUDTQD6PoB9btPtPTtrUGlAP2610impZLr8BRf+rRJ
	yBPXfwbYXt7Zp+vj13a42ypm98x3GDdJlaNfhPAqp7BCx7Ia2h/R62RDTJqEIquNij5u+YIRbCHRS
	FxiTfLZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJjq-00000002UsW-2lJt;
	Mon, 26 Oct 2026 12:23:42 +0000
Received: from out-119.mta0.migadu.com ([2001:41d0:1004:224b::77] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJjn-00000002UqY-3zER
	for linux-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 12:23:41 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=BRur1T5Cd7MQHpgJV027Bta+ISLyg752XtPnkNJ+VCg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793017418; v=1; x=1793622218;
 b=LrSeN6MsebCIoP9emGJYMgt74P4QehJ17BhTse5aybDMq/SaLtk/eSJW2C+9EuKKNcgrniJV
 7VxFSi7f2VYyn/Yi3v5k9D5Aqx1FczpiS5HDR5xPhrWc5BF8nMZtDJNyLZyLdz09eAkIEF1xMdN
 xXHkI2bHb3B5yjwI2JapJRdY=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id cf25d12802c1723f;
	Mon, 26 Oct 2026 12:23:37 +0000
X-Mizu-Trace-ID: cf25d12802c1723f
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
Subject: [PATCH 3/3] riscv: keep booting if KFENCE pool reservation fails
Date: Mon, 26 Oct 2026 20:23:04 +0800
Message-ID: <58e3baebbf4e454725e6bde8b7a267fb71cfdaae.1793017074.git.liuyun01@kylinos.cn>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793017073.git.liuyun01@kylinos.cn>
References: <cover.1793017073.git.liuyun01@kylinos.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_052340_134252_BADDF421 
X-CRM114-Status: GOOD (  11.08  )
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

A failed KFENCE pool reservation hits BUG_ON() and stops boot. Continue
building the linear map and disable KFENCE if the reservation fails.

Reject later pool initialization as well, since a replacement pool may
have huge-page mappings that kfence_protect_page() cannot handle.

Fixes: 25abe0db9243 ("riscv: Fix kfence now that the linear mapping can be backed by PUD/P4D/PGD")
Cc: stable@vger.kernel.org
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 arch/riscv/include/asm/kfence.h |  4 +++-
 arch/riscv/mm/init.c            | 19 +++++++++++++++----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/kfence.h b/arch/riscv/include/asm/kfence.h
index 29cb3a6ee113..57e57426a7d6 100644
--- a/arch/riscv/include/asm/kfence.h
+++ b/arch/riscv/include/asm/kfence.h
@@ -9,9 +9,11 @@
 #include <asm/cacheflush.h>
 #include <asm/pgtable.h>
 
+extern bool kfence_disabled;
+
 static inline bool arch_kfence_init_pool(void)
 {
-	return true;
+	return !kfence_disabled;
 }
 
 static inline bool kfence_protect_page(unsigned long addr, bool protect)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fb37b0b67efe..393106cd25ba 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -27,6 +27,7 @@
 #include <asm/fixmap.h>
 #include <asm/io.h>
 #include <asm/kasan.h>
+#include <asm/kfence.h>
 #include <asm/module.h>
 #include <asm/numa.h>
 #include <asm/pgtable.h>
@@ -44,6 +45,10 @@ DECLARE_BITMAP(new_valid_map_cpus, NR_CPUS);
 struct kernel_mapping kernel_map __ro_after_init;
 EXPORT_SYMBOL(kernel_map);
 
+#ifdef CONFIG_KFENCE
+bool kfence_disabled __ro_after_init;
+#endif
+
 #ifdef CONFIG_64BIT
 u64 satp_mode __ro_after_init = SATP_MODE_57;
 #else
@@ -1229,10 +1234,13 @@ static void __init create_linear_mapping_page_table(void)
 	 *  for this region.
 	 */
 	kfence_pool = memblock_phys_alloc(KFENCE_POOL_SIZE, PAGE_SIZE);
-	BUG_ON(!kfence_pool);
-
-	memblock_mark_nomap(kfence_pool, KFENCE_POOL_SIZE);
-	__kfence_pool = __va(kfence_pool);
+	if (kfence_pool) {
+		memblock_mark_nomap(kfence_pool, KFENCE_POOL_SIZE);
+		__kfence_pool = __va(kfence_pool);
+	} else {
+		pr_err("failed to allocate kfence pool\n");
+		kfence_disabled = true;
+	}
 #endif
 
 	/* Map all memory banks in the linear mapping */
@@ -1253,6 +1261,9 @@ static void __init create_linear_mapping_page_table(void)
 #endif
 
 #ifdef CONFIG_KFENCE
+	if (!kfence_pool)
+		return;
+
 	create_linear_mapping_range(kfence_pool, kfence_pool + KFENCE_POOL_SIZE, PAGE_SIZE, NULL);
 
 	memblock_clear_nomap(kfence_pool, KFENCE_POOL_SIZE);
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

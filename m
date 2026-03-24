Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E5FF532E6
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCB99S9jZo4pTPUGpdUssptZggJm2R64VbDV1R6HI10=; b=K+bLtA9jIyhNZD
	E+obutOxww2C0NBWZO6GYs7vEa5m6wYoKohD1vQutP+Lf0daZDVQzuS2ZyyrqC7p4WiC1YS1jerxV
	0IfeIigVhqpfEsAMgPotimrOwYbJg25o4lqNC6zNek4FDzas1nJTc/7aSBUhIniu6KtMXI9onIkrG
	AXU+szky2Q7CI5NpLcjD2YnTSsi3oN4zV5P4j88mauXU1C0V6VODWP/VbsDUTFWPdgRhjdIZ7wTyL
	DYFCdzQhaE6M4cH+m1Z9L6Tan3TYvr+Jggb0+kEmzs4gBqWot3/I3AkpoQR64OBx2LRhRAby0ZWfq
	no6R6U51GAyaCLzr16Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vTI-00000000mg4-1Wy6;
	Tue, 24 Mar 2026 06:42:36 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vTE-00000000mRj-44af;
	Tue, 24 Mar 2026 06:42:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Williams <dan.j.williams@intel.com>,
	Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fnnas.com>,
	Li Nan <linan122@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-raid@vger.kernel.org
Subject: [PATCH 05/17] raid6: remove raid6_get_zero_page
Date: Tue, 24 Mar 2026 07:40:40 +0100
Message-ID: <20260324064115.3217136-6-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324064115.3217136-1-hch@lst.de>
References: <20260324064115.3217136-1-hch@lst.de>
MIME-Version: 1.0
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

Just open code it as in other places in the kernel.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 crypto/async_tx/async_pq.c                      |  2 +-
 crypto/async_tx/async_raid6_recov.c             |  4 ++--
 include/linux/raid/pq.h                         |  6 ------
 lib/raid/raid6/arm/recov_neon.c                 |  6 +++---
 lib/raid/raid6/loongarch/recov_loongarch_simd.c | 12 ++++++------
 lib/raid/raid6/recov.c                          |  6 +++---
 lib/raid/raid6/riscv/recov_rvv.c                |  6 +++---
 lib/raid/raid6/s390/recov_s390xc.c              |  6 +++---
 lib/raid/raid6/x86/recov_avx2.c                 |  6 +++---
 lib/raid/raid6/x86/recov_avx512.c               |  6 +++---
 lib/raid/raid6/x86/recov_ssse3.c                |  6 +++---
 11 files changed, 30 insertions(+), 36 deletions(-)

diff --git a/crypto/async_tx/async_pq.c b/crypto/async_tx/async_pq.c
index 9e4bb7fbde25..0ce6f07b4e0d 100644
--- a/crypto/async_tx/async_pq.c
+++ b/crypto/async_tx/async_pq.c
@@ -119,7 +119,7 @@ do_sync_gen_syndrome(struct page **blocks, unsigned int *offsets, int disks,
 	for (i = 0; i < disks; i++) {
 		if (blocks[i] == NULL) {
 			BUG_ON(i > disks - 3); /* P or Q can't be zero */
-			srcs[i] = raid6_get_zero_page();
+			srcs[i] = page_address(ZERO_PAGE(0));
 		} else {
 			srcs[i] = page_address(blocks[i]) + offsets[i];
 
diff --git a/crypto/async_tx/async_raid6_recov.c b/crypto/async_tx/async_raid6_recov.c
index 539ea5b378dc..f2dc6af6e6a7 100644
--- a/crypto/async_tx/async_raid6_recov.c
+++ b/crypto/async_tx/async_raid6_recov.c
@@ -414,7 +414,7 @@ async_raid6_2data_recov(int disks, size_t bytes, int faila, int failb,
 		async_tx_quiesce(&submit->depend_tx);
 		for (i = 0; i < disks; i++)
 			if (blocks[i] == NULL)
-				ptrs[i] = raid6_get_zero_page();
+				ptrs[i] = page_address(ZERO_PAGE(0));
 			else
 				ptrs[i] = page_address(blocks[i]) + offs[i];
 
@@ -497,7 +497,7 @@ async_raid6_datap_recov(int disks, size_t bytes, int faila,
 		async_tx_quiesce(&submit->depend_tx);
 		for (i = 0; i < disks; i++)
 			if (blocks[i] == NULL)
-				ptrs[i] = raid6_get_zero_page();
+				ptrs[i] = page_address(ZERO_PAGE(0));
 			else
 				ptrs[i] = page_address(blocks[i]) + offs[i];
 
diff --git a/include/linux/raid/pq.h b/include/linux/raid/pq.h
index 5e7e743b83f5..f27a866c287f 100644
--- a/include/linux/raid/pq.h
+++ b/include/linux/raid/pq.h
@@ -11,12 +11,6 @@
 #include <linux/blkdev.h>
 #include <linux/mm.h>
 
-/* This should be const but the raid6 code is too convoluted for that. */
-static inline void *raid6_get_zero_page(void)
-{
-	return page_address(ZERO_PAGE(0));
-}
-
 /* Routine choices */
 struct raid6_calls {
 	void (*gen_syndrome)(int, size_t, void **);
diff --git a/lib/raid/raid6/arm/recov_neon.c b/lib/raid/raid6/arm/recov_neon.c
index 13d5df718c15..461bdb98b5cc 100644
--- a/lib/raid/raid6/arm/recov_neon.c
+++ b/lib/raid/raid6/arm/recov_neon.c
@@ -29,10 +29,10 @@ static void raid6_2data_recov_neon(int disks, size_t bytes, int faila,
 	 * delta p and delta q
 	 */
 	dp = (u8 *)ptrs[faila];
-	ptrs[faila] = raid6_get_zero_page();
+	ptrs[faila] = page_address(ZERO_PAGE(0));
 	ptrs[disks - 2] = dp;
 	dq = (u8 *)ptrs[failb];
-	ptrs[failb] = raid6_get_zero_page();
+	ptrs[failb] = page_address(ZERO_PAGE(0));
 	ptrs[disks - 1] = dq;
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
@@ -66,7 +66,7 @@ static void raid6_datap_recov_neon(int disks, size_t bytes, int faila,
 	 * Use the dead data page as temporary storage for delta q
 	 */
 	dq = (u8 *)ptrs[faila];
-	ptrs[faila] = raid6_get_zero_page();
+	ptrs[faila] = page_address(ZERO_PAGE(0));
 	ptrs[disks - 1] = dq;
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
diff --git a/lib/raid/raid6/loongarch/recov_loongarch_simd.c b/lib/raid/raid6/loongarch/recov_loongarch_simd.c
index eb3a1e79f01f..4d4563209647 100644
--- a/lib/raid/raid6/loongarch/recov_loongarch_simd.c
+++ b/lib/raid/raid6/loongarch/recov_loongarch_simd.c
@@ -43,10 +43,10 @@ static void raid6_2data_recov_lsx(int disks, size_t bytes, int faila,
 	 * delta p and delta q
 	 */
 	dp = (u8 *)ptrs[faila];
-	ptrs[faila] = raid6_get_zero_page();
+	ptrs[faila] = page_address(ZERO_PAGE(0));
 	ptrs[disks - 2] = dp;
 	dq = (u8 *)ptrs[failb];
-	ptrs[failb] = raid6_get_zero_page();
+	ptrs[failb] = page_address(ZERO_PAGE(0));
 	ptrs[disks - 1] = dq;
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
@@ -198,7 +198,7 @@ static void raid6_datap_recov_lsx(int disks, size_t bytes, int faila,
 	 * Use the dead data page as temporary storage for delta q
 	 */
 	dq = (u8 *)ptrs[faila];
-	ptrs[faila] = raid6_get_zero_page();
+	ptrs[faila] = page_address(ZERO_PAGE(0));
 	ptrs[disks - 1] = dq;
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
@@ -317,10 +317,10 @@ static void raid6_2data_recov_lasx(int disks, size_t bytes, int faila,
 	 * delta p and delta q
 	 */
 	dp = (u8 *)ptrs[faila];
-	ptrs[faila] = raid6_get_zero_page();
+	ptrs[faila] = page_address(ZERO_PAGE(0));
 	ptrs[disks - 2] = dp;
 	dq = (u8 *)ptrs[failb];
-	ptrs[failb] = raid6_get_zero_page();
+	ptrs[failb] = page_address(ZERO_PAGE(0));
 	ptrs[disks - 1] = dq;
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
@@ -437,7 +437,7 @@ static void raid6_datap_recov_lasx(int disks, size_t bytes, int faila,
 	 * Use the dead data page as temporary storage for delta q
 	 */
 	dq = (u8 *)ptrs[faila];
-	ptrs[faila] = raid6_get_zero_page();
+	ptrs[faila] = page_address(ZERO_PAGE(0));
 	ptrs[disks - 1] = dq;
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
diff --git a/lib/raid/raid6/recov.c b/lib/raid/raid6/recov.c
index 8d113196632e..211e1df28963 100644
--- a/lib/raid/raid6/recov.c
+++ b/lib/raid/raid6/recov.c
@@ -31,10 +31,10 @@ static void raid6_2data_recov_intx1(int disks, size_t bytes, int faila,
 	   Use the dead data pages as temporary storage for
 	   delta p and delta q */
 	dp = (u8 *)ptrs[faila];
-	ptrs[faila] = raid6_get_zero_page();
+	ptrs[faila] = page_address(ZERO_PAGE(0));
 	ptrs[disks-2] = dp;
 	dq = (u8 *)ptrs[failb];
-	ptrs[failb] = raid6_get_zero_page();
+	ptrs[failb] = page_address(ZERO_PAGE(0));
 	ptrs[disks-1] = dq;
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
@@ -72,7 +72,7 @@ static void raid6_datap_recov_intx1(int disks, size_t bytes, int faila,
 	/* Compute syndrome with zero for the missing data page
 	   Use the dead data page as temporary storage for delta q */
 	dq = (u8 *)ptrs[faila];
-	ptrs[faila] = raid6_get_zero_page();
+	ptrs[faila] = page_address(ZERO_PAGE(0));
 	ptrs[disks-1] = dq;
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
diff --git a/lib/raid/raid6/riscv/recov_rvv.c b/lib/raid/raid6/riscv/recov_rvv.c
index 40c393206b6a..f77d9c430687 100644
--- a/lib/raid/raid6/riscv/recov_rvv.c
+++ b/lib/raid/raid6/riscv/recov_rvv.c
@@ -158,10 +158,10 @@ static void raid6_2data_recov_rvv(int disks, size_t bytes, int faila,
 	 * delta p and delta q
 	 */
 	dp = (u8 *)ptrs[faila];
-	ptrs[faila] = raid6_get_zero_page();
+	ptrs[faila] = page_address(ZERO_PAGE(0));
 	ptrs[disks - 2] = dp;
 	dq = (u8 *)ptrs[failb];
-	ptrs[failb] = raid6_get_zero_page();
+	ptrs[failb] = page_address(ZERO_PAGE(0));
 	ptrs[disks - 1] = dq;
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
@@ -196,7 +196,7 @@ static void raid6_datap_recov_rvv(int disks, size_t bytes, int faila,
 	 * Use the dead data page as temporary storage for delta q
 	 */
 	dq = (u8 *)ptrs[faila];
-	ptrs[faila] = raid6_get_zero_page();
+	ptrs[faila] = page_address(ZERO_PAGE(0));
 	ptrs[disks - 1] = dq;
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
diff --git a/lib/raid/raid6/s390/recov_s390xc.c b/lib/raid/raid6/s390/recov_s390xc.c
index 487018f81192..0f32217b7123 100644
--- a/lib/raid/raid6/s390/recov_s390xc.c
+++ b/lib/raid/raid6/s390/recov_s390xc.c
@@ -34,10 +34,10 @@ static void raid6_2data_recov_s390xc(int disks, size_t bytes, int faila,
 	   Use the dead data pages as temporary storage for
 	   delta p and delta q */
 	dp = (u8 *)ptrs[faila];
-	ptrs[faila] = raid6_get_zero_page();
+	ptrs[faila] = page_address(ZERO_PAGE(0));
 	ptrs[disks-2] = dp;
 	dq = (u8 *)ptrs[failb];
-	ptrs[failb] = raid6_get_zero_page();
+	ptrs[failb] = page_address(ZERO_PAGE(0));
 	ptrs[disks-1] = dq;
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
@@ -81,7 +81,7 @@ static void raid6_datap_recov_s390xc(int disks, size_t bytes, int faila,
 	/* Compute syndrome with zero for the missing data page
 	   Use the dead data page as temporary storage for delta q */
 	dq = (u8 *)ptrs[faila];
-	ptrs[faila] = raid6_get_zero_page();
+	ptrs[faila] = page_address(ZERO_PAGE(0));
 	ptrs[disks-1] = dq;
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
diff --git a/lib/raid/raid6/x86/recov_avx2.c b/lib/raid/raid6/x86/recov_avx2.c
index 19fbd9c4dce6..325310c81e1c 100644
--- a/lib/raid/raid6/x86/recov_avx2.c
+++ b/lib/raid/raid6/x86/recov_avx2.c
@@ -28,10 +28,10 @@ static void raid6_2data_recov_avx2(int disks, size_t bytes, int faila,
 	   Use the dead data pages as temporary storage for
 	   delta p and delta q */
 	dp = (u8 *)ptrs[faila];
-	ptrs[faila] = raid6_get_zero_page();
+	ptrs[faila] = page_address(ZERO_PAGE(0));
 	ptrs[disks-2] = dp;
 	dq = (u8 *)ptrs[failb];
-	ptrs[failb] = raid6_get_zero_page();
+	ptrs[failb] = page_address(ZERO_PAGE(0));
 	ptrs[disks-1] = dq;
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
@@ -196,7 +196,7 @@ static void raid6_datap_recov_avx2(int disks, size_t bytes, int faila,
 	/* Compute syndrome with zero for the missing data page
 	   Use the dead data page as temporary storage for delta q */
 	dq = (u8 *)ptrs[faila];
-	ptrs[faila] = raid6_get_zero_page();
+	ptrs[faila] = page_address(ZERO_PAGE(0));
 	ptrs[disks-1] = dq;
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
diff --git a/lib/raid/raid6/x86/recov_avx512.c b/lib/raid/raid6/x86/recov_avx512.c
index 143f4976b2ad..08de77fcb8bd 100644
--- a/lib/raid/raid6/x86/recov_avx512.c
+++ b/lib/raid/raid6/x86/recov_avx512.c
@@ -37,10 +37,10 @@ static void raid6_2data_recov_avx512(int disks, size_t bytes, int faila,
 	 */
 
 	dp = (u8 *)ptrs[faila];
-	ptrs[faila] = raid6_get_zero_page();
+	ptrs[faila] = page_address(ZERO_PAGE(0));
 	ptrs[disks-2] = dp;
 	dq = (u8 *)ptrs[failb];
-	ptrs[failb] = raid6_get_zero_page();
+	ptrs[failb] = page_address(ZERO_PAGE(0));
 	ptrs[disks-1] = dq;
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
@@ -238,7 +238,7 @@ static void raid6_datap_recov_avx512(int disks, size_t bytes, int faila,
 	 */
 
 	dq = (u8 *)ptrs[faila];
-	ptrs[faila] = raid6_get_zero_page();
+	ptrs[faila] = page_address(ZERO_PAGE(0));
 	ptrs[disks-1] = dq;
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
diff --git a/lib/raid/raid6/x86/recov_ssse3.c b/lib/raid/raid6/x86/recov_ssse3.c
index 146cdbf465bd..002bef1e0847 100644
--- a/lib/raid/raid6/x86/recov_ssse3.c
+++ b/lib/raid/raid6/x86/recov_ssse3.c
@@ -30,10 +30,10 @@ static void raid6_2data_recov_ssse3(int disks, size_t bytes, int faila,
 	   Use the dead data pages as temporary storage for
 	   delta p and delta q */
 	dp = (u8 *)ptrs[faila];
-	ptrs[faila] = raid6_get_zero_page();
+	ptrs[faila] = page_address(ZERO_PAGE(0));
 	ptrs[disks-2] = dp;
 	dq = (u8 *)ptrs[failb];
-	ptrs[failb] = raid6_get_zero_page();
+	ptrs[failb] = page_address(ZERO_PAGE(0));
 	ptrs[disks-1] = dq;
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
@@ -203,7 +203,7 @@ static void raid6_datap_recov_ssse3(int disks, size_t bytes, int faila,
 	/* Compute syndrome with zero for the missing data page
 	   Use the dead data page as temporary storage for delta q */
 	dq = (u8 *)ptrs[faila];
-	ptrs[faila] = raid6_get_zero_page();
+	ptrs[faila] = page_address(ZERO_PAGE(0));
 	ptrs[disks-1] = dq;
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

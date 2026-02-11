Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D71ECD6D3
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Feb 2026 17:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUAwlwpzgheHdsrUw/0qrPL1PQEy7KqrHucfIS9e/Gc=; b=zLT7pMMpqn3zQO
	uDSwUviiggsI8mtGFeWypZGb8DsmNNEwTnheziTc1uPoQcatdatDNp2bVGNIT+rKDho13PVdeiHzx
	cEJqSHNSj7L77lAlXt5JqNOPThchbfbS+1iKF3FhacC5wWDgHmGFOdz9JFIStYtsIh+WPi/PN7CBz
	OWcR0kr0mqEt0HOg70w1sGhOvm+4ThCOOB3hNl1yrUxQQOatsc4mghqil0RlmSbkYvLoYpw0nXYGx
	r08kSNzIkhMtQSRF/CsKdZVTaVJbfe+hJJhrrWOUgjmvgxUUOUuMvP5bCC20f1Bkm+4xxuipqfi2p
	5eY0Hl9mLy2pqG8qMzug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqE3H-00000000to0-0oWe;
	Wed, 11 Feb 2026 17:30:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqE3E-00000000tla-0NKH
	for linux-riscv@lists.infradead.org;
	Wed, 11 Feb 2026 17:30:57 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770831052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X323MOQmcQUTpJgkN+84fsCKXqW3v74pQvlv4aLvRT8=;
	b=ecMZkWzYoWPY0RS09/lD57t2gt1Vy4HclF6l0WnT/kggt+60Q3rvJcwouC4luYCE4DsOJn
	PPnkFvHEqYgqi9Lzc0dv3yZ9H0+IwavqU7yTdJvnsCGxomKl53g4+7MfH+tNgrl/MIiTfe
	QigFZquT1bAHATGHCHUNQRABZpuXd1ThcNtT0Tpj6k2M2WVwECM1Am2H1NwqqClIXlCnUW
	oWNGocAvLG3ARFsmrHS1n//dWfBR0EYXyzwQU9FxHe1GBflIBJNNdLXttvtUolb5HPavoA
	hVFGHjYHl2XkjfceBytUPfvvUDdDdET797Ngpm+psquBBp6fTPH6SHFkKY7dfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770831052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X323MOQmcQUTpJgkN+84fsCKXqW3v74pQvlv4aLvRT8=;
	b=y4ZGecbN4iScLAhdZBOG4jR47B8CfxQJ9bLUZRwGay9YA1BpQebFfqplN9wR3ViIQwxiDR
	IhfCBNiFhyHNfcCg==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 5/5] riscv: Reuse compare_unaligned_access() in check_vector_unaligned_access()
Date: Wed, 11 Feb 2026 18:30:35 +0100
Message-ID: <f18ca7e1efc2e4f231779a4b0bfae04b29f9dc62.1770830596.git.namcao@linutronix.de>
In-Reply-To: <cover.1770830596.git.namcao@linutronix.de>
References: <cover.1770830596.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_093056_329083_35C1C1CF 
X-CRM114-Status: GOOD (  10.29  )
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

check_vector_unaligned_access() duplicates the logic in
compare_unaligned_access().

Use compare_unaligned_access() and deduplicate.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/unaligned_access_speed.c | 55 +++++++---------------
 1 file changed, 16 insertions(+), 39 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index b3ed74b71d3e..8a9f261dc10b 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -72,7 +72,7 @@ measure_cycles(void (*func)(void *dst, const void *src, size_t len),
 static int __maybe_unused
 compare_unaligned_access(void (*word_copy)(void *dst, const void *src, size_t len),
 			 void (*byte_copy)(void *dst, const void *src, size_t len),
-			 void *buf)
+			 void *buf, const char *type)
 {
 	int cpu = smp_processor_id();
 	u64 word_cycles;
@@ -92,8 +92,8 @@ compare_unaligned_access(void (*word_copy)(void *dst, const void *src, size_t le
 
 	/* Don't divide by zero. */
 	if (!word_cycles || !byte_cycles) {
-		pr_warn("cpu%d: rdtime lacks granularity needed to measure unaligned access speed\n",
-			cpu);
+		pr_warn("cpu%d: rdtime lacks granularity needed to measure %s unaligned access speed\n",
+			cpu, type);
 
 		return -1;
 	}
@@ -101,8 +101,9 @@ compare_unaligned_access(void (*word_copy)(void *dst, const void *src, size_t le
 	fast = word_cycles < byte_cycles;
 
 	ratio = div_u64((byte_cycles * 100), word_cycles);
-	pr_info("cpu%d: Ratio of byte access time to unaligned word access is %d.%02d, unaligned accesses are %s\n",
+	pr_info("cpu%d: %s unaligned word access speed is %d.%02dx byte access speed (%s)\n",
 		cpu,
+		type,
 		ratio / 100,
 		ratio % 100,
 		fast ? "fast" : "slow");
@@ -121,7 +122,8 @@ static int check_unaligned_access(struct page *page)
 		return 0;
 
 	ret = compare_unaligned_access(__riscv_copy_words_unaligned,
-				       __riscv_copy_bytes_unaligned, buf);
+				       __riscv_copy_bytes_unaligned,
+				       buf, "scalar");
 	if (ret < 0)
 		return 0;
 
@@ -291,13 +293,8 @@ static int riscv_offline_cpu(unsigned int cpu)
 static void check_vector_unaligned_access(struct work_struct *work __always_unused)
 {
 	int cpu = smp_processor_id();
-	u64 word_cycles;
-	u64 byte_cycles;
-	int ratio;
 	struct page *page;
-	void *dst;
-	void *src;
-	long speed = RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW;
+	int ret;
 
 	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
 		return;
@@ -308,40 +305,20 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 		return;
 	}
 
-	/* Make an unaligned destination buffer. */
-	dst = (void *)((unsigned long)page_address(page) | 0x1);
-	/* Unalign src as well, but differently (off by 1 + 2 = 3). */
-	src = dst + (MISALIGNED_BUFFER_SIZE / 2);
-	src += 2;
-
 	kernel_vector_begin();
 
-	word_cycles = measure_cycles(__riscv_copy_vec_words_unaligned,
-				     dst, src, MISALIGNED_COPY_SIZE);
-
-	byte_cycles = measure_cycles(__riscv_copy_vec_bytes_unaligned,
-				     dst, src, MISALIGNED_COPY_SIZE);
+	ret = compare_unaligned_access(__riscv_copy_vec_words_unaligned,
+				       __riscv_copy_vec_bytes_unaligned,
+				       page_address(page), "vector");
 	kernel_vector_end();
 
-	/* Don't divide by zero. */
-	if (!word_cycles || !byte_cycles) {
-		pr_warn("cpu%d: rdtime lacks granularity needed to measure unaligned vector access speed\n",
-			cpu);
-
+	if (ret < 0)
 		goto free;
-	}
 
-	if (word_cycles < byte_cycles)
-		speed = RISCV_HWPROBE_MISALIGNED_VECTOR_FAST;
-
-	ratio = div_u64((byte_cycles * 100), word_cycles);
-	pr_info("cpu%d: Ratio of vector byte access time to vector unaligned word access is %d.%02d, unaligned accesses are %s\n",
-		cpu,
-		ratio / 100,
-		ratio % 100,
-		(speed ==  RISCV_HWPROBE_MISALIGNED_VECTOR_FAST) ? "fast" : "slow");
-
-	per_cpu(vector_misaligned_access, cpu) = speed;
+	if (ret)
+		per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_FAST;
+	else
+		per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW;
 
 free:
 	__free_pages(page, MISALIGNED_BUFFER_ORDER);
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

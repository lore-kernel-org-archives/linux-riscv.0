Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A07ECD6C1
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Feb 2026 17:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjwwpUWDw+Rp9wpPtckm16pb7vchZHXM6VJYikh4oWg=; b=j5L7ztdM87RfYA
	p3IB/u63zjderNlfqL9IrlK4hCQP37nF6XPxmZSHxfy75UvQ1ZwTdMNKVQYuP/N5PFWY/X89iJAnA
	idcwSGr4+Cy6yMMmqFQ/qPOQXFDQ/jLSU4ZBgaROCKBjWDS9WeJBB+n31Ghr6d0ulw2qjPuV0kWln
	IvtmrX5gmKLnB9BBp60ecA3MB6dlFSvYk7ktSG6O1Oj4v55xgOgvwd3v1uiyin2H+EszKvM8aIlXJ
	EkT+1msaVaiC49ARX+mIZkhnNptA42rVPdVXxLK/GhWGYeyzaBuPWMD8E2hfeZlGohL4jA9tr4RSQ
	74SEMxO+pGGabdOh3zkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqE3E-00000000tmF-3gmK;
	Wed, 11 Feb 2026 17:30:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqE3B-00000000tk0-3CES
	for linux-riscv@lists.infradead.org;
	Wed, 11 Feb 2026 17:30:55 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770831051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/8y0dAsi1KhYQOwI9LZZG8LjkoOsEKw49Zlrv+dlAg=;
	b=SdZMaVtpDXnlEmf2pEmfwTyNcS8A9Qiqs5CvVQO5Ve9E/z1NFbyHRpPF69btIw3HMZuMuz
	Ors8Gsuj4kctnAXXSgAj1daq2F0OUZwEQHzd+tKjXrP72zUWUHJqMdA9/7M1vx0zhQdafx
	74OaIVPnrIgxKMuTn/iUsFFQHPDKkBy4ufbhyVr3HwB8h+A0wA5iqURQVAffd3O1A6Atvs
	oNY2TC64pR5zFjFq0ZnoKzKVU9Y5WvbRuDLxqukC3jv85WN5UFqBIqiiy7nYxGvtKdR1Er
	WZ38UfnJ1kwuWaqHfiegaqEdVZqWl3RRYG4qwY7ZmafQzecKyOXOyhB16yaEuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770831051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/8y0dAsi1KhYQOwI9LZZG8LjkoOsEKw49Zlrv+dlAg=;
	b=k6LTFLm3s31j4+B5eetbSfi6TJuNhE43D3HIdciKWDDFdd3YzCd25qygSntBdy8nxc/iVj
	VAKUMRhPWZDhUxCQ==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 3/5] riscv: Reuse measure_cycles() in check_vector_unaligned_access()
Date: Wed, 11 Feb 2026 18:30:33 +0100
Message-ID: <be4c66fd4120952195fdcd0e62d245c55f0711e2.1770830596.git.namcao@linutronix.de>
In-Reply-To: <cover.1770830596.git.namcao@linutronix.de>
References: <cover.1770830596.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_093053_983522_E163F6D0 
X-CRM114-Status: GOOD (  11.25  )
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

check_vector_unaligned_access() duplicates the logic in measure_cycles().

Reuse measure_cycles() and deduplicate.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/unaligned_access_speed.c | 54 ++++------------------
 1 file changed, 8 insertions(+), 46 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index b964a666a973..c0d39c4b2150 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -16,7 +16,6 @@
 
 #include "copy-unaligned.h"
 
-#define MISALIGNED_ACCESS_JIFFIES_LG2 1
 #define MISALIGNED_ACCESS_NS 8000000
 #define MISALIGNED_BUFFER_SIZE 0x4000
 #define MISALIGNED_BUFFER_ORDER get_order(MISALIGNED_BUFFER_SIZE)
@@ -30,9 +29,9 @@ static long unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNO
 
 static cpumask_t fast_misaligned_access;
 
-#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
-static u64 measure_cycles(void (*func)(void *dst, const void *src, size_t len),
-			  void *dst, void *src, size_t len)
+static u64 __maybe_unused
+measure_cycles(void (*func)(void *dst, const void *src, size_t len),
+	       void *dst, void *src, size_t len)
 {
 	u64 start_cycles, end_cycles, cycles = -1ULL;
 	u64 start_ns;
@@ -64,6 +63,7 @@ static u64 measure_cycles(void (*func)(void *dst, const void *src, size_t len),
 	return cycles;
 }
 
+#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
 static int check_unaligned_access(void *param)
 {
 	int cpu = smp_processor_id();
@@ -270,11 +270,9 @@ static int riscv_offline_cpu(unsigned int cpu)
 static void check_vector_unaligned_access(struct work_struct *work __always_unused)
 {
 	int cpu = smp_processor_id();
-	u64 start_cycles, end_cycles;
 	u64 word_cycles;
 	u64 byte_cycles;
 	int ratio;
-	unsigned long start_jiffies, now;
 	struct page *page;
 	void *dst;
 	void *src;
@@ -294,50 +292,14 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 	/* Unalign src as well, but differently (off by 1 + 2 = 3). */
 	src = dst + (MISALIGNED_BUFFER_SIZE / 2);
 	src += 2;
-	word_cycles = -1ULL;
 
-	/* Do a warmup. */
 	kernel_vector_begin();
-	__riscv_copy_vec_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
-
-	start_jiffies = jiffies;
-	while ((now = jiffies) == start_jiffies)
-		cpu_relax();
-
-	/*
-	 * For a fixed amount of time, repeatedly try the function, and take
-	 * the best time in cycles as the measurement.
-	 */
-	while (time_before(jiffies, now + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
-		start_cycles = get_cycles64();
-		/* Ensure the CSR read can't reorder WRT to the copy. */
-		mb();
-		__riscv_copy_vec_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
-		/* Ensure the copy ends before the end time is snapped. */
-		mb();
-		end_cycles = get_cycles64();
-		if ((end_cycles - start_cycles) < word_cycles)
-			word_cycles = end_cycles - start_cycles;
-	}
-
-	byte_cycles = -1ULL;
-	__riscv_copy_vec_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
-	start_jiffies = jiffies;
-	while ((now = jiffies) == start_jiffies)
-		cpu_relax();
 
-	while (time_before(jiffies, now + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
-		start_cycles = get_cycles64();
-		/* Ensure the CSR read can't reorder WRT to the copy. */
-		mb();
-		__riscv_copy_vec_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
-		/* Ensure the copy ends before the end time is snapped. */
-		mb();
-		end_cycles = get_cycles64();
-		if ((end_cycles - start_cycles) < byte_cycles)
-			byte_cycles = end_cycles - start_cycles;
-	}
+	word_cycles = measure_cycles(__riscv_copy_vec_words_unaligned,
+				     dst, src, MISALIGNED_COPY_SIZE);
 
+	byte_cycles = measure_cycles(__riscv_copy_vec_bytes_unaligned,
+				     dst, src, MISALIGNED_COPY_SIZE);
 	kernel_vector_end();
 
 	/* Don't divide by zero. */
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

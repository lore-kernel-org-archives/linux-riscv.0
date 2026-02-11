Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7E6ECD6D1
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Feb 2026 17:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oN0B7YpPAXlgLe029dO7EqO5H76yFn6t7WdSFthtUg4=; b=ymWZuV0cHwsbjR
	qQFbWhzAwSQQR8TIATfs8asVYFseBqwRkHg7PYkQOmRh00Q4yK+5FMcAbrleQvSeLZmiHvoMeUfcS
	+p43XMxlGjZxUHyWeJ+qZVwnhsQPj0glKTHVFFK4Z0DOd16gE0CPCRjweUddanUwY6hOXARfczJXz
	/bWQ/oXipoVVKJMZnCPaI/h54uv0gdVx63Or8FOb55Zsxmo+8c6vDlo7zA+kZ1gPKH50rug7Wv1XV
	TA6ttbCexskJrN2m6EapbawbB3dSdXW4BUHu+vY5Bq+E/b1kH6X9rp0514SRca3ptNr+GDu+2SW0V
	v5LgX3ogfDtYrgmeJRUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqE3G-00000000tnd-3Thu;
	Wed, 11 Feb 2026 17:30:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqE3C-00000000tk1-00u6
	for linux-riscv@lists.infradead.org;
	Wed, 11 Feb 2026 17:30:56 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770831051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=md7PKEkW8qRnREfNKFlfHXRJ8unV7xpddBLzTx6CkJg=;
	b=1lBK/ktcYfigwtF7Wm7+ofucP+4Ikm8K636KRYzfkD7zRCgm7vNbGQM9/b6/4wQ7Mbso7k
	qxCFAcbWVZK61NFDmZj2CSEdUTSM0aCN4lfHsGDzNlrYSEnmVm4zT9HLDgWEPeXENBMkNb
	z814DHgCNM5rII8jkUlUzfuHndgOdMhU+uIhLT8RaEZ5FKiOFa9jMDCIXGA6h25aFNRh39
	kGYFV31crqW4FHf6j4tw6bD/8ZznEtRnnrf37GFA8vJF1+gPGPcS+cZ2jVTvInPxl3QVlx
	L/9WMiaoGAvVJauOn0qI9Qd5hsKmP3dcQS60UoTNatU9RGdJH8d60vA/2Cy+Aw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770831051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=md7PKEkW8qRnREfNKFlfHXRJ8unV7xpddBLzTx6CkJg=;
	b=onsazupK5R9EnobhxSXr+gvZPjH6MVKB8Lv4ovAtHYM13MyO2JRg2kLOx2FHEUqFvs/XKx
	9sxXcuc2Wrn9Z0AA==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 4/5] riscv: Split out compare_unaligned_access()
Date: Wed, 11 Feb 2026 18:30:34 +0100
Message-ID: <3695f77279d473eead8ed6210d97c941321cd4f1.1770830596.git.namcao@linutronix.de>
In-Reply-To: <cover.1770830596.git.namcao@linutronix.de>
References: <cover.1770830596.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_093054_240559_28C37655 
X-CRM114-Status: GOOD (  11.52  )
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

Scalar misaligned access probe and vector misaligned access probe share
very similar code. Split out this similar part from scalar probe into
compare_unaligned_access(), which will be reused for vector probe in a
follow-up commit.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/unaligned_access_speed.c | 59 +++++++++++++++-------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index c0d39c4b2150..b3ed74b71d3e 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -63,58 +63,79 @@ measure_cycles(void (*func)(void *dst, const void *src, size_t len),
 	return cycles;
 }
 
-#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
-static int check_unaligned_access(void *param)
+/*
+ * Return:
+ *     1 if unaligned accesses are fast
+ *     0 if unaligned accesses are slow
+ *    -1 if check cannot be done
+ */
+static int __maybe_unused
+compare_unaligned_access(void (*word_copy)(void *dst, const void *src, size_t len),
+			 void (*byte_copy)(void *dst, const void *src, size_t len),
+			 void *buf)
 {
 	int cpu = smp_processor_id();
 	u64 word_cycles;
 	u64 byte_cycles;
+	void *dst, *src;
+	bool fast;
 	int ratio;
-	struct page *page = param;
-	void *dst;
-	void *src;
-	long speed = RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW;
-
-	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
-		return 0;
 
 	/* Make an unaligned destination buffer. */
-	dst = (void *)((unsigned long)page_address(page) | 0x1);
+	dst = (void *)((unsigned long)buf | 0x1);
 	/* Unalign src as well, but differently (off by 1 + 2 = 3). */
 	src = dst + (MISALIGNED_BUFFER_SIZE / 2);
 	src += 2;
 
-	word_cycles = measure_cycles(__riscv_copy_words_unaligned, dst, src, MISALIGNED_COPY_SIZE);
-	byte_cycles = measure_cycles(__riscv_copy_bytes_unaligned, dst, src, MISALIGNED_COPY_SIZE);
+	word_cycles = measure_cycles(word_copy, dst, src, MISALIGNED_COPY_SIZE);
+	byte_cycles = measure_cycles(byte_copy, dst, src, MISALIGNED_COPY_SIZE);
 
 	/* Don't divide by zero. */
 	if (!word_cycles || !byte_cycles) {
 		pr_warn("cpu%d: rdtime lacks granularity needed to measure unaligned access speed\n",
 			cpu);
 
-		return 0;
+		return -1;
 	}
 
-	if (word_cycles < byte_cycles)
-		speed = RISCV_HWPROBE_MISALIGNED_SCALAR_FAST;
+	fast = word_cycles < byte_cycles;
 
 	ratio = div_u64((byte_cycles * 100), word_cycles);
 	pr_info("cpu%d: Ratio of byte access time to unaligned word access is %d.%02d, unaligned accesses are %s\n",
 		cpu,
 		ratio / 100,
 		ratio % 100,
-		(speed == RISCV_HWPROBE_MISALIGNED_SCALAR_FAST) ? "fast" : "slow");
+		fast ? "fast" : "slow");
 
-	per_cpu(misaligned_access_speed, cpu) = speed;
+	return fast;
+}
+
+#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
+static int check_unaligned_access(struct page *page)
+{
+	void *buf = page_address(page);
+	int cpu = smp_processor_id();
+	int ret;
+
+	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
+		return 0;
+
+	ret = compare_unaligned_access(__riscv_copy_words_unaligned,
+				       __riscv_copy_bytes_unaligned, buf);
+	if (ret < 0)
+		return 0;
 
 	/*
 	 * Set the value of fast_misaligned_access of a CPU. These operations
 	 * are atomic to avoid race conditions.
 	 */
-	if (speed == RISCV_HWPROBE_MISALIGNED_SCALAR_FAST)
+	if (ret) {
+		per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_SCALAR_FAST;
 		cpumask_set_cpu(cpu, &fast_misaligned_access);
-	else
+	} else {
+		per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW;
 		cpumask_clear_cpu(cpu, &fast_misaligned_access);
+	}
 
 	return 0;
 }
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

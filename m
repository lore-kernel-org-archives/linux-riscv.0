Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D26AECD6D2
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Feb 2026 17:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASt3hyhZ2RVuJjlzYDVZpUjmA2Ao+GqtUaZEzt8B3ds=; b=vuIDD34hCueuWi
	6x3myKZmQPVdzLHAeYQMeAHSoY68Twkw8fMVtz97O5+sHXjrtxmTuAm62TdBwYxjnajqxwEcYhvxO
	kM+TQ51X1sWMlMzkN3bsLJK7bbGqqXEFAEU3uOFbGzZ6dNFy2QGq7Im3Nk4DwCxu2HGOsTyq9WY+J
	6OIzmP6LyYMYhWVFgXiXfp38ReDPO2z2Ode4eap/iDRG4a0YR90ht1StHWbDKDdnEVRmqHuZEy2fd
	MTOz/uYPlS9PZaQ5By2qoRFVu7/LF3AgLzAlGmKW+IhihK6JP/mMigII9o/8F6NPMb2Z5l76QrOkm
	PkReQV1dr8i00Mzd2I1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqE3F-00000000tmO-0md5;
	Wed, 11 Feb 2026 17:30:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqE3B-00000000tjz-3FnR
	for linux-riscv@lists.infradead.org;
	Wed, 11 Feb 2026 17:30:55 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770831051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BUvkJ8w7tWD428d0BdBWQcoGHqIOYKVajPuycpt1LHo=;
	b=rs7dFTkJT2aeKl7wyDrHY6j4sJsJOPo3k7zZJtt8ykCO5bPQHcjxArKin4vr5B7H2cCBp0
	nF2lLxYzQxi2lkjKBDgqR+FZs1+JiNr0W1/aeWRgljWhFIBqzXNK821kZS1k955yHBjc3J
	JyyZdTMHm5dF8Olbmjiox+v/q33SfMuwZBFklSJhKiT6zmX1yaRjYqDSDCs67MMU/X/DjW
	EMsdL7yTLCwAEk5Nht7JFECXFuDLHWsX+FbCju1MNFrCdZkv9C96u6CUEA0VLrGDOChQzE
	TFPrpVrt5ge4biAfHivFqlBxt6UwukyCIoyU0e0z9XO7UGDP2Cmg789zXnUe9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770831051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BUvkJ8w7tWD428d0BdBWQcoGHqIOYKVajPuycpt1LHo=;
	b=eOZVy0MgH/eo0R1k1vEpbyAXyjY293OPaiCvVmNW/F/WqzsANEBsUecAxJbJTnhSUABGfX
	FdXZTbiS0bgUhwDQ==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 2/5] riscv: Split out measure_cycles() for reuse
Date: Wed, 11 Feb 2026 18:30:32 +0100
Message-ID: <50d0598e45acc56c95176e52fbbe56e1f4becc84.1770830596.git.namcao@linutronix.de>
In-Reply-To: <cover.1770830596.git.namcao@linutronix.de>
References: <cover.1770830596.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_093053_994802_74F1505C 
X-CRM114-Status: GOOD (  10.74  )
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

Byte cycle measurement and word cycle measurement of scalar misaligned
access are very similar. Split these parts out into a common
measure_cycles() function to avoid duplication.

This function will also be reused for vector misaligned access probe in a
follow-up commit.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/unaligned_access_speed.c | 69 +++++++++++-----------
 1 file changed, 33 insertions(+), 36 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 8b744c4a41ea..b964a666a973 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -31,30 +31,15 @@ static long unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNO
 static cpumask_t fast_misaligned_access;
 
 #ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
-static int check_unaligned_access(void *param)
+static u64 measure_cycles(void (*func)(void *dst, const void *src, size_t len),
+			  void *dst, void *src, size_t len)
 {
-	int cpu = smp_processor_id();
-	u64 start_cycles, end_cycles;
-	u64 word_cycles;
-	u64 byte_cycles;
+	u64 start_cycles, end_cycles, cycles = -1ULL;
 	u64 start_ns;
-	int ratio;
-	struct page *page = param;
-	void *dst;
-	void *src;
-	long speed = RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW;
 
-	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
-		return 0;
-
-	/* Make an unaligned destination buffer. */
-	dst = (void *)((unsigned long)page_address(page) | 0x1);
-	/* Unalign src as well, but differently (off by 1 + 2 = 3). */
-	src = dst + (MISALIGNED_BUFFER_SIZE / 2);
-	src += 2;
-	word_cycles = -1ULL;
 	/* Do a warmup. */
-	__riscv_copy_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+	func(dst, src, len);
+
 	preempt_disable();
 
 	/*
@@ -66,29 +51,41 @@ static int check_unaligned_access(void *param)
 		start_cycles = get_cycles64();
 		/* Ensure the CSR read can't reorder WRT to the copy. */
 		mb();
-		__riscv_copy_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+		func(dst, src, len);
 		/* Ensure the copy ends before the end time is snapped. */
 		mb();
 		end_cycles = get_cycles64();
-		if ((end_cycles - start_cycles) < word_cycles)
-			word_cycles = end_cycles - start_cycles;
+		if ((end_cycles - start_cycles) < cycles)
+			cycles = end_cycles - start_cycles;
 	}
 
-	byte_cycles = -1ULL;
-	__riscv_copy_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+	preempt_enable();
 
-	start_ns = ktime_get_mono_fast_ns();
-	while (ktime_get_mono_fast_ns() < start_ns + MISALIGNED_ACCESS_NS) {
-		start_cycles = get_cycles64();
-		mb();
-		__riscv_copy_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
-		mb();
-		end_cycles = get_cycles64();
-		if ((end_cycles - start_cycles) < byte_cycles)
-			byte_cycles = end_cycles - start_cycles;
-	}
+	return cycles;
+}
 
-	preempt_enable();
+static int check_unaligned_access(void *param)
+{
+	int cpu = smp_processor_id();
+	u64 word_cycles;
+	u64 byte_cycles;
+	int ratio;
+	struct page *page = param;
+	void *dst;
+	void *src;
+	long speed = RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW;
+
+	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
+		return 0;
+
+	/* Make an unaligned destination buffer. */
+	dst = (void *)((unsigned long)page_address(page) | 0x1);
+	/* Unalign src as well, but differently (off by 1 + 2 = 3). */
+	src = dst + (MISALIGNED_BUFFER_SIZE / 2);
+	src += 2;
+
+	word_cycles = measure_cycles(__riscv_copy_words_unaligned, dst, src, MISALIGNED_COPY_SIZE);
+	byte_cycles = measure_cycles(__riscv_copy_bytes_unaligned, dst, src, MISALIGNED_COPY_SIZE);
 
 	/* Don't divide by zero. */
 	if (!word_cycles || !byte_cycles) {
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3530ECD6E45
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 21:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJ8f1Akh7FVjtzNtzUqNe+TguKJ33qo0LPd5rO//y+M=; b=vLBpjLjuS97Q5x
	uVD11CUk6On45lh+RRdwP3pRhlAtAiArdxdt8HJLdz3whACdfwodzbK4xKr2flyH6EciKDB4C3iRe
	5EQYHL7jwk9iN3PqRKeIOINYpmw7lD6ex5JOo/Em1o8fwJveKgdhsX/jIfFdADzZSuZObnUV10Tw2
	WE0sXGUMXHQuOz6DTG25pFyVlmotndCKxGEHZuz7dm/ZLUZiFSaDYePen0LOiNrJtZRSd5oO1L3sE
	uRzutfrTPGLXW294nEVU1t0vOLjy3cdI2/SpXXPyLQPlA5qyuN+HkCL2za9ea98P3fW/7Q2Rcn5vz
	SDwQWIuFIF/8nB8e68ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSi21-00000006OAY-48s1;
	Thu, 28 May 2026 21:12:45 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSi1z-00000006O9L-1z5g
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 21:12:44 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780002759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yO2TkV30CBiOE4tZ4btDgEvHpRhLIV3vd2JMv2gLDzU=;
	b=hx1eH4BB0PhQ0FWGrZjS6apQGsFLclqZPW8oPWUZv5ht/+NidRCMIt8ofmpAICWopm0a22
	oHvwNQfRUxvBbhncwZUroHSGLKzGeKzOyji/Xh5/JhDLEU3rbsp9PeSitQu7GuDRq7fri9
	yQVyqcqS/rjI2q03FHfU/6x+igAHx0UsePV8v9J5fgqXquiyhiSgQsgtKc7TgzRkOyjRuI
	zufCH1o9qUtCmMbbO9uYhTZI5EtAqefIg6f396xXx8RW6yU94jVc/TTsXjeJxwQhWV60zH
	KoccrHo9gDIv/NXUWz19bDEHWi+vsaPCrRUAngahpUX0Zjjvg31XzXnKyik0EQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780002759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yO2TkV30CBiOE4tZ4btDgEvHpRhLIV3vd2JMv2gLDzU=;
	b=xX/fy/oe9KCF9sVzqjh3hvi/Sj2WfWPtdNOln3EtjzumDT+a81mKP8Dkfh3m10jnfx0om5
	eX6G+zIO/ICa7mBA==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 1/2] riscv: misaligned: Fix fast_unaligned_access_speed_key init
Date: Thu, 28 May 2026 23:12:30 +0200
Message-ID: <2468816ceb433394099a00d7822f819745276b49.1780002199.git.namcao@linutronix.de>
In-Reply-To: <cover.1780002199.git.namcao@linutronix.de>
References: <cover.1780002199.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_141243_645642_EFB40A16 
X-CRM114-Status: GOOD (  16.23  )
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

When booting with unaligned_scalar_speed=fast,
fast_unaligned_access_speed_key is initialized incorrectly.

The key is currently derived from the fast_misaligned_access cpumask, but
that mask is only populated when the unaligned access speed probe runs.
Specifying unaligned_scalar_speed=fast skips the probe entirely, leaving
the mask uninitialized.

The information tracked by fast_misaligned_access is already available in
the misaligned_access_speed per-CPU variable. Use that to initialize
fast_unaligned_access_speed_key instead and remove the redundant cpumask.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/unaligned_access_speed.c | 69 +++++++---------------
 1 file changed, 22 insertions(+), 47 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 11c781a4de73..bb57eb5d19df 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -27,8 +27,6 @@ DEFINE_PER_CPU(long, vector_misaligned_access) = RISCV_HWPROBE_MISALIGNED_VECTOR
 static long unaligned_scalar_speed_param = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
 static long unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN;
 
-static cpumask_t fast_misaligned_access;
-
 static u64 __maybe_unused
 measure_cycles(void (*func)(void *dst, const void *src, size_t len),
 	       void *dst, void *src, size_t len)
@@ -131,13 +129,10 @@ static int check_unaligned_access(struct page *page)
 	 * Set the value of fast_misaligned_access of a CPU. These operations
 	 * are atomic to avoid race conditions.
 	 */
-	if (ret) {
+	if (ret)
 		per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_SCALAR_FAST;
-		cpumask_set_cpu(cpu, &fast_misaligned_access);
-	} else {
+	else
 		per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW;
-		cpumask_clear_cpu(cpu, &fast_misaligned_access);
-	}
 
 	return 0;
 }
@@ -192,49 +187,24 @@ static void __init check_unaligned_access_speed_all_cpus(void)
 
 DEFINE_STATIC_KEY_FALSE(fast_unaligned_access_speed_key);
 
-static void modify_unaligned_access_branches(cpumask_t *mask, int weight)
+static void modify_unaligned_access_branches(const cpumask_t *mask)
 {
-	if (cpumask_weight(mask) == weight)
+	bool fast = true;
+	int cpu;
+
+	for_each_cpu(cpu, mask) {
+		if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_FAST) {
+			fast = false;
+			break;
+		}
+	}
+
+	if (fast)
 		static_branch_enable_cpuslocked(&fast_unaligned_access_speed_key);
 	else
 		static_branch_disable_cpuslocked(&fast_unaligned_access_speed_key);
 }
 
-static void set_unaligned_access_static_branches_except_cpu(int cpu)
-{
-	/*
-	 * Same as set_unaligned_access_static_branches, except excludes the
-	 * given CPU from the result. When a CPU is hotplugged into an offline
-	 * state, this function is called before the CPU is set to offline in
-	 * the cpumask, and thus the CPU needs to be explicitly excluded.
-	 */
-
-	cpumask_t fast_except_me;
-
-	cpumask_and(&fast_except_me, &fast_misaligned_access, cpu_online_mask);
-	cpumask_clear_cpu(cpu, &fast_except_me);
-
-	modify_unaligned_access_branches(&fast_except_me, num_online_cpus() - 1);
-}
-
-static void set_unaligned_access_static_branches(void)
-{
-	/*
-	 * This will be called after check_unaligned_access_all_cpus so the
-	 * result of unaligned access speed for all CPUs will be available.
-	 *
-	 * To avoid the number of online cpus changing between reading
-	 * cpu_online_mask and calling num_online_cpus, cpus_read_lock must be
-	 * held before calling this function.
-	 */
-
-	cpumask_t fast_and_online;
-
-	cpumask_and(&fast_and_online, &fast_misaligned_access, cpu_online_mask);
-
-	modify_unaligned_access_branches(&fast_and_online, num_online_cpus());
-}
-
 static int riscv_online_cpu(unsigned int cpu)
 {
 	int ret = cpu_online_unaligned_access_init(cpu);
@@ -266,14 +236,19 @@ static int riscv_online_cpu(unsigned int cpu)
 #endif
 
 exit:
-	set_unaligned_access_static_branches();
+	modify_unaligned_access_branches(cpu_online_mask);
 
 	return 0;
 }
 
 static int riscv_offline_cpu(unsigned int cpu)
 {
-	set_unaligned_access_static_branches_except_cpu(cpu);
+	cpumask_t mask;
+
+	cpumask_copy(&mask, cpu_online_mask);
+	cpumask_clear_cpu(cpu, &mask);
+
+	modify_unaligned_access_branches(&mask);
 
 	return 0;
 }
@@ -430,7 +405,7 @@ static int __init check_unaligned_access_all_cpus(void)
 				  riscv_online_cpu_vec, NULL);
 
 	cpus_read_lock();
-	set_unaligned_access_static_branches();
+	modify_unaligned_access_branches(cpu_online_mask);
 	cpus_read_unlock();
 
 	return 0;
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

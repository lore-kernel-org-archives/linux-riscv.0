Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F85ECD6CB
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Feb 2026 17:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTrme/+y1OyUidQAomRzdggE1yQ33l4NkEGtSOcX8gk=; b=opmemhgSdMwf2T
	SxJTHWNIf9cpimaM1MV/eE0WZPqHKPCb6bHVMbmXDIlDC6mLEpwS1SxAFay5jnDehRP2C0CJTc1b6
	cY7E/yJIFVRXCjAV8Al2hnBD1U1nPYfxvQvR9N1c4CAJsOSYgO75DmfyzHmsV50QpzmNH0uxtCrCE
	rTQQUbndhLQo2CaDp4XkESfSNqZVETBrzMGU8HGYjwa314ym+JE/nm/z+ummA9AZXbQmMoL4kZJ1P
	wzW34xAAf7DmhoKAwuPhBMTHs73yVeBxOnJPByTwyFkaollQW/2AoXAzl58+/X3eA1zBfLnghh6h/
	gqxrz5T9M70lzy+bA6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqE3F-00000000tmZ-23Qv;
	Wed, 11 Feb 2026 17:30:57 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqE3B-00000000tjy-3rIw
	for linux-riscv@lists.infradead.org;
	Wed, 11 Feb 2026 17:30:55 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770831050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XZ1wS3EkGS+wwLdwUudi9ss9LulFQNodQHS/dw62M1g=;
	b=kpB4bgYEqanUlIF0vZKcYFpNXDgR7pr7v6lRuqzhHnr3AoyuH3MP2Ww628MyOorndOVXEB
	ueNmE7eG7i7cZtZlmd0A1CqvREarLsB9s8egrrZTpZf57KLMdJY8dz655aFdSn7UF9XPVd
	QT7sVJIVv5jGwAj5zUaXPW+GbrvzhroqP5zTFW/oT+6TRYA0UIAwVmJAMy1anbpcStvXe3
	yhO2Yej3kimKcpysJAQTbTDAyssJnw/KhPbRaB3Sz9GM5XNZhyPxw1dp3vvRlIed+n3oSp
	InfbOvtLvaidiGEBYTks1JR7/0oxbMOZLbcYBf9Er+qpybZLQo6UgCLPjdmtGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770831050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XZ1wS3EkGS+wwLdwUudi9ss9LulFQNodQHS/dw62M1g=;
	b=LQ91RW9Zh93ahUIz4FmRP/hfC84OGYkwo90UEkjaQG8jONEILQ71e9CjxJRTxyicbWD7+g
	ndWnnTvTGpEg3ACA==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1/5] riscv: Clean up & optimize unaligned scalar access probe
Date: Wed, 11 Feb 2026 18:30:31 +0100
Message-ID: <9b9a20affe2e4f5c380926ceb885a47e20a59395.1770830596.git.namcao@linutronix.de>
In-Reply-To: <cover.1770830596.git.namcao@linutronix.de>
References: <cover.1770830596.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_093054_116096_B228B4D1 
X-CRM114-Status: GOOD (  15.67  )
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

check_unaligned_access_speed_all_cpus() is more complicated than it should
be:

  - It uses on_each_cpu() to probe unaligned memory access on all CPUs but
    excludes CPU0 with a check in the callback function. So an IPI to CPU0
    is wasted.

  - Probing on CPU0 is done with smp_call_on_cpu(), which is not as fast as
    on_each_cpu().

The reason for this design is because the probe is timed with jiffies.
Therefore on_each_cpu() excludes CPU0 because that CPU needs to tend to
jiffies.

Instead, replace jiffies usage with ktime_get_mono_fast_ns(). With jiffies
out of the way, on_each_cpu() can be used for all CPUs and
smp_call_on_cpu() can be dropped.

To make ktime_get_mono_fast_ns() usable, move this probe to late_initcall.
Anything after clocksource's fs_initcall works, but avoid depending on
clocksource staying at fs_initcall.

The choice of probe time is now 8000000 ns, which is the same as before (2
jiffies) for riscv defconfig. This is excessive for the CPUs I have, and
probably should be reduced; but that's a different discussion.

Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/unaligned_access_speed.c | 28 ++++++++--------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 70b5e6927620..8b744c4a41ea 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -17,6 +17,7 @@
 #include "copy-unaligned.h"
 
 #define MISALIGNED_ACCESS_JIFFIES_LG2 1
+#define MISALIGNED_ACCESS_NS 8000000
 #define MISALIGNED_BUFFER_SIZE 0x4000
 #define MISALIGNED_BUFFER_ORDER get_order(MISALIGNED_BUFFER_SIZE)
 #define MISALIGNED_COPY_SIZE ((MISALIGNED_BUFFER_SIZE / 2) - 0x80)
@@ -36,8 +37,8 @@ static int check_unaligned_access(void *param)
 	u64 start_cycles, end_cycles;
 	u64 word_cycles;
 	u64 byte_cycles;
+	u64 start_ns;
 	int ratio;
-	unsigned long start_jiffies, now;
 	struct page *page = param;
 	void *dst;
 	void *src;
@@ -55,15 +56,13 @@ static int check_unaligned_access(void *param)
 	/* Do a warmup. */
 	__riscv_copy_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
 	preempt_disable();
-	start_jiffies = jiffies;
-	while ((now = jiffies) == start_jiffies)
-		cpu_relax();
 
 	/*
 	 * For a fixed amount of time, repeatedly try the function, and take
 	 * the best time in cycles as the measurement.
 	 */
-	while (time_before(jiffies, now + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
+	start_ns = ktime_get_mono_fast_ns();
+	while (ktime_get_mono_fast_ns() < start_ns + MISALIGNED_ACCESS_NS) {
 		start_cycles = get_cycles64();
 		/* Ensure the CSR read can't reorder WRT to the copy. */
 		mb();
@@ -77,11 +76,9 @@ static int check_unaligned_access(void *param)
 
 	byte_cycles = -1ULL;
 	__riscv_copy_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
-	start_jiffies = jiffies;
-	while ((now = jiffies) == start_jiffies)
-		cpu_relax();
 
-	while (time_before(jiffies, now + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
+	start_ns = ktime_get_mono_fast_ns();
+	while (ktime_get_mono_fast_ns() < start_ns + MISALIGNED_ACCESS_NS) {
 		start_cycles = get_cycles64();
 		mb();
 		__riscv_copy_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
@@ -125,13 +122,12 @@ static int check_unaligned_access(void *param)
 	return 0;
 }
 
-static void __init check_unaligned_access_nonboot_cpu(void *param)
+static void __init _check_unaligned_access(void *param)
 {
 	unsigned int cpu = smp_processor_id();
 	struct page **pages = param;
 
-	if (smp_processor_id() != 0)
-		check_unaligned_access(pages[cpu]);
+	check_unaligned_access(pages[cpu]);
 }
 
 /* Measure unaligned access speed on all CPUs present at boot in parallel. */
@@ -158,11 +154,7 @@ static void __init check_unaligned_access_speed_all_cpus(void)
 		}
 	}
 
-	/* Check everybody except 0, who stays behind to tend jiffies. */
-	on_each_cpu(check_unaligned_access_nonboot_cpu, bufs, 1);
-
-	/* Check core 0. */
-	smp_call_on_cpu(0, check_unaligned_access, bufs[0], true);
+	on_each_cpu(_check_unaligned_access, bufs, 1);
 
 out:
 	for_each_cpu(cpu, cpu_online_mask) {
@@ -494,4 +486,4 @@ static int __init check_unaligned_access_all_cpus(void)
 	return 0;
 }
 
-arch_initcall(check_unaligned_access_all_cpus);
+late_initcall(check_unaligned_access_all_cpus);
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

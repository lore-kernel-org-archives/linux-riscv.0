Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9B8C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 22:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MNQkrhaI6Hna+ypKyKcI2aeqZNJ/llcd5WyugWTTt8Y=; b=vCHw0C9kGAS5K3
	Ws1KCKqFNjoQkwrg/5vlDYFHPTCibrm6zdpVVCLllk9ccm+m1EtpD7zzPUUSdOpvSzPs5XKROrgJE
	fSjwC7CCYzYRIY9jOwWTDMB+VWbutiegFYf99Dfn/GwInKh/DhrQYg7oR6FFQwSy2tRuDCWjcw72O
	yyQvl5VgPzT828g/UVPLFBmp70ar2kmFJ4M5v13aYDuhWECgP0u0iVuFlREETThPKkedl/4j8RfJY
	N6i5V5XuLyOOJnzdi4bkscXBRoF0WiMe+lf9seW8JKpdz2oH9iOJY3F9AA3R0l4EtcTbLR/nsOPyT
	8vI2i5kZbQDDLJDHnrNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r08Yl-0005vJ-1g;
	Mon, 06 Nov 2023 22:59:07 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r08Yi-0005uz-29
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 22:59:06 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-587b1231dbeso940132eaf.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 14:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699311543; x=1699916343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JjTrbVO5DQDFfCNQXlxC4Kehdfa5zqUUgQgAbIyQh7E=;
        b=LyWAKaHd9Av6g+2J5hJMpWUCHTw9RSXvYgZ4QxVzL77J628CCZN9ycfqSohtETs6hv
         u2DcMfJj1osJWP6uSZhO/pFanjcn7ZmdlyshiV5UZa1EqFmZPlOQ0BshUCdcVSGuteFl
         ujnkUWarlvDYdq2g1V7w19GTP6oY5CtUL8Kb8DLInZapTm8eNnZiMXlNbMfwyRiqFyer
         U+x6ui/Wja74z3KU/ckPj4GKv/nZxekm+PLs2dlk2qkmERwtB0uBmO5JlDTTYnHer3Xe
         w67x7KKY1JEHIPmoYkMGoaL0OHa1B9XqH3hknvHH+o1H7DYMl5CXppLcOoL89jyfY+wP
         Ov8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699311543; x=1699916343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjTrbVO5DQDFfCNQXlxC4Kehdfa5zqUUgQgAbIyQh7E=;
        b=XFtk9OvSQ7zme6HLiZO8ycSslPV1+mZVQSZUYTpkaiSfKhL9u6LAqVIbFrqRAjUDMK
         5vDAXC3w/aXi5qsdaNq4q2ZMoRl7CUtx4/UrES8D1wdJU3OVpkfFodeagUS8/XcsyCzU
         H8cg7mBelH7v2IiB0jc4LvWLAmkukpEP76H1Py0o1X7NGhIRkzumSc3evOGvBCAEmFya
         xO6EdbtGDMQyd++usEOKfOTD7mReVyBXdlkljfFUI0BHKe7sI2OjYjwqvj47eW8LXYfo
         Hwe8Pgqf7gmeLGM5Uq2ck26l9ce3CUzVDxksVkjKLCCEAkblkA1la5yt6VjgpvrPqwUR
         vxvw==
X-Gm-Message-State: AOJu0YxKXG7rXn5nNkRQYBRyh/k7teT//ZhtYXQCEpJoqsBOpr8I0Zkw
	NIzTL8RLgMV1GcggHQjZJRXR5Q==
X-Google-Smtp-Source: AGHT+IGJGoME8X8LqT0dQqrq8zLlt5O/Rz53cZhJIyjZHL5dZRVWcXb3vddhFyqP5x1o6XfoLkHSig==
X-Received: by 2002:a4a:c919:0:b0:582:1477:8362 with SMTP id v25-20020a4ac919000000b0058214778362mr28266888ooq.4.1699311543185;
        Mon, 06 Nov 2023 14:59:03 -0800 (PST)
Received: from evan.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w15-20020a4aa98f000000b00586a945615csm1737346oom.6.2023.11.06.14.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 14:59:02 -0800 (PST)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3] RISC-V: Probe misaligned access speed in parallel
Date: Mon,  6 Nov 2023 14:58:55 -0800
Message-Id: <20231106225855.3121724-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_145904_886194_800DB5C1 
X-CRM114-Status: GOOD (  21.32  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Marc Zyngier <maz@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Evan Green <evan@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Probing for misaligned access speed takes about 0.06 seconds. On a
system with 64 cores, doing this in smp_callin() means it's done
serially, extending boot time by 3.8 seconds. That's a lot of boot time.

Instead of measuring each CPU serially, let's do the measurements on
all CPUs in parallel. If we disable preemption on all CPUs, the
jiffies stop ticking, so we can do this in stages of 1) everybody
except core 0, then 2) core 0. The allocations are all done outside of
on_each_cpu() to avoid calling alloc_pages() with interrupts disabled.

For hotplugged CPUs that come in after the boot time measurement,
register CPU hotplug callbacks, and do the measurement there. Interrupts
are enabled in those callbacks, so they're fine to do alloc_pages() in.

Reported-by: Jisheng Zhang <jszhang@kernel.org>
Closes: https://lore.kernel.org/all/mhng-9359993d-6872-4134-83ce-c97debe1cf9a@palmer-ri-x1c9/T/#mae9b8f40016f9df428829d33360144dc5026bcbf
Fixes: 584ea6564bca ("RISC-V: Probe for unaligned access speed")
Signed-off-by: Evan Green <evan@rivosinc.com>

---

Changes in v3:
 - Avoid alloc_pages() with interrupts disabled (Sebastien)
 - Use cpuhp callbacks instead of hooking into smp_callin() (Sebastien).
 - Move cached answer check in check_unaligned_access() out to the
   hotplug callback, both to save the work of a useless allocation, and
   since check_unaligned_access_emulated() resets the answer to unknown.

Changes in v2:
 - Removed new global, used system_state == SYSTEM_RUNNING instead
   (Jisheng)
 - Added tags

 arch/riscv/include/asm/cpufeature.h |  1 -
 arch/riscv/kernel/cpufeature.c      | 96 +++++++++++++++++++++++------
 arch/riscv/kernel/smpboot.c         |  1 -
 3 files changed, 77 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 7f1e46a9d445..69f2cae96f0b 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -30,7 +30,6 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
-void check_unaligned_access(int cpu);
 void riscv_user_isa_enable(void);
 
 #ifdef CONFIG_RISCV_MISALIGNED
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 6a01ded615cd..fe59e18dbd5b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -8,6 +8,7 @@
 
 #include <linux/acpi.h>
 #include <linux/bitmap.h>
+#include <linux/cpuhotplug.h>
 #include <linux/ctype.h>
 #include <linux/log2.h>
 #include <linux/memory.h>
@@ -29,6 +30,7 @@
 
 #define MISALIGNED_ACCESS_JIFFIES_LG2 1
 #define MISALIGNED_BUFFER_SIZE 0x4000
+#define MISALIGNED_BUFFER_ORDER get_order(MISALIGNED_BUFFER_SIZE)
 #define MISALIGNED_COPY_SIZE ((MISALIGNED_BUFFER_SIZE / 2) - 0x80)
 
 unsigned long elf_hwcap __read_mostly;
@@ -557,30 +559,21 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
-void check_unaligned_access(int cpu)
+static int check_unaligned_access(void *param)
 {
+	int cpu = smp_processor_id();
 	u64 start_cycles, end_cycles;
 	u64 word_cycles;
 	u64 byte_cycles;
 	int ratio;
 	unsigned long start_jiffies, now;
-	struct page *page;
+	struct page *page = param;
 	void *dst;
 	void *src;
 	long speed = RISCV_HWPROBE_MISALIGNED_SLOW;
 
 	if (check_unaligned_access_emulated(cpu))
-		return;
-
-	/* We are already set since the last check */
-	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_UNKNOWN)
-		return;
-
-	page = alloc_pages(GFP_NOWAIT, get_order(MISALIGNED_BUFFER_SIZE));
-	if (!page) {
-		pr_warn("Can't alloc pages to measure memcpy performance");
-		return;
-	}
+		return 0;
 
 	/* Make an unaligned destination buffer. */
 	dst = (void *)((unsigned long)page_address(page) | 0x1);
@@ -634,7 +627,7 @@ void check_unaligned_access(int cpu)
 		pr_warn("cpu%d: rdtime lacks granularity needed to measure unaligned access speed\n",
 			cpu);
 
-		goto out;
+		return 0;
 	}
 
 	if (word_cycles < byte_cycles)
@@ -648,19 +641,84 @@ void check_unaligned_access(int cpu)
 		(speed == RISCV_HWPROBE_MISALIGNED_FAST) ? "fast" : "slow");
 
 	per_cpu(misaligned_access_speed, cpu) = speed;
+	return 0;
+}
 
-out:
-	__free_pages(page, get_order(MISALIGNED_BUFFER_SIZE));
+static void check_unaligned_access_nonboot_cpu(void *param)
+{
+	unsigned int cpu = smp_processor_id();
+	struct page **pages = param;
+
+	if (smp_processor_id() != 0)
+		check_unaligned_access(pages[cpu]);
+}
+
+static int riscv_online_cpu(unsigned int cpu)
+{
+	static struct page *buf;
+
+	/* We are already set since the last check */
+	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_UNKNOWN)
+		return 0;
+
+	buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
+	if (!buf) {
+		pr_warn("Allocation failure, not measuring misaligned performance\n");
+		return -ENOMEM;
+	}
+
+	check_unaligned_access(buf);
+	__free_pages(buf, MISALIGNED_BUFFER_ORDER);
+	return 0;
 }
 
-static int __init check_unaligned_access_boot_cpu(void)
+/* Measure unaligned access on all CPUs present at boot in parallel. */
+static int check_unaligned_access_all_cpus(void)
 {
-	check_unaligned_access(0);
+	unsigned int cpu;
+	unsigned int cpu_count = num_possible_cpus();
+	struct page **bufs = kzalloc(cpu_count * sizeof(struct page *),
+				     GFP_KERNEL);
+
+	if (!bufs) {
+		pr_warn("Allocation failure, not measuring misaligned performance\n");
+		return 0;
+	}
+
+	/*
+	 * Allocate separate buffers for each CPU so there's no fighting over
+	 * cache lines.
+	 */
+	for_each_cpu(cpu, cpu_online_mask) {
+		bufs[cpu] = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
+		if (!bufs[cpu]) {
+			pr_warn("Allocation failure, not measuring misaligned performance\n");
+			goto out;
+		}
+	}
+
+	/* Check everybody except 0, who stays behind to tend jiffies. */
+	on_each_cpu(check_unaligned_access_nonboot_cpu, bufs, 1);
+
+	/* Check core 0. */
+	smp_call_on_cpu(0, check_unaligned_access, bufs[0], true);
+
+	/* Setup hotplug callback for any new CPUs that come online. */
+	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
+				  riscv_online_cpu, NULL);
+
+out:
 	unaligned_emulation_finish();
+	for_each_cpu(cpu, cpu_online_mask) {
+		if (bufs[cpu])
+			__free_pages(bufs[cpu], MISALIGNED_BUFFER_ORDER);
+	}
+
+	kfree(bufs);
 	return 0;
 }
 
-arch_initcall(check_unaligned_access_boot_cpu);
+arch_initcall(check_unaligned_access_all_cpus);
 
 void riscv_user_isa_enable(void)
 {
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index d69c628c24f4..d162bf339beb 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -247,7 +247,6 @@ asmlinkage __visible void smp_callin(void)
 	riscv_ipi_enable();
 
 	numa_add_cpu(curr_cpuid);
-	check_unaligned_access(curr_cpuid);
 	set_cpu_online(curr_cpuid, 1);
 
 	if (has_vector()) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

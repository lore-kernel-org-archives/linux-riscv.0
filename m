Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B07C46CD4
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 17:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ztlpSB5Yk7O0HZBoQtE8d8Tl/x/+VwzalYgHyRVNys=; b=HTUaz4aQVNsh6Z
	OUxevlw0uTdQF0Gf5fN84cXaci+TLRrPU7L+RGT4054k7q5hbrEqRVkffbcOOsBUjaSBRsSVZ0iKv
	11stY2eIV6+ymk8iB5Dtj9lR69SceCOeKwRiD4RRZb+YcrroTaqJCJEFNTt73EzE3+gsxPXeUtGbY
	YC7aF3JfTx41gAyaX4FQXv5tUaCITIyvhXCqL9GwkvDJVMfNRC1+iOcvSBHaDO4IeTxgsY//5/AvE
	OJwJ+3UyR6YXW4Xv+jgPjYFdFVfb0xwN9AmdGCcTY6QSaYlRHa5/3MnBTl7n39DpGNw5jvkyC+t8D
	vQNasmXHXTXhiiQSdyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIXrN-00FDSE-1C;
	Wed, 27 Dec 2023 17:38:25 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIXrJ-00FDPK-0A
	for linux-riscv@lists.infradead.org;
	Wed, 27 Dec 2023 17:38:22 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1f5bd86ceb3so4101854fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Dec 2023 09:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703698698; x=1704303498; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YMlsfn7czPVsXwrmU+kv95pA8qnyqJLx1nukNUHIJyw=;
        b=Ye+CjmZiy2zTnyItQLMk1USVCwlpXJK69+pJr3O0Anu5haHzN/2g3Hhk9Q/TFqjXgq
         xTzTAZu3wSBdFZ40t0RAuqkkLPG2TslUXBQlP0J0VSXPIeNpov9w0Vw2umDkNXbUZ0gj
         OX6bQ8Sin49UVpxTWH2Xk8S5rekgs47319KmjD0UdB3/Qe4JsUAxMtgGa0UbWL+aRHmi
         sJlKG4bdydQCpIJlIeQ4lkCLCMRl73mHObXz4mGVH46omnUqG40OXYVKGaGcaTKsuXu2
         c67c+MDhlqHpissO43Y1EOlm3bwpOh9R3LGlrKA1pKPaKSrAMlrbUjin+jrnaOrXkN6L
         KL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703698698; x=1704303498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMlsfn7czPVsXwrmU+kv95pA8qnyqJLx1nukNUHIJyw=;
        b=DnmVz1guAUMdkSUs2Vg4agKvm27Y1X4phwBEHnLMqEugNzxN71+p7qaenw8O55uoJu
         J4pTpyTw6+lIOdPmCn1Il3VIku2PDTiMeHCUWOsQvPOlj2K7ay26PPtb/uxFxv6YVoMX
         s+g/evl3Qe3EO3ZzV/D4VazmnnJ3mxWLEmNyZWrOZQkN1qkB/IlGN3iFdO2rAFQu22VE
         ynGTSMONi8Yz5NshK5hhX9Lt/xbPseKhukmzPAc0FQQ2BIqQ4DHZOu+KOqDNSmG5wjoF
         YayLzkZfmwa+Dbz+chAOXcNREJJ53XXSimLu/eknaKK+9tLbLmGii/7OMv2eefyERUEb
         r/DA==
X-Gm-Message-State: AOJu0YwlhZbsMFfZXfzOH68wNNvL7CoNfyq1XzXICw90y1XZSgXFcFj4
	Eo2q/M4aU13K1csIjQNcmJZMmLhJteQN0Q==
X-Google-Smtp-Source: AGHT+IEIrmTuGZOJNDeXOpI5DFGqZulKKWwLyazfrOgAYCgNMHfgJ1Ew2aY/lLJoiaXBaUHq2w/fMw==
X-Received: by 2002:a05:6871:724:b0:204:302f:74cb with SMTP id f36-20020a056871072400b00204302f74cbmr11492877oap.24.1703698698069;
        Wed, 27 Dec 2023 09:38:18 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id rl15-20020a056871650f00b002049c207104sm1337173oab.27.2023.12.27.09.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 09:38:17 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 27 Dec 2023 09:38:01 -0800
Subject: [PATCH v14 2/5] riscv: Add static key for misaligned accesses
MIME-Version: 1.0
Message-Id: <20231227-optimize_checksum-v14-2-ddfd48016566@rivosinc.com>
References: <20231227-optimize_checksum-v14-0-ddfd48016566@rivosinc.com>
In-Reply-To: <20231227-optimize_checksum-v14-0-ddfd48016566@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, Xiao Wang <xiao.w.wang@intel.com>, 
 Evan Green <evan@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703698692; l=5478;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=D4IKaaj3vE+b0K5XN8QdVSXmK3dl6XnNZpqh6Lepfss=;
 b=wW1oSltYcPLm6WjHMbTJUzZDxQi942rfKCi7R0Jd24cRe7PpnWNp2kkXzDGS2uPhT+MHc6RqD
 cYQbMZT28P7Bxk85HOSEujEx+JNt2ZYDyHx8MaBRhCDsRybFl1WXekw
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_093821_089979_4C5B36C2 
X-CRM114-Status: GOOD (  19.49  )
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

Support static branches depending on the value of misaligned accesses.
This will be used by a later patch in the series. All online cpus must
be considered "fast" for this static branch to be flipped.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h |  2 +
 arch/riscv/kernel/cpufeature.c      | 89 +++++++++++++++++++++++++++++++++++--
 2 files changed, 87 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index a418c3112cd6..7b129e5e2f07 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -133,4 +133,6 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
+DECLARE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
+
 #endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b3785ffc1570..dfd716b93565 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -8,8 +8,10 @@
 
 #include <linux/acpi.h>
 #include <linux/bitmap.h>
+#include <linux/cpu.h>
 #include <linux/cpuhotplug.h>
 #include <linux/ctype.h>
+#include <linux/jump_label.h>
 #include <linux/log2.h>
 #include <linux/memory.h>
 #include <linux/module.h>
@@ -44,6 +46,8 @@ struct riscv_isainfo hart_isa[NR_CPUS];
 /* Performance information */
 DEFINE_PER_CPU(long, misaligned_access_speed);
 
+static cpumask_t fast_misaligned_access;
+
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
@@ -643,6 +647,16 @@ static int check_unaligned_access(void *param)
 		(speed == RISCV_HWPROBE_MISALIGNED_FAST) ? "fast" : "slow");
 
 	per_cpu(misaligned_access_speed, cpu) = speed;
+
+	/*
+	 * Set the value of fast_misaligned_access of a CPU. These operations
+	 * are atomic to avoid race conditions.
+	 */
+	if (speed == RISCV_HWPROBE_MISALIGNED_FAST)
+		cpumask_set_cpu(cpu, &fast_misaligned_access);
+	else
+		cpumask_clear_cpu(cpu, &fast_misaligned_access);
+
 	return 0;
 }
 
@@ -655,13 +669,70 @@ static void check_unaligned_access_nonboot_cpu(void *param)
 		check_unaligned_access(pages[cpu]);
 }
 
+DEFINE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
+
+static int exclude_set_unaligned_access_static_branches(int cpu)
+{
+	/*
+	 * Same as set_unaligned_access_static_branches, except excludes the
+	 * given CPU from the result. When a CPU is hotplugged into an offline
+	 * state, this function is called before the CPU is set to offline in
+	 * the cpumask, and thus the CPU needs to be explicitly excluded.
+	 */
+
+	cpumask_t online_fast_misaligned_access;
+
+	cpumask_and(&online_fast_misaligned_access, &fast_misaligned_access, cpu_online_mask);
+	cpumask_clear_cpu(cpu, &online_fast_misaligned_access);
+
+	if (cpumask_weight(&online_fast_misaligned_access) == (num_online_cpus() - 1))
+		static_branch_enable_cpuslocked(&fast_misaligned_access_speed_key);
+	else
+		static_branch_disable_cpuslocked(&fast_misaligned_access_speed_key);
+
+	return 0;
+}
+
+static int set_unaligned_access_static_branches(void)
+{
+	/*
+	 * This will be called after check_unaligned_access_all_cpus so the
+	 * result of unaligned access speed for all CPUs will be available.
+	 *
+	 * To avoid the number of online cpus changing between reading
+	 * cpu_online_mask and calling num_online_cpus, cpus_read_lock must be
+	 * held before calling this function.
+	 */
+	cpumask_t online_fast_misaligned_access;
+
+	cpumask_and(&online_fast_misaligned_access, &fast_misaligned_access, cpu_online_mask);
+
+	if (cpumask_weight(&online_fast_misaligned_access) == num_online_cpus())
+		static_branch_enable_cpuslocked(&fast_misaligned_access_speed_key);
+	else
+		static_branch_disable_cpuslocked(&fast_misaligned_access_speed_key);
+
+	return 0;
+}
+
+static int lock_and_set_unaligned_access_static_branch(void)
+{
+	cpus_read_lock();
+	set_unaligned_access_static_branches();
+	cpus_read_unlock();
+
+	return 0;
+}
+
+arch_initcall_sync(lock_and_set_unaligned_access_static_branch);
+
 static int riscv_online_cpu(unsigned int cpu)
 {
 	static struct page *buf;
 
 	/* We are already set since the last check */
 	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_UNKNOWN)
-		return 0;
+		goto exit;
 
 	buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
 	if (!buf) {
@@ -671,7 +742,14 @@ static int riscv_online_cpu(unsigned int cpu)
 
 	check_unaligned_access(buf);
 	__free_pages(buf, MISALIGNED_BUFFER_ORDER);
-	return 0;
+
+exit:
+	return set_unaligned_access_static_branches();
+}
+
+static int riscv_offline_cpu(unsigned int cpu)
+{
+	return exclude_set_unaligned_access_static_branches(cpu);
 }
 
 /* Measure unaligned access on all CPUs present at boot in parallel. */
@@ -705,9 +783,12 @@ static int check_unaligned_access_all_cpus(void)
 	/* Check core 0. */
 	smp_call_on_cpu(0, check_unaligned_access, bufs[0], true);
 
-	/* Setup hotplug callback for any new CPUs that come online. */
+	/*
+	 * Setup hotplug callbacks for any new CPUs that come online or go
+	 * offline.
+	 */
 	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
-				  riscv_online_cpu, NULL);
+				  riscv_online_cpu, riscv_offline_cpu);
 
 out:
 	unaligned_emulation_finish();

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

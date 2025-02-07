Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBC6C02199
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 16:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LjO4BtzknSixDUJbU4rWeG/58eA/58IkbB8Zjeux+GU=; b=mIhZQyp2xbMgRh
	F5xoOO4e1261Q2NFcYXLI9XjrIdDT/cXqQeh5M210sWjFnX+ZV0cu87GHDrCnYeTLn8hq4rWiwgrC
	jpN/MKQhZ/prvEEvI+EyBoLQxi8awGgrbHGhCAINRisfNko8W3nW+BkN8LB8M1e3/c1AKb4WQ0Ve6
	izQgexX49Xf9miJ8PZipGOMNkuuobzfJ2Wp/qvzMQycfBTQ6kotepkiBO6+WSNi6XeOkWGm084vnl
	vbsTc6BumcYPKhUZdgz+3yM/JAJKPyoBddKXJTyKmj9w0xOrDinyhbFLisYcadCNKQNxs8Iz//7Em
	aUsu+gDql5iB1lhoURDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR5y-0000000AFjK-15rB;
	Fri, 07 Feb 2025 16:20:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR5v-0000000AFgx-0Xyz
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 16:20:44 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38dc5764fc0so1249148f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 08:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945241; x=1739550041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZV9Bvxyy8oBnqpcvuhP90zRC/EQE6fM7xvGU71P15A=;
        b=YSAmFSsMSOu2qUvb8UgFf5xWweZDj4OZiUOPcQJ+afILFOOb7WvYJY/A8N24B+DRH0
         D4ofANbyBOU2UregLUS4KFqpPor08A715SD5jLsa4zetWrZxCrhfKG1X5PJq+JKPsilQ
         uW2KPhgcXhrBugmMr4dMzDdwCD2H+C6gm6I2QyF9ZpkWRR0+ILAGjsq1RZoW22uHgFlU
         4awXBrgp9fTv77JQu5kcLbTEBgjuOHze2sTB75AzPyFO4vcSqkQsDFR/3auJgA++Vhbb
         BuAhttbkY0b2b8WeigqdSwdSyKNHANZ9+NEaezJIGD6XLR5TPeKAhDlVQpfhuzNyjos+
         QJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945241; x=1739550041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZV9Bvxyy8oBnqpcvuhP90zRC/EQE6fM7xvGU71P15A=;
        b=d2cE1fjrs3jwpsD+ym3HI11Rr5quWGqxrOswEtots9nwXatQ6zcGlEqycuBZ8nc4AY
         6gGLMhoge4fpBOb6L2e+rKKnyhrsvUSpvReKITzxgl/OY9j+KIB3WotDZHfN66+ZEfpQ
         zeZmLA7Z9aG7VkMq8ML4L7iv/jiiW5EJrYqZd6jlcq2S3jPK0bs9ipEhKWeXh7g8D5nf
         O3x/KbB/Pyy9lrk3aEYksbpoAJnl/2zfj5zAkuophcMT2KvuPyYKZXpOGVuTbXsb+4P8
         Q9tv0HZTuRRnlF0dUFKNDlKJ3eKU0gQhZd3rFqCwPpn72VpLN4zb8JXrleuiQJpMTtHA
         YVqA==
X-Gm-Message-State: AOJu0YyHDPEaQqrkmdiCevj+O1VgzOFVKUgg3p/yfUh3iqVIedmyNlfg
	gs2qSWmPE6kmY8VH2cvDvyc3ggvqxYa6ubBPwNl3UZLyTAKRISDt6+zmpY8M9HrJ22doX65WPgM
	FdlY=
X-Gm-Gg: ASbGncvlLOS4XdugvM98B0ptGn9kTLd+hwz7+yvLVZjo/iGS6oSQ2KWZ15C4XojRl0Y
	uMJo/5FbDXi6oA3uMWc48MB7A4XIrJJHHzsx9nSCcVXnpyD1mQBzTmd4rPqcj94rHmck/DqSINC
	/yY+buX/6rAQshrbOi1NyV+xVS72MH+0CM8/NofptbNuenBjwGlfc9BJ/itSLh53jF1NaKkF4fM
	Xu2SUURlgYVEagp8EY99nD9ydIOK0BAgOAivH5wyEytZANzUuhxozOLG4I/uQ8+4Q4EMWr+fldD
	Z8LA/2fLe1Av9CA+6z1cpmXdrYC4G+YnFg2WlTwGUgr4X7NA/K25r5BdPQ==
X-Google-Smtp-Source: AGHT+IEOg6IG0kjsFKTvz6AcKlvyJUvdpYugEgGxtXEalKSZMbMjvynoGIK3ylHbblQH+CwYP9eGsQ==
X-Received: by 2002:a5d:588e:0:b0:38d:d274:4533 with SMTP id ffacd0b85a97d-38dd2745860mr6721f8f.55.1738945240610;
        Fri, 07 Feb 2025 08:20:40 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd1af32sm5010225f8f.16.2025.02.07.08.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:20:40 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 7/9] riscv: Prepare for unaligned access type table lookups
Date: Fri,  7 Feb 2025 17:19:47 +0100
Message-ID: <20250207161939.46139-18-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207161939.46139-11-ajones@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_082043_761933_CF9BA692 
X-CRM114-Status: GOOD (  16.92  )
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

Probing unaligned accesses on boot is time consuming. Provide a
function which will be used to look up the access type in a table
by id registers. Vendors which provide table entries can then skip
the probing.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 114 ++++++++++++---------
 1 file changed, 66 insertions(+), 48 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index d9d4ca1fadc7..f8497097e79d 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -130,6 +130,50 @@ static void __init check_unaligned_access_nonboot_cpu(void *param)
 		check_unaligned_access(pages[cpu]);
 }
 
+/* Measure unaligned access speed on all CPUs present at boot in parallel. */
+static void __init check_unaligned_access_speed_all_cpus(void)
+{
+	unsigned int cpu;
+	unsigned int cpu_count = num_possible_cpus();
+	struct page **bufs = kcalloc(cpu_count, sizeof(*bufs), GFP_KERNEL);
+
+	if (!bufs) {
+		pr_warn("Allocation failure, not measuring misaligned performance\n");
+		return;
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
+out:
+	for_each_cpu(cpu, cpu_online_mask) {
+		if (bufs[cpu])
+			__free_pages(bufs[cpu], MISALIGNED_BUFFER_ORDER);
+	}
+
+	kfree(bufs);
+}
+#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
+static void __init check_unaligned_access_speed_all_cpus(void)
+{
+}
+#endif
+
 DEFINE_STATIC_KEY_FALSE(fast_unaligned_access_speed_key);
 
 static void modify_unaligned_access_branches(cpumask_t *mask, int weight)
@@ -186,8 +230,17 @@ static int __init lock_and_set_unaligned_access_static_branch(void)
 
 arch_initcall_sync(lock_and_set_unaligned_access_static_branch);
 
+static bool check_unaligned_access_table(void)
+{
+	return false;
+}
+
 static int riscv_online_cpu(unsigned int cpu)
 {
+	if (check_unaligned_access_table())
+		goto exit;
+
+#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
 	static struct page *buf;
 
 	/* We are already set since the last check */
@@ -203,6 +256,7 @@ static int riscv_online_cpu(unsigned int cpu)
 
 	check_unaligned_access(buf);
 	__free_pages(buf, MISALIGNED_BUFFER_ORDER);
+#endif
 
 exit:
 	set_unaligned_access_static_branches();
@@ -217,50 +271,6 @@ static int riscv_offline_cpu(unsigned int cpu)
 	return 0;
 }
 
-/* Measure unaligned access speed on all CPUs present at boot in parallel. */
-static void __init check_unaligned_access_speed_all_cpus(void)
-{
-	unsigned int cpu;
-	unsigned int cpu_count = num_possible_cpus();
-	struct page **bufs = kcalloc(cpu_count, sizeof(*bufs), GFP_KERNEL);
-
-	if (!bufs) {
-		pr_warn("Allocation failure, not measuring misaligned performance\n");
-		return;
-	}
-
-	/*
-	 * Allocate separate buffers for each CPU so there's no fighting over
-	 * cache lines.
-	 */
-	for_each_cpu(cpu, cpu_online_mask) {
-		bufs[cpu] = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
-		if (!bufs[cpu]) {
-			pr_warn("Allocation failure, not measuring misaligned performance\n");
-			goto out;
-		}
-	}
-
-	/* Check everybody except 0, who stays behind to tend jiffies. */
-	on_each_cpu(check_unaligned_access_nonboot_cpu, bufs, 1);
-
-	/* Check core 0. */
-	smp_call_on_cpu(0, check_unaligned_access, bufs[0], true);
-
-out:
-	for_each_cpu(cpu, cpu_online_mask) {
-		if (bufs[cpu])
-			__free_pages(bufs[cpu], MISALIGNED_BUFFER_ORDER);
-	}
-
-	kfree(bufs);
-}
-#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
-static void __init check_unaligned_access_speed_all_cpus(void)
-{
-}
-#endif
-
 #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
 static void check_vector_unaligned_access(struct work_struct *work __always_unused)
 {
@@ -370,6 +380,11 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 }
 #endif
 
+static bool check_vector_unaligned_access_table(void)
+{
+	return false;
+}
+
 static int riscv_online_cpu_vec(unsigned int cpu)
 {
 	if (!has_vector()) {
@@ -377,6 +392,9 @@ static int riscv_online_cpu_vec(unsigned int cpu)
 		return 0;
 	}
 
+	if (check_vector_unaligned_access_table())
+		return 0;
+
 #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
 	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
 		return 0;
@@ -392,13 +410,15 @@ static int __init check_unaligned_access_all_cpus(void)
 {
 	int cpu;
 
-	if (!check_unaligned_access_emulated_all_cpus())
+	if (!check_unaligned_access_table() &&
+	    !check_unaligned_access_emulated_all_cpus())
 		check_unaligned_access_speed_all_cpus();
 
 	if (!has_vector()) {
 		for_each_online_cpu(cpu)
 			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
-	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
+	} else if (!check_vector_unaligned_access_table() &&
+		   !check_vector_unaligned_access_emulated_all_cpus() &&
 		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
 		kthread_run(vec_check_unaligned_access_speed_all_cpus,
 			    NULL, "vec_check_unaligned_access_speed_all_cpus");
@@ -408,10 +428,8 @@ static int __init check_unaligned_access_all_cpus(void)
 	 * Setup hotplug callbacks for any new CPUs that come online or go
 	 * offline.
 	 */
-#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
 	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
 				  riscv_online_cpu, riscv_offline_cpu);
-#endif
 	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
 				  riscv_online_cpu_vec, NULL);
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0D8C021B8
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 12:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qeTHQkL5UHRRRsp5bXVZpmWtPelOEQgsqPl/ld58ZrE=; b=wA4QBT5cqcOoXm
	wMntxBnEO5lScf8sJimGc9edo39dGfL3e4FaoRzz/opzM7n+FhdctbcOpGmvGgx07cU7RMjqfHZ73
	1IqFSlL6F40V6bhSomLJGAe3MJU29leBE+tiCUk0LjYg1+2okQclyvGk6Gi21EToJcvICGkWQj5Ou
	5msZGFyTie5FljsOWVljJxvKX+DHXS3aogANGoTR4N29Ubg5fV5uNssBwteZUv/w/z7W73ANAJ9b7
	M4caiYH3yVKLGxRWnw56bWEvLZt7ZwMfSHQQtEHigVNr/DdmEjVQuSq+uSWxuQjP8/VdAWY8wBEgh
	Ncp3iOkf+F3MFzWC9AHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR6n-00000004ZnH-0XxM;
	Tue, 04 Mar 2025 12:10:49 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQwj-00000004V9O-45Zu
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 12:00:27 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-390f69e71c8so2289773f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 04:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741089625; x=1741694425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsvuidqxLzlkQbg+w8AmHQXcpq7FTNK4bF6tx3heuhc=;
        b=OyexBKcyRq6FlewGAWy2JffLuPIPIr18Ngaktu0eGfvLAoWkhJ9kEREbq/G/VCInEF
         PbwwYriKOtIxa78iOG2eXBwHcyL9tQQstzSH1tNS5JUGXL/ZLV0mKGdzJLRntxRAxz0U
         FWaha+PhPTaXGbrAVe3qtEWPmCzPHZAlXeXba1RpfH59XGdcaW4hBejowI98PP3GVh5A
         ygimVqQDiJpvIBshFAGApPkeBChZK2AMZx6/jq1MEV9VKhPcmbKI8rOrI5JM7uJcoLfc
         Aii9a0OoSsv02MrpihdtgsOOsTun+VZym1vJSojINfpOzh+Yels7gTzRr6ii6hddNDa0
         fHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089625; x=1741694425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GsvuidqxLzlkQbg+w8AmHQXcpq7FTNK4bF6tx3heuhc=;
        b=hNyn6Iibe/cmAm9K6caFeJyIOJ4RykEtOdkqvjk7Ypm8/xcwzaN/7T//wY+oBPrGVs
         Z9MJM5/6rA2gIWpmqCpSMOnhN+02JTVW6+JZabhPiOuIzXQ3Vw2hqaiXB9wDfwPWy4JY
         8UTD9NFo1LyQMyHB5HO17bS+ZcigLh0tgZwL459/ouBQScVXPoyni+0/MQNjuMCdn73B
         /vvu6BtJypieeXwo7wlC/sf6p9y9uIdZa8sXR7wd8KgeTdP+omkLOSDiNqu1HCmfL0fj
         eKWXhLXbpCCUCJuQL2cvLZ+Y4Yo8VfLHC0c77UqR6M7isgQ8k3RNy5+O5xdf0yZte7DA
         vjgQ==
X-Gm-Message-State: AOJu0YxYq0a+k3/fQuSuPodDwhlk/0BFXEcCxOdSC6Suurkd/6esQ1xc
	emWNdJhG4Y/k89wj9+FUaNefOZBWFUm4E+Ceg06fagXdsQayj23M1dmBJ6YXGNN1HxGJ+k9tyDL
	B
X-Gm-Gg: ASbGncsSX3CAMj03vy0MnDZjxEd74hiW3/SSW6og/UzvT2dLI9xhHPBQwIAGTPeE5kL
	7Tmcs3fNMP1OBEEBdCz7FnSpi5dnHSeL7AbYPxheWFEAMfaaPyN7Q9kaie3w28q5oUUr/ykSv4h
	Wd43KYlOTNqBAwZmv0nBLSpd1YiSTtQggmuX9zsB/mH561dSnZuNS+bI1Yer7RpNueDUmgrMlz9
	xL3XQtcryPOBvC0E+nHGS3aHY78VOkqvix44Pi2Yz/GGsFAMuZBa+yIOIkKVeUCUK8Pckso7Ikf
	Oqzzz8h/vgwwJT0OvkkPWQAlw31uc4Oe
X-Google-Smtp-Source: AGHT+IGQ5X8LL0DZ3UPHsnfOapJsPrretEHDDQzUDGpCH+nIE/GuITrQTn3tEhqjhrUytGCLIAwsgA==
X-Received: by 2002:a05:6000:144a:b0:391:bc8:564a with SMTP id ffacd0b85a97d-3911561aaeemr2394550f8f.22.1741089624562;
        Tue, 04 Mar 2025 04:00:24 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844ac6sm17312277f8f.71.2025.03.04.04.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:00:24 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net
Subject: [PATCH v3 7/8] riscv: Add parameter for skipping access speed tests
Date: Tue,  4 Mar 2025 13:00:22 +0100
Message-ID: <20250304120014.143628-17-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304120014.143628-10-ajones@ventanamicro.com>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_040026_064620_82689B5F 
X-CRM114-Status: GOOD (  20.98  )
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

Allow skipping scalar and vector unaligned access speed tests. This
is useful for testing alternative code paths and to skip the tests in
environments where they run too slowly. All CPUs must have the same
unaligned access speed.

The code movement is because we now need the scalar cpu hotplug
callback to always run, so we need to bring it and its supporting
functions out of CONFIG_RISCV_PROBE_UNALIGNED_ACCESS.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 187 +++++++++++++--------
 1 file changed, 121 insertions(+), 66 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index d9d4ca1fadc7..18e334549544 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -24,8 +24,12 @@
 DEFINE_PER_CPU(long, misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
 DEFINE_PER_CPU(long, vector_misaligned_access) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
 
-#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
+static long unaligned_scalar_speed_param = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
+static long unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN;
+
 static cpumask_t fast_misaligned_access;
+
+#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
 static int check_unaligned_access(void *param)
 {
 	int cpu = smp_processor_id();
@@ -130,6 +134,50 @@ static void __init check_unaligned_access_nonboot_cpu(void *param)
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
@@ -188,21 +236,29 @@ arch_initcall_sync(lock_and_set_unaligned_access_static_branch);
 
 static int riscv_online_cpu(unsigned int cpu)
 {
-	static struct page *buf;
-
 	/* We are already set since the last check */
-	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
+	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
+		goto exit;
+	} else if (unaligned_scalar_speed_param != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
+		per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
 		goto exit;
-
-	check_unaligned_access_emulated(NULL);
-	buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
-	if (!buf) {
-		pr_warn("Allocation failure, not measuring misaligned performance\n");
-		return -ENOMEM;
 	}
 
-	check_unaligned_access(buf);
-	__free_pages(buf, MISALIGNED_BUFFER_ORDER);
+#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
+	{
+		static struct page *buf;
+
+		check_unaligned_access_emulated(NULL);
+		buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
+		if (!buf) {
+			pr_warn("Allocation failure, not measuring misaligned performance\n");
+			return -ENOMEM;
+		}
+
+		check_unaligned_access(buf);
+		__free_pages(buf, MISALIGNED_BUFFER_ORDER);
+	}
+#endif
 
 exit:
 	set_unaligned_access_static_branches();
@@ -217,50 +273,6 @@ static int riscv_offline_cpu(unsigned int cpu)
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
@@ -372,8 +384,8 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 
 static int riscv_online_cpu_vec(unsigned int cpu)
 {
-	if (!has_vector()) {
-		per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
+	if (unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN) {
+		per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
 		return 0;
 	}
 
@@ -388,30 +400,73 @@ static int riscv_online_cpu_vec(unsigned int cpu)
 	return 0;
 }
 
+static const char * const speed_str[] __initconst = { NULL, NULL, "slow", "fast", "unsupported" };
+
+static int __init set_unaligned_scalar_speed_param(char *str)
+{
+	if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW]))
+		unaligned_scalar_speed_param = RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW;
+	else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_SCALAR_FAST]))
+		unaligned_scalar_speed_param = RISCV_HWPROBE_MISALIGNED_SCALAR_FAST;
+	else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED]))
+		unaligned_scalar_speed_param = RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED;
+	else
+		return -EINVAL;
+
+	return 1;
+}
+__setup("unaligned_scalar_speed=", set_unaligned_scalar_speed_param);
+
+static int __init set_unaligned_vector_speed_param(char *str)
+{
+	if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW]))
+		unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW;
+	else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_VECTOR_FAST]))
+		unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_FAST;
+	else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED]))
+		unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
+	else
+		return -EINVAL;
+
+	return 1;
+}
+__setup("unaligned_vector_speed=", set_unaligned_vector_speed_param);
+
 static int __init check_unaligned_access_all_cpus(void)
 {
 	int cpu;
 
-	if (!check_unaligned_access_emulated_all_cpus())
+	if (unaligned_scalar_speed_param == RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN &&
+	    !check_unaligned_access_emulated_all_cpus()) {
 		check_unaligned_access_speed_all_cpus();
-
-	if (!has_vector()) {
+	} else {
+		pr_info("scalar unaligned access speed set to '%s' by command line\n",
+			speed_str[unaligned_scalar_speed_param]);
 		for_each_online_cpu(cpu)
-			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
-	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
-		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
+			per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
+	}
+
+	if (!has_vector())
+		unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
+
+	if (unaligned_vector_speed_param == RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN &&
+	    !check_vector_unaligned_access_emulated_all_cpus() &&
+	    IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
 		kthread_run(vec_check_unaligned_access_speed_all_cpus,
 			    NULL, "vec_check_unaligned_access_speed_all_cpus");
+	} else {
+		pr_info("vector unaligned access speed set to '%s' by command line\n",
+			speed_str[unaligned_vector_speed_param]);
+		for_each_online_cpu(cpu)
+			per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
 	}
 
 	/*
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

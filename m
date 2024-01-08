Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A197C47077
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 23:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SACq30mF0wM9vYEiPUx9QuOM0aGi7XdoeoybqE/HoA=; b=QTrddXJkd6fG6A
	LikNZM5VtGLD2npEqSIOEE6CpPBkK+JlOikGTc/SkJxmmvNRglRZXY7i1yiYVjHCUtQW7uaXnHXOd
	v0OXni4bJFopn9bMswHQMXnv0ZwWmcR7n2oUZDZMW3PDO9AdxuyotwCFlYV2VNxoSHjUv1SqJctaO
	x1hlzvChfile1UwTLTVTAGvnY4CywJt2wJMXuZuBDSn6lqh1IJbSEm70imMtMY770Q+F3VWHKqnjS
	mmC9pdgt4/+g36/zjC1H51faPNG7OKnlqYcyfG95Y2GRRo4KsHAiv7EefYCmvzGWUW8GwM4PDEUzL
	72ql5yMgiU3/dECM2DYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMzUs-006U9O-0c;
	Mon, 08 Jan 2024 23:57:34 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMzUp-006U8F-0R
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 23:57:32 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-205cdc4b2b8so1736868fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 15:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704758250; x=1705363050; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjiIlU3g58hIFUKwUoiVaj6BvYCOkDOQIpxSoofLMPg=;
        b=WlnITvru34Mylm1iuer+9zQdDoAlErtaOr9y5r+kmLAebqyxtVGxZa/7yGPTfUe18S
         Lo+WjY0hl6wpIowh4YhffPx6fMaOi3oFnmsmSrUiYtIKH3yQw+LcncEm0qlV0F0tGfKD
         dHYwB0T/pGvj0l4Q7MWYQhFrxlSSOkk+ho6i3Jum0K91qCDxUtYvXdX2r27BDmHmbfcr
         sJMTfUjfdWwPDeDzf0ZMzggfEsu2Js6D6ixXfPKZb5FgUrBJKXKUMCE6G66yvt99M7WR
         He0aVFuc2ThQkagP/vOlzFzmcTXaYyYA82m8adBqBHZoubc31EJFynKnxSSv62btC6gX
         p66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704758250; x=1705363050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjiIlU3g58hIFUKwUoiVaj6BvYCOkDOQIpxSoofLMPg=;
        b=Pjb+vy/bRohswMIK/UxBLrbWUIOGKd/qfCfQcqdFSiEvKHR8/KfuhJoZteJbW5bqsd
         JGELt1eeikriNA1X6an/mk7DgeyRHnmoeXg6E5+OE7yhhPFcznRq6fZ6wWCq4OWSydPO
         rMCMLPkGMzu0WDBJtj1zo23aXvvKQRuKiuKMMzMCLau3pnE4nY26V2tYR3m7lO3mgFUm
         9ET5I3Gm3IC+rwog4e/q5MCoEFNZMd19mVf+0CVSPklMk2hZhe7lU9lg5DNsU3aH8N+q
         V7s3XlsN1q9A+0USa0Ghf6nLnzc1w1JqKU0kI890E9bOuSki0jc8lHkErRkBLQ5Poe/N
         dV8g==
X-Gm-Message-State: AOJu0YzSP+vFYG+D7EkYUaR+dHwiafPaAHmIcyR0zAXDbOmoh6/rJBuE
	4UXlMhcc3AmG6VsmnV7cHOTzmzhC3+Z13A==
X-Google-Smtp-Source: AGHT+IFUZGGdDLQC9cX5fNhg+jYh8WmCCePQv1988nheWHfdZIW5kILBL7bdjKgDZdoAzGSjYv26zQ==
X-Received: by 2002:a05:6871:4d2:b0:1fb:75b:131e with SMTP id n18-20020a05687104d200b001fb075b131emr5963512oai.112.1704758250070;
        Mon, 08 Jan 2024 15:57:30 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ti5-20020a056871890500b002043b415eaasm206961oab.29.2024.01.08.15.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 15:57:29 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 08 Jan 2024 15:57:03 -0800
Subject: [PATCH v15 2/5] riscv: Add static key for misaligned accesses
MIME-Version: 1.0
Message-Id: <20240108-optimize_checksum-v15-2-1c50de5f2167@rivosinc.com>
References: <20240108-optimize_checksum-v15-0-1c50de5f2167@rivosinc.com>
In-Reply-To: <20240108-optimize_checksum-v15-0-1c50de5f2167@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704758245; l=5351;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=8KBYgXHVWJbA5ZwBBOd3JMcReJGd2wOakcAaFByUquI=;
 b=bV66gCXlvdm2nItIplQ34m9bU1Txqz+B31KHO1dpux6boBZl96Sh7wpTptRGfxjlpIikdW4P3
 reSthiW79g7CfgE2jDl01ddjA6jiu4k8ztHlEa+JEg/aW7UgYUlMbQH
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_155731_174048_07897E8C 
X-CRM114-Status: GOOD (  20.08  )
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
This will be used by a later patch in the series. At any point in time,
this static branch will only be enabled if all online CPUs are
considered "fast".

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h |  2 +
 arch/riscv/kernel/cpufeature.c      | 90 +++++++++++++++++++++++++++++++++++--
 2 files changed, 89 insertions(+), 3 deletions(-)

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
index b3785ffc1570..b62baeb504d8 100644
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
 
@@ -655,13 +669,69 @@ static void check_unaligned_access_nonboot_cpu(void *param)
 		check_unaligned_access(pages[cpu]);
 }
 
+DEFINE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
+
+static void modify_unaligned_access_branches(cpumask_t *mask, int weight)
+{
+	if (cpumask_weight(mask) == weight)
+		static_branch_enable_cpuslocked(&fast_misaligned_access_speed_key);
+	else
+		static_branch_disable_cpuslocked(&fast_misaligned_access_speed_key);
+}
+
+static void set_unaligned_access_static_branches_except_cpu(int cpu)
+{
+	/*
+	 * Same as set_unaligned_access_static_branches, except excludes the
+	 * given CPU from the result. When a CPU is hotplugged into an offline
+	 * state, this function is called before the CPU is set to offline in
+	 * the cpumask, and thus the CPU needs to be explicitly excluded.
+	 */
+
+	cpumask_t fast_except_me;
+
+	cpumask_and(&fast_except_me, &fast_misaligned_access, cpu_online_mask);
+	cpumask_clear_cpu(cpu, &fast_except_me);
+
+	modify_unaligned_access_branches(&fast_except_me, num_online_cpus() - 1);
+}
+
+static void set_unaligned_access_static_branches(void)
+{
+	/*
+	 * This will be called after check_unaligned_access_all_cpus so the
+	 * result of unaligned access speed for all CPUs will be available.
+	 *
+	 * To avoid the number of online cpus changing between reading
+	 * cpu_online_mask and calling num_online_cpus, cpus_read_lock must be
+	 * held before calling this function.
+	 */
+
+	cpumask_t fast_and_online;
+
+	cpumask_and(&fast_and_online, &fast_misaligned_access, cpu_online_mask);
+
+	modify_unaligned_access_branches(&fast_and_online, num_online_cpus());
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
@@ -671,6 +741,17 @@ static int riscv_online_cpu(unsigned int cpu)
 
 	check_unaligned_access(buf);
 	__free_pages(buf, MISALIGNED_BUFFER_ORDER);
+
+exit:
+	set_unaligned_access_static_branches();
+
+	return 0;
+}
+
+static int riscv_offline_cpu(unsigned int cpu)
+{
+	set_unaligned_access_static_branches_except_cpu(cpu);
+
 	return 0;
 }
 
@@ -705,9 +786,12 @@ static int check_unaligned_access_all_cpus(void)
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

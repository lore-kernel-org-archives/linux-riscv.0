Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B15CD98E6
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 03:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9bgqREEcnfdt6OtnSlSzp5xRv5m5TNkvnG0nsH9/SA=; b=cU9ITLkCMG0fr3
	3sNoqmaAw5WZHEQOWDqLFK5TexizMYOorNeSmU/EEQtXwwH5s5ei5TA9uMRpQKeHmJMxcwOpj2uRO
	RmBKH85HcjEKQvIM+75rAOsMW7Uka6W75ABBfX+pR4WzkeGeDO+Iq88CWJSKgjbnH+6PUGMe47DC2
	jjXu7ZYXcqYFu4uOBptj7R8ZCdWAGQVHT8+YwdiqOQeBfltvdF0HM7MHJMEdPj5wxW2CLRvvMHOdY
	AKe29amUhjSgXSuP7uXsud0kgNWH3k5bv8WCQTHgvicWpH2MRm1P7Kxijx4Kg5eqvyqeScEfI2fOR
	SuqlM345GbCuD2OBDcEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZh6u-0000000GYyP-2isg;
	Wed, 17 Jun 2026 03:38:40 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZh6s-0000000GYxZ-2uxL
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jun 2026 03:38:40 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781667515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ECbGHWtQ+jrzHJRs4USa5UszLEQs+i/gsj0NHZu3sqc=;
	b=qS885WPEJYfEIVB87uVsb2/mCKzMsYdlADE/ymT2IShEbcDn2tpcYm0KZERQlYOKqvD49/
	sw7SIUfCEfKKKYx+clC7SgC+rZd60cwRe3TcZfcJAtg8gVvoAFUJrQzSg8H5hLjQwM4XIv
	GTOPY574yORpm3RH0+CH4iZJQQtOsBa+HqTkMd8OxErdn1qMIGswHa0NnvSN8glkLg0zpe
	uKpwJ+FOB+u52EyCSQvoH0xRLaBrwynwI+m2L5fiwqFMXqOutCu3GubEgnY2DDZc+MRXvg
	HypApqDw8IqAdEfpHxBNneaTyI14qdV5bbd8LV6KW7+siNaJYZVrKoab9aL4/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781667515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ECbGHWtQ+jrzHJRs4USa5UszLEQs+i/gsj0NHZu3sqc=;
	b=P3KdvkCETGCEdPuE/2MX5ipRPf2qck+mhr2XAqJLzCfybFn97nnATBrc5vnHbsRHZO/KIw
	HVPU8jJ+Jk4W1vAA==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Jingwei Wang <wangjingwei@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] riscv: unaligned: stop using kthread for check_vector_unaligned_access()
Date: Wed, 17 Jun 2026 05:38:24 +0200
Message-ID: <1c378963f27c5960e8a57c50b8b444d30954cb54.1781666867.git.namcao@linutronix.de>
In-Reply-To: <cover.1781666867.git.namcao@linutronix.de>
References: <cover.1781666867.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_203838_881922_DC05BAEA 
X-CRM114-Status: GOOD (  13.31  )
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

A kthread is used to run check_vector_unaligned_access() to optimize boot
time, allowing the kernel to continue booting without waiting for the
unaligned vector speed probe to finish.

However, this asynchronous approach introduces several complications.
First, the kthread may not complete before a user reads vDSO data,
resulting in incorrect values. This was previously addressed by
commit 5d15d2ad36b0 ("riscv: hwprobe: Fix stale vDSO data for
late-initialized keys at boot"), which added complex synchronization
between the kthread and vDSO reads.

Second, it was discovered that the kthread may not finish before
vec_check_unaligned_access_speed_all_cpus() (marked with __init) is freed,
triggering a page fault.

These issues raise the question of whether the kthread is worth the added
complexity. A past boot time regression report was actually unrelated to
synchronous probing; it was caused by the probe running serially. Since
switching to a parallel probe, no further complaints have been made.
Furthermore, the unaligned scalar access speed probe takes the same amount
of time, runs synchronously, and has caused no issues.

Testing shows no noticeable boot time slowdown when running the vector
probe synchronously (0.464474s with kthread vs. 0.457991s without).

Remove the kthread usage and run the probe synchronously. This simplifies
the boot flow and allows for the revert of commit 5d15d2ad36b0 ("riscv:
hwprobe: Fix stale vDSO data for late-initialized keys at boot")

Reported-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Closes: https://lore.kernel.org/linux-riscv/20260612-vec_unaligned_drop_init-v1-1-df969210ae34@oss.tenstorrent.com/
Fixes: a00e022be531 ("riscv: Annotate unaligned access init functions")
Cc: <stable@vger.kernel.org>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/unaligned_access_speed.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index bb57eb5d19df..6e35bca568de 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -6,7 +6,6 @@
 #include <linux/cpu.h>
 #include <linux/cpumask.h>
 #include <linux/jump_label.h>
-#include <linux/kthread.h>
 #include <linux/mm.h>
 #include <linux/smp.h>
 #include <linux/types.h>
@@ -288,18 +287,9 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 	__free_pages(page, MISALIGNED_BUFFER_ORDER);
 }
 
-/* Measure unaligned access speed on all CPUs present at boot in parallel. */
-static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
-{
-	schedule_on_each_cpu(check_vector_unaligned_access);
-	riscv_hwprobe_complete_async_probe();
-
-	return 0;
-}
 #else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
-static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
+static void check_vector_unaligned_access(struct work_struct *work __always_unused)
 {
-	return 0;
 }
 #endif
 
@@ -387,12 +377,7 @@ static int __init check_unaligned_access_all_cpus(void)
 			per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
 	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
 		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
-		riscv_hwprobe_register_async_probe();
-		if (IS_ERR(kthread_run(vec_check_unaligned_access_speed_all_cpus,
-				       NULL, "vec_check_unaligned_access_speed_all_cpus"))) {
-			pr_warn("Failed to create vec_unalign_check kthread\n");
-			riscv_hwprobe_complete_async_probe();
-		}
+		schedule_on_each_cpu(check_vector_unaligned_access);
 	}
 
 	/*
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

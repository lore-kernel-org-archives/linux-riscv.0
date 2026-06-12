Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2231CD98CE
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 21:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4AdkanjZpI4IUUxEA0gyosDHzfB7GMrBCWLNYPQ/cdM=; b=ZdiAgz/f6fwHHO
	OYhmUsi/T2yEeiLaskgdjt1xXYYhX75f1E20qDbKyAaGOQohWYlQdvk5UM1k84iry/3A1rn4IZHEC
	mfFrjJg/2FSLDVZxFepcR7Ed3i+v6Lj10GuPbtqEJBX1pRCZAiQUjUXWjimlp4EWT4f0YSmY0fhre
	fJ2OmRWGVeIs/RWxrD3N1oA4DKZhLBIrCOOHXlbJFEI3PlMTwB0sIexQuEuQkQ9+IxTLAYnj3J/D+
	4+G+oAKzWjcI7Hhu8icKq9UjyxVpC2EJTvaPXV7xhr0TsE1+MeQUV94iooeeLHeMRKTe1vUDh4xl9
	eGtW8ec5OwLjX4z7O1Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9MT-0000000BbYK-1oA8;
	Fri, 12 Jun 2026 21:24:21 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9MQ-0000000BbXi-052M
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jun 2026 21:24:19 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781299439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t15DazWXhlF+lF3d0rhesPGkVLJ1z99gUfPz5CiypHI=;
	b=2bHFOAtOByJznUzt46JmbBLXxmlfb1MSRV9D+/w5RnLrqkN7kYd41IwtsZvsv+kXgN4S/h
	SDhYUt/81T5ew4cR4/+tGpFxkTu4Jh+uz5rjpCgX7Wrl4FGsSUSmt0SvgwWrXWWw6Fsql7
	Xy4hMUYw3vLfk7/3nWZlCtYAw9B2rMoHXukMxGVTUqaez9UBKbtL3hS5Ls2MZTwNl/Uk0V
	0TEMjHKJ/zckWwHXPYaNm0flolCAI/33bwIPOVkskvfPTi7NfVXyjZ6x/yhsY9Rmcm9hcH
	MBQbzpeSckfCOGmSPV7uJ9MVH5grUkZtF7mO43Kij/RA9xSNyUWa36NhZH/Pig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781299439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t15DazWXhlF+lF3d0rhesPGkVLJ1z99gUfPz5CiypHI=;
	b=8eaR3eEOYZ3HTSstCGbh15hpuIfiLc+FBybfbOT3NY7jobVVhDpCOT6D1vxYcUiev9V1m9
	f8Ut+OpxJabhmxCQ==
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones
 <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 andrew.jones@oss.qualcomm.com, ganboing@gmail.com, Anirudh Srinivasan
 <asrinivasan@oss.tenstorrent.com>
Subject: Re: [PATCH] riscv: drop __init from
 vec_check_unaligned_access_speed_all_cpus
In-Reply-To: <20260612-vec_unaligned_drop_init-v1-1-df969210ae34@oss.tenstorrent.com>
References: <20260612-vec_unaligned_drop_init-v1-1-df969210ae34@oss.tenstorrent.com>
Date: Fri, 12 Jun 2026 23:23:57 +0200
Message-ID: <87ecibwiz6.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_142418_233285_2A6990CE 
X-CRM114-Status: GOOD (  26.36  )
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

Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com> writes:
> This function runs within a kthread and need not necessarily finish
> before system finishes boot and free_initmem() unmaps the .init.text
> section. This function makes calls to SBI for probing unaligned access
> speed, and if this is slow for some reason (say some debug prints were
> added to SBI), the kthread can still be running at this point and result
> in an instruction page fault when trying to fetch from the freed region.
...
> Drop __init from its signature so that this doesn't happen.

That should work.

But we should really take a step back and reconsider whether running the
vector access speed probe in a kthread is really a good idea.

We have a problem in the past that the kthread may not complete before
user reads vdso, and user gets incorrect values. That was addressed by
5d15d2ad36b0 ("riscv: hwprobe: Fix stale vDSO data for late-initialized
keys at boot") which complicates things.

And now you discover another issue.

The motivation for using a kthread is to avoid boot time slow down. But
this has been bothering me for quite a while now, because I am not sure
if using kthread really speeds things up. Sooner or later, the kthread
has to run. If it runs before the kernel is done booting, then the boot
is even slower due to overhead of the kthread. If it runs after the
kernel finishes booting, then we run into these kinds of
headache. Unfortunately I do not have a riscv cpu with vector to confirm
my suspicion.

Furthermore, the vector access speed probe takes the same amount of time
as scalar access speed probe. The scalar one is done without any
kthread, and no one ever complained about boot time issue (well, someone
did complain but that has nothing to do with kthread. Their 64-core (?)
system is slower because the probe was done serially, and we switched to
parallel probe and it was fine).

So I think we should really get rid of that kthread entirely, the
headache is not worth. That also allows reverting 5d15d2ad36b0 ("riscv:
hwprobe: Fix stale vDSO data for late-initialized keys at boot"), making
the code simplier.

Below is a patch that has only been tested with qemu. It reverts the
mentioned commit and removes the kthread.

diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 8c572a464719..2f278c395af9 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -42,11 +42,4 @@ static inline bool riscv_hwprobe_pair_cmp(struct riscv_hwprobe *pair,
 	return pair->value == other_pair->value;
 }
 
-#ifdef CONFIG_MMU
-void riscv_hwprobe_register_async_probe(void);
-void riscv_hwprobe_complete_async_probe(void);
-#else
-static inline void riscv_hwprobe_register_async_probe(void) {}
-static inline void riscv_hwprobe_complete_async_probe(void) {}
-#endif
 #endif
diff --git a/arch/riscv/include/asm/vdso/arch_data.h b/arch/riscv/include/asm/vdso/arch_data.h
index 88b37af55175..da57a3786f7a 100644
--- a/arch/riscv/include/asm/vdso/arch_data.h
+++ b/arch/riscv/include/asm/vdso/arch_data.h
@@ -12,12 +12,6 @@ struct vdso_arch_data {
 
 	/* Boolean indicating all CPUs have the same static hwprobe values. */
 	__u8 homogeneous_cpus;
-
-	/*
-	 * A gate to check and see if the hwprobe data is actually ready, as
-	 * probing is deferred to avoid boot slowdowns.
-	 */
-	__u8 ready;
 };
 
 #endif /* __RISCV_ASM_VDSO_ARCH_DATA_H */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 0f701ace3bb9..f3ed4fd396fb 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -5,9 +5,6 @@
  * more details.
  */
 #include <linux/syscalls.h>
-#include <linux/completion.h>
-#include <linux/atomic.h>
-#include <linux/once.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
@@ -470,32 +467,28 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
 	return 0;
 }
 
-#ifdef CONFIG_MMU
-
-static DECLARE_COMPLETION(boot_probes_done);
-static atomic_t pending_boot_probes = ATOMIC_INIT(1);
-
-void riscv_hwprobe_register_async_probe(void)
+static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
+			    size_t pair_count, size_t cpusetsize,
+			    unsigned long __user *cpus_user,
+			    unsigned int flags)
 {
-	atomic_inc(&pending_boot_probes);
-}
+	if (flags & RISCV_HWPROBE_WHICH_CPUS)
+		return hwprobe_get_cpus(pairs, pair_count, cpusetsize,
+					cpus_user, flags);
 
-void riscv_hwprobe_complete_async_probe(void)
-{
-	if (atomic_dec_and_test(&pending_boot_probes))
-		complete(&boot_probes_done);
+	return hwprobe_get_values(pairs, pair_count, cpusetsize,
+				  cpus_user, flags);
 }
 
-static int complete_hwprobe_vdso_data(void)
+#ifdef CONFIG_MMU
+
+static int __init init_hwprobe_vdso_data(void)
 {
 	struct vdso_arch_data *avd = vdso_k_arch_data;
 	u64 id_bitsmash = 0;
 	struct riscv_hwprobe pair;
 	int key;
 
-	if (unlikely(!atomic_dec_and_test(&pending_boot_probes)))
-		wait_for_completion(&boot_probes_done);
-
 	/*
 	 * Initialize vDSO data with the answers for the "all CPUs" case, to
 	 * save a syscall in the common case.
@@ -523,52 +516,13 @@ static int complete_hwprobe_vdso_data(void)
 	 * vDSO should defer to the kernel for exotic cpu masks.
 	 */
 	avd->homogeneous_cpus = id_bitsmash != 0 && id_bitsmash != -1;
-
-	/*
-	 * Make sure all the VDSO values are visible before we look at them.
-	 * This pairs with the implicit "no speculativly visible accesses"
-	 * barrier in the VDSO hwprobe code.
-	 */
-	smp_wmb();
-	avd->ready = true;
-	return 0;
-}
-
-static int __init init_hwprobe_vdso_data(void)
-{
-	struct vdso_arch_data *avd = vdso_k_arch_data;
-
-	/*
-	 * Prevent the vDSO cached values from being used, as they're not ready
-	 * yet.
-	 */
-	avd->ready = false;
 	return 0;
 }
 
 arch_initcall_sync(init_hwprobe_vdso_data);
 
-#else
-
-static int complete_hwprobe_vdso_data(void) { return 0; }
-
 #endif /* CONFIG_MMU */
 
-static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
-			    size_t pair_count, size_t cpusetsize,
-			    unsigned long __user *cpus_user,
-			    unsigned int flags)
-{
-	DO_ONCE_SLEEPABLE(complete_hwprobe_vdso_data);
-
-	if (flags & RISCV_HWPROBE_WHICH_CPUS)
-		return hwprobe_get_cpus(pairs, pair_count, cpusetsize,
-					cpus_user, flags);
-
-	return hwprobe_get_values(pairs, pair_count, cpusetsize,
-				cpus_user, flags);
-}
-
 SYSCALL_DEFINE5(riscv_hwprobe, struct riscv_hwprobe __user *, pairs,
 		size_t, pair_count, size_t, cpusetsize, unsigned long __user *,
 		cpus, unsigned int, flags)
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 70b5e6927620..6a725eee5acd 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -375,19 +375,6 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
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
-#else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
-static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
-{
-	return 0;
-}
 #endif
 
 static int riscv_online_cpu_vec(unsigned int cpu)
@@ -474,12 +461,7 @@ static int __init check_unaligned_access_all_cpus(void)
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
diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
index 8f45500d0a6e..2ddeba6c68dd 100644
--- a/arch/riscv/kernel/vdso/hwprobe.c
+++ b/arch/riscv/kernel/vdso/hwprobe.c
@@ -27,7 +27,7 @@ static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
 	 * homogeneous, then this function can handle requests for arbitrary
 	 * masks.
 	 */
-	if (flags != 0 || (!all_cpus && !avd->homogeneous_cpus) || unlikely(!avd->ready))
+	if ((flags != 0) || (!all_cpus && !avd->homogeneous_cpus))
 		return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
 
 	/* This is something we can handle, fill out the pairs. */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

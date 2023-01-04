Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB432C4708D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 18:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hso0P+eZG/wikSSLnA6Etaabj1uCjx6zJ1KW1YMh+Co=; b=252O3pQ715Lk1u
	gxzwiX2MJCUN9fQZVz2k19kJXrWDhkm8gZJah7PA7CCtHfC396XYpFwxNIxc17xDPq0jEpyzrWfUZ
	hatO4aC7t+uzWEidSnipnXVGBVg97xzp4o9t0IJ5fUGSjuOBFfTrxFNJugSEbFyJ+LIHfQXjtAkEu
	vOYtEdMLY3qb87d/VoPfT3y+hCBOiwKQ4rpLHJsM0M3KE/9/WJ+YgUNNjBLmbWwswe+h8Zac1hW/T
	X7JLbRv2CiumkCmtNKABzb7y931/FOB1RTPGT5xwqgrjX8Y0bUtgItDjUqUkMvv27r0Fm2pkNcEMS
	2WNsTNdTJH6xOLxgBgzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD8Zh-00AyUb-4C; Wed, 04 Jan 2023 18:33:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD8YW-00Axcm-Hb; Wed, 04 Jan 2023 18:32:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 104691063;
	Wed,  4 Jan 2023 10:32:45 -0800 (PST)
Received: from pierre123.arm.com (unknown [10.57.44.105])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0DA793F663;
	Wed,  4 Jan 2023 10:31:59 -0800 (PST)
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Pierre Gondois <pierre.gondois@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Gavin Shan <gshan@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v4 6/6] arch_topology: Build cacheinfo from primary CPU
Date: Wed,  4 Jan 2023 19:30:29 +0100
Message-Id: <20230104183033.755668-7-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104183033.755668-1-pierre.gondois@arm.com>
References: <20230104183033.755668-1-pierre.gondois@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_103204_940144_AFCA4686 
X-CRM114-Status: GOOD (  24.34  )
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

commit 3fcbf1c77d08 ("arch_topology: Fix cache attributes detection
in the CPU hotplug path")
adds a call to detect_cache_attributes() to populate the cacheinfo
before updating the siblings mask. detect_cache_attributes() allocates
memory and can take the PPTT mutex (on ACPI platforms). On PREEMPT_RT
kernels, on secondary CPUs, this triggers a:
  'BUG: sleeping function called from invalid context' [1]
as the code is executed with preemption and interrupts disabled.

The primary CPU was previously storing the cache information using
the now removed (struct cpu_topology).llc_id:
commit 5b8dc787ce4a ("arch_topology: Drop LLC identifier stash from
the CPU topology")

allocate_cache_info() tries to build the cacheinfo from the primary
CPU prior secondary CPUs boot, if the DT/ACPI description
contains cache information.
If allocate_cache_info() fails, then fallback to the current state
for the cacheinfo allocation. [1] will be triggered in such case.

When unplugging a CPU, the cacheinfo memory cannot be freed. If it
was, then the memory would be allocated early by the re-plugged
CPU and would trigger [1].

Note that populate_cache_leaves() might be called multiple times
due to populate_leaves being moved up. This is required since
detect_cache_attributes() might be called with per_cpu_cacheinfo(cpu)
being allocated but not populated.

[1]:
[    7.560791] BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:46
[    7.560794] in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 0, name: swapper/111
[    7.560796] preempt_count: 1, expected: 0
[    7.560797] RCU nest depth: 1, expected: 1
[    7.560799] 3 locks held by swapper/111/0:
[    7.560800]  #0: ffff403e406cae98 (&pcp->lock){+.+.}-{3:3}, at: get_page_from_freelist+0x218/0x12c8
[    7.560811]  #1: ffffc5f8ed09f8e8 (rcu_read_lock){....}-{1:3}, at: rt_spin_trylock+0x48/0xf0
[    7.560820]  #2: ffff403f400b4fd8 (&zone->lock){+.+.}-{3:3}, at: rmqueue_bulk+0x64/0xa80
[    7.560824] irq event stamp: 0
[    7.560825] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
[    7.560827] hardirqs last disabled at (0): [<ffffc5f8e9f7d594>] copy_process+0x5dc/0x1ab8
[    7.560830] softirqs last  enabled at (0): [<ffffc5f8e9f7d594>] copy_process+0x5dc/0x1ab8
[    7.560833] softirqs last disabled at (0): [<0000000000000000>] 0x0
[    7.560834] Preemption disabled at:
[    7.560835] [<ffffc5f8e9fd3c28>] migrate_enable+0x30/0x130
[    7.560838] CPU: 111 PID: 0 Comm: swapper/111 Tainted: G        W          6.0.0-rc4-rt6-[...]
[    7.560841] Call trace:
[...]
[    7.560870]  __kmalloc+0xbc/0x1e8
[    7.560873]  detect_cache_attributes+0x2d4/0x5f0
[    7.560876]  update_siblings_masks+0x30/0x368
[    7.560880]  store_cpu_topology+0x78/0xb8
[    7.560883]  secondary_start_kernel+0xd0/0x198
[    7.560885]  __secondary_switched+0xb0/0xb4

Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/cacheinfo.c |  5 ---
 drivers/base/arch_topology.c  | 12 +++++-
 drivers/base/cacheinfo.c      | 71 ++++++++++++++++++++++++++---------
 include/linux/cacheinfo.h     |  1 +
 4 files changed, 65 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 440a3df5944c..3a13113f1b29 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -113,11 +113,6 @@ static void fill_cacheinfo(struct cacheinfo **this_leaf,
 	}
 }
 
-int init_cache_level(unsigned int cpu)
-{
-	return init_of_cache_level(cpu);
-}
-
 int populate_cache_leaves(unsigned int cpu)
 {
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index e7d6e6657ffa..b1c1dd38ab01 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -736,7 +736,7 @@ void update_siblings_masks(unsigned int cpuid)
 
 	ret = detect_cache_attributes(cpuid);
 	if (ret && ret != -ENOENT)
-		pr_info("Early cacheinfo failed, ret = %d\n", ret);
+		pr_info("Early cacheinfo allocation failed, ret = %d\n", ret);
 
 	/* update core and thread sibling masks */
 	for_each_online_cpu(cpu) {
@@ -825,7 +825,7 @@ __weak int __init parse_acpi_topology(void)
 #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
 void __init init_cpu_topology(void)
 {
-	int ret;
+	int cpu, ret;
 
 	reset_cpu_topology();
 	ret = parse_acpi_topology();
@@ -840,6 +840,14 @@ void __init init_cpu_topology(void)
 		reset_cpu_topology();
 		return;
 	}
+
+	for_each_possible_cpu(cpu) {
+		ret = fetch_cache_info(cpu);
+		if (ret) {
+			pr_err("Early cacheinfo failed, ret = %d\n", ret);
+			break;
+		}
+	}
 }
 
 void store_cpu_topology(unsigned int cpuid)
diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 339cd1e3d5af..b57fbd0d7114 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -386,10 +386,6 @@ static void free_cache_attributes(unsigned int cpu)
 		return;
 
 	cache_shared_cpu_map_remove(cpu);
-
-	kfree(per_cpu_cacheinfo(cpu));
-	per_cpu_cacheinfo(cpu) = NULL;
-	cache_leaves(cpu) = 0;
 }
 
 int __weak init_cache_level(unsigned int cpu)
@@ -402,29 +398,71 @@ int __weak populate_cache_leaves(unsigned int cpu)
 	return -ENOENT;
 }
 
+static inline
+int allocate_cache_info(int cpu)
+{
+	per_cpu_cacheinfo(cpu) = kcalloc(cache_leaves(cpu),
+					 sizeof(struct cacheinfo), GFP_ATOMIC);
+	if (!per_cpu_cacheinfo(cpu)) {
+		cache_leaves(cpu) = 0;
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+int fetch_cache_info(unsigned int cpu)
+{
+	struct cpu_cacheinfo *this_cpu_ci;
+	unsigned int levels, split_levels;
+	int ret;
+
+	if (acpi_disabled) {
+		ret = init_of_cache_level(cpu);
+		if (ret < 0)
+			return ret;
+	} else {
+		ret = acpi_get_cache_info(cpu, &levels, &split_levels);
+		if (ret < 0)
+			return ret;
+
+		this_cpu_ci = get_cpu_cacheinfo(cpu);
+		this_cpu_ci->num_levels = levels;
+		/*
+		 * This assumes that:
+		 * - there cannot be any split caches (data/instruction)
+		 *   above a unified cache
+		 * - data/instruction caches come by pair
+		 */
+		this_cpu_ci->num_leaves = levels + split_levels;
+	}
+	if (!cache_leaves(cpu))
+		return -ENOENT;
+
+	return allocate_cache_info(cpu);
+}
+
 int detect_cache_attributes(unsigned int cpu)
 {
 	int ret;
 
-	/* Since early detection of the cacheinfo is allowed via this
-	 * function and this also gets called as CPU hotplug callbacks via
-	 * cacheinfo_cpu_online, the initialisation can be skipped and only
-	 * CPU maps can be updated as the CPU online status would be update
-	 * if called via cacheinfo_cpu_online path.
+	/* Since early initialization/allocation of the cacheinfo is allowed
+	 * via fetch_cache_info() and this also gets called as CPU hotplug
+	 * callbacks via cacheinfo_cpu_online, the init/alloc can be skipped
+	 * as it will happen only once (the cacheinfo memory is never freed).
+	 * Just populate the cacheinfo.
 	 */
 	if (per_cpu_cacheinfo(cpu))
-		goto update_cpu_map;
+		goto populate_leaves;
 
 	if (init_cache_level(cpu) || !cache_leaves(cpu))
 		return -ENOENT;
 
-	per_cpu_cacheinfo(cpu) = kcalloc(cache_leaves(cpu),
-					 sizeof(struct cacheinfo), GFP_ATOMIC);
-	if (per_cpu_cacheinfo(cpu) == NULL) {
-		cache_leaves(cpu) = 0;
-		return -ENOMEM;
-	}
+	ret = allocate_cache_info(cpu);
+	if (ret)
+		return ret;
 
+populate_leaves:
 	/*
 	 * populate_cache_leaves() may completely setup the cache leaves and
 	 * shared_cpu_map or it may leave it partially setup.
@@ -433,7 +471,6 @@ int detect_cache_attributes(unsigned int cpu)
 	if (ret)
 		goto free_ci;
 
-update_cpu_map:
 	/*
 	 * For systems using DT for cache hierarchy, fw_token
 	 * and shared_cpu_map will be set up here only if they are
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 00d8e7f9d1c6..dfef57077cd0 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -85,6 +85,7 @@ int populate_cache_leaves(unsigned int cpu);
 int cache_setup_acpi(unsigned int cpu);
 bool last_level_cache_is_valid(unsigned int cpu);
 bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y);
+int fetch_cache_info(unsigned int cpu);
 int detect_cache_attributes(unsigned int cpu);
 #ifndef CONFIG_ACPI_PPTT
 /*
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

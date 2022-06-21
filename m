Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90FDC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 19:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKwnD+OthI0wJamGtsU1lnC/xs3QyEtw+/eL/lXX3tg=; b=IgehHsgXTVvQIe
	x+KLUTJcEqc7L64Uvdpp5aOPFklenML13FRgkgWWKO8Omun7b+jPaJQcL7lemWQmtc2SZf90BibuC
	f1qZd0C1USNiHqR2SoXyUGAZsEf1cOTcf52wMVo+7An2nAgu98YA+uCAuk31pxWZPuimAaML29ija
	g271584Zw9tpkM7Lig5BrdUxJL6aP/r0utW9SL/RWxga186MjHJ/nPUmfy0lS0ey8R75lptA2p/52
	CuPBkjrKKLICCOBz5i7LLeE+xFDDzdApoeWf2yhdiKvEIGobaFq0Qulb/Fy+bKBj/OWuq5zwPy8Ud
	7wi1LFVt45LSbU3oqHkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3jTN-006pSi-Oe; Tue, 21 Jun 2022 19:23:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3jQr-006o4F-Hi; Tue, 21 Jun 2022 19:21:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE439165C;
	Tue, 21 Jun 2022 12:20:58 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B73223F792;
	Tue, 21 Jun 2022 12:20:56 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Atish Patra <atishp@atishpatra.org>,
	Atish Patra <atishp@rivosinc.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>,
	Rob Herring <robh+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v4 06/20] cacheinfo: Allow early detection and population of cache attributes
Date: Tue, 21 Jun 2022 20:20:20 +0100
Message-Id: <20220621192034.3332546-7-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621192034.3332546-1-sudeep.holla@arm.com>
References: <20220621192034.3332546-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_122101_722122_71B02FBA 
X-CRM114-Status: GOOD (  19.79  )
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

Some architecture/platforms may need to setup cache properties very
early in the boot along with other cpu topologies so that all these
information can be used to build sched_domains which is used by the
scheduler.

Allow detect_cache_attributes to be called quite early during the boot.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/cacheinfo.c  | 51 ++++++++++++++++++++++++++-------------
 include/linux/cacheinfo.h |  1 +
 2 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index fdc1baa342f1..2aa9e8e341b7 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -193,14 +193,8 @@ static int cache_setup_of_node(unsigned int cpu)
 {
 	struct device_node *np;
 	struct cacheinfo *this_leaf;
-	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	unsigned int index = 0;
 
-	/* skip if fw_token is already populated */
-	if (this_cpu_ci->info_list->fw_token) {
-		return 0;
-	}
-
 	np = of_cpu_device_node_get(cpu);
 	if (!np) {
 		pr_err("Failed to find cpu%d device node\n", cpu);
@@ -236,6 +230,18 @@ int __weak cache_setup_acpi(unsigned int cpu)
 
 unsigned int coherency_max_size;
 
+static int cache_setup_properties(unsigned int cpu)
+{
+	int ret = 0;
+
+	if (of_have_populated_dt())
+		ret = cache_setup_of_node(cpu);
+	else if (!acpi_disabled)
+		ret = cache_setup_acpi(cpu);
+
+	return ret;
+}
+
 static int cache_shared_cpu_map_setup(unsigned int cpu)
 {
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
@@ -246,21 +252,21 @@ static int cache_shared_cpu_map_setup(unsigned int cpu)
 	if (this_cpu_ci->cpu_map_populated)
 		return 0;
 
-	if (of_have_populated_dt())
-		ret = cache_setup_of_node(cpu);
-	else if (!acpi_disabled)
-		ret = cache_setup_acpi(cpu);
-
-	if (ret)
-		return ret;
+	/*
+	 * skip setting up cache properties if LLC is valid, just need
+	 * to update the shared cpu_map if the cache attributes were
+	 * populated early before all the cpus are brought online
+	 */
+	if (!last_level_cache_is_valid(cpu)) {
+		ret = cache_setup_properties(cpu);
+		if (ret)
+			return ret;
+	}
 
 	for (index = 0; index < cache_leaves(cpu); index++) {
 		unsigned int i;
 
 		this_leaf = per_cpu_cacheinfo_idx(cpu, index);
-		/* skip if shared_cpu_map is already populated */
-		if (!cpumask_empty(&this_leaf->shared_cpu_map))
-			continue;
 
 		cpumask_set_cpu(cpu, &this_leaf->shared_cpu_map);
 		for_each_online_cpu(i) {
@@ -330,10 +336,19 @@ int __weak populate_cache_leaves(unsigned int cpu)
 	return -ENOENT;
 }
 
-static int detect_cache_attributes(unsigned int cpu)
+int detect_cache_attributes(unsigned int cpu)
 {
 	int ret;
 
+	/* Since early detection of the cacheinfo is allowed via this
+	 * function and this also gets called as CPU hotplug callbacks via
+	 * cacheinfo_cpu_online, the initialisation can be skipped and only
+	 * CPU maps can be updated as the CPU online status would be update
+	 * if called via cacheinfo_cpu_online path.
+	 */
+	if (per_cpu_cacheinfo(cpu))
+		goto update_cpu_map;
+
 	if (init_cache_level(cpu) || !cache_leaves(cpu))
 		return -ENOENT;
 
@@ -349,6 +364,8 @@ static int detect_cache_attributes(unsigned int cpu)
 	ret = populate_cache_leaves(cpu);
 	if (ret)
 		goto free_ci;
+
+update_cpu_map:
 	/*
 	 * For systems using DT for cache hierarchy, fw_token
 	 * and shared_cpu_map will be set up here only if they are
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 7e429bc5c1a4..00b7a6ae8617 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -84,6 +84,7 @@ int populate_cache_leaves(unsigned int cpu);
 int cache_setup_acpi(unsigned int cpu);
 bool last_level_cache_is_valid(unsigned int cpu);
 bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y);
+int detect_cache_attributes(unsigned int cpu);
 #ifndef CONFIG_ACPI_PPTT
 /*
  * acpi_find_last_cache_level is only called on ACPI enabled
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

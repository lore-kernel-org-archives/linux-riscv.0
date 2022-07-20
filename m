Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524CBC43334
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 12:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7Puzm9y0whocVOEZOEU8JR3pAgOrI++6I0Mwlzv8sg=; b=NMH6gTwCh+xBac
	btbO4vVL74YBGLMu4OXVZiE83po8gKhCVaHMJ1a/4qgShHda1wL7Gdei+h+VExs4oNdgic6/+CFw+
	B7WnnKP8hxX/3yv86M13an3mOrQnnjg3zc1cU49Gy8LuWDHIFK7QvA6GUOF3Bz6YMLI+rFgFRIWZC
	pOwo3pPma/fGcEIKAUa1yUsYmIOsZAR0GUSUVFUSOvvK/8v98QixAL/+OfOyaFFB0OOdEaWLi74aH
	Sp4ERfKvjLDAFuqutxqM4zuOKlY1V+LmvcsXg8351tr0JhG079O4KnpRhISQBPHxkztAYUHMjcZVg
	4769y8MtdfMAmseoVKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9G5-005cJn-Ug; Wed, 20 Jul 2022 12:56:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9FH-005bAc-4O; Wed, 20 Jul 2022 12:56:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5C3C15BF;
	Wed, 20 Jul 2022 05:56:04 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AFC883F70D;
	Wed, 20 Jul 2022 05:56:02 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Guenter Roeck <linux@roeck-us.net>,
	linux-acpi@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ionela Voinescu <ionela.voinescu@arm.com>
Subject: [PATCH v3 2/3] ACPI: PPTT: Leave the table mapped for the runtime usage
Date: Wed, 20 Jul 2022 13:55:39 +0100
Message-Id: <20220720-arch_topo_fixes-v3-2-43d696288e84@arm.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220720-arch_topo_fixes-v3-0-43d696288e84@arm.com>
References: <20220720-arch_topo_fixes-v3-0-43d696288e84@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_055607_332874_E7C8029A 
X-CRM114-Status: GOOD (  17.21  )
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

Currently, everytime an information needs to be fetched from the PPTT,
the table is mapped via acpi_get_table() and unmapped after the use via
acpi_put_table() which is fine. However we do this at runtime especially
when the CPU is hotplugged out and plugged in back since we re-populate
the cache topology and other information.

However, with the support to fetch LLC information from the PPTT in the
cpuhotplug path which is executed in the atomic context, it is preferred
to avoid mapping and unmapping of the PPTT for every single use as the
acpi_get_table() might sleep waiting for a mutex.

In order to avoid the same, the table is needs to just mapped once on
the boot CPU and is never unmapped allowing it to be used at runtime
with out the hassle of mapping and unmapping the table.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Cc: Rafael J. Wysocki <rafael@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

--

Hi Rafael,

Sorry to bother you again on this PPTT changes. Guenter reported an issue
with lockdep enabled in -next that include my cacheinfo/arch_topology changes
to utilise LLC from PPTT in the CPU hotplug path.

Please ack the change once you are happy so that I can get it merged with
other fixes via Greg's tree.

Regards,
Sudeep

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index dd3222a15c9c..c91342dcbcd6 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -533,21 +533,37 @@ static int topology_get_acpi_cpu_tag(struct acpi_table_header *table,
 	return -ENOENT;
 }
 
+
+static struct acpi_table_header *acpi_get_pptt(void)
+{
+	static struct acpi_table_header *pptt;
+	acpi_status status;
+
+	/*
+	 * PPTT will be used at runtime on every CPU hotplug in path, so we
+	 * don't need to call acpi_put_table() to release the table mapping.
+	 */
+	if (!pptt) {
+		status = acpi_get_table(ACPI_SIG_PPTT, 0, &pptt);
+		if (ACPI_FAILURE(status))
+			acpi_pptt_warn_missing();
+	}
+
+	return pptt;
+}
+
 static int find_acpi_cpu_topology_tag(unsigned int cpu, int level, int flag)
 {
 	struct acpi_table_header *table;
-	acpi_status status;
 	int retval;
 
-	status = acpi_get_table(ACPI_SIG_PPTT, 0, &table);
-	if (ACPI_FAILURE(status)) {
-		acpi_pptt_warn_missing();
+	table = acpi_get_pptt();
+	if (!table)
 		return -ENOENT;
-	}
+
 	retval = topology_get_acpi_cpu_tag(table, cpu, level, flag);
 	pr_debug("Topology Setup ACPI CPU %d, level %d ret = %d\n",
 		 cpu, level, retval);
-	acpi_put_table(table);
 
 	return retval;
 }
@@ -568,16 +584,13 @@ static int find_acpi_cpu_topology_tag(unsigned int cpu, int level, int flag)
 static int check_acpi_cpu_flag(unsigned int cpu, int rev, u32 flag)
 {
 	struct acpi_table_header *table;
-	acpi_status status;
 	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
 	struct acpi_pptt_processor *cpu_node = NULL;
 	int ret = -ENOENT;
 
-	status = acpi_get_table(ACPI_SIG_PPTT, 0, &table);
-	if (ACPI_FAILURE(status)) {
-		acpi_pptt_warn_missing();
-		return ret;
-	}
+	table = acpi_get_pptt();
+	if (!table)
+		return -ENOENT;
 
 	if (table->revision >= rev)
 		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
@@ -585,8 +598,6 @@ static int check_acpi_cpu_flag(unsigned int cpu, int rev, u32 flag)
 	if (cpu_node)
 		ret = (cpu_node->flags & flag) != 0;
 
-	acpi_put_table(table);
-
 	return ret;
 }
 
@@ -605,18 +616,15 @@ int acpi_find_last_cache_level(unsigned int cpu)
 	u32 acpi_cpu_id;
 	struct acpi_table_header *table;
 	int number_of_levels = 0;
-	acpi_status status;
+
+	table = acpi_get_pptt();
+	if (!table)
+		return -ENOENT;
 
 	pr_debug("Cache Setup find last level CPU=%d\n", cpu);
 
 	acpi_cpu_id = get_acpi_id_for_cpu(cpu);
-	status = acpi_get_table(ACPI_SIG_PPTT, 0, &table);
-	if (ACPI_FAILURE(status)) {
-		acpi_pptt_warn_missing();
-	} else {
-		number_of_levels = acpi_find_cache_levels(table, acpi_cpu_id);
-		acpi_put_table(table);
-	}
+	number_of_levels = acpi_find_cache_levels(table, acpi_cpu_id);
 	pr_debug("Cache Setup find last level level=%d\n", number_of_levels);
 
 	return number_of_levels;
@@ -638,20 +646,16 @@ int acpi_find_last_cache_level(unsigned int cpu)
 int cache_setup_acpi(unsigned int cpu)
 {
 	struct acpi_table_header *table;
-	acpi_status status;
-
-	pr_debug("Cache Setup ACPI CPU %d\n", cpu);
 
-	status = acpi_get_table(ACPI_SIG_PPTT, 0, &table);
-	if (ACPI_FAILURE(status)) {
-		acpi_pptt_warn_missing();
+	table = acpi_get_pptt();
+	if (!table)
 		return -ENOENT;
-	}
+
+	pr_debug("Cache Setup ACPI CPU %d\n", cpu);
 
 	cache_setup_acpi_cpu(table, cpu);
-	acpi_put_table(table);
 
-	return status;
+	return 0;
 }
 
 /**
@@ -730,50 +734,38 @@ int find_acpi_cpu_topology_package(unsigned int cpu)
 int find_acpi_cpu_topology_cluster(unsigned int cpu)
 {
 	struct acpi_table_header *table;
-	acpi_status status;
 	struct acpi_pptt_processor *cpu_node, *cluster_node;
 	u32 acpi_cpu_id;
 	int retval;
 	int is_thread;
 
-	status = acpi_get_table(ACPI_SIG_PPTT, 0, &table);
-	if (ACPI_FAILURE(status)) {
-		acpi_pptt_warn_missing();
+	table = acpi_get_pptt();
+	if (!table)
 		return -ENOENT;
-	}
 
 	acpi_cpu_id = get_acpi_id_for_cpu(cpu);
 	cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
-	if (cpu_node == NULL || !cpu_node->parent) {
-		retval = -ENOENT;
-		goto put_table;
-	}
+	if (!cpu_node || !cpu_node->parent)
+		return -ENOENT;
 
 	is_thread = cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD;
 	cluster_node = fetch_pptt_node(table, cpu_node->parent);
-	if (cluster_node == NULL) {
-		retval = -ENOENT;
-		goto put_table;
-	}
+	if (!cluster_node)
+		return -ENOENT;
+
 	if (is_thread) {
-		if (!cluster_node->parent) {
-			retval = -ENOENT;
-			goto put_table;
-		}
+		if (!cluster_node->parent)
+			return -ENOENT;
+
 		cluster_node = fetch_pptt_node(table, cluster_node->parent);
-		if (cluster_node == NULL) {
-			retval = -ENOENT;
-			goto put_table;
-		}
+		if (!cluster_node)
+			return -ENOENT;
 	}
 	if (cluster_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID)
 		retval = cluster_node->acpi_processor_id;
 	else
 		retval = ACPI_PTR_DIFF(cluster_node, table);
 
-put_table:
-	acpi_put_table(table);
-
 	return retval;
 }
 

-- 
b4 0.10.0-dev-54fef

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

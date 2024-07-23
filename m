Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE11DC3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 06:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rJQj4D9Xpbjgrid9VjK/z0zJLU6rq01AZm6mOrZxjw=; b=yHbiXwxdNitB+p
	QFplEAzhDGWIbLDJBVSnqS6JyFlnlarzpiVGrnUJiruAXFpswd/noP+RHwDtyz5gdr6FqUEmV+7ZN
	yolOUBjW/EmPuLP3Y3taw0jpfaFYWmqaCk9zD+JansNcQ61xCpl1pqH8iHQ9ST7EXSDb1XSKLtQxi
	s/XVtCRfnLBWBR9/krT6d3ZWy+S4wYcvvbC7Xa3h4gWNNL95Zwf3RyjbZFd+M2HQiKtyhT3RTvbRz
	bvO+qQHVeBLlhwuqigwQdem20ywl+DEmYSdStd56NeAjuqfnsZXfsk6KYnXap3sGt5ksGC7fpHWrr
	aCxonJAtdxSnYZP6rDpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9Mx-0000000Bbmg-3LMJ;
	Tue, 23 Jul 2024 06:51:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9HQ-0000000BYLM-1cPH;
	Tue, 23 Jul 2024 06:45:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B30AD60A3B;
	Tue, 23 Jul 2024 06:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62871C4AF0B;
	Tue, 23 Jul 2024 06:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721717147;
	bh=BMzYC9t5QuwdECGq/0fBoBhxOHJUxmDFhThI+5y02vI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pXyUTJ1K6KmdxcOzNFBhx10UAi7KtrWf2AC3cALBHu4GHYptWrJdZs84KnVQHe9+r
	 6L7sZnWwWkvamwENwdFcjOPa7Ik7CfES8b2PphVrh8Z4/TtDm8a2zXTvuTr7RxjG0Y
	 U8yG00iMG5cROM2FJH+nUaCOsq3QjYflzEYICYyV0Bq+tuO57Wnm7MvSa5w0eTT61l
	 riNbmax5cb3PLTX/FW5nUjwSlej24ad9+5YG1ZAjplXI46GgWTYHEC0ipmUoCbEtA+
	 SCCP/H+rkG97RIat7tZtGxcVnQ17gKXpjVmbibUY4TWBt31zk2JBZoWoVAZDFUP42w
	 HhmDiQLPvcwSw==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	nvdimm@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 18/25] mm: move numa_distance and related code from x86 to numa_memblks
Date: Tue, 23 Jul 2024 09:41:49 +0300
Message-ID: <20240723064156.4009477-19-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240723064156.4009477-1-rppt@kernel.org>
References: <20240723064156.4009477-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_234548_781350_83B03DE0 
X-CRM114-Status: GOOD (  25.13  )
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

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Move code dealing with numa_distance array from arch/x86 to
mm/numa_memblks.c

This code will be later reused by arch_numa.

No functional changes.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/include/asm/numa.h  |   2 -
 arch/x86/mm/numa.c           | 104 -----------------------------------
 arch/x86/mm/numa_internal.h  |   2 -
 include/linux/numa_memblks.h |   4 ++
 mm/numa_memblks.c            | 104 +++++++++++++++++++++++++++++++++++
 5 files changed, 108 insertions(+), 108 deletions(-)

diff --git a/arch/x86/include/asm/numa.h b/arch/x86/include/asm/numa.h
index 6e9a50bf03d4..203100500f24 100644
--- a/arch/x86/include/asm/numa.h
+++ b/arch/x86/include/asm/numa.h
@@ -23,8 +23,6 @@ extern int numa_off;
 extern s16 __apicid_to_node[MAX_LOCAL_APIC];
 extern nodemask_t numa_nodes_parsed __initdata;
 
-extern void __init numa_set_distance(int from, int to, int distance);
-
 static inline void set_apicid_to_node(int apicid, s16 node)
 {
 	__apicid_to_node[apicid] = node;
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 6874d5650b4d..8eb15578625e 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -24,9 +24,6 @@
 
 int numa_off;
 
-static int numa_distance_cnt;
-static u8 *numa_distance;
-
 static __init int numa_setup(char *opt)
 {
 	if (!opt)
@@ -118,107 +115,6 @@ void __init setup_node_to_cpumask_map(void)
 	pr_debug("Node to cpumask map for %u nodes\n", nr_node_ids);
 }
 
-/**
- * numa_reset_distance - Reset NUMA distance table
- *
- * The current table is freed.  The next numa_set_distance() call will
- * create a new one.
- */
-void __init numa_reset_distance(void)
-{
-	size_t size = numa_distance_cnt * numa_distance_cnt * sizeof(numa_distance[0]);
-
-	/* numa_distance could be 1LU marking allocation failure, test cnt */
-	if (numa_distance_cnt)
-		memblock_free(numa_distance, size);
-	numa_distance_cnt = 0;
-	numa_distance = NULL;	/* enable table creation */
-}
-
-static int __init numa_alloc_distance(void)
-{
-	nodemask_t nodes_parsed;
-	size_t size;
-	int i, j, cnt = 0;
-
-	/* size the new table and allocate it */
-	nodes_parsed = numa_nodes_parsed;
-	numa_nodemask_from_meminfo(&nodes_parsed, &numa_meminfo);
-
-	for_each_node_mask(i, nodes_parsed)
-		cnt = i;
-	cnt++;
-	size = cnt * cnt * sizeof(numa_distance[0]);
-
-	numa_distance = memblock_alloc(size, PAGE_SIZE);
-	if (!numa_distance) {
-		pr_warn("Warning: can't allocate distance table!\n");
-		/* don't retry until explicitly reset */
-		numa_distance = (void *)1LU;
-		return -ENOMEM;
-	}
-
-	numa_distance_cnt = cnt;
-
-	/* fill with the default distances */
-	for (i = 0; i < cnt; i++)
-		for (j = 0; j < cnt; j++)
-			numa_distance[i * cnt + j] = i == j ?
-				LOCAL_DISTANCE : REMOTE_DISTANCE;
-	printk(KERN_DEBUG "NUMA: Initialized distance table, cnt=%d\n", cnt);
-
-	return 0;
-}
-
-/**
- * numa_set_distance - Set NUMA distance from one NUMA to another
- * @from: the 'from' node to set distance
- * @to: the 'to'  node to set distance
- * @distance: NUMA distance
- *
- * Set the distance from node @from to @to to @distance.  If distance table
- * doesn't exist, one which is large enough to accommodate all the currently
- * known nodes will be created.
- *
- * If such table cannot be allocated, a warning is printed and further
- * calls are ignored until the distance table is reset with
- * numa_reset_distance().
- *
- * If @from or @to is higher than the highest known node or lower than zero
- * at the time of table creation or @distance doesn't make sense, the call
- * is ignored.
- * This is to allow simplification of specific NUMA config implementations.
- */
-void __init numa_set_distance(int from, int to, int distance)
-{
-	if (!numa_distance && numa_alloc_distance() < 0)
-		return;
-
-	if (from >= numa_distance_cnt || to >= numa_distance_cnt ||
-			from < 0 || to < 0) {
-		pr_warn_once("Warning: node ids are out of bound, from=%d to=%d distance=%d\n",
-			     from, to, distance);
-		return;
-	}
-
-	if ((u8)distance != distance ||
-	    (from == to && distance != LOCAL_DISTANCE)) {
-		pr_warn_once("Warning: invalid distance parameter, from=%d to=%d distance=%d\n",
-			     from, to, distance);
-		return;
-	}
-
-	numa_distance[from * numa_distance_cnt + to] = distance;
-}
-
-int __node_distance(int from, int to)
-{
-	if (from >= numa_distance_cnt || to >= numa_distance_cnt)
-		return from == to ? LOCAL_DISTANCE : REMOTE_DISTANCE;
-	return numa_distance[from * numa_distance_cnt + to];
-}
-EXPORT_SYMBOL(__node_distance);
-
 static int __init numa_register_memblks(struct numa_meminfo *mi)
 {
 	int nid, err;
diff --git a/arch/x86/mm/numa_internal.h b/arch/x86/mm/numa_internal.h
index a51229a2f5af..249e3aaeadce 100644
--- a/arch/x86/mm/numa_internal.h
+++ b/arch/x86/mm/numa_internal.h
@@ -5,8 +5,6 @@
 #include <linux/types.h>
 #include <asm/numa.h>
 
-void __init numa_reset_distance(void);
-
 void __init x86_numa_init(void);
 
 struct numa_meminfo;
diff --git a/include/linux/numa_memblks.h b/include/linux/numa_memblks.h
index 6981cf97d2c9..968a590535ac 100644
--- a/include/linux/numa_memblks.h
+++ b/include/linux/numa_memblks.h
@@ -7,6 +7,10 @@
 
 #define NR_NODE_MEMBLKS		(MAX_NUMNODES * 2)
 
+extern int numa_distance_cnt;
+void __init numa_set_distance(int from, int to, int distance);
+void __init numa_reset_distance(void);
+
 struct numa_memblk {
 	u64			start;
 	u64			end;
diff --git a/mm/numa_memblks.c b/mm/numa_memblks.c
index 72f191a94c66..e3c3519725d4 100644
--- a/mm/numa_memblks.c
+++ b/mm/numa_memblks.c
@@ -7,11 +7,115 @@
 #include <linux/numa.h>
 #include <linux/numa_memblks.h>
 
+int numa_distance_cnt;
+static u8 *numa_distance;
+
 nodemask_t numa_nodes_parsed __initdata;
 
 struct numa_meminfo numa_meminfo __initdata_or_meminfo;
 struct numa_meminfo numa_reserved_meminfo __initdata_or_meminfo;
 
+/**
+ * numa_reset_distance - Reset NUMA distance table
+ *
+ * The current table is freed.  The next numa_set_distance() call will
+ * create a new one.
+ */
+void __init numa_reset_distance(void)
+{
+	size_t size = numa_distance_cnt * numa_distance_cnt * sizeof(numa_distance[0]);
+
+	/* numa_distance could be 1LU marking allocation failure, test cnt */
+	if (numa_distance_cnt)
+		memblock_free(numa_distance, size);
+	numa_distance_cnt = 0;
+	numa_distance = NULL;	/* enable table creation */
+}
+
+static int __init numa_alloc_distance(void)
+{
+	nodemask_t nodes_parsed;
+	size_t size;
+	int i, j, cnt = 0;
+
+	/* size the new table and allocate it */
+	nodes_parsed = numa_nodes_parsed;
+	numa_nodemask_from_meminfo(&nodes_parsed, &numa_meminfo);
+
+	for_each_node_mask(i, nodes_parsed)
+		cnt = i;
+	cnt++;
+	size = cnt * cnt * sizeof(numa_distance[0]);
+
+	numa_distance = memblock_alloc(size, PAGE_SIZE);
+	if (!numa_distance) {
+		pr_warn("Warning: can't allocate distance table!\n");
+		/* don't retry until explicitly reset */
+		numa_distance = (void *)1LU;
+		return -ENOMEM;
+	}
+
+	numa_distance_cnt = cnt;
+
+	/* fill with the default distances */
+	for (i = 0; i < cnt; i++)
+		for (j = 0; j < cnt; j++)
+			numa_distance[i * cnt + j] = i == j ?
+				LOCAL_DISTANCE : REMOTE_DISTANCE;
+	printk(KERN_DEBUG "NUMA: Initialized distance table, cnt=%d\n", cnt);
+
+	return 0;
+}
+
+/**
+ * numa_set_distance - Set NUMA distance from one NUMA to another
+ * @from: the 'from' node to set distance
+ * @to: the 'to'  node to set distance
+ * @distance: NUMA distance
+ *
+ * Set the distance from node @from to @to to @distance.  If distance table
+ * doesn't exist, one which is large enough to accommodate all the currently
+ * known nodes will be created.
+ *
+ * If such table cannot be allocated, a warning is printed and further
+ * calls are ignored until the distance table is reset with
+ * numa_reset_distance().
+ *
+ * If @from or @to is higher than the highest known node or lower than zero
+ * at the time of table creation or @distance doesn't make sense, the call
+ * is ignored.
+ * This is to allow simplification of specific NUMA config implementations.
+ */
+void __init numa_set_distance(int from, int to, int distance)
+{
+	if (!numa_distance && numa_alloc_distance() < 0)
+		return;
+
+	if (from >= numa_distance_cnt || to >= numa_distance_cnt ||
+			from < 0 || to < 0) {
+		pr_warn_once("Warning: node ids are out of bound, from=%d to=%d distance=%d\n",
+			     from, to, distance);
+		return;
+	}
+
+	if ((u8)distance != distance ||
+	    (from == to && distance != LOCAL_DISTANCE)) {
+		pr_warn_once("Warning: invalid distance parameter, from=%d to=%d distance=%d\n",
+			     from, to, distance);
+		return;
+	}
+
+	numa_distance[from * numa_distance_cnt + to] = distance;
+}
+
+int __node_distance(int from, int to)
+{
+	if (from >= numa_distance_cnt || to >= numa_distance_cnt)
+		return from == to ? LOCAL_DISTANCE : REMOTE_DISTANCE;
+	return numa_distance[from * numa_distance_cnt + to];
+}
+EXPORT_SYMBOL(__node_distance);
+
 static int __init numa_add_memblk_to(int nid, u64 start, u64 end,
 				     struct numa_meminfo *mi)
 {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

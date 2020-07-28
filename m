Return-Path: <SRS0=Fr2v=BH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF396C433E4
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 05:16:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE82820658
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 05:16:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1LlisGuZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDqolARt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE82820658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hrru3w86aEvJKqh40bESCV/dfhBs8KhqRsMKsSIdA9w=; b=1LlisGuZlQI+Q66xpR6+Fb4ii
	io9ViefDTM19xicT9Ki6EmCWd7q/WOJN8QTXuuhk43LOlzupdWvpvG4J1Tg92yJyEyPgaMBJkD1l+
	+rTgFnMc74uOTdbeARQ9sTC66aMYrlPQc8CcdvaIEOowPRcWBP6pOkv3dVfHdrXkseRe0gN7aj6k+
	6OsQllD6CVlgZTLL13A+PTr8hWPlpTAUgx4th/a4l2MSDyrvpWKYYQZUPg9j8nvnYiVAbGR8T8bZF
	tKryO/Z8GTTpPcbPNOS+L5GzSajvbsKl1UAcx3IFFhTVbvm8RE+0XanIlsCpRqZg8Svf/i55DtJWq
	Prbk1YnSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0Hyj-0006ux-2z; Tue, 28 Jul 2020 05:16:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0Hwq-0005lU-Fv; Tue, 28 Jul 2020 05:14:51 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7F8F021D95;
 Tue, 28 Jul 2020 05:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595913281;
 bh=hyYCib2EzOYupEpjqTA02kWUy84POJABcJ/qGLZac04=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XDqolARt7JP4OTgvgXGBzFyeZRytmbAFbtGJaFk1lZHBHYKYmJhZtfCfKN9tIFvku
 TKBPHHtbHVB/wUBdRDOwh8QsDOP2utFTiOILOl0mq07BFNqNdrKi5EMjqjtlAYe4x4
 ixC0LlEffXTqoengolg1jQ37jbrs/aEBEQqXuFZs=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 15/15] memblock: remove 'type' parameter from
 for_each_memblock()
Date: Tue, 28 Jul 2020 08:11:53 +0300
Message-Id: <20200728051153.1590-16-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200728051153.1590-1-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_011446_243569_2ED5D87E 
X-CRM114-Status: GOOD (  19.75  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Christoph Hellwig <hch@lst.de>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

for_each_memblock() is used exclusively to iterate over memblock.memory in
a few places that use data from memblock_region rather than the memory
ranges.

Remove type parameter from the for_each_memblock() iterator to improve
encapsulation of memblock internals from its users.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arm64/kernel/setup.c      |  2 +-
 arch/arm64/mm/numa.c           |  2 +-
 arch/mips/netlogic/xlp/setup.c |  2 +-
 include/linux/memblock.h       | 10 +++++++---
 mm/memblock.c                  |  4 ++--
 mm/page_alloc.c                |  8 ++++----
 6 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 93b3844cf442..23da7908cbed 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -217,7 +217,7 @@ static void __init request_standard_resources(void)
 	if (!standard_resources)
 		panic("%s: Failed to allocate %zu bytes\n", __func__, res_size);
 
-	for_each_memblock(memory, region) {
+	for_each_memblock(region) {
 		res = &standard_resources[i++];
 		if (memblock_is_nomap(region)) {
 			res->name  = "reserved";
diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
index 0cbdbcc885fb..08721d2c0b79 100644
--- a/arch/arm64/mm/numa.c
+++ b/arch/arm64/mm/numa.c
@@ -350,7 +350,7 @@ static int __init numa_register_nodes(void)
 	struct memblock_region *mblk;
 
 	/* Check that valid nid is set to memblks */
-	for_each_memblock(memory, mblk) {
+	for_each_memblock(mblk) {
 		int mblk_nid = memblock_get_region_node(mblk);
 
 		if (mblk_nid == NUMA_NO_NODE || mblk_nid >= MAX_NUMNODES) {
diff --git a/arch/mips/netlogic/xlp/setup.c b/arch/mips/netlogic/xlp/setup.c
index 1a0fc5b62ba4..e69d9fc468cf 100644
--- a/arch/mips/netlogic/xlp/setup.c
+++ b/arch/mips/netlogic/xlp/setup.c
@@ -70,7 +70,7 @@ static void nlm_fixup_mem(void)
 	const int pref_backup = 512;
 	struct memblock_region *mem;
 
-	for_each_memblock(memory, mem) {
+	for_each_memblock(mem) {
 		memblock_remove(mem->base + mem->size - pref_backup,
 			pref_backup);
 	}
diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index d70c2835e913..c901cb8ecf92 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -527,9 +527,13 @@ static inline unsigned long memblock_region_reserved_end_pfn(const struct memblo
 	return PFN_UP(reg->base + reg->size);
 }
 
-#define for_each_memblock(memblock_type, region)					\
-	for (region = memblock.memblock_type.regions;					\
-	     region < (memblock.memblock_type.regions + memblock.memblock_type.cnt);	\
+/**
+ * for_each_memblock - itereate over registered memory regions
+ * @region: loop variable
+ */
+#define for_each_memblock(region)					\
+	for (region = memblock.memory.regions;				\
+	     region < (memblock.memory.regions + memblock.memory.cnt);	\
 	     region++)
 
 extern void *alloc_large_system_hash(const char *tablename,
diff --git a/mm/memblock.c b/mm/memblock.c
index 2ad5e6e47215..550bb72cf6cb 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1694,7 +1694,7 @@ static phys_addr_t __init_memblock __find_max_addr(phys_addr_t limit)
 	 * the memory memblock regions, if the @limit exceeds the total size
 	 * of those regions, max_addr will keep original value PHYS_ADDR_MAX
 	 */
-	for_each_memblock(memory, r) {
+	for_each_memblock(r) {
 		if (limit <= r->size) {
 			max_addr = r->base + limit;
 			break;
@@ -1864,7 +1864,7 @@ void __init_memblock memblock_trim_memory(phys_addr_t align)
 	phys_addr_t start, end, orig_start, orig_end;
 	struct memblock_region *r;
 
-	for_each_memblock(memory, r) {
+	for_each_memblock(r) {
 		orig_start = r->base;
 		orig_end = r->base + r->size;
 		start = round_up(orig_start, align);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 95af111d69d3..8a19f46dc86e 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5927,7 +5927,7 @@ overlap_memmap_init(unsigned long zone, unsigned long *pfn)
 
 	if (mirrored_kernelcore && zone == ZONE_MOVABLE) {
 		if (!r || *pfn >= memblock_region_memory_end_pfn(r)) {
-			for_each_memblock(memory, r) {
+			for_each_memblock(r) {
 				if (*pfn < memblock_region_memory_end_pfn(r))
 					break;
 			}
@@ -6528,7 +6528,7 @@ static unsigned long __init zone_absent_pages_in_node(int nid,
 		unsigned long start_pfn, end_pfn;
 		struct memblock_region *r;
 
-		for_each_memblock(memory, r) {
+		for_each_memblock(r) {
 			start_pfn = clamp(memblock_region_memory_base_pfn(r),
 					  zone_start_pfn, zone_end_pfn);
 			end_pfn = clamp(memblock_region_memory_end_pfn(r),
@@ -7122,7 +7122,7 @@ static void __init find_zone_movable_pfns_for_nodes(void)
 	 * options.
 	 */
 	if (movable_node_is_enabled()) {
-		for_each_memblock(memory, r) {
+		for_each_memblock(r) {
 			if (!memblock_is_hotpluggable(r))
 				continue;
 
@@ -7143,7 +7143,7 @@ static void __init find_zone_movable_pfns_for_nodes(void)
 	if (mirrored_kernelcore) {
 		bool mem_below_4gb_not_mirrored = false;
 
-		for_each_memblock(memory, r) {
+		for_each_memblock(r) {
 			if (memblock_is_mirror(r))
 				continue;
 
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

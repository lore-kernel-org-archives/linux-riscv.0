Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C87C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 06:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uU6uFfzYUlLCEcmuVay+kAOVM7Jxyn22Uo/go74Fiic=; b=NGS7GN7v6k+JeR
	P4PPHMuT/xTU/U8elIXyd0xjmOw2Ra8yfXzsPHqkCPGc0zdvwlGc/TUKOl9SPUVnyKIS0L9vzSbep
	3E+8+d2IlYO232iIsuihSIIYXR8Fr5gksbflOTN1A/QjFvC99mgqCW2k19i3vHkkllAUXAVGJxYaG
	fDfcFO+W18M7uUXnSC8B3SAjJV0o7yGqIyXnzJ0bSLqRdHL3rjLfXKoHRsTM6gtVCDXmuRoD69f56
	UqhIrBqSf7JPKvcJRiQlMt7jLX6FS2lWQaz1fRBygin9f9WX1v8+6iOJ5Q+c3k0caW+Hd9IIRJDRz
	1I/qV0p8f1VywWB9Zufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbaZJ-00000004717-0iRD;
	Wed, 07 Aug 2024 06:54:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbaQa-000000042sR-07au;
	Wed, 07 Aug 2024 06:45:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5254561159;
	Wed,  7 Aug 2024 06:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA20C4AF0D;
	Wed,  7 Aug 2024 06:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723013143;
	bh=myrv0/Onz2uf2L79NKQuCidiTPIpfcVd5CfvCX/gMk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yq7z4D4CNKGaU8Hxfxlb0pvzqi6oDWqzCyj3ZS3YWHnl1sFVaL+OF/gxE+uH3I5Uo
	 hWeOqCZtC3CCmSqorjY3q9MwOA1lEzkE9fXxNKjo0Q0CuI5bEGTYoRPQdiqCUovFgj
	 CUTE/k/5j0cIbbjanJ56rNJ2eJN8jjw+Yz/LM6jGUrb47YyTfsDbDIDItua0qoExqw
	 fVO2Ekjlec0Os7yJqaxNdmE6m4N0aDMchtQgCCHo64Wjoy+yTDA6TIoG5+N28A4hUq
	 EKfxnR83EZ6XFL9i85qWZvyL0UsZkWJx7pOFJraH89GBoJx9IiFiefj7w3AiLS7hdW
	 Myrms3QsJPpmg==
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
	x86@kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v4 21/26] mm: numa_memblks: make several functions and variables static
Date: Wed,  7 Aug 2024 09:41:05 +0300
Message-ID: <20240807064110.1003856-22-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807064110.1003856-1-rppt@kernel.org>
References: <20240807064110.1003856-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_234544_298437_D971542A 
X-CRM114-Status: GOOD (  16.89  )
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

Make functions and variables that are exclusively used by numa_memblks
static.

Move numa_nodemask_from_meminfo() before its callers to avoid forward
declaration.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> [arm64 + CXL via QEMU]
Acked-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/numa_memblks.h |  8 --------
 mm/numa_memblks.c            | 36 ++++++++++++++++++------------------
 2 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/include/linux/numa_memblks.h b/include/linux/numa_memblks.h
index 07381320848f..5c6e12ad0b7a 100644
--- a/include/linux/numa_memblks.h
+++ b/include/linux/numa_memblks.h
@@ -7,7 +7,6 @@
 
 #define NR_NODE_MEMBLKS		(MAX_NUMNODES * 2)
 
-extern int numa_distance_cnt;
 void __init numa_set_distance(int from, int to, int distance);
 void __init numa_reset_distance(void);
 
@@ -22,17 +21,10 @@ struct numa_meminfo {
 	struct numa_memblk	blk[NR_NODE_MEMBLKS];
 };
 
-extern struct numa_meminfo numa_meminfo __initdata_or_meminfo;
-extern struct numa_meminfo numa_reserved_meminfo __initdata_or_meminfo;
-
 int __init numa_add_memblk(int nodeid, u64 start, u64 end);
 void __init numa_remove_memblk_from(int idx, struct numa_meminfo *mi);
 
 int __init numa_cleanup_meminfo(struct numa_meminfo *mi);
-int __init numa_register_meminfo(struct numa_meminfo *mi);
-
-void __init numa_nodemask_from_meminfo(nodemask_t *nodemask,
-				       const struct numa_meminfo *mi);
 
 int __init numa_memblks_init(int (*init_func)(void),
 			     bool memblock_force_top_down);
diff --git a/mm/numa_memblks.c b/mm/numa_memblks.c
index 7749b6f6b250..e97665a5e8ce 100644
--- a/mm/numa_memblks.c
+++ b/mm/numa_memblks.c
@@ -7,13 +7,27 @@
 #include <linux/numa.h>
 #include <linux/numa_memblks.h>
 
-int numa_distance_cnt;
+static int numa_distance_cnt;
 static u8 *numa_distance;
 
 nodemask_t numa_nodes_parsed __initdata;
 
-struct numa_meminfo numa_meminfo __initdata_or_meminfo;
-struct numa_meminfo numa_reserved_meminfo __initdata_or_meminfo;
+static struct numa_meminfo numa_meminfo __initdata_or_meminfo;
+static struct numa_meminfo numa_reserved_meminfo __initdata_or_meminfo;
+
+/*
+ * Set nodes, which have memory in @mi, in *@nodemask.
+ */
+static void __init numa_nodemask_from_meminfo(nodemask_t *nodemask,
+					      const struct numa_meminfo *mi)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mi->blk); i++)
+		if (mi->blk[i].start != mi->blk[i].end &&
+		    mi->blk[i].nid != NUMA_NO_NODE)
+			node_set(mi->blk[i].nid, *nodemask);
+}
 
 /**
  * numa_reset_distance - Reset NUMA distance table
@@ -290,20 +304,6 @@ int __init numa_cleanup_meminfo(struct numa_meminfo *mi)
 	return 0;
 }
 
-/*
- * Set nodes, which have memory in @mi, in *@nodemask.
- */
-void __init numa_nodemask_from_meminfo(nodemask_t *nodemask,
-				       const struct numa_meminfo *mi)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(mi->blk); i++)
-		if (mi->blk[i].start != mi->blk[i].end &&
-		    mi->blk[i].nid != NUMA_NO_NODE)
-			node_set(mi->blk[i].nid, *nodemask);
-}
-
 /*
  * Mark all currently memblock-reserved physical memory (which covers the
  * kernel's own memory ranges) as hot-unswappable.
@@ -371,7 +371,7 @@ static void __init numa_clear_kernel_node_hotplug(void)
 	}
 }
 
-int __init numa_register_meminfo(struct numa_meminfo *mi)
+static int __init numa_register_meminfo(struct numa_meminfo *mi)
 {
 	int i;
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

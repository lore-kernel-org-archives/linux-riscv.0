Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3019C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 06:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pV2MeYiEU7Zsb1DIZ+zcHCo1OGsb61xx6sCrEwIca4I=; b=oJqxYKpiKqxT1E
	ess3tzG5itQncoN3vk+IcoMmm2dEfLL9Vmgiq+i/v2+tarNmn08/Ti4IvqIWkiO0eUSWL8SEFdbbg
	xL0YqyCy/a1RztlBA8s3Yf/ZQHZrkvi8yr2vLQmFpaYVa/J+Ro7OZUFz56MPaprrTNu0j1a9iEuyU
	byVh8fo0wgr6yskhpXHmZvbtwlkW+c1O+zA/jnv8BUBFuTarWEzuuTdBV014goWo43W6CJBBmwFVr
	nBfknkNYYLveP87XoOzamiYCcw60Im/dM9v39QQwvr3+N1SUhoOOhdbNl/3wvenyHhhrUHOPbNMRP
	noYp2TeE6qVt103HuRAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZP3x-00000003u0f-2voR;
	Thu, 01 Aug 2024 06:13:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZP0r-00000003s6K-3u6r;
	Thu, 01 Aug 2024 06:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 39F6E62502;
	Thu,  1 Aug 2024 06:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB07C4AF11;
	Thu,  1 Aug 2024 06:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722492608;
	bh=+b1cOkZzBkabktp5Vtr0BxOA2OwItOU3swcoPl+STrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MFAG9F3fUnIEGckALXUsgPgJNDOGxKIktrZWhCPRrwe1l/PA4t95t0glD4Bw67Wwj
	 56IqcN7KC3zzeCXB3c8CrI5bl5iDUVSKZrsLqr43Ecm7gRjqRFCAR9bIDA59V6hoqm
	 Xly5FwnM79IMgwgHQI+TPINCsSXXhleTBgnO0f80JBYd2cMfyLGz32VP93mcQrjqJA
	 Ne73hzkU/Y8f6hDf1oBGnhpCmZoHktUlCUaZ+WLWYPT98uUNEZFkSQTU50QEbSbj1J
	 0OJkDgvPRbuCaVMusjazFYkXiGRxn2uK7gxV2/FyMUUmWwS+NFGAia450ymPPe8PXm
	 gEBtBz7iXoOvw==
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
Subject: [PATCH v3 07/26] mm: drop CONFIG_HAVE_ARCH_NODEDATA_EXTENSION
Date: Thu,  1 Aug 2024 09:08:07 +0300
Message-ID: <20240801060826.559858-8-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801060826.559858-1-rppt@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_231010_133328_CA18E331 
X-CRM114-Status: GOOD (  16.45  )
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

There are no users of HAVE_ARCH_NODEDATA_EXTENSION left, so
arch_alloc_nodedata() and arch_refresh_nodedata() are not needed
anymore.

Replace the call to arch_alloc_nodedata() in free_area_init() with
memblock_alloc(), remove arch_refresh_nodedata() and cleanup
include/linux/memory_hotplug.h from the associated ifdefery.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
---
 include/linux/memory_hotplug.h | 48 ----------------------------------
 mm/mm_init.c                   |  3 +--
 2 files changed, 1 insertion(+), 50 deletions(-)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index ebe876930e78..b27ddce5d324 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -16,54 +16,6 @@ struct resource;
 struct vmem_altmap;
 struct dev_pagemap;
 
-#ifdef CONFIG_HAVE_ARCH_NODEDATA_EXTENSION
-/*
- * For supporting node-hotadd, we have to allocate a new pgdat.
- *
- * If an arch has generic style NODE_DATA(),
- * node_data[nid] = kzalloc() works well. But it depends on the architecture.
- *
- * In general, generic_alloc_nodedata() is used.
- *
- */
-extern pg_data_t *arch_alloc_nodedata(int nid);
-extern void arch_refresh_nodedata(int nid, pg_data_t *pgdat);
-
-#else /* CONFIG_HAVE_ARCH_NODEDATA_EXTENSION */
-
-#define arch_alloc_nodedata(nid)	generic_alloc_nodedata(nid)
-
-#ifdef CONFIG_NUMA
-/*
- * XXX: node aware allocation can't work well to get new node's memory at this time.
- *	Because, pgdat for the new node is not allocated/initialized yet itself.
- *	To use new node's memory, more consideration will be necessary.
- */
-#define generic_alloc_nodedata(nid)				\
-({								\
-	memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);	\
-})
-
-extern pg_data_t *node_data[];
-static inline void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
-{
-	node_data[nid] = pgdat;
-}
-
-#else /* !CONFIG_NUMA */
-
-/* never called */
-static inline pg_data_t *generic_alloc_nodedata(int nid)
-{
-	BUG();
-	return NULL;
-}
-static inline void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
-{
-}
-#endif /* CONFIG_NUMA */
-#endif /* CONFIG_HAVE_ARCH_NODEDATA_EXTENSION */
-
 #ifdef CONFIG_MEMORY_HOTPLUG
 struct page *pfn_to_online_page(unsigned long pfn);
 
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 75c3bd42799b..bcc2f2dd8021 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1838,11 +1838,10 @@ void __init free_area_init(unsigned long *max_zone_pfn)
 
 		if (!node_online(nid)) {
 			/* Allocator not initialized yet */
-			pgdat = arch_alloc_nodedata(nid);
+			pgdat = memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);
 			if (!pgdat)
 				panic("Cannot allocate %zuB for node %d.\n",
 				       sizeof(*pgdat), nid);
-			arch_refresh_nodedata(nid, pgdat);
 		}
 
 		pgdat = NODE_DATA(nid);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

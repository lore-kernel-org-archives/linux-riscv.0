Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938C4C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 06:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1bDWk0xamFHqNesRxa6Snik9Kr43QFTU5aTsdP8PnXo=; b=Imk13zlVYL+BXm
	dM0iHOFSd1k/rrapZDWmPg36AUjD9POPCCz7vAYk/zfUBp2RUKOhFz+qqvflhu0SjM/y5K51q3xay
	68Reg0UhfGlj3lk+7bacVmREjH9hdf5XcX7cMHPEkAU/Tb0+KswmkvfntGi9iV66uriK45JzvTB2a
	wE7wAcZcTNz6Gf5BPLL9i+HnV573j0qLE48iFDUEG5jbIpee1zsw0PsiPUBfn/0gvH40lnSOpnPpa
	d0YV0GuE7QFZIGPdvXnW3KoJzWL6P1VRIyi2vQKcbw82ttG/yVku4rQw+usP6tqF4GPgfFG4SNsPd
	dwZw/R0V1kySm0TONiNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZP2j-00000003tGf-3O2r;
	Thu, 01 Aug 2024 06:12:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZP0V-00000003rqi-0YI8;
	Thu, 01 Aug 2024 06:09:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 237266263A;
	Thu,  1 Aug 2024 06:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881CCC4AF0C;
	Thu,  1 Aug 2024 06:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722492585;
	bh=jUiExhtxbXLJEeICWPE63efzW6eqLaOxDv+h7X1UR1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fyJjwiWO5WHG4X2BzzIkyEGTY5gXOCD+ocNhSqlvP1OilB9J7rnYOnJABy+hGNW7D
	 xyTV54Pg3gqNh0EPbnqoG/ks9lFNNaRt68ghnwEBkGMQaZxTf+nA+LyP19RicBy5Mn
	 oBAhzFwgqXTg+F2KNHfJxuZAc+N3bPm43YahnhzEpn1k2PvuuM8oXAE1AEsUYxJerR
	 tX/VcdeduKO5ZFtg7MixgD6k3bqZICLB50wXo+SmGeSCjFOLiA5DXhtHAdrjSd6Fih
	 OPSoIR83ckKg/rW0fTB91OmvxgfNNKKtMbwyRz9u7AFU5KUSVbJZsnfwxQI4xSQrNV
	 +9nKM8amxI9NA==
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
Subject: [PATCH v3 05/26] MIPS: loongson64: rename __node_data to node_data
Date: Thu,  1 Aug 2024 09:08:05 +0300
Message-ID: <20240801060826.559858-6-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801060826.559858-1-rppt@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_230947_369981_FA82CC06 
X-CRM114-Status: GOOD (  15.02  )
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

Make definition of node_data match other architectures.
This will allow pulling declaration of node_data to the generic mm code in
the following commit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 arch/mips/include/asm/mach-loongson64/mmzone.h | 4 ++--
 arch/mips/loongson64/numa.c                    | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/mmzone.h b/arch/mips/include/asm/mach-loongson64/mmzone.h
index a3d65d37b8b5..2effd5f8ed62 100644
--- a/arch/mips/include/asm/mach-loongson64/mmzone.h
+++ b/arch/mips/include/asm/mach-loongson64/mmzone.h
@@ -14,9 +14,9 @@
 #define pa_to_nid(addr)  (((addr) & 0xf00000000000) >> NODE_ADDRSPACE_SHIFT)
 #define nid_to_addrbase(nid) ((unsigned long)(nid) << NODE_ADDRSPACE_SHIFT)
 
-extern struct pglist_data *__node_data[];
+extern struct pglist_data *node_data[];
 
-#define NODE_DATA(n)		(__node_data[n])
+#define NODE_DATA(n)		(node_data[n])
 
 extern void __init prom_init_numa_memory(void);
 
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index 68dafd6d3e25..b50ce28d2741 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -29,8 +29,8 @@
 
 unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
 EXPORT_SYMBOL(__node_distances);
-struct pglist_data *__node_data[MAX_NUMNODES];
-EXPORT_SYMBOL(__node_data);
+struct pglist_data *node_data[MAX_NUMNODES];
+EXPORT_SYMBOL(node_data);
 
 cpumask_t __node_cpumask[MAX_NUMNODES];
 EXPORT_SYMBOL(__node_cpumask);
@@ -107,7 +107,7 @@ static void __init node_mem_init(unsigned int node)
 	tnid = early_pfn_to_nid(nd_pa >> PAGE_SHIFT);
 	if (tnid != node)
 		pr_info("NODE_DATA(%d) on node %d\n", node, tnid);
-	__node_data[node] = nd;
+	node_data[node] = nd;
 	NODE_DATA(node)->node_start_pfn = start_pfn;
 	NODE_DATA(node)->node_spanned_pages = end_pfn - start_pfn;
 
@@ -206,5 +206,5 @@ pg_data_t * __init arch_alloc_nodedata(int nid)
 
 void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
 {
-	__node_data[nid] = pgdat;
+	node_data[nid] = pgdat;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

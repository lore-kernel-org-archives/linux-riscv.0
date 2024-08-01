Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE1AC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 06:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fMeafIZ2WEFrUWK+3BgzmvsNK4M5pGypMGgYfjuV5RE=; b=IUCzdHH7ij7Klm
	Rduztw1wQtI2ERSUwEoVpEL06IpD8bEhDnfV54P6dh1/lQI6AFBurN6Yp/uNqeWpYgNmrdn8uXKOM
	7bHQt/yyJWwtR4qOUR9WGxmWVayULrIXNkwB7Bf/V1TyjSL/Z2rtVLTbSJFuw18zWv5XL9Nolocd+
	uIgX0JVsaHdqnRp9t+TRLSV+/s1E/IWB6dA+ROtyQnjsuPTTE+MiMkiuvRB3dRIY6YwTvPl34HRAP
	wEZkXLkbIki4NTErftC8D/qNzL65aBq5hS3zQj0jmo/cG+pQ1ABt4FGxkD52916p8fhhNnAHOVh+I
	ZrOIBFfQajPFTwwWPbmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZP7S-00000003vne-3jsg;
	Thu, 01 Aug 2024 06:16:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZP2B-00000003svj-477G;
	Thu, 01 Aug 2024 06:11:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A73A6140C;
	Thu,  1 Aug 2024 06:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7173C4AF0C;
	Thu,  1 Aug 2024 06:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722492691;
	bh=Hwkl2fYIk7TOliTb70qL/9b9HRfQD7yZz25kkbJxzwg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sggkX9UXhxZlNsIU8Cl5aBh0kTbihmyOr+rKh8PUi6HpNbM0T6FIQKsN6mrcRHsf+
	 /SHE74zS057DN4assx4nJNhHkYwGmMqA+89c3GAN3GWW1EkySpM/jKp7djIHsHmlQ5
	 J+Rv/xUy1WL2p4zN9YP1XUUreurEUzXm4yz/xIU+P7O+cVStnX8B/b0U7trY1kXI3V
	 hD82NTGJiywRlimIOVt1MLB+ZyReKPZdsG0bD+xetL7gw2D1t4eztwZAnWKJPPnk54
	 vnKaRI5ocC0Nw9z/8HV7kFU7UWYinD8YhScEarF8oyOHxHwNgCdMiLoia/TVqvYCnm
	 Y30JzCKYd6e+A==
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
Subject: [PATCH v3 14/26] x86/numa_emu: split __apicid_to_node update to a helper function
Date: Thu,  1 Aug 2024 09:08:14 +0300
Message-ID: <20240801060826.559858-15-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801060826.559858-1-rppt@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_231132_179159_41ED66EA 
X-CRM114-Status: GOOD (  17.83  )
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

This is required to make numa emulation code architecture independent so
that it can be moved to generic code in following commits.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
---
 arch/x86/include/asm/numa.h  |  2 ++
 arch/x86/mm/numa.c           | 22 ++++++++++++++++++++++
 arch/x86/mm/numa_emulation.c | 14 +-------------
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/arch/x86/include/asm/numa.h b/arch/x86/include/asm/numa.h
index 2dab1ada96cf..7017d540894a 100644
--- a/arch/x86/include/asm/numa.h
+++ b/arch/x86/include/asm/numa.h
@@ -72,6 +72,8 @@ void debug_cpumask_set_cpu(int cpu, int node, bool enable);
 
 #ifdef CONFIG_NUMA_EMU
 int numa_emu_cmdline(char *str);
+void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
+					unsigned int nr_emu_nids);
 #else /* CONFIG_NUMA_EMU */
 static inline int numa_emu_cmdline(char *str)
 {
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index cfe7e5477cf8..9180d524cfe4 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -848,6 +848,28 @@ EXPORT_SYMBOL(cpumask_of_node);
 
 #endif	/* !CONFIG_DEBUG_PER_CPU_MAPS */
 
+#ifdef CONFIG_NUMA_EMU
+void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
+					unsigned int nr_emu_nids)
+{
+	int i, j;
+
+	/*
+	 * Transform __apicid_to_node table to use emulated nids by
+	 * reverse-mapping phys_nid.  The maps should always exist but fall
+	 * back to zero just in case.
+	 */
+	for (i = 0; i < ARRAY_SIZE(__apicid_to_node); i++) {
+		if (__apicid_to_node[i] == NUMA_NO_NODE)
+			continue;
+		for (j = 0; j < nr_emu_nids; j++)
+			if (__apicid_to_node[i] == emu_nid_to_phys[j])
+				break;
+		__apicid_to_node[i] = j < nr_emu_nids ? j : 0;
+	}
+}
+#endif /* CONFIG_NUMA_EMU */
+
 #ifdef CONFIG_NUMA_KEEP_MEMINFO
 static int meminfo_to_nid(struct numa_meminfo *mi, u64 start)
 {
diff --git a/arch/x86/mm/numa_emulation.c b/arch/x86/mm/numa_emulation.c
index 439804e21962..f2746e52ab93 100644
--- a/arch/x86/mm/numa_emulation.c
+++ b/arch/x86/mm/numa_emulation.c
@@ -476,19 +476,7 @@ void __init numa_emulation(struct numa_meminfo *numa_meminfo, int numa_dist_cnt)
 		    ei.blk[i].nid != NUMA_NO_NODE)
 			node_set(ei.blk[i].nid, numa_nodes_parsed);
 
-	/*
-	 * Transform __apicid_to_node table to use emulated nids by
-	 * reverse-mapping phys_nid.  The maps should always exist but fall
-	 * back to zero just in case.
-	 */
-	for (i = 0; i < ARRAY_SIZE(__apicid_to_node); i++) {
-		if (__apicid_to_node[i] == NUMA_NO_NODE)
-			continue;
-		for (j = 0; j < ARRAY_SIZE(emu_nid_to_phys); j++)
-			if (__apicid_to_node[i] == emu_nid_to_phys[j])
-				break;
-		__apicid_to_node[i] = j < ARRAY_SIZE(emu_nid_to_phys) ? j : 0;
-	}
+	numa_emu_update_cpu_to_node(emu_nid_to_phys, ARRAY_SIZE(emu_nid_to_phys));
 
 	/* make sure all emulated nodes are mapped to a physical node */
 	for (i = 0; i < ARRAY_SIZE(emu_nid_to_phys); i++)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD55C52D6D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 06:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kLUJ0AV+ZJ6xvDRRbfRWxGQxJ1uO5GICvfP7hk19RZo=; b=LlOGmD+J+3c1xe
	ZyPx4IHHx5f/7WB/X83YnDe9JPCFBPnO3tSNZkGNqbSZAN7bXtjrSKZb2WROEywc3x9I7wD+234+q
	l30K5f20XnOIjVLpvr6a7S4paLk6pBt8mm/d7M0+40TttbSyy7bEENvghCrzEVyzk7eatsFmfqUGE
	wi+Nzbc03sobJSzCHUAwvNkwtnbjfz6ry6ZfV7iGu8kbQXtXT13TGO6+vvJMj1zwJ3G5fuSh67OzM
	DhGAdwIN+7thHBJAR/nlzm9j/W+f0/nuwMORkdBDwVcVqTMAhqz9lNZcUDMTqnTxeb26YTYrEAA8g
	YZ848A6dVOXmckwUZURA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZP2D-00000003sxJ-3pH2;
	Thu, 01 Aug 2024 06:11:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZP0K-00000003rmS-32fp;
	Thu, 01 Aug 2024 06:09:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E566ACE1872;
	Thu,  1 Aug 2024 06:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0025DC4AF09;
	Thu,  1 Aug 2024 06:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722492574;
	bh=mmhHQYCETRJBHfScnhlLv4Zo+WisPGGfSJnH6vP+xjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cr1CiLPN8Njdras4Btqnv341rMINjlqlnS1idBt/fsGeA4aaKp/Ea7yaeCTLRW+OD
	 SLPSIWQWQGJwKbXyYy0pIWVIzgViSpnkqTQGdGOGlErfpLRWbytg7pgdYGk+qx62Zh
	 vYO75yHA7yY/Uy0nBoxrtxxpTUVILgIgN/WYcr56R6lmrJ6AHRlpmtU1yA6AtLKxrM
	 ZMeWtHyXc0v0Y5TlxT1McUabePfZDEmVQfqH5OPEDQwG1SfJboJ8M8tXb85NcwNlTk
	 yRFhOlgDBqiScu3LsYNIWwFXmfZDKp8obRgWw9/g6qXMgFBNCRXgedXGkmX7WEaQAO
	 2ahFkgooeohiw==
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
Subject: [PATCH v3 04/26] MIPS: sgi-ip27: drop HAVE_ARCH_NODEDATA_EXTENSION
Date: Thu,  1 Aug 2024 09:08:04 +0300
Message-ID: <20240801060826.559858-5-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801060826.559858-1-rppt@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_230937_139147_A6101728 
X-CRM114-Status: GOOD (  12.61  )
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

Commit f8f9f21c7848 ("MIPS: Fix build error for loongson64 and
sgi-ip27") added HAVE_ARCH_NODEDATA_EXTENSION to sgi-ip27 to silence a
compilation error that happened because sgi-ip27 didn't define array of
pg_data_t as node_data like most other architectures did.

After addition of node_data array that matches other architectures and
after ensuring that offline nodes do not appear on node_possible_map, it
is safe to drop arch_alloc_nodedata() and HAVE_ARCH_NODEDATA_EXTENSION
from sgi-ip27.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/mips/Kconfig                |  1 -
 arch/mips/sgi-ip27/ip27-memory.c | 10 ----------
 2 files changed, 11 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 60077e576935..ea5f3c3c31f6 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -735,7 +735,6 @@ config SGI_IP27
 	select WAR_R10000_LLSC
 	select MIPS_L1_CACHE_SHIFT_7
 	select NUMA
-	select HAVE_ARCH_NODEDATA_EXTENSION
 	help
 	  This are the SGI Origin 200, Origin 2000 and Onyx 2 Graphics
 	  workstations.  To compile a Linux kernel that runs on these, say Y
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index c30ef6958b97..eb6d2fa41a8a 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -426,13 +426,3 @@ void __init mem_init(void)
 	memblock_free_all();
 	setup_zero_pages();	/* This comes from node 0 */
 }
-
-pg_data_t * __init arch_alloc_nodedata(int nid)
-{
-	return memblock_alloc(sizeof(pg_data_t), SMP_CACHE_BYTES);
-}
-
-void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
-{
-	__node_data[nid] = (struct node_data *)pgdat;
-}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

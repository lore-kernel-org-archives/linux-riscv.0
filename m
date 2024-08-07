Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1E3C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 06:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzbiD/vcQYcPj+k4qoOfe4Npm8kLtJ5Y1nWEBrU7A8o=; b=CjmTrkdnLOq+/w
	iJ7VUf4BFMeyynm//UaYCGEvyCIX5WLEN/fNQ1GcYzX1y7iqhxZ/fAlv3U5FgjvcC6VN+pEbGF1Ce
	Oq4eUXdNhb4SCEQ7nnf6yaJFHGE9Kvr56TVFNpR93VJ/RXiP02oph8yySrPzpNa9d7qFFLgSRmYes
	4i2sZYsSULKtLuES8HcQCt1rzyM3ypnLFN24EPiM3dR27uifWJcCC6N0eJ+AuNBY8FC+lKS9ErUzx
	zhSOePReupu64AASDSA8Lo4Pfk9/UiDUuk6DD8k2hBrftf4vjVzfrl7c8DPZIsm6s2/GFs95hTte6
	ZweCtDDEtOi/QWeAO6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbaPQ-000000042CC-0aik;
	Wed, 07 Aug 2024 06:44:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbaNJ-0000000414d-2wLd;
	Wed, 07 Aug 2024 06:42:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 20AEC61053;
	Wed,  7 Aug 2024 06:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8230DC4AF0D;
	Wed,  7 Aug 2024 06:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723012940;
	bh=idsHhwKxCydMIEYW67Mi8IEYDtCQDaQ99uA3YpCABEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hQ4mZ12NkBXSfE0hhYdc5i9KQJBCyI1M5WrRev+NtKWDGPSaE8Wmtl2i3VESVG2xg
	 Y5Ub1jLCzE5idKc6FUYwbselD+u4diobwITTAK4bvtOm6qBXHMP1Fz0Znf6+iTCyYi
	 JJBg28lFO4lVodBcKj9T7Hv2b5Jp95ie+eYfBxVstxofJSZnKI6t4VaskYxv36YHbQ
	 ASshRfDYXdY494etcdP22k2YkiYKeg1nR38nXmBhnfAtenk55tcm9BCU4MpzZuxjbD
	 WTtoemNkM82xpYaKODYIpaWEWe/5z8KX706XNAEWvXVCFYljiiswPwrriIJruk9IHn
	 36hliCUlm3ZWw==
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
Subject: [PATCH v4 04/26] MIPS: sgi-ip27: drop HAVE_ARCH_NODEDATA_EXTENSION
Date: Wed,  7 Aug 2024 09:40:48 +0300
Message-ID: <20240807064110.1003856-5-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807064110.1003856-1-rppt@kernel.org>
References: <20240807064110.1003856-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_234221_855905_8CA92451 
X-CRM114-Status: GOOD (  11.79  )
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
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> [arm64 + CXL via QEMU]
Acked-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>
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

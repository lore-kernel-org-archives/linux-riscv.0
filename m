Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09991C3DA63
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 06:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+CoJZLgIGv+9RfU5FLCVTAU9RXB5qq7xLhHL6vwPEE=; b=wDJjXxjTS89p84
	rR19xMqV1gtx48BBm0Dw+ZsmoE3CFYGGdDT37H3E/GHS4ORPSmf+DKW0+O7KPakNtTGAMgFQCPIz/
	t9O5S3PH+z7dIaVFZEJcIPmF+aR9n0hnSYvHxgZ3mDH7t/BbZnXjk3hS2UpucTNy+F6N9zAWsU1np
	fAkFAyfklymkVMrP/Y+8bEgDFf7rCE8+xm6xbiNfwu60dkmOBQmPbOPZV0NbuGdYActWid1jNYhtQ
	zCvSJ037hJ5KdjfgcYJBLyTY3gwNumbX0x750q5D1mZspYlf3wPMk+TwHLYatl/o/6l7tj3Hxp9pq
	9V086or9OmCrHUoZ3h+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9Jb-0000000BZpC-0ccn;
	Tue, 23 Jul 2024 06:48:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9GJ-0000000BXcH-1aVi;
	Tue, 23 Jul 2024 06:44:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9B68FCE0CF9;
	Tue, 23 Jul 2024 06:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A897DC4AF11;
	Tue, 23 Jul 2024 06:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721717076;
	bh=8rGMU6H0xpSW1PfNkpG5PW55rGb66bFUqmPdcr4x6rM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DMH+LIu7U+aon+ordBnOP9y/4e/JQcPrdrU4wjutvSLDDvXOc1ys6wuHbI4hKieQR
	 /xgRhOakm6RQTdiw2VvUZ5E+G5+8InucFZSJ4L/WpYdF2KBpwnJhzL2X3blwUIsPHF
	 BNsuUV6DrXa0kDav1NpSJD8RWtLixsQL95KrNLHU/bpdX+V8avSWLrtUxamv6XP6Ji
	 Wy8f6yiSPuW67CGtqy45Wu7qsOcxty7IMCR7Ls2bWyZ9yB4JzsDY3BvA9clRGF07K6
	 TvjJ9DmJQksoZos1626QbyJJRVE6drznFrXoiqAYFhoYqZXLw0uPhlOK3FS/vUJ5rC
	 SWsVGk9Lql1nw==
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
Subject: [PATCH v2 12/25] x86/numa: move FAKE_NODE_* defines to numa_emu
Date: Tue, 23 Jul 2024 09:41:43 +0300
Message-ID: <20240723064156.4009477-13-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240723064156.4009477-1-rppt@kernel.org>
References: <20240723064156.4009477-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_234439_882123_71E7C15E 
X-CRM114-Status: GOOD (  12.58  )
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

The definitions of FAKE_NODE_MIN_SIZE and FAKE_NODE_MIN_HASH_MASK are
only used by numa emulation code, make them local to
arch/x86/mm/numa_emulation.c

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 arch/x86/include/asm/numa.h  | 2 --
 arch/x86/mm/numa_emulation.c | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/numa.h b/arch/x86/include/asm/numa.h
index ef2844d69173..2dab1ada96cf 100644
--- a/arch/x86/include/asm/numa.h
+++ b/arch/x86/include/asm/numa.h
@@ -71,8 +71,6 @@ void debug_cpumask_set_cpu(int cpu, int node, bool enable);
 #endif
 
 #ifdef CONFIG_NUMA_EMU
-#define FAKE_NODE_MIN_SIZE	((u64)32 << 20)
-#define FAKE_NODE_MIN_HASH_MASK	(~(FAKE_NODE_MIN_SIZE - 1UL))
 int numa_emu_cmdline(char *str);
 #else /* CONFIG_NUMA_EMU */
 static inline int numa_emu_cmdline(char *str)
diff --git a/arch/x86/mm/numa_emulation.c b/arch/x86/mm/numa_emulation.c
index 9a9305367fdd..1ce22e315b80 100644
--- a/arch/x86/mm/numa_emulation.c
+++ b/arch/x86/mm/numa_emulation.c
@@ -10,6 +10,9 @@
 
 #include "numa_internal.h"
 
+#define FAKE_NODE_MIN_SIZE	((u64)32 << 20)
+#define FAKE_NODE_MIN_HASH_MASK	(~(FAKE_NODE_MIN_SIZE - 1UL))
+
 static int emu_nid_to_phys[MAX_NUMNODES];
 static char *emu_cmdline __initdata;
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

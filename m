Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C73CC46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 07:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xgj3lJ3qdIbLMtrMo0QTmJa6Np+IB/KByt9HzDe/J/g=; b=aG3BIF2juhHjyI
	ASIkoIMC2XesxewEI+PLJZZ2opWTgq/DZ4b1rEA1lQuNp9D8lkTa+GCNsouYUbJFLxeL1eYSfyui0
	1R5Wo0OJPdN788TI5MrzPjg9lFyyhgKmxy2wDvMIe6xzZJQojqUAxDBQ4sDOBAO0ZRAUoS1lLXkSQ
	5XCMAdC5s1NPefsuDn5A5qgAEi8tTgH3jrNqTV5QKWWf4UQ+9EDkt0uGpEjkolSWMCJv4DYlVQBNr
	sA7l7D4g0IK0AyRu4HvzChCsCLPdpY78i96LDYhobVX3mRZ5KmjCtZbX7imFtMlDphmoXrhjTuK+F
	4tzBAWvO3cl4375hUDcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi8j2-00Ehfv-2m;
	Mon, 18 Sep 2023 07:31:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi8iy-00Eha0-2v;
	Mon, 18 Sep 2023 07:31:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 03A47CE0C47;
	Mon, 18 Sep 2023 07:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2285FC433AD;
	Mon, 18 Sep 2023 07:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695022273;
	bh=GrzrJESS7vx7QyV0O3w+oX12p1W5MbqUcsXcqyR+rMA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L26X5Mym5jbDCDCi9pBttJiCUmGDJK7QCrrwON0wsqLsaMRtQtziMfk+8vmq102wK
	 apB9eMngz4FDoZOnyfOnpxsYAYV+s6z6uy/A7GUFANPsDrtCidzVD8sw9PZ9EeZeSS
	 BBZbnyT3UkLAeKFTSJ+WQXJ44CEr3Yz7/npPDOeCiIyuKPQdJ6wFULwDSI42C+21i2
	 TtK4M26N760ml2Bd8ec+c+dtMjxHoi8aQYpVD0iQ48GL/MfHLj1xfBm+sXCRSzVgn2
	 IlOo26svfqfJVEKxvnTHvne8XyU+XB4i1UAyBnP2cTSXuXl9ONzyCPVFbHoWx7LKOg
	 fqTz/6KsDW2hQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Nadav Amit <nadav.amit@gmail.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v3 06/13] mm/execmem: introduce execmem_data_alloc()
Date: Mon, 18 Sep 2023 10:29:48 +0300
Message-Id: <20230918072955.2507221-7-rppt@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230918072955.2507221-1-rppt@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_003117_326770_2C6F0FB1 
X-CRM114-Status: GOOD (  21.86  )
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

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Data related to code allocations, such as module data section, need to
comply with architecture constraints for its placement and its
allocation right now was done using execmem_text_alloc().

Create a dedicated API for allocating data related to code allocations
and allow architectures to define address ranges for data allocations.

Since currently this is only relevant for powerpc variants that use the
VMALLOC address space for module data allocations, automatically reuse
address ranges defined for text unless address range for data is
explicitly defined by an architecture.

With separation of code and data allocations, data sections of the
modules are now mapped as PAGE_KERNEL rather than PAGE_KERNEL_EXEC which
was a default on many architectures.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/powerpc/kernel/module.c | 12 ++++++++++++
 include/linux/execmem.h      | 19 +++++++++++++++++++
 kernel/module/main.c         | 15 +++------------
 mm/execmem.c                 | 17 ++++++++++++++++-
 4 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index f4dd26f693a3..824d9541a310 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -95,6 +95,9 @@ static struct execmem_params execmem_params __ro_after_init = {
 		[EXECMEM_DEFAULT] = {
 			.alignment = 1,
 		},
+		[EXECMEM_MODULE_DATA] = {
+			.alignment = 1,
+		},
 	},
 };
 
@@ -103,7 +106,12 @@ struct execmem_params __init *execmem_arch_params(void)
 	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
 	struct execmem_range *range = &execmem_params.ranges[EXECMEM_DEFAULT];
 
+	/*
+	 * BOOK3S_32 and 8xx define MODULES_VADDR for text allocations and
+	 * allow allocating data in the entire vmalloc space
+	 */
 #ifdef MODULES_VADDR
+	struct execmem_range *data = &execmem_params.ranges[EXECMEM_MODULE_DATA];
 	unsigned long limit = (unsigned long)_etext - SZ_32M;
 
 	/* First try within 32M limit from _etext to avoid branch trampolines */
@@ -116,6 +124,10 @@ struct execmem_params __init *execmem_arch_params(void)
 		range->start = MODULES_VADDR;
 		range->end = MODULES_END;
 	}
+	data->start = VMALLOC_START;
+	data->end = VMALLOC_END;
+	data->pgprot = PAGE_KERNEL;
+	data->alignment = 1;
 #else
 	range->start = VMALLOC_START;
 	range->end = VMALLOC_END;
diff --git a/include/linux/execmem.h b/include/linux/execmem.h
index 519bdfdca595..09d45ac786e9 100644
--- a/include/linux/execmem.h
+++ b/include/linux/execmem.h
@@ -29,6 +29,7 @@
  * @EXECMEM_KPROBES: parameters for kprobes
  * @EXECMEM_FTRACE: parameters for ftrace
  * @EXECMEM_BPF: parameters for BPF
+ * @EXECMEM_MODULE_DATA: parameters for module data sections
  * @EXECMEM_TYPE_MAX:
  */
 enum execmem_type {
@@ -37,6 +38,7 @@ enum execmem_type {
 	EXECMEM_KPROBES,
 	EXECMEM_FTRACE,
 	EXECMEM_BPF,
+	EXECMEM_MODULE_DATA,
 	EXECMEM_TYPE_MAX,
 };
 
@@ -107,6 +109,23 @@ struct execmem_params *execmem_arch_params(void);
  */
 void *execmem_text_alloc(enum execmem_type type, size_t size);
 
+/**
+ * execmem_data_alloc - allocate memory for data coupled to code
+ * @type: type of the allocation
+ * @size: how many bytes of memory are required
+ *
+ * Allocates memory that will contain data coupled with executable code,
+ * like data sections in kernel modules.
+ *
+ * The memory will have protections defined by architecture.
+ *
+ * The allocated memory will reside in an area that does not impose
+ * restrictions on the addressing modes.
+ *
+ * Return: a pointer to the allocated memory or %NULL
+ */
+void *execmem_data_alloc(enum execmem_type type, size_t size);
+
 /**
  * execmem_free - free executable memory
  * @ptr: pointer to the memory that should be freed
diff --git a/kernel/module/main.c b/kernel/module/main.c
index c4146bfcd0a7..2ae83a6abf66 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1188,25 +1188,16 @@ void __weak module_arch_freeing_init(struct module *mod)
 {
 }
 
-static bool mod_mem_use_vmalloc(enum mod_mem_type type)
-{
-	return IS_ENABLED(CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC) &&
-		mod_mem_type_is_core_data(type);
-}
-
 static void *module_memory_alloc(unsigned int size, enum mod_mem_type type)
 {
-	if (mod_mem_use_vmalloc(type))
-		return vzalloc(size);
+	if (mod_mem_type_is_data(type))
+		return execmem_data_alloc(EXECMEM_MODULE_DATA, size);
 	return execmem_text_alloc(EXECMEM_MODULE_TEXT, size);
 }
 
 static void module_memory_free(void *ptr, enum mod_mem_type type)
 {
-	if (mod_mem_use_vmalloc(type))
-		vfree(ptr);
-	else
-		execmem_free(ptr);
+	execmem_free(ptr);
 }
 
 static void free_mod_mem(struct module *mod)
diff --git a/mm/execmem.c b/mm/execmem.c
index abcbd07e05ac..aeff85261360 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -53,11 +53,23 @@ static void *execmem_alloc(size_t size, struct execmem_range *range)
 	return kasan_reset_tag(p);
 }
 
+static inline bool execmem_range_is_data(enum execmem_type type)
+{
+	return type == EXECMEM_MODULE_DATA;
+}
+
 void *execmem_text_alloc(enum execmem_type type, size_t size)
 {
 	return execmem_alloc(size, &execmem_params.ranges[type]);
 }
 
+void *execmem_data_alloc(enum execmem_type type, size_t size)
+{
+	WARN_ON_ONCE(!execmem_range_is_data(type));
+
+	return execmem_alloc(size, &execmem_params.ranges[type]);
+}
+
 void execmem_free(void *ptr)
 {
 	/*
@@ -93,7 +105,10 @@ static void execmem_init_missing(struct execmem_params *p)
 		struct execmem_range *r = &p->ranges[i];
 
 		if (!r->start) {
-			r->pgprot = default_range->pgprot;
+			if (execmem_range_is_data(i))
+				r->pgprot = PAGE_KERNEL;
+			else
+				r->pgprot = default_range->pgprot;
 			r->alignment = default_range->alignment;
 			r->start = default_range->start;
 			r->end = default_range->end;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

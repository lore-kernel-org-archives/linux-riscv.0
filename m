Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859EFC001CC
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 16:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFigXmuWH0zfaNUQKXLTDVt+KsMqafRnKhJ9M650yoA=; b=MAf1RN1EgCmsVf
	mV82NbAcy9on2N6cyjVYXaz08GZ1qPMshjWHxJ92fT+S/yChEzx66qqUEoNlunixxsLWlb+9eZv/f
	Ph6DhVglsSZlu0XmF6gbXQUpORguWeWFx2DItqSgySfjijntpMYYeoywKhitRJtL4TvrSvcbzZV58
	66UA3lsFHpGsh0njIKrPQKPTGsa01j6PGBnDu8NidDFDdRwCk3S/dAMOKsWdnkC0Q6alnO6/udTAz
	Nk5kb7NQxzoj93IcEFfkbLrxBocut9Oec1rCS4vPhXY8xi6zhFnlNxKOCCY+RIisB3/SlWvkKHnDM
	rt9Rh58LXvzZTBoTpmgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwt1-0000000Cu74-0s1K;
	Thu, 11 Apr 2024 16:02:51 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwsg-0000000Ctrp-0ozQ;
	Thu, 11 Apr 2024 16:02:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1A15CCE16D9;
	Thu, 11 Apr 2024 16:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818CFC2BD10;
	Thu, 11 Apr 2024 16:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712851347;
	bh=et4MgsnYGm8cVKv9jXBAzJOVzMpXCbC7LVUAQwPu1L8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M1GXndAQP3oIWJF2kKyNlpiiJSFO7nmNgf4MIU0ERGhKxhpSGaH9nxwDuLhsV3Xqy
	 oWFbKUT/il9FmwUQEyH0r/e2BlemPH7VRA1ywsfVtoDfKNcIa4f2do77HzqxqdrG6t
	 QlP+gFMeCVi6VrLKqby9Dn5q7YBcfKh9PkLfkItK2qs1Sx2MUlI4qvR4Q73oKj8gOV
	 YIq1zu3Q38f4fDlPFB+klMICo31RMpMdTnPu5jG0/g9T75phgJPr5vjbKe2lBvj3yQ
	 QDLR8IEPEAv5EEBMbPsUOffQmtDM0+zqars1F9uzRfdyUjJWSeVO38WX+SrdXXfWIy
	 bNoL6A2CTDgVQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Nadav Amit <nadav.amit@gmail.com>,
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
	linux-arch@vger.kernel.org,
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
Subject: [PATCH v4 04/15] module: make module_memory_{alloc,free} more self-contained
Date: Thu, 11 Apr 2024 19:00:40 +0300
Message-ID: <20240411160051.2093261-5-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411160051.2093261-1-rppt@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_090231_169798_EA6C6A6E 
X-CRM114-Status: GOOD (  18.19  )
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

Move the logic related to the memory allocation and freeing into
module_memory_alloc() and module_memory_free().

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 kernel/module/main.c | 64 +++++++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index e1e8a7a9d6c1..5b82b069e0d3 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1203,15 +1203,44 @@ static bool mod_mem_use_vmalloc(enum mod_mem_type type)
 		mod_mem_type_is_core_data(type);
 }
 
-static void *module_memory_alloc(unsigned int size, enum mod_mem_type type)
+static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
 {
+	unsigned int size = PAGE_ALIGN(mod->mem[type].size);
+	void *ptr;
+
+	mod->mem[type].size = size;
+
 	if (mod_mem_use_vmalloc(type))
-		return vzalloc(size);
-	return module_alloc(size);
+		ptr = vmalloc(size);
+	else
+		ptr = module_alloc(size);
+
+	if (!ptr)
+		return -ENOMEM;
+
+	/*
+	 * The pointer to these blocks of memory are stored on the module
+	 * structure and we keep that around so long as the module is
+	 * around. We only free that memory when we unload the module.
+	 * Just mark them as not being a leak then. The .init* ELF
+	 * sections *do* get freed after boot so we *could* treat them
+	 * slightly differently with kmemleak_ignore() and only grey
+	 * them out as they work as typical memory allocations which
+	 * *do* eventually get freed, but let's just keep things simple
+	 * and avoid *any* false positives.
+	 */
+	kmemleak_not_leak(ptr);
+
+	memset(ptr, 0, size);
+	mod->mem[type].base = ptr;
+
+	return 0;
 }
 
-static void module_memory_free(void *ptr, enum mod_mem_type type)
+static void module_memory_free(struct module *mod, enum mod_mem_type type)
 {
+	void *ptr = mod->mem[type].base;
+
 	if (mod_mem_use_vmalloc(type))
 		vfree(ptr);
 	else
@@ -1229,12 +1258,12 @@ static void free_mod_mem(struct module *mod)
 		/* Free lock-classes; relies on the preceding sync_rcu(). */
 		lockdep_free_key_range(mod_mem->base, mod_mem->size);
 		if (mod_mem->size)
-			module_memory_free(mod_mem->base, type);
+			module_memory_free(mod, type);
 	}
 
 	/* MOD_DATA hosts mod, so free it at last */
 	lockdep_free_key_range(mod->mem[MOD_DATA].base, mod->mem[MOD_DATA].size);
-	module_memory_free(mod->mem[MOD_DATA].base, MOD_DATA);
+	module_memory_free(mod, MOD_DATA);
 }
 
 /* Free a module, remove from lists, etc. */
@@ -2225,7 +2254,6 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 static int move_module(struct module *mod, struct load_info *info)
 {
 	int i;
-	void *ptr;
 	enum mod_mem_type t = 0;
 	int ret = -ENOMEM;
 
@@ -2234,26 +2262,12 @@ static int move_module(struct module *mod, struct load_info *info)
 			mod->mem[type].base = NULL;
 			continue;
 		}
-		mod->mem[type].size = PAGE_ALIGN(mod->mem[type].size);
-		ptr = module_memory_alloc(mod->mem[type].size, type);
-		/*
-                 * The pointer to these blocks of memory are stored on the module
-                 * structure and we keep that around so long as the module is
-                 * around. We only free that memory when we unload the module.
-                 * Just mark them as not being a leak then. The .init* ELF
-                 * sections *do* get freed after boot so we *could* treat them
-                 * slightly differently with kmemleak_ignore() and only grey
-                 * them out as they work as typical memory allocations which
-                 * *do* eventually get freed, but let's just keep things simple
-                 * and avoid *any* false positives.
-		 */
-		kmemleak_not_leak(ptr);
-		if (!ptr) {
+
+		ret = module_memory_alloc(mod, type);
+		if (ret) {
 			t = type;
 			goto out_enomem;
 		}
-		memset(ptr, 0, mod->mem[type].size);
-		mod->mem[type].base = ptr;
 	}
 
 	/* Transfer each section which specifies SHF_ALLOC */
@@ -2296,7 +2310,7 @@ static int move_module(struct module *mod, struct load_info *info)
 	return 0;
 out_enomem:
 	for (t--; t >= 0; t--)
-		module_memory_free(mod->mem[t].base, t);
+		module_memory_free(mod, t);
 	return ret;
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

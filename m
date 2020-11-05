Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D33DC00A89
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 05:25:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1C6D2083B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 05:25:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="siqmlcvn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Nb9JvPnL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ea8pBGS2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1C6D2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JnWMh5YW+5z1KqRvUW27zSQzWIPFuJvIcCylO95JdJg=; b=siqmlcvnsVA5jgWpcP2ll/ebp
	NmA3q0LDvniMBH4b3VqhLilPcsXZQdQCfBskR14BlF9Rj8ROmia+PzJ7MapzAt/zghi/WNlz8YrM2
	NnJCye0QyyOCD1GnbKV3lyJ4s7J7CUlW4exT5djlAdaKExSt3+wLZ/tWwA3rYmP/ieKErbkyQjaQw
	Js0WGykJJeaqcItKD0lNi4ytkVyI2s0+JiFpBF4Vwr0miUe6kxQ0jmBUlW+L8Qvphatn+bJj+wf2i
	HI7f7xKLwXvMAiq73q6yA6t+z0bCE4QJN15uRdGDVLrqMYLoMFCOYTsbketu8ay/7dokT1t4Jelcn
	4jXAXQdEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaXlp-0005OA-Fh; Thu, 05 Nov 2020 05:25:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW3i-00016k-Kf
 for linux-riscv@merlin.infradead.org; Thu, 05 Nov 2020 03:35:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=p6gF/ok1lCk6FsPcFlhNJsqY0/AwhvgWwOWKA6Oxdqs=; b=Nb9JvPnLiaJSMCu6YuBrPB2k3P
 RDRVFvR2ODohj33xOgaqsifTXr41Igommr1zPxqJ4rZ3rBCuX59qWfjn9tzrcJ4QtLr9KBaL9Lu72
 ExzuQLBff2qZk7OH6BBS60ZJbEpo9eieO80elKMB0hSTouh04al99bP5vpTEoY6Wtm0jBn/+mNXd6
 GQocVmidcmbgxx+gmhqB/WoXS8J2LL9JZnCwu36+XHG7y7gzc+WByJCy+rLwgfHoRL3cYpYSTmYvx
 NV6vlScHIahTNBIA3y4QNqst483HIJ7KD0wY1GAHTVv+SO4pJ262ksZ5EBQquqbWf5LezWB4fKzEY
 ogofzb3w==;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaSmu-00012o-4N
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 00:06:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604535659; x=1636071659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9LXIU6uBowXoagPOvdiTOz1DEXbfskoKX8F/DlcY3rg=;
 b=ea8pBGS2+y9uiidXO6IYFrLxIkUnwF5z7sDjr4tBM5Ee9AeVDSGl1tkP
 d3RDvlUdXGsik6aGbcnbDWFuzDHYM6ZnAfs1qseUeRAVuaKFu1SwE1Otp
 +eICvWYN3Iiia5TSlyedjju7eusYlLLtBRUQB2BrbifaKzeAnx35sc+DK
 QoIkME1C4lzxe1qHAjhK/GCNegthvQuX/gODCIkesBlrcNtCCARtmASXt
 1umIePWqUm5XtWwHpZuuPYxcOx7AnSTtF6ZBFIw0tk8dTqHp6XVIQ0ADk
 juAh2Q9uEnmBTY26yriTUoG2TUb6Kj3zjkh2aWCoMIzZy4JKRyHPs7G+i w==;
IronPort-SDR: rWkhE/DEmTkeyvwp53K7BmVvQHjTFGNgqgkhOAceUalkAgCZUb3OEvRNYYXVaSuc8PTMX0MlGB
 oSn9eT1hEFroxaPbUruOCJF6f2Va7jwCahqgGNAnYW2hxYKfBlcKm/F1/atZBsmcvDXPvnoUgM
 gyWtX4PiJlTlpcYgLC7EH4eH+KhciqT3jv2gRvbqr0hbdMUfpCBp523MkSG75Z7keorKepplIr
 sulaZHcQpnAFgNZ5/ff/64z+6VYTVhOW5xzgtYwy2/CncYjpxJXDZ8Z4lebi8klegMRPNIKr3j
 jzE=
X-IronPort-AV: E=Sophos;i="5.77,451,1596470400"; d="scan'208";a="255394932"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 05 Nov 2020 08:19:30 +0800
IronPort-SDR: yuJEzyGUa8Ela8sU17+rteRc1fLddx/hTVBKRLhVzCRQzTYsip1OvqUf874HGFcE6hmwEa/waT
 IJhG+P3Z2B6OwiOjF28oEz0fQveZJj3rUMINrKJM6+p9lUwc5uEH6fA1kMltvbKSYDtZ0oreLD
 HOcQfatYnnRKvuGFdKFPKTOheSgrd5jcS2y3Kwusz+TZy1kIrJuZeAhpHl598DEbnCgVZ9BEAV
 MVQrWjvtKIFpQwWnOQe5HW5tDYQ8y+apdiUPoC9na3Z8F1Zr405Mg7JO7ujqmQQUTj11YfLkwe
 +AgvjFpHSu55jbMbl7C5eEI8
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 15:51:08 -0800
IronPort-SDR: VjqcOTAU4bApn5VGbAwSOp9Egjq3jCCKzrTI7gslDFhyCh8ji0NStWFx3qVPI68gSIzWqdSdPt
 CyFFu6ha3fvoYjzvriYI7jfvPjfv3zudT2WrELfbn8rGFMDyem6FjXsM/kQ2fBVvD5EwYaEVFg
 lkSU+ONvzotbz0drAN3a3+rGCRR2+WIwREzUrxIzabnfUiPLT2Dd7BuLIIxHOHEyGUJ/48ypsJ
 VMVK5QSZZnjDj2Cg6PK4XEgDFOpkNZDcompELIWaRXWZ1WiSElX57TKsYhnG7xFFrvQ01FCxA/
 4Go=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.117])
 by uls-op-cesaip02.wdc.com with ESMTP; 04 Nov 2020 16:05:01 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] RISC-V: Protect all kernel sections including init
 early
Date: Wed,  4 Nov 2020 16:04:38 -0800
Message-Id: <20201105000439.1491243-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105000439.1491243-1-atish.patra@wdc.com>
References: <20201105000439.1491243-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_000600_638006_D4DAF98E 
X-CRM114-Status: GOOD (  15.75  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Guo Ren <ren_guo@c-sky.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Miguel Ojeda <ojeda@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michel Lespinasse <walken@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, .init.text & .init.data are intermixed which makes it impossible
apply different permissions to them. .init.data shouldn't need exec
permissions while .init.text shouldn't have write permission. Moreover,
the strict permission are only enforced /init starts. This leaves the
kernel vulnerable from possible buggy built-in modules.

Keep .init.text & .data in separate sections so that different permissions
are applied to each section. Apply permissions to individual sections as
early as possible. This improves the kernel protection under
CONFIG_STRICT_KERNEL_RWX. We also need to restore the permissions for the
entire _init section after it is freed so that those pages can be used
for other purpose.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/sections.h   |  2 ++
 arch/riscv/include/asm/set_memory.h |  4 +++
 arch/riscv/kernel/setup.c           | 12 +++++++
 arch/riscv/kernel/vmlinux.lds.S     | 49 ++++++++++++++++-------------
 arch/riscv/mm/init.c                | 21 ++++++++++---
 arch/riscv/mm/pageattr.c            |  6 ++++
 6 files changed, 67 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
index 3a9971b1210f..1595c5b60cfd 100644
--- a/arch/riscv/include/asm/sections.h
+++ b/arch/riscv/include/asm/sections.h
@@ -9,5 +9,7 @@
 
 extern char _start[];
 extern char _start_kernel[];
+extern char __init_data_begin[], __init_data_end[];
+extern char __init_text_begin[], __init_text_end[];
 
 #endif /* __ASM_SECTIONS_H */
diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index 4c5bae7ca01c..b21f4bea6434 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -15,11 +15,15 @@ int set_memory_ro(unsigned long addr, int numpages);
 int set_memory_rw(unsigned long addr, int numpages);
 int set_memory_x(unsigned long addr, int numpages);
 int set_memory_nx(unsigned long addr, int numpages);
+int set_memory_rw_nx(unsigned long addr, int numpages);
+void protect_kernel_text_data(void);
 #else
 static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
+static inline void protect_kernel_text_data(void) {};
+static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
 #endif
 
 int set_direct_map_invalid_noflush(struct page *page);
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index b916f4a904c4..0cbbf62c7747 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -22,6 +22,7 @@
 #include <asm/cpu_ops.h>
 #include <asm/early_ioremap.h>
 #include <asm/setup.h>
+#include <asm/set_memory.h>
 #include <asm/sections.h>
 #include <asm/sbi.h>
 #include <asm/tlbflush.h>
@@ -92,6 +93,8 @@ void __init setup_arch(char **cmdline_p)
 	if (IS_ENABLED(CONFIG_RISCV_SBI))
 		sbi_init();
 
+	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
+		protect_kernel_text_data();
 #ifdef CONFIG_SWIOTLB
 	swiotlb_init(1);
 #endif
@@ -121,3 +124,12 @@ static int __init topology_init(void)
 	return 0;
 }
 subsys_initcall(topology_init);
+
+void free_initmem(void)
+{
+	unsigned long init_begin = (unsigned long)__init_begin;
+	unsigned long init_end = (unsigned long)__init_end;
+
+	set_memory_rw_nx(init_begin, (init_end - init_begin) >> PAGE_SHIFT);
+	free_initmem_default(POISON_FREE_INITMEM);
+}
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index cacd7898ba7f..ca19ee5acd0a 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -29,6 +29,22 @@ SECTIONS
 	HEAD_TEXT_SECTION
 	. = ALIGN(PAGE_SIZE);
 
+	.text : {
+		_text = .;
+		_stext = .;
+		TEXT_TEXT
+		SCHED_TEXT
+		CPUIDLE_TEXT
+		LOCK_TEXT
+		KPROBES_TEXT
+		ENTRY_TEXT
+		IRQENTRY_TEXT
+		SOFTIRQENTRY_TEXT
+		*(.fixup)
+		_etext = .;
+	}
+
+	. = ALIGN(SECTION_ALIGN);
 	__init_begin = .;
 	__init_text_begin = .;
 	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) ALIGN(SECTION_ALIGN) { \
@@ -53,35 +69,24 @@ SECTIONS
 	{
 		EXIT_TEXT
 	}
-	.exit.data :
-	{
-		EXIT_DATA
-	}
-	PERCPU_SECTION(L1_CACHE_BYTES)
-	__init_end = .;
 
+	__init_text_end = .;
 	. = ALIGN(SECTION_ALIGN);
-	.text : {
-		_text = .;
-		_stext = .;
-		TEXT_TEXT
-		SCHED_TEXT
-		CPUIDLE_TEXT
-		LOCK_TEXT
-		KPROBES_TEXT
-		ENTRY_TEXT
-		IRQENTRY_TEXT
-		SOFTIRQENTRY_TEXT
-		*(.fixup)
-		_etext = .;
-	}
-
 #ifdef CONFIG_EFI
 	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
 	__pecoff_text_end = .;
 #endif
-
+	/* Start of init data section */
+	__init_data_begin = .;
 	INIT_DATA_SECTION(16)
+	.exit.data :
+	{
+		EXIT_DATA
+	}
+	PERCPU_SECTION(L1_CACHE_BYTES)
+
+	__init_data_end = .;
+	__init_end = .;
 
 	/* Start of data section */
 	_sdata = .;
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0d13d0c36a7d..00793f3c837e 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -622,18 +622,29 @@ static inline void setup_vm_final(void)
 #endif /* CONFIG_MMU */
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
-void mark_rodata_ro(void)
+void protect_kernel_text_data(void)
 {
-	unsigned long text_start = (unsigned long)_text;
-	unsigned long text_end = (unsigned long)_etext;
+	unsigned long text_start = (unsigned long)_start;
+	unsigned long init_text_start = (unsigned long)__init_text_begin;
+	unsigned long init_data_start = (unsigned long)__init_data_begin;
 	unsigned long rodata_start = (unsigned long)__start_rodata;
 	unsigned long data_start = (unsigned long)_data;
 	unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
 
-	set_memory_ro(text_start, (text_end - text_start) >> PAGE_SHIFT);
-	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
+	set_memory_ro(text_start, (init_text_start - text_start) >> PAGE_SHIFT);
+	set_memory_ro(init_text_start, (init_data_start - init_text_start) >> PAGE_SHIFT);
+	set_memory_nx(init_data_start, (rodata_start - init_data_start) >> PAGE_SHIFT);
+	/* rodata section is marked readonly in mark_rodata_ro */
 	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
 	set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
+}
+
+void mark_rodata_ro(void)
+{
+	unsigned long rodata_start = (unsigned long)__start_rodata;
+	unsigned long data_start = (unsigned long)_data;
+
+	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
 
 	debug_checkwx();
 }
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 19fecb362d81..c64ec224fd0c 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -128,6 +128,12 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 	return ret;
 }
 
+int set_memory_rw_nx(unsigned long addr, int numpages)
+{
+	return __set_memory(addr, numpages, __pgprot(_PAGE_READ | _PAGE_WRITE),
+			    __pgprot(_PAGE_EXEC));
+}
+
 int set_memory_ro(unsigned long addr, int numpages)
 {
 	return __set_memory(addr, numpages, __pgprot(_PAGE_READ),
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

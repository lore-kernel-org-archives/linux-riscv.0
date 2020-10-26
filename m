Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A529EC56202
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 23:03:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5837420708
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 23:03:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tormdiD4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="TINKrKy1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5837420708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oywE//1iXDBCyZMx/g2q51Gaz+jyhPQi+ZXU++cKzDw=; b=tormdiD4MrtCitBw7gI19k1yX
	QoRXXSgmXFbYBSCnc/8iMMZfO9Pqq19sern8kdCtQfMSKoBHmyHpdRBDtf5HX8gbZAlyfrHivX0wm
	zkpY7xzgZ0OHlaoFladcnJPJSojoMl+0gUeqV0bIlmBRFngaGP3j0Owje1pHFagZTsqi7g5+r3gd7
	ISEhANtyxlX301o1K28/yYIdBq652NzL0QSBGqhs1vNVJ0OrPhxuBQNRXLbh/l6q144HKBmBLfklM
	LOHVxqzca6fYMg7AA4XMaO8Pr3ov3xDYHtqmtjCKxEsovZf2SC8BX2f1MoGNWIVVI8nitiQVuE4Vv
	pVqjtr42Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXBWa-0004KB-4Y; Mon, 26 Oct 2020 23:03:36 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXBWU-0004H6-Er
 for linux-riscv@lists.infradead.org; Mon, 26 Oct 2020 23:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603753410; x=1635289410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iPUv/PUCUw9poafNmoCWlV7tTLouxKtDuq6y3HZQDjc=;
 b=TINKrKy1j7UvdoiLMTeHUQ/tMBzQuLtdTEH/fWFrgO6GS+tfZcEZ8JHu
 Cl2FOprdMaFJ02crvI0iY3uM/H++1sZNJlYKC81UfIWEROxDKgp0pdDI4
 I6QBWtOpDcvdfYolhms30rt3tqELl2JP1csmhLb78lJbIgcwbZkAu0D0M
 0hblQSEchmVhvcSFc3cket/LBv6gEqdvViw+5WKkCsT5sKuBEmjZ5N8Mo
 6BaHAosKbWj4CtithfGsVHfyhVkX0czQFMHbgAWBkfUNdLyj+svAGcBaF
 /L1NRhojdJC+/A7+0TRv7wF65E3xRBRVb1jPZdwTp024gNcjRa6N//K/Z Q==;
IronPort-SDR: CsILWxdqzjyqU2FwYLjPK+jZdSUoiFWfCLCK+zomYaBEEBdHYGDeaNr7VvK9zze/GpA6btdait
 F1JdnNzUJfawMwtwWVtbM80tYohxjLjTkce7af85Ed+TPHgSzENYmGcC6ODWnQ8/RUXMWmX19Z
 sHcoBfNu6L8r42mWepVbU0Iwl9uNPRG3jHzlJ8w8gSj+DWbjwfR8WWgSnONL6BjmJA88gqBS1q
 M/Bwcdr2OMD5ks7Gp2TfMj/7ykp/9agc8yDoViH+z7+v/8XjJohC59tKu6NIkStZgO3jdA79cN
 fMM=
X-IronPort-AV: E=Sophos;i="5.77,421,1596470400"; d="scan'208";a="152152914"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 27 Oct 2020 07:03:25 +0800
IronPort-SDR: 3u2+d01NfPNLyJepvSU9gqztIqwBrsJhqYka2NFJ9fpUx5JTnhNRJABKy6ymocr+VACsvFbW0b
 6IrLWS8PlkhTEoMNENQpQZY/Dg3kkiMoplXxpCudshL4S7UCtXcY4cloLua+RDS0oHtpSFbVzU
 Y+X7uqSvXZrCUQOkIV5UCjT224FgPTw2OAhCeEAyTTPpgudiMZjzE9YrQNgG4A+BLF2tUVsuBR
 BImVlogyHkN9O4t2kyVGoYGTNHNi5bqZhvUwAY1RNzRvcA+vQD0w7T2SoaguxxMPOwTACcF/d3
 Z+sMS87NekBWHXBRqTecgl0W
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 15:48:36 -0700
IronPort-SDR: ey/+IpD7q+PZFkntsCEL5kRkGMghTUQ92D4aSwCY0hicm+MUionuNfl6dBlx3Gh91OzXB6oKuq
 FIrt8TuWoscWKGL5FZGzu4oj0jqXFxfqAjrHGnQLM0h4LD3Er1WjUcaV2wAoJI00VcLs3/mXyS
 /Prep/fH4qGRAmABa+qjbQbvBrGkfszca5mZUfa2SOTn3Nb0sYaGlEKe6wEY2Vo3ZSHVRn7fll
 21NHZZZaa3XJN3YV/d0MMiVrPYSdIbcOhg7XGcbFSgMmsM0NEy7Y5E1i8priVbwPj6Z7qmOgj+
 tBg=
WDCIronportException: Internal
Received: from 8223p12.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.110])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Oct 2020 16:03:26 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] RISC-V: Protect .init.text & .init.data
Date: Mon, 26 Oct 2020 16:02:53 -0700
Message-Id: <20201026230254.911912-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026230254.911912-1-atish.patra@wdc.com>
References: <20201026230254.911912-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_190330_837440_84C45BC2 
X-CRM114-Status: GOOD (  19.16  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>,
 Michel Lespinasse <walken@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, .init.text & .init.data are intermixed which makes it impossible
apply different permissions to them. .init.data shouldn't need exec
permissions while .init.text shouldn't have write permission.

Keep them in separate sections so that different permissions are applied to
each section. This improves the kernel protection under
CONFIG_STRICT_KERNEL_RWX. We also need to restore the permissions for the
entire _init section after it is freed so that those pages can be used for
other purpose.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/sections.h   |  2 ++
 arch/riscv/include/asm/set_memory.h |  2 ++
 arch/riscv/kernel/setup.c           |  9 +++++
 arch/riscv/kernel/vmlinux.lds.S     | 51 ++++++++++++++++-------------
 arch/riscv/mm/init.c                |  8 ++++-
 arch/riscv/mm/pageattr.c            |  6 ++++
 6 files changed, 54 insertions(+), 24 deletions(-)

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
index 4cc3a4e2afd3..913429c9c1ae 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -15,6 +15,7 @@ int set_memory_ro(unsigned long addr, int numpages);
 int set_memory_rw(unsigned long addr, int numpages);
 int set_memory_x(unsigned long addr, int numpages);
 int set_memory_nx(unsigned long addr, int numpages);
+int set_memory_default(unsigned long addr, int numpages);
 void protect_kernel_text_data(void);
 #else
 static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
@@ -22,6 +23,7 @@ static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
 static inline void protect_kernel_text_data(void) {};
+static inline int set_memory_default(unsigned long addr, int numpages) { return 0; }
 #endif
 
 int set_direct_map_invalid_noflush(struct page *page);
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index b722c5bf892c..abfbdc8cfef3 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -123,3 +123,12 @@ static int __init topology_init(void)
 	return 0;
 }
 subsys_initcall(topology_init);
+
+void free_initmem(void)
+{
+	unsigned long init_begin = (unsigned long)__init_begin;
+	unsigned long init_end = (unsigned long)__init_end;
+
+	set_memory_default(init_begin, (init_end - init_begin) >> PAGE_SHIFT);
+	free_initmem_default(POISON_FREE_INITMEM);
+}
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index cacd7898ba7f..0a1874e48e8a 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -29,6 +29,26 @@ SECTIONS
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
+#ifdef CONFIG_EFI
+	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
+	__pecoff_text_end = .;
+#endif
+	. = ALIGN(SECTION_ALIGN);
 	__init_begin = .;
 	__init_text_begin = .;
 	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) ALIGN(SECTION_ALIGN) { \
@@ -53,35 +73,20 @@ SECTIONS
 	{
 		EXIT_TEXT
 	}
+
+	__init_text_end = .;
+	. = ALIGN(SECTION_ALIGN);
+	/* Start of init data section */
+	__init_data_begin = .;
+	INIT_DATA_SECTION(16)
 	.exit.data :
 	{
 		EXIT_DATA
 	}
 	PERCPU_SECTION(L1_CACHE_BYTES)
-	__init_end = .;
 
-	. = ALIGN(SECTION_ALIGN);
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
-#ifdef CONFIG_EFI
-	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
-	__pecoff_text_end = .;
-#endif
-
-	INIT_DATA_SECTION(16)
+	__init_data_end = .;
+	__init_end = .;
 
 	/* Start of data section */
 	_sdata = .;
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5f196f8158d4..1bb3821d81d5 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -610,13 +610,19 @@ static inline void setup_vm_final(void)
 #ifdef CONFIG_STRICT_KERNEL_RWX
 void protect_kernel_text_data(void)
 {
-	unsigned long text_start = (unsigned long)_text;
+	unsigned long text_start = (unsigned long)_start;
 	unsigned long text_end = (unsigned long)_etext;
+	unsigned long init_text_start = (unsigned long)__init_text_begin;
+	unsigned long init_text_end = (unsigned long)__init_text_end;
+	unsigned long init_data_start = (unsigned long)__init_data_begin;
+	unsigned long init_data_end = (unsigned long)__init_data_end;
 	unsigned long rodata_start = (unsigned long)__start_rodata;
 	unsigned long data_start = (unsigned long)_data;
 	unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
 
+	set_memory_ro(init_text_start, (init_text_end - init_text_start) >> PAGE_SHIFT);
 	set_memory_ro(text_start, (text_end - text_start) >> PAGE_SHIFT);
+	set_memory_nx(init_data_start, (init_data_end - init_data_start) >> PAGE_SHIFT);
 	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
 	set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
 }
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 19fecb362d81..04f3fc16aa9c 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -128,6 +128,12 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 	return ret;
 }
 
+int set_memory_default(unsigned long addr, int numpages)
+{
+	return __set_memory(addr, numpages, __pgprot(_PAGE_KERNEL),
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

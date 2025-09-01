Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EF1CA0FFF
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 17:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/gdT0iYM3HMbpNIgliFzppBmoglthxaudeQTl4ee2dU=; b=XsY/8W+ZK+rhiY
	21ow7hYOfBB+LpJzbp8Fyh8yW+KH1Q0qWFZ59mjrSEnU0zO9PHmsOsE69VyPJgTmfqdCEb2rSiqsr
	rCdCCgR9IjxLJxxuIsIpoqr38+mxZiHN8uOeXdSgbIEat9d8ZJmbz4+I9Fn7DjbCZFdUKfNDoW/44
	MVXtPmu9zaE6hLy7UqxzdrVPM2OZNJ2ZWbCCdWVq+ctvW00fKkjxzhMZquQEaSVVSgofNagV1oBZz
	rjVg/AbsUEvJjmJ8AAVGVYMnMthTT74UqmoGKy8qr0iL7yvbgRqgu9MjJCw5FLx15DV384TeARnXJ
	f0VTCsZcepm7szhbV+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut87K-0000000DQiX-1OID;
	Mon, 01 Sep 2025 17:14:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4zW-0000000CmQ2-3mY7
	for linux-riscv@bombadil.infradead.org;
	Mon, 01 Sep 2025 13:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ozw0O54FHk+TR7i9YrzO3JawV9UWD7KG8XrbYOvortQ=; b=Dxp8JVJVcNMtaTxIQjQb7TDnf8
	oG9eX0TYDAVdUXPNdll8+YLHKKTyEn+DGTDOhMidbMpa8HLJ0l6R5P1EhiOLZGrfg650CkjMDNOet
	Ttp32t1rwIU3hAl7I45M7xp6tck1SROhM9HfuRNhPJSw/VPMrEgTkgCOv8SG6V8jcRdIYwI4rl34P
	PJMdhhUBAf/m4w5aUsohnZMsCLNDofwZ/YeoAyXKM3TxN+NootRv+XgymcnDS7v91XJT1EjxPQCcS
	FSDyMAIVl8/1y9ZinmarPNWMgIk2upLZRot5Zo5/99sNEThYp8DiRPxIjSJeuLkl/LJh4uPyY08S3
	8mZm3jMQ==;
Received: from m.syntacore.com ([178.249.69.228])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4zT-00000003kP8-2OPX
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 13:54:37 +0000
Received: from MRN-SC-KSMG-01.corp.syntacore.com (localhost [127.0.0.1])
	by m.syntacore.com (Postfix) with ESMTP id 0FFE71A0004;
	Mon,  1 Sep 2025 13:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.syntacore.com 0FFE71A0004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=m;
	t=1756734871; bh=Ozw0O54FHk+TR7i9YrzO3JawV9UWD7KG8XrbYOvortQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=peyNlvWFhWIz1gS25XmRT+Gl87AHdP2bmsj7MxlSrvVwy0Hw2XYGoSh1GMIoRvZ5C
	 VCHoSk4RDu3pZzD6he2aBgueonopmlK7H8M4R66UiNdl60h9xk9b3JRFOhyyhCz/VL
	 UHG0iX8oYOSp5MK5/MgGQp+AVR5jRUrCu4y2eRyRFk1nFu+ph4ayO1Amp5LY2TMxfo
	 /OHlpSgFPnq8PsDKeDReiv4K8STUDGC7L17urcTh+doMyuqZQY+Sc7wWfwzw0WooOl
	 jPDi6uLMVuWwg1JwtD8CNEduS9boa+Y4pnatDgl3sdCm7Pzx2YHNtMjN5vqsrQbof8
	 QgwW/n2bUoqeA==
Received: from S-SC-EXCH-01.corp.syntacore.com (mail.syntacore.com [10.76.202.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by m.syntacore.com (Postfix) with ESMTPS;
	Mon,  1 Sep 2025 13:54:28 +0000 (UTC)
Received: from localhost (10.30.18.228) by S-SC-EXCH-01.corp.syntacore.com
 (10.76.202.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 1 Sep
 2025 16:54:21 +0300
From: Svetlana Parfenova <svetlana.parfenova@syntacore.com>
To: <linux-fsdevel@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.f>, <viro@zeniv.linux.org.uk>, <brauner@kernel.org>,
	<jack@suse.cz>, <kees@kernel.org>, <akpm@linux-foundation.org>,
	<david@redhat.com>, <lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>,
	<vbabka@suse.cz>, <rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<svetlana.parfenova@syntacore.com>
Subject: [RFC RESEND v3] binfmt_elf: preserve original ELF e_flags for core dumps
Date: Mon, 1 Sep 2025 20:53:50 +0700
Message-ID: <20250901135350.619485-1-svetlana.parfenova@syntacore.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250806161814.607668-1-svetlana.parfenova@syntacore.com>
References: <20250806161814.607668-1-svetlana.parfenova@syntacore.com>
MIME-Version: 1.0
X-Originating-IP: [10.30.18.228]
X-ClientProxiedBy: S-SC-EXCH-01.corp.syntacore.com (10.76.202.20) To
 S-SC-EXCH-01.corp.syntacore.com (10.76.202.20)
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/09/01 12:41:00 #27718494
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_145435_821813_381CD73B 
X-CRM114-Status: GOOD (  22.36  )
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

Some architectures, such as RISC-V, use the ELF e_flags field to encode
ABI-specific information (e.g., ISA extensions, fpu support). Debuggers
like GDB rely on these flags in core dumps to correctly interpret
optional register sets. If the flags are missing or incorrect, GDB may
warn and ignore valid data, for example:

    warning: Unexpected size of section '.reg2/213' in core file.

This can prevent access to fpu or other architecture-specific registers
even when they were dumped.

Save the e_flags field during ELF binary loading (in load_elf_binary())
into the mm_struct, and later retrieve it during core dump generation
(in fill_note_info()). Kconfig option CONFIG_ARCH_HAS_ELF_CORE_EFLAGS
is introduced for architectures that require this behaviour.

Signed-off-by: Svetlana Parfenova <svetlana.parfenova@syntacore.com>
---
Changes in v3:
 - Introduce CONFIG_ARCH_HAS_ELF_CORE_EFLAGS Kconfig option instead of
   arch-specific ELF_CORE_USE_PROCESS_EFLAGS define.
 - Add helper functions to set/get e_flags in mm_struct.
 - Wrap saved_e_flags field of mm_struct with
   #ifdef CONFIG_ARCH_HAS_ELF_CORE_EFLAGS.

Changes in v2:
 - Remove usage of Kconfig option.
 - Add an architecture-optional macro to set process e_flags. Enabled
   by defining ELF_CORE_USE_PROCESS_EFLAGS. Defaults to no-op if not
   used.

 arch/riscv/Kconfig       |  1 +
 fs/Kconfig.binfmt        |  9 +++++++++
 fs/binfmt_elf.c          | 40 ++++++++++++++++++++++++++++++++++------
 include/linux/mm_types.h |  5 +++++
 4 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a4b233a0659e..1bef00208bdd 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -224,6 +224,7 @@ config RISCV
 	select VDSO_GETRANDOM if HAVE_GENERIC_VDSO
 	select USER_STACKTRACE_SUPPORT
 	select ZONE_DMA32 if 64BIT
+	select ARCH_HAS_ELF_CORE_EFLAGS
 
 config RUSTC_SUPPORTS_RISCV
 	def_bool y
diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
index bd2f530e5740..1949e25c7741 100644
--- a/fs/Kconfig.binfmt
+++ b/fs/Kconfig.binfmt
@@ -184,4 +184,13 @@ config EXEC_KUNIT_TEST
 	  This builds the exec KUnit tests, which tests boundary conditions
 	  of various aspects of the exec internals.
 
+config ARCH_HAS_ELF_CORE_EFLAGS
+	bool
+	depends on BINFMT_ELF && ELF_CORE
+	default n
+	help
+	  Select this option if the architecture makes use of the e_flags
+	  field in the ELF header to store ABI or other architecture-specific
+	  information that should be preserved in core dumps.
+
 endmenu
diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 4aacf9c9cc2d..e4653bb99946 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -103,6 +103,21 @@ static struct linux_binfmt elf_format = {
 
 #define BAD_ADDR(x) (unlikely((unsigned long)(x) >= TASK_SIZE))
 
+static inline void elf_coredump_set_mm_eflags(struct mm_struct *mm, u32 flags)
+{
+#ifdef CONFIG_ARCH_HAS_ELF_CORE_EFLAGS
+	mm->saved_e_flags = flags;
+#endif
+}
+
+static inline u32 elf_coredump_get_mm_eflags(struct mm_struct *mm, u32 flags)
+{
+#ifdef CONFIG_ARCH_HAS_ELF_CORE_EFLAGS
+	flags = mm->saved_e_flags;
+#endif
+	return flags;
+}
+
 /*
  * We need to explicitly zero any trailing portion of the page that follows
  * p_filesz when it ends before the page ends (e.g. bss), otherwise this
@@ -1290,6 +1305,8 @@ static int load_elf_binary(struct linux_binprm *bprm)
 	mm->end_data = end_data;
 	mm->start_stack = bprm->p;
 
+	elf_coredump_set_mm_eflags(mm, elf_ex->e_flags);
+
 	/**
 	 * DOC: "brk" handling
 	 *
@@ -1804,6 +1821,8 @@ static int fill_note_info(struct elfhdr *elf, int phdrs,
 	struct elf_thread_core_info *t;
 	struct elf_prpsinfo *psinfo;
 	struct core_thread *ct;
+	u16 machine;
+	u32 flags;
 
 	psinfo = kmalloc(sizeof(*psinfo), GFP_KERNEL);
 	if (!psinfo)
@@ -1831,17 +1850,26 @@ static int fill_note_info(struct elfhdr *elf, int phdrs,
 		return 0;
 	}
 
-	/*
-	 * Initialize the ELF file header.
-	 */
-	fill_elf_header(elf, phdrs,
-			view->e_machine, view->e_flags);
+	machine = view->e_machine;
+	flags = view->e_flags;
 #else
 	view = NULL;
 	info->thread_notes = 2;
-	fill_elf_header(elf, phdrs, ELF_ARCH, ELF_CORE_EFLAGS);
+	machine = ELF_ARCH;
+	flags = ELF_CORE_EFLAGS;
 #endif
 
+	/*
+	 * Override ELF e_flags with value taken from process,
+	 * if arch needs that.
+	 */
+	flags = elf_coredump_get_mm_eflags(dump_task->mm, flags);
+
+	/*
+	 * Initialize the ELF file header.
+	 */
+	fill_elf_header(elf, phdrs, machine, flags);
+
 	/*
 	 * Allocate a structure for each thread.
 	 */
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 08bc2442db93..04a2857f12f2 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1102,6 +1102,11 @@ struct mm_struct {
 
 		unsigned long saved_auxv[AT_VECTOR_SIZE]; /* for /proc/PID/auxv */
 
+#ifdef CONFIG_ARCH_HAS_ELF_CORE_EFLAGS
+		/* the ABI-related flags from the ELF header. Used for core dump */
+		unsigned long saved_e_flags;
+#endif
+
 		struct percpu_counter rss_stat[NR_MM_COUNTERS];
 
 		struct linux_binfmt *binfmt;
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

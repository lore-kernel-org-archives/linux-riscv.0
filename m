Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83592C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 12:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4okPr6+StxkhKp00yF/LMo0tQW9wxXZ2bSQTiVfM100=; b=laGOkV+acNs6zf
	jw2IFj6XET989m0y5GjbVk6jDVAm6OXtBBgW3jh/whwQyXsgm0LHJO36uZ3fXiF0yvld/o0WblsQB
	ilx6XLhPCn8cnL75hN6ybN/qYe44Rc3TjRO98Y5IkGMm+NsMJMlGxNzgEtRRgyH0/dUSUP9usOSTc
	F910szntgTaIPXZsjv90ES9P73yZ/jbYF/K7d3jeovkkwtimk9DsZLABZzj8pt0CvzbdaLJliiRh4
	1olO8A6cRZBxswrkZKeeSWAVlEQGSrFUaj6wQjKispQOqzUDaWdEjOw8vHHiVVMyB3/c1XnswM5xF
	1bKt7otNive0d6mzf/4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEsGa-00C54P-DP; Tue, 01 Feb 2022 12:28:12 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEsGO-00C50r-Q0; Tue, 01 Feb 2022 12:28:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04E2D113E;
 Tue,  1 Feb 2022 04:27:57 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.45.192])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1A8373F73B;
 Tue,  1 Feb 2022 04:27:52 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 Russell King <linux@armlinux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mm/hugetlb: Generalize ARCH_WANT_GENERAL_HUGETLB
Date: Tue,  1 Feb 2022 17:57:45 +0530
Message-Id: <1643718465-4324-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_042800_960526_60FB7669 
X-CRM114-Status: GOOD (  11.31  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ARCH_WANT_GENERAL_HUGETLB config has duplicate definitions on platforms
that subscribe it. Instead make it a generic config option which can be
selected on applicable platforms when required.

Cc: Russell King <linux@armlinux.org.uk>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This applies on v5.17-rc2

 arch/arm/Kconfig   | 4 +---
 arch/riscv/Kconfig | 4 +---
 arch/x86/Kconfig   | 4 +---
 mm/Kconfig         | 3 +++
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 4c97cb40eebb..ba6ba78a9cb6 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -37,6 +37,7 @@ config ARM
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_MEMTEST
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
+	select ARCH_WANT_GENERAL_HUGETLB
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
@@ -1508,9 +1509,6 @@ config HW_PERF_EVENTS
 	def_bool y
 	depends on ARM_PMU
 
-config ARCH_WANT_GENERAL_HUGETLB
-	def_bool y
-
 config ARM_MODULE_PLTS
 	bool "Use PLTs to allow module memory to spill over into vmalloc area"
 	depends on MODULES
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5adcbd9b5e88..0804b9a11934 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -40,6 +40,7 @@ config RISCV
 	select ARCH_USE_MEMTEST
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
+	select ARCH_WANT_GENERAL_HUGETLB
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
 	select BUILDTIME_TABLE_SORT if MMU
@@ -171,9 +172,6 @@ config ARCH_SPARSEMEM_ENABLE
 config ARCH_SELECT_MEMORY_MODEL
 	def_bool ARCH_SPARSEMEM_ENABLE
 
-config ARCH_WANT_GENERAL_HUGETLB
-	def_bool y
-
 config ARCH_SUPPORTS_UPROBES
 	def_bool y
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 9f5bd41bf660..37372cd5c9a7 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -118,6 +118,7 @@ config X86
 	select ARCH_WANT_DEFAULT_BPF_JIT	if X86_64
 	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
 	select ARCH_WANTS_NO_INSTR
+	select ARCH_WANT_GENERAL_HUGETLB
 	select ARCH_WANT_HUGE_PMD_SHARE
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANTS_THP_SWAP		if X86_64
@@ -347,9 +348,6 @@ config ARCH_NR_GPIO
 config ARCH_SUSPEND_POSSIBLE
 	def_bool y
 
-config ARCH_WANT_GENERAL_HUGETLB
-	def_bool y
-
 config AUDIT_ARCH
 	def_bool y if X86_64
 
diff --git a/mm/Kconfig b/mm/Kconfig
index 3326ee3903f3..46e460164d91 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -411,6 +411,9 @@ choice
 	  benefit.
 endchoice
 
+config ARCH_WANT_GENERAL_HUGETLB
+	bool
+
 config ARCH_WANTS_THP_SWAP
 	def_bool n
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

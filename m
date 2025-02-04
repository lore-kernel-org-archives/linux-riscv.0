Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1DBC02198
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 20:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FmzwlsGm+7Ei8F3uTSXMYBstg1XaByfBTyI3lyqqu8=; b=lHpy2HJmuqA9SO
	rBGwnqxdPhwEsQdAVgrFEyvSOEq/MS9WJy67WO7p100vV1Zabaz2VcQq2973klx/S0ghIFNili09b
	biRlMryJnqxdSXnsMksJk/jcYmYZCKiBhPPC2R6oG4wwQKkEfqn5drhipsbgUm4vCTxjcDnBAvaPq
	hHhF3o7h26HCvkOnZAfRd6yVQgEwIqgpYZTnC6r5pbJtaxGHE8gCxQsAhMrboypdgVgyyK6xGz10g
	aVxqMVAEnp6Otjlyx3SMS99rf2NW6A6GmntRSlcSy9C345SskgEMzgJAmHwFHbBBd+AY3p4U0Ut6V
	I6YqVeDcNqq2waiZUfsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfP6Y-00000001SaS-31vK;
	Tue, 04 Feb 2025 20:01:06 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMrm-000000018Dt-0ERI;
	Tue, 04 Feb 2025 17:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690662; x=1770226662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ht7/TOmkT+iwiNKb8KTAnbXFoYcUy6oM0kb2gCQ20Wc=;
  b=F7XPcWxSQup1ygaEE4vV/PWueMPDhbOr0FzR6ddIpOXvVpoZSVPg1nE/
   kcG1v8fwsa+EsIZRi0rP4HHzE1wXY+tHjxZHWq+nRwAE/oSQRCCYpDqBQ
   yijZXa1EbEH+U5IFB4twvX2G5i6atp0HhpKOlXXXTkOnVFh/DOerx5R1F
   kccGlRtx0y8D6qB9vcEAKUcdYGlcHpipjgdDkBiDQ3CpHHtopKJZKABzo
   4JSJ5HgXSZ+iO5rwG0DmxYGlVNK/7O9FT5/ZFJCa5KJll48xBpoV+tarO
   tyVf4cv8Lm7byHgk7l/qd+uz9xXXSm+3A6rvFasEDSM1DZ3vQOy+h/v6G
   w==;
X-CSE-ConnectionGUID: rRMZ7G2kTxm/JpOco32ztA==
X-CSE-MsgGUID: 5LUiSiEgQ0K4nAEyFCHpYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38931220"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38931220"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:37:41 -0800
X-CSE-ConnectionGUID: UAr5/zW7Rha56MjtNiYK0Q==
X-CSE-MsgGUID: 2nPTC7p0TeC/cQLyC4Ywqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147867266"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:37:29 -0800
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: luto@kernel.org,
	xin@zytor.com,
	kirill.shutemov@linux.intel.com,
	palmer@dabbelt.com,
	tj@kernel.org,
	andreyknvl@gmail.com,
	brgerst@gmail.com,
	ardb@kernel.org,
	dave.hansen@linux.intel.com,
	jgross@suse.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	corbet@lwn.net,
	maciej.wieczor-retman@intel.com,
	dvyukov@google.com,
	richard.weiyang@gmail.com,
	ytcoode@gmail.com,
	tglx@linutronix.de,
	hpa@zytor.com,
	seanjc@google.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	justinstitt@google.com,
	jason.andryuk@amd.com,
	glider@google.com,
	ubizjak@gmail.com,
	jannh@google.com,
	bhe@redhat.com,
	vincenzo.frascino@arm.com,
	rafael.j.wysocki@intel.com,
	ndesaulniers@google.com,
	mingo@redhat.com,
	catalin.marinas@arm.com,
	junichi.nomura@nec.com,
	nathan@kernel.org,
	ryabinin.a.a@gmail.com,
	dennis@kernel.org,
	bp@alien8.de,
	kevinloughlin@google.com,
	morbo@google.com,
	dan.j.williams@intel.com,
	julian.stecklina@cyberus-technology.de,
	peterz@infradead.org,
	cl@linux.com,
	kees@kernel.org
Cc: kasan-dev@googlegroups.com,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [PATCH 15/15] kasan: Add mititgation and debug modes
Date: Tue,  4 Feb 2025 18:33:56 +0100
Message-ID: <450a1fe078b0e07bf2e4f3098c9110c9959c6524.1738686764.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_093742_172574_C5B52C12 
X-CRM114-Status: GOOD (  12.99  )
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

With smaller memory footprint KASAN could be used in production systems.
One problem is that saving stacktraces slowes memory allocation
substantially - with KASAN enabled up to 90% of time spent on kmalloc()
is spent on saving the stacktrace.

Add mitigation mode to allow the option for running KASAN focused on
performance and security. In mitigation mode disable saving stacktraces
and set fault mode to always panic on KASAN error as a security
mechanism.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 lib/Kconfig.kasan | 28 ++++++++++++++++++++++++++++
 mm/kasan/report.c |  4 ++++
 mm/kasan/tags.c   |  5 +++++
 3 files changed, 37 insertions(+)

diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index d08b4e9bf477..6daa62b40dea 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -244,4 +244,32 @@ config KASAN_SW_TAGS_DENSE
 	  ARCH_HAS_KASAN_SW_TAGS_DENSE is needed for this option since the
 	  special tag macros need to be properly set for 4-bit wide tags.
 
+choice
+	prompt "KASAN operation mode"
+	default KASAN_OPERATION_DEBUG
+	help
+	  Choose between the mitigation or debug operation modes.
+
+	  The first one disables stacktrace saving and enables panic on error.
+	  Faster memory allocation but less information. The second one is the
+	  default where KASAN operates with full functionality.
+
+config KASAN_OPERATION_DEBUG
+	bool "Debug operation mode"
+	depends on KASAN
+	help
+	  The default mode. Full functionality and all boot parameters
+	  available.
+
+config KASAN_OPERATION_MITIGATION
+	bool "Mitigation operation mode"
+	depends on KASAN
+	help
+	  Operation mode dedicated at faster operation at the cost of less
+	  information collection. Disables stacktrace saving for faster
+	  allocations and forces panic on KASAN error to mitigate malicious
+	  attacks.
+
+endchoice
+
 endif # KASAN
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index ee9e406b0cdb..ae989d3bd919 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -47,7 +47,11 @@ enum kasan_arg_fault {
 	KASAN_ARG_FAULT_PANIC_ON_WRITE,
 };
 
+#ifdef CONFIG_KASAN_OPERATION_MITIGATION
+static enum kasan_arg_fault kasan_arg_fault __ro_after_init = KASAN_ARG_FAULT_PANIC;
+#else
 static enum kasan_arg_fault kasan_arg_fault __ro_after_init = KASAN_ARG_FAULT_DEFAULT;
+#endif
 
 /* kasan.fault=report/panic */
 static int __init early_kasan_fault(char *arg)
diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
index c111d98961ed..2414cddeaaf3 100644
--- a/mm/kasan/tags.c
+++ b/mm/kasan/tags.c
@@ -78,6 +78,11 @@ early_param("kasan.stack_ring_size", early_kasan_flag_stack_ring_size);
 
 void __init kasan_init_tags(void)
 {
+	if (IS_ENABLED(CONFIG_KASAN_OPERATION_MITIGATION)) {
+		static_branch_disable(&kasan_flag_stacktrace);
+		return;
+	}
+
 	switch (kasan_arg_stacktrace) {
 	case KASAN_ARG_STACKTRACE_DEFAULT:
 		/* Default is specified by kasan_flag_stacktrace definition. */
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

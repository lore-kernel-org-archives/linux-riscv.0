Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BA1C02199
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 20:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sAbTDyS8uNjxiSUz4c+yVNV0teMEq4PCCGjKQoiaBl0=; b=sg39lmqb7ZKynn
	gr4qytFFIcQRwZ/aksYZEs9rQJZgB58VeR4/83lVAkxgdZWEgQcPB/vgqTdRgl7CIlN8v1VputzH9
	VkJfj14he4uc2POB/prU/tXLR6INvWTmjA0gP+YSr2GRrjHtKC7QkqfPtaG4yQwYRAih7zITnvan8
	kEHgZb442I/tYuwBl/LjLuAfwVv0V1vL5FFnflb4pbqlOtc/MgqBMS7a8ahmfMNaEcBwFoURdVZLP
	w1Bdwz5lrCvlYq1wkR7OhhP0BYfXPnziqlQYO2gnwAZeHEd+X126Q3I2dZLCP9dO/Yyq91QdcoKH+
	8WYdW3MMx4+WpqW2s9Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfP6V-00000001SY8-3i3U;
	Tue, 04 Feb 2025 20:01:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMr2-000000017tA-2SrN;
	Tue, 04 Feb 2025 17:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wcThim39EYPHxXLHIVD/RA5qpLaRNquzUdH4zXdFJ+w=; b=YA0hyO2EoSy5o5sd3CNHcsm2k1
	Ej0g1bYGP4ymlQ5hXmasRBOKebLAqNuFf0J4H6hgIXmds7T5hIZIsmalF33TUoSis5orLwQDwDVqK
	M78V5y3WhOPtVVVE17v/2t2D7Vj9QHElUoAtX/0Br1IBNoaTj229y9mxhgXZHNQHoDi/JNaW0bDD9
	RFMZ6B8MzhdI8dTFoCqHiDyly/QfDTb0ESNIhUT1e/nDjDOls2IX9n5GKwbcNGm+a2NbvwZyQ62eC
	hlEzfc/cd87YIgISn5oatbgYI21KCQP/9yiigllaGY/vG9OlJk5psqwXhBqnSvZbU+Ix8WAbsrWi7
	fEzJbeRA==;
Received: from mgamail.intel.com ([198.175.65.20])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMqz-0000000GM17-2QF7;
	Tue, 04 Feb 2025 17:36:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690613; x=1770226613;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EUgvSoD6ZXvZMdQY8EXK092WIVXF++/3+F17U+GxOWU=;
  b=CWAB+BXHZ2GM4DhILaTk5HeAJ6vUIBQsu6QRGt6n5Eha5enrPIJ/q3/3
   B655tMNN1brqCn2fCzMVZG9+qVtKJGG9sthgV9r0W9bqunWEoDEi1k6mu
   3rD1yOIXWCp0pbYm6mMbh569ajBUzK3ePw5VDZYZu9wIxmY5uu0BTkGA4
   wa7GxqCsi5ojt9EZ8bTrUHWsb49FITy7TRx4NyhWCKZARkeOUigwE0Ypf
   37iUqmd/xNmvwn17CtlPX9Y7tJBBoaeFGZzQIyooUixVhmubEPK4P2Ilg
   DLe9TSDfU5vMnjSkRZNOBcQtTqadbq01CE3E0P4q6TH+YUt6+YaOnVVTx
   g==;
X-CSE-ConnectionGUID: pVim1VIZTySXLQmIm/LYrQ==
X-CSE-MsgGUID: RmhbzAmYST+HgvWubX73gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38930979"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38930979"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:51 -0800
X-CSE-ConnectionGUID: P6du7V6VScafjuMIXvnbWA==
X-CSE-MsgGUID: W7s9nIAMS+GBPujRL+zY2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147866889"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:39 -0800
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
Subject: [PATCH 11/15] x86: LAM initialization
Date: Tue,  4 Feb 2025 18:33:52 +0100
Message-ID: <01104816cdd0d430ac843847a8056d07b8770be0.1738686764.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_173653_950719_9831F02A 
X-CRM114-Status: GOOD (  11.40  )
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

To make use of KASAN's tag based mode on x86 Linear Address Masking
(LAM) needs to be enabled. To do that the 28th bit in CR4 needs to be
set.

Set the bit in early memory initialization.

When launching secondary CPUs the LAM bit gets lost. To avoid this it
needs to get added in a mask in head_64.S. The bit mask permits some
bits of CR4 to pass from the primary CPU to the secondary CPUs without
being cleared.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 arch/x86/kernel/head_64.S | 3 +++
 arch/x86/mm/init.c        | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 16752b8dfa89..7cdafcedbc70 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -199,6 +199,9 @@ SYM_INNER_LABEL(common_startup_64, SYM_L_LOCAL)
 	 *  there will be no global TLB entries after the execution."
 	 */
 	movl	$(X86_CR4_PAE | X86_CR4_LA57), %edx
+#ifdef CONFIG_ADDRESS_MASKING
+	orl	$X86_CR4_LAM_SUP, %edx
+#endif
 #ifdef CONFIG_X86_MCE
 	/*
 	 * Preserve CR4.MCE if the kernel will enable #MC support.
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index eb503f53c319..4dc3679fedd1 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -756,6 +756,9 @@ void __init init_mem_mapping(void)
 	probe_page_size_mask();
 	setup_pcid();
 
+	if (boot_cpu_has(X86_FEATURE_LAM) && IS_ENABLED(CONFIG_KASAN_SW_TAGS))
+		cr4_set_bits_and_update_boot(X86_CR4_LAM_SUP);
+
 #ifdef CONFIG_X86_64
 	end = max_pfn << PAGE_SHIFT;
 #else
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

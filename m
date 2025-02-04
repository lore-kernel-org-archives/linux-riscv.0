Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52458C02193
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 17:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pge2f/3RQVOJeDkUHhsbbpeZflVbBhnL/T8b3oT5oH4=; b=geRPqwOsHjZ4Zh
	qcirxe7gCkUg4TaYWAJQY8vFLeB+1tJRtjfeTFZ5vVdG2MqGTpCq9t5xZEest38CL28MvleLfWkUw
	G9ogYt1EuMpjSiibsSSF2EWnJlvdGDQeaEgT1J1oi1p/cFuNgJrGckVLnS6Z098H2HFvDXEAw4qjh
	iibyXSV2WQDnPxv3iskPrCnhzI+A2Ov3pIH0QaGp6ZVcr2jcprvcLf0XAjJYKcz90k3YPObKRjPIi
	24yNuwO3lIFy7JuFoYktEivkrfnlsq8UCgZddbuiCWyMyMfs82noKmzI50a3BUYQbBcLyycne8TG7
	sHSOD+ECy/FhgYCK4Lqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMre-000000018A9-3qNU;
	Tue, 04 Feb 2025 17:37:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMrd-0000000188q-0sjW;
	Tue, 04 Feb 2025 17:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PCQPfnDRBxmJXeqGE9pZTyAVVotiYe5di+G+aFzDagA=; b=HLYfdIQLAojtFiseo7grIMUX22
	reMeiUIVRYXR/0GEWxwujVpzviwq/bZK5SbGAxztVnjmob4Ak5pUCISHCc7VH3I7YGBJxW9BdGcpI
	Y4AG7Z5voFgdmmRP0dBg4vjdQHDdjZStk+L46SZxdgskSZZMzsNOEgYaalo7pZ4plE/jQZE6tvFJT
	gJubamFGmwIqHdmCQ/G47g2tbrmlNclGW+l0h8Rz36LFTCtzmxMt4fzFX7DWfTA68TgC07MjfvfkU
	dPlJ0ovUGwjAw5d6f3cp6jVigx2s9wXmV9u2DFOBY7TpLIIZaBTZSj3AMIwf2uUembLbaqiYZtsle
	84i70LJA==;
Received: from mgamail.intel.com ([198.175.65.20])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMra-0000000GM8P-0IIv;
	Tue, 04 Feb 2025 17:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690650; x=1770226650;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oiRBgvokfmZMzIN+jtwGJEePgjLFxs7ade5tHmSo4go=;
  b=dleCM97NLMMhqJF6uboYjgTeQ0240BEnWj7Y702GgVnQXpm/f8L6en+Z
   LXs8D7VuYRmkqjgjVanentYaMGZhrUShE3427/ukzGUQbEJVPgayw5hAB
   RpvdBF21NTojyrTlIh5tDb0hXS1lnDoeHnyEtYExXn8jJ/zW0EcZOZYZs
   7vwgPFrs8NdSCl91jartCp2x78gvIvH+t+IZYjQq765UdvuhRn08bEz59
   p/Wj/S229mUwhgd4qwIXY7zK5bALQg1fisoL+g4eXSZnmHnS63qkoiAl2
   MMgWPYQvpBUmOpdKqoJUCkTtEmAMvNa5fB296KpTZkV6ZXTHIpy6DWN45
   A==;
X-CSE-ConnectionGUID: Ew1KeiVcSf2xZoIggImK5Q==
X-CSE-MsgGUID: wSNJEya+TQWWisS92pEdPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38931169"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38931169"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:37:29 -0800
X-CSE-ConnectionGUID: VKIBhH62QgyxuyV1BEgDvg==
X-CSE-MsgGUID: /T7gEKWsTDWNscbEm9C8IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147867163"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:37:17 -0800
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
Subject: [PATCH 14/15] x86: Make software tag-based kasan available
Date: Tue,  4 Feb 2025 18:33:55 +0100
Message-ID: <794a931acfb8e73e28c02932ef08bed9254f164e.1738686764.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_173730_610192_7FC188FC 
X-CRM114-Status: GOOD (  10.97  )
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

Make CONFIG_KASAN_SW_TAGS available for x86 machines if they have
ADDRESS_MASKING enabled (LAM) as that works similarly to Top-Byte Ignore
(TBI) that allows the software tag-based mode on arm64 platform.

Set scale macro based on KASAN mode: in software tag-based mode 32 bytes
of memory map to one shadow byte and 16 in generic mode.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 arch/x86/Kconfig                | 8 ++++++++
 arch/x86/boot/compressed/misc.h | 2 ++
 arch/x86/include/asm/kasan.h    | 2 +-
 arch/x86/kernel/setup.c         | 2 ++
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index dfec7bc692d4..afbcf27ad278 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -36,6 +36,7 @@ config X86_64
 	select ARCH_HAS_ELFCORE_COMPAT
 	select ZONE_DMA32
 	select EXECMEM if DYNAMIC_FTRACE
+	select ARCH_HAS_KASAN_SW_TAGS_DENSE
 
 config FORCE_DYNAMIC_FTRACE
 	def_bool y
@@ -190,6 +191,7 @@ config X86
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN			if X86_64
 	select HAVE_ARCH_KASAN_VMALLOC		if X86_64
+	select HAVE_ARCH_KASAN_SW_TAGS		if ADDRESS_MASKING
 	select HAVE_ARCH_KFENCE
 	select HAVE_ARCH_KMSAN			if X86_64
 	select HAVE_ARCH_KGDB
@@ -394,6 +396,12 @@ config KASAN_SHADOW_OFFSET
 	hex
 	default 0xdffffc0000000000 if KASAN_GENERIC
 
+config KASAN_SHADOW_SCALE_SHIFT
+	int
+	default 5 if KASAN_SW_TAGS_DENSE
+	default 4 if KASAN_SW_TAGS
+	default 3
+
 config HAVE_INTEL_TXT
 	def_bool y
 	depends on INTEL_IOMMU && ACPI
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index dd8d1a85f671..397a70558ffa 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -13,6 +13,8 @@
 #undef CONFIG_PARAVIRT_SPINLOCKS
 #undef CONFIG_KASAN
 #undef CONFIG_KASAN_GENERIC
+#undef CONFIG_KASAN_SW_TAGS
+#undef CONFIG_KASAN_SW_TAGS_DENSE
 
 #define __NO_FORTIFY
 
diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
index 79151356d5f2..99ff4ae83bf7 100644
--- a/arch/x86/include/asm/kasan.h
+++ b/arch/x86/include/asm/kasan.h
@@ -6,7 +6,7 @@
 #include <linux/kasan-tags.h>
 #include <linux/types.h>
 
-#define KASAN_SHADOW_SCALE_SHIFT 3
+#define KASAN_SHADOW_SCALE_SHIFT CONFIG_KASAN_SHADOW_SCALE_SHIFT
 
 /*
  * Compiler uses shadow offset assuming that addresses start
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index f1fea506e20f..c300274e205a 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1121,6 +1121,8 @@ void __init setup_arch(char **cmdline_p)
 
 	kasan_init();
 
+	kasan_init_sw_tags();
+
 	/*
 	 * Sync back kernel address range.
 	 *
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

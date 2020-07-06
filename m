Return-Path: <SRS0=gb7b=AR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63074C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 17:26:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FDC42070C
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 17:26:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ytmm5+zq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="hJfZXsYU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FDC42070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dilmiv8up8qoiXUxiZHXB7KghIE9iajdjzimzl6u4+s=; b=ytmm5+zqII8DUe/HY0VwZz2D/
	lQPk0bd4Rv+G8CE+ugtIROxMTTfAeJ2T12IHabIEl1e+9QZJqxrQle2z4M0WPUutXsUfbkAE8cQTo
	p5J5Oia6txfR1u896mJSeE6daHNQlvyyMZiwVz7xZCtvwZT/RcShHioJOR4NQ9CJISJGGG4M9H5SU
	rCIAYg7mh6JPgB8KbFS6M6zap872bCeIzzwZlzHgXLng4c+t/eRTBiRK0sjAyKjUNsqXitEfv6Gw7
	QT3Kgtqbjw+244fGfx6CAjfk4NCEsWGIcZjKR27WDlup0K3Lgak2xBjdBTwGmvVegkMLsI+NZRkZ7
	INdEpTxHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsUt9-0002gi-39; Mon, 06 Jul 2020 17:26:43 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsUt1-0002ZQ-Kt
 for linux-riscv@lists.infradead.org; Mon, 06 Jul 2020 17:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594056396; x=1625592396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nglTD4UGuoe/uqWlZLpzP4BN9AAnND7WFwPf/vb2+9A=;
 b=hJfZXsYUKjLutah5hJujO90Dc4+J1pg9cXX6c5A5lllsM+68lVMgSgUo
 eFUx4K3K2GK6HQcF0QZWOjqCNb8r3/ykD9hxyIRDGWUbps/m38G9QOwY6
 3Z0EaOloahDFAxhWot733tLEbVXACVNLdleAZvF3IdKE7EKmhdoFMfMii
 x32+Z7DfisBvKh3euj1lHRQknvbTgGWTo63SL520ZZxwRVdGN2ZPi5jCd
 tgt9T7YCZUfB3hB8xjHuqHk4G4VvueQVREn4jeYL+sPy16XjqMyuVEA4r
 bBiIyzgsCDv/allnI09UXnwPXgPqjmAfb5Tnfj2YQhNeQa3+eZMXrAVzM g==;
IronPort-SDR: 8Oh9d6MDIPbrrvdqSH/fyHkWeAyvjVX6xUST1h0tuQjM2KUFvQ25/iPsu+CSRn1t4/tenEPS3D
 gD19jnIefbz3WiSFEZJNqqIykodZhEmE83Ya2ADVlobmm+1W+/ImIzTGXgKtW8a3HMDKLSfzRy
 P+TBKUjXvxvUe9LP7BPBo6aOZFzyQhFmK+5yiki1+qc65QaZrMF4UZZz8TZa/4BAx6ZI0K7POL
 uCGIZ7+NaIM9F1SsoNrQzf7mfvk7Yv3ji2EzoB2P4zucPrQ3LCY+SmGu/Xwc1S86GIkSM+UNQg
 g/c=
X-IronPort-AV: E=Sophos;i="5.75,320,1589212800"; d="scan'208";a="141930681"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jul 2020 01:26:32 +0800
IronPort-SDR: Eft33Q5/UOTd5F0xokLF56jbqNZKjXHMpPh0lrXO8OPRcfngjopEBVY/B7aH85TJrqj36iE8y3
 dimwdI+W3w8tW6DV/wSu4lGHgttu1Co7g=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 10:15:12 -0700
IronPort-SDR: gDKpxTkf6kRQVCNHFTZKzeJePNqqwOyT895u69WUMRsx6FMtPceebiL50Lkyg9sjTJz7zphSC0
 o+OC9FBlwPIQ==
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.57.161])
 by uls-op-cesaip01.wdc.com with ESMTP; 06 Jul 2020 10:26:30 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 04/11] RISC-V: Add early ioremap support
Date: Mon,  6 Jul 2020 10:26:02 -0700
Message-Id: <20200706172609.25965-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200706172609.25965-1-atish.patra@wdc.com>
References: <20200706172609.25965-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_132636_103788_CF0B4A59 
X-CRM114-Status: GOOD (  13.70  )
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
Cc: linux-efi@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

UEFI uses early IO or memory mappings for runtime services before
normal ioremap() is usable. Add the necessary fixmap bindings and
pmd mappings for generic ioremap support to work.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/Kconfig              |  1 +
 arch/riscv/include/asm/Kbuild   |  1 +
 arch/riscv/include/asm/fixmap.h | 13 +++++++++++++
 arch/riscv/include/asm/io.h     |  1 +
 arch/riscv/kernel/setup.c       |  1 +
 arch/riscv/mm/init.c            | 33 +++++++++++++++++++++++++++++++++
 6 files changed, 50 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 128192e14ff2..fda90093e588 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -32,6 +32,7 @@ config RISCV
 	select GENERIC_ARCH_TOPOLOGY if SMP
 	select GENERIC_ATOMIC64 if !64BIT
 	select GENERIC_CLOCKEVENTS
+	select GENERIC_EARLY_IOREMAP
 	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO
 	select GENERIC_IOREMAP
 	select GENERIC_IRQ_MULTI_HANDLER
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 3d9410bb4de0..59dd7be55005 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+generic-y += early_ioremap.h
 generic-y += extable.h
 generic-y += flat.h
 generic-y += kvm_para.h
diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 11613f38228a..54cbf07fb4e9 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -27,6 +27,19 @@ enum fixed_addresses {
 	FIX_TEXT_POKE1,
 	FIX_TEXT_POKE0,
 	FIX_EARLYCON_MEM_BASE,
+
+	__end_of_permanent_fixed_addresses,
+	/*
+	 * Temporary boot-time mappings, used by early_ioremap(),
+	 * before ioremap() is functional.
+	 */
+#define NR_FIX_BTMAPS		(SZ_256K / PAGE_SIZE)
+#define FIX_BTMAPS_SLOTS	7
+#define TOTAL_FIX_BTMAPS	(NR_FIX_BTMAPS * FIX_BTMAPS_SLOTS)
+
+	FIX_BTMAP_END = __end_of_permanent_fixed_addresses,
+	FIX_BTMAP_BEGIN = FIX_BTMAP_END + TOTAL_FIX_BTMAPS - 1,
+
 	__end_of_fixed_addresses
 };
 
diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 3835c3295dc5..c025a746a148 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -14,6 +14,7 @@
 #include <linux/types.h>
 #include <linux/pgtable.h>
 #include <asm/mmiowb.h>
+#include <asm/early_ioremap.h>
 
 /*
  * MMIO access functions are separated out to break dependency cycles
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 8519a6d29857..1244b433fe7c 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -72,6 +72,7 @@ void __init setup_arch(char **cmdline_p)
 
 	*cmdline_p = boot_command_line;
 
+	early_ioremap_setup();
 	parse_early_param();
 
 	setup_bootmem();
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index c18c94ab3b23..bad60686d080 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -377,6 +377,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	uintptr_t load_pa = (uintptr_t)(&_start);
 	uintptr_t load_sz = (uintptr_t)(&_end) - load_pa;
 	uintptr_t map_size = best_map_size(load_pa, MAX_EARLY_MAPPING_SIZE);
+#ifndef __PAGETABLE_PMD_FOLDED
+	pmd_t fix_bmap_spmd, fix_bmap_epmd;
+#endif
 
 	va_pa_offset = PAGE_OFFSET - load_pa;
 	pfn_base = PFN_DOWN(load_pa);
@@ -427,6 +430,36 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	dtb_size = fdt_totalsize((void *)dtb_pa);
 	dtb_size = (dtb_size > DTB_EARLY_SIZE) ? DTB_EARLY_SIZE : dtb_size;
 	memcpy((void *)pa, (void *)dtb_pa, dtb_size);
+
+	/*
+	 * Bootime fixmap only can handle PMD_SIZE mapping. Thus, boot-ioremap
+	 * range can not span multiple pmds.
+	 */
+	BUILD_BUG_ON((__fix_to_virt(FIX_BTMAP_BEGIN) >> PMD_SHIFT)
+		     != (__fix_to_virt(FIX_BTMAP_END) >> PMD_SHIFT));
+
+#ifndef __PAGETABLE_PMD_FOLDED
+	/*
+	 * Early ioremap fixmap is already created as it lies within first 2MB
+	 * of fixmap region. We always map PMD_SIZE. Thus, both FIX_BTMAP_END
+	 * FIX_BTMAP_BEGIN should lie in the same pmd. Verify that and warn
+	 * the user if not.
+	 */
+	fix_bmap_spmd = fixmap_pmd[pmd_index(__fix_to_virt(FIX_BTMAP_BEGIN))];
+	fix_bmap_epmd = fixmap_pmd[pmd_index(__fix_to_virt(FIX_BTMAP_END))];
+	if (pmd_val(fix_bmap_spmd) != pmd_val(fix_bmap_epmd)) {
+		WARN_ON(1);
+		pr_warn("fixmap btmap start [%08lx] != end [%08lx]\n",
+			pmd_val(fix_bmap_spmd), pmd_val(fix_bmap_epmd));
+		pr_warn("fix_to_virt(FIX_BTMAP_BEGIN): %08lx\n",
+			fix_to_virt(FIX_BTMAP_BEGIN));
+		pr_warn("fix_to_virt(FIX_BTMAP_END):   %08lx\n",
+			fix_to_virt(FIX_BTMAP_END));
+
+		pr_warn("FIX_BTMAP_END:       %d\n", FIX_BTMAP_END);
+		pr_warn("FIX_BTMAP_BEGIN:     %d\n", FIX_BTMAP_BEGIN);
+	}
+#endif
 }
 
 static void __init setup_vm_final(void)
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

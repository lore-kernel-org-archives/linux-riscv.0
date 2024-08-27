Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF79C54735
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 11:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3QgGMnu5EK5gSHgX+Xf+x+0aWGp3QEthy8dcnKXwzfs=; b=KHrtx812pFceD3
	P6JBmDykCZIYNbCB7FR7Kb32QSW0BJQWiv4z7o09/u6qrr7KkfZU6I5CiH8o252PgMkLDfTnuoa8G
	ViHHvKGjZcUlCiMYVfAE0Jlkv3EbI4x6sNtN3YNoDJch2KGu06c0UeUlezkEqdCH5oaoyr5ZWata4
	eygQo7OvWi7pyhpR7y2jXNq3KmUCixhMZdV8Fahe+INMKaZE0NJriM5Oznl5751Zzw4bvjqYhbuIN
	tgw2rHmPc7cM2kNNwADmThnLGrMvvxwJvdNcOdMj+6wCqtA8cPc+Cx/XqlaE8L6SvrSXrsfyGROAq
	EEztf9a3adWl75aGBb+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siuWH-0000000B2Xn-03qP;
	Tue, 27 Aug 2024 11:37:53 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siuVT-0000000B2J2-4Br3
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 11:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1724758624; x=1756294624;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F50f3qIUpTHn684n3f885wQ8c6LqK97tiJsfNPZU8Ws=;
  b=s+UUDLQM9/qEU3GlP9desfGgJZgLvhbqRnK88MekUSKT52ryCiGG4TCW
   7sUeaGSQK6NQIUlhCZhiS6HHSwWLzLhjB3RRRK/FNj6YlF/G0ZoxzAl9g
   1eAfunawvUGFJsTIfmuLHoP1OOewT4q4hHAWWWqjMThNVEjR2s0wdHjcv
   rQENNvKs92vAO7E3l7bREDKpmEXGr0stJv3DYkjs9MdOWyveQSsBX45kS
   HqMmlMLh/IjZLzhK8wR42AaJogdxG/d/FLj49MJ+oxbWykx4hDZtzWMTu
   zV7SAPc1uG/bZCPZWhjbe8aQUiv7oSVVGT3YBQ+RtUhSv30/VGeMd1AbG
   A==;
X-CSE-ConnectionGUID: 4G8f+MWwRVKFQqy48iCJlg==
X-CSE-MsgGUID: xo2hvbX9SjWfsPQArQ9Haw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 14:36:56 +0300
X-CSE-ConnectionGUID: l89z8843QFKHaLS15hpymQ==
X-CSE-MsgGUID: IuEfY1SqQ3WNUTEuklfTEg==
Received: from unknown (HELO epgd022.me-corp.lan) ([10.154.54.6])
  by ces03_data.me-corp.lan with SMTP; 27 Aug 2024 14:36:54 +0300
Received: by epgd022.me-corp.lan (sSMTP sendmail emulation); Tue, 27 Aug 2024 14:36:54 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH] riscv: make ZONE_DMA32 optional
Date: Tue, 27 Aug 2024 14:36:11 +0300
Message-Id: <20240827113611.537302-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_043704_318493_99C336E6 
X-CRM114-Status: GOOD (  12.29  )
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

It is not necessary any RISCV platform has ZONE_DMA32.

Example - if platform has no DRAM in [0..4G] region,
it will report failure like below each boot.

[    0.088709] swapper/0: page allocation failure: order:7, mode:0xcc4(GFP_KERNEL|GFP_DMA32), nodemask=(null),cpuset=/
[    0.088832] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc5 #30
[    0.088864] Call Trace:
[    0.088869] [<ffffffff800059f2>] dump_backtrace+0x1c/0x24
[    0.088910] [<ffffffff805f328c>] show_stack+0x2c/0x38
[    0.088957] [<ffffffff805fd800>] dump_stack_lvl+0x52/0x74
[    0.088987] [<ffffffff805fd836>] dump_stack+0x14/0x1c
[    0.089010] [<ffffffff801a23a8>] warn_alloc+0xf4/0x176
[    0.089041] [<ffffffff801a3052>] __alloc_pages_noprof+0xc28/0xcb4
[    0.089067] [<ffffffff80086eda>] atomic_pool_expand+0x62/0x1f8
[    0.089090] [<ffffffff8080d674>] __dma_atomic_pool_init+0x46/0x9e
[    0.089115] [<ffffffff8080d762>] dma_atomic_pool_init+0x96/0x11c
[    0.089139] [<ffffffff80002146>] do_one_initcall+0x5c/0x1b2
[    0.089158] [<ffffffff8080127c>] kernel_init_freeable+0x214/0x274
[    0.089190] [<ffffffff805fefd8>] kernel_init+0x1e/0x10a
[    0.089209] [<ffffffff8060748a>] ret_from_fork+0xe/0x1c

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/riscv/Kconfig | 2 +-
 mm/Kconfig         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0f3cd7c3a436..94a573112625 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -50,6 +50,7 @@ config RISCV
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_DATA
+	select ARCH_HAS_ZONE_DMA_SET if 64BIT
 	select ARCH_KEEP_MEMBLOCK if ACPI
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
@@ -200,7 +201,6 @@ config RISCV
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
 	select UACCESS_MEMCPY if !MMU
-	select ZONE_DMA32 if 64BIT
 
 config CLANG_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_CLANG
diff --git a/mm/Kconfig b/mm/Kconfig
index b72e7d040f78..97c85da98e89 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1032,7 +1032,7 @@ config ZONE_DMA
 config ZONE_DMA32
 	bool "Support DMA32 zone" if ARCH_HAS_ZONE_DMA_SET
 	depends on !X86_32
-	default y if ARM64
+	default y if ARM64 || (RISCV && 64BIT)
 
 config ZONE_DEVICE
 	bool "Device memory (pmem, HMM, etc...) hotplug support"
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

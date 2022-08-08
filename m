Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF57C00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 08:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Ii0XrP7+Z658b5nzYxK9jzH2h021EjGuMuwFYFqY4Q=; b=Ien7Y0Jn1XPfyL
	m9gRnNKh3SAiTlOHMr86EaPGo2n56C1g/KwSOEOsjnAUyx226U+06jXJfeuqcSpGvafbnyM3ee9dO
	6jpejmoTdeBekYoKHJCZCGQ2kSIHoR9Q5R4BC9/I6co1QgVOstnMt/oJxQBy51YyC1hPtzzHHdhVQ
	NjZeXUkgxH4iTITkx/WaseO29LPvIoN33ZFDQpYi5eI7tBrftJ45wPvUBMvTM5TiNxWuSfXvTiGfD
	dxFKLugAjz0bfYYmtNIS2ZPagmVGEV5k7cBgbV5D12eX31/xB4IEwgN+TVlPPusKaDeK/XDyLLUjB
	XQGdTEbYZjG1lfKR5KVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxmK-00CIjN-N0; Mon, 08 Aug 2022 08:06:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxmF-00CIgo-Tl
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 08:06:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 278C560EB8;
	Mon,  8 Aug 2022 08:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8661C43470;
	Mon,  8 Aug 2022 08:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659945978;
	bh=E9+7aC4Yw8oq+CFp7IBpO6wuIDD2IWECqn1vNuAh4Gg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z0qSkbBljX/OZVI0viXnuLml2pfStiIeGHBuHL3siHSedGE3HFxJdpmfkjTY9a4o2
	 f5NMfXHQKQHILSlbZ1zG2pisBhbG7vz014u3Y8Sp2Oz9cu+qVCv7crr5i34VxSOz/8
	 XdZ+Ln/igjZG2mQylv4rBO7mxi0r7j8Nf/S4X9deoEe+uC5XXgDh6+sP2fRdNioMi5
	 UCeotd8qCbNhW8Si/WhecVACDm2EMuIWOPIm+Bc3nUYy2bw0BBOwjV1WAVbKfLD+Pp
	 e4bTQ01W5hKN5m7clD3wp5pv+E0xom6T3Qym7q5pccVtQRktYW7+v+vDOS3scds5ch
	 W3IXChEmQpSkQ==
From: guoren@kernel.org
To: tj@kernel.org,
	cl@linux.com,
	palmer@dabbelt.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	peterz@infradead.org,
	arnd@arndb.de
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [RFC PATCH 1/4] vmstat: percpu: Rename HAVE_CMPXCHG_LOCAL to HAVE_CMPXCHG_PERCPU_BYTE
Date: Mon,  8 Aug 2022 04:05:57 -0400
Message-Id: <20220808080600.3346843-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220808080600.3346843-1-guoren@kernel.org>
References: <20220808080600.3346843-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_010620_217123_EE5C36A2 
X-CRM114-Status: GOOD (  12.71  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The name HAVE_CMPXCHG_LOCAL is confused with using cmpxchg_local, but
vmstat needs this_cpu_cmpxchg_1. Rename would clarify the meaning, and
maybe we could remove cmpxchg(64)_local API (Only drivers/iommu/intel
used) in the future.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 .../features/locking/cmpxchg-local/arch-support.txt         | 6 +++---
 arch/Kconfig                                                | 2 +-
 arch/arm64/Kconfig                                          | 2 +-
 arch/s390/Kconfig                                           | 2 +-
 arch/x86/Kconfig                                            | 2 +-
 mm/vmstat.c                                                 | 4 ++--
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/features/locking/cmpxchg-local/arch-support.txt b/Documentation/features/locking/cmpxchg-local/arch-support.txt
index 8b1a8d9e1c79..4d4c5c2fa66d 100644
--- a/Documentation/features/locking/cmpxchg-local/arch-support.txt
+++ b/Documentation/features/locking/cmpxchg-local/arch-support.txt
@@ -1,7 +1,7 @@
 #
-# Feature name:          cmpxchg-local
-#         Kconfig:       HAVE_CMPXCHG_LOCAL
-#         description:   arch supports the this_cpu_cmpxchg() API
+# Feature name:          cmpxchg-percpu-byte
+#         Kconfig:       HAVE_CMPXCHG_PERCPU_BYTE
+#         description:   arch supports the this_cpu_cmpxchg_1() API
 #
     -----------------------
     |         arch |status|
diff --git a/arch/Kconfig b/arch/Kconfig
index f330410da63a..81800cdfe161 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -471,7 +471,7 @@ config HAVE_ALIGNED_STRUCT_PAGE
 	  on a struct page for better performance. However selecting this
 	  might increase the size of a struct page by a word.
 
-config HAVE_CMPXCHG_LOCAL
+config HAVE_CMPXCHG_PERCPU_BYTE
 	bool
 
 config HAVE_CMPXCHG_DOUBLE
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 571cc234d0b3..24a82bdc766a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -175,7 +175,7 @@ config ARM64
 	select HAVE_EBPF_JIT
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_CMPXCHG_DOUBLE
-	select HAVE_CMPXCHG_LOCAL
+	select HAVE_CMPXCHG_PERCPU_BYTE
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 318fce77601d..ac03af800bf7 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -151,7 +151,7 @@ config S390
 	select HAVE_ARCH_VMAP_STACK
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_CMPXCHG_DOUBLE
-	select HAVE_CMPXCHG_LOCAL
+	select HAVE_CMPXCHG_PERCPU_BYTE
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS
 	select HAVE_DYNAMIC_FTRACE
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f9920f1341c8..5f4f6df7b89f 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -184,7 +184,7 @@ config X86
 	select HAVE_ARCH_WITHIN_STACK_FRAMES
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_CMPXCHG_DOUBLE
-	select HAVE_CMPXCHG_LOCAL
+	select HAVE_CMPXCHG_PERCPU_BYTE
 	select HAVE_CONTEXT_TRACKING_USER		if X86_64
 	select HAVE_CONTEXT_TRACKING_USER_OFFSTACK	if HAVE_CONTEXT_TRACKING_USER
 	select HAVE_C_RECORDMCOUNT
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 373d2730fcf2..b2fc6d28d3b2 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -554,9 +554,9 @@ void __dec_node_page_state(struct page *page, enum node_stat_item item)
 }
 EXPORT_SYMBOL(__dec_node_page_state);
 
-#ifdef CONFIG_HAVE_CMPXCHG_LOCAL
+#ifdef CONFIG_HAVE_CMPXCHG_PERCPU_BYTE
 /*
- * If we have cmpxchg_local support then we do not need to incur the overhead
+ * If we have this_cpu_cmpxchg_1 arch support then we do not need to incur the overhead
  * that comes with local_irq_save/restore if we use this_cpu_cmpxchg.
  *
  * mod_state() modifies the zone counter state through atomic per cpu
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
